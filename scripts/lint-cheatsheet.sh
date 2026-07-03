#!/usr/bin/env bash
# ============================================================
# DS Cheatsheet Lint — 检查 components-cheatsheet.md 中的违规模式
# 用法: bash scripts/lint-cheatsheet.sh
# ============================================================
set -euo pipefail

CHEATSHEET="components-cheatsheet.md"
PROBLEMS=0

red()  { printf "\033[31m%s\033[0m\n" "$*"; }
green(){ printf "\033[32m%s\033[0m\n" "$*"; }
dim()  { printf "\033[2m%s\033[0m\n" "$*"; }

[[ -f "$CHEATSHEET" ]] || { red "ERROR: $CHEATSHEET not found — run from repo root"; exit 1; }

echo "🔍 Linting $CHEATSHEET …"
echo ""

# ---- 1. transition-all (ban, except transition-[width]) ----
dim "→ 检查 transition-all …"
HITS=$(grep -n 'transition-all' "$CHEATSHEET" | grep -v 'transition-\[width\]' || true)
if [[ -n "$HITS" ]]; then
  red "❌ transition-all (禁止):"
  echo "$HITS" | while read line; do echo "   $line"; done
  PROBLEMS=$((PROBLEMS + $(echo "$HITS" | wc -l)))
else
  green "✅ transition-all: 无违规"
fi

# ---- 2. box-shadow / shadow-lg etc on non-overlay elements ----
dim "→ 检查 box-shadow / shadow-* …"
# overlay 元素允许: Dropdown, Tooltip, Modal. 标记 warn 而非 error.
SHADOW_HITS=$(grep -n 'shadow-\(lg\|sm\|md\|xl\|2xl\|inner\)' "$CHEATSHEET" || true)
if [[ -n "$SHADOW_HITS" ]]; then
  echo "⚠️  shadow-* (仅 overlay 允许: Dropdown/Tooltip/Modal):"
  echo "$SHADOW_HITS" | while read line; do echo "   $line"; done
  echo "   👆 人工确认: 是否仅用于 overlay 元素"
else
  green "✅ shadow-*: 无使用"
fi

# ---- 3. 禁止的 duration 值 ----
dim "→ 检查禁止的 duration …"
BAD_DUR=$(grep -nE 'duration-(100|500|700|1000)' "$CHEATSHEET" || true)
if [[ -n "$BAD_DUR" ]]; then
  red "❌ 禁止的 duration (仅 150/200/300 允许):"
  echo "$BAD_DUR" | while read line; do echo "   $line"; done
  PROBLEMS=$((PROBLEMS + $(echo "$BAD_DUR" | wc -l)))
else
  green "✅ duration: 仅使用 150/200/300"
fi

# ---- 4. rounded-full on interactive elements ----
dim "→ 检查 rounded-full 于交互元素 …"
FULL_BTN=$(grep -n 'rounded-full' "$CHEATSHEET" | grep -E 'button|select|input' || true)
if [[ -n "$FULL_BTN" ]]; then
  red "❌ rounded-full 于交互元素 (button/input/select 应用 rounded-lg):"
  echo "$FULL_BTN" | while read line; do echo "   $line"; done
  PROBLEMS=$((PROBLEMS + $(echo "$FULL_BTN" | wc -l)))
else
  green "✅ rounded-full: 未用于交互元素"
fi

# ---- 5. 纯黑/纯白 文字色或背景 ----
dim "→ 检查 #000 / #FFF 硬编码 …"
PURE_COLOR=$(grep -nE '(#[0]{3,6}|#[Ff]{3,6})' "$CHEATSHEET" || true)
if [[ -n "$PURE_COLOR" ]]; then
  red "❌ 纯黑/纯白硬编码 (用 gray-900/gray-50):"
  echo "$PURE_COLOR" | while read line; do echo "   $line"; done
  PROBLEMS=$((PROBLEMS + $(echo "$PURE_COLOR" | wc -l)))
else
  green "✅ 无纯黑/纯白硬编码"
fi

# ---- 6. font-family 声明 ----
dim "→ 检查 font-family …"
FF_HITS=$(grep -n 'font-family' "$CHEATSHEET" || true)
if [[ -n "$FF_HITS" ]]; then
  red "❌ font-family 声明 (使用系统字体栈):"
  echo "$FF_HITS" | while read line; do echo "   $line"; done
  PROBLEMS=$((PROBLEMS + $(echo "$FF_HITS" | wc -l)))
else
  green "✅ font-family: 无自定义字体"
fi

# ---- 7. border (非 border-b 分割线) 应改用 inset-ring ----
dim "→ 检查 border (非 border-b 分割线) …"
BORDER_HITS=$(grep -nE '\bborder\b' "$CHEATSHEET" | grep -v 'border-b' | grep -v 'border-t' | grep -v '##' || true)
if [[ -n "$BORDER_HITS" ]]; then
  echo "⚠️  border (非 border-b/t 分割线，应用 inset-ring):"
  echo "$BORDER_HITS" | while read line; do echo "   $line"; done
  echo "   👆 人工确认: 是否应改用 inset-ring"
else
  green "✅ border: 仅分割线使用"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [[ $PROBLEMS -eq 0 ]]; then
  green "🎉 全部检查通过"
else
  red "❌ 发现 $PROBLEMS 个违规"
fi
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
exit $PROBLEMS
