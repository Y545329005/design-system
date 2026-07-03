#!/usr/bin/env bash
# ============================================================
# DS Compliance Check — 外部项目一键自检脚本
# 用法: bash check-ds-compliance.sh [目录路径]
#       默认检查当前目录下所有 .html/.jinja2/.njk/.twig 文件
#
# 零依赖，可 curl 后直接运行：
#   curl -O https://.../check-ds-compliance.sh
#   bash check-ds-compliance.sh ./templates/
# ============================================================
set -euo pipefail

TARGET="${1:-.}"
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
CYAN='\033[36m'
DIM='\033[2m'
RESET='\033[0m'

VIOLATIONS=0
WARNINGS=0
FILES_CHECKED=0
TMPFILE=$(mktemp)
trap 'rm -f "$TMPFILE"' EXIT

# --- 查找待检查文件 ---
FILES=()
while IFS= read -r -d '' file; do
  FILES+=("$file")
done < <(find "$TARGET" -type f \( \
  -name '*.html' -o -name '*.jinja2' -o -name '*.njk' -o -name '*.twig' -o \
  -name '*.hbs' -o -name '*.ejs' -o -name '*.vue' -o -name '*.jsx' -o -name '*.tsx' \
\) -print0 2>/dev/null || true)

if [[ ${#FILES[@]} -eq 0 ]]; then
  echo "❌ 未找到 HTML/模板文件 (搜索路径: $TARGET)"
  echo "   支持: .html .jinja2 .njk .twig .hbs .ejs .vue .jsx .tsx"
  exit 1
fi

FILES_CHECKED=${#FILES[@]}

echo ""
printf "${CYAN}🔍 DS Compliance Check${RESET}\n"
printf "${DIM}   检查 %d 个文件 (路径: %s)${RESET}\n\n" "$FILES_CHECKED" "$TARGET"

# ============================================================
# 辅助函数
# ============================================================
# check_err "描述" "grep -E pattern" — 违规记为 ERROR
check_err() {
  local desc="$1" pattern="$2"
  local count=0

  grep -nH -E "$pattern" "${FILES[@]}" 2>/dev/null > "$TMPFILE" || true
  count=$(wc -l < "$TMPFILE" | tr -d ' ')

  if [[ $count -gt 0 ]]; then
    printf "${RED}❌ %s${RESET}\n" "$desc"
    while IFS= read -r line; do
      printf "   ${DIM}%s${RESET}\n" "$line"
    done < "$TMPFILE"
    VIOLATIONS=$((VIOLATIONS + count))
  else
    printf "${GREEN}✅ %s${RESET}\n" "$desc"
  fi
}

# check_warn "描述" "grep -E pattern" — 违规记为 WARNING
check_warn() {
  local desc="$1" pattern="$2"
  local count=0

  grep -nH -E "$pattern" "${FILES[@]}" 2>/dev/null > "$TMPFILE" || true
  count=$(wc -l < "$TMPFILE" | tr -d ' ')

  if [[ $count -gt 0 ]]; then
    printf "${YELLOW}⚠️  %s${RESET}\n" "$desc"
    while IFS= read -r line; do
      printf "   ${DIM}%s${RESET}\n" "$line"
    done < "$TMPFILE"
    WARNINGS=$((WARNINGS + count))
  else
    printf "${GREEN}✅ %s${RESET}\n" "$desc"
  fi
}

# ============================================================
# 1. transition-all（禁止）
# ============================================================
echo "━━━ 动效 ━━━"
check_err \
  "transition-all（应改为 transition-colors）" \
  'transition-all'

# ============================================================
# 2. 禁止的 duration 值（仅 150/200/300 允许）
# ============================================================
check_err \
  "禁止的 duration 值（仅 150/200/300 允许）" \
  'duration-(100|500|700|1000|[4-9][0-9]{2})'

# ============================================================
# 3. 缺少 motion-reduce
# ============================================================
MISSING_REDUCE=""
for f in "${FILES[@]}"; do
  if grep -q 'transition-' "$f" 2>/dev/null && ! grep -q 'motion-reduce' "$f" 2>/dev/null; then
    MISSING_REDUCE="${MISSING_REDUCE}${f}\n"
  fi
done
if [[ -n "$MISSING_REDUCE" ]]; then
  printf "${YELLOW}⚠️  文件含 transition 但未见 motion-reduce（应在交互元素上加 motion-reduce:transition-none）${RESET}\n"
  echo -e "$MISSING_REDUCE" | while IFS= read -r line; do [[ -n "$line" ]] && printf "   ${DIM}%s${RESET}\n" "$line"; done
else
  printf "${GREEN}✅ motion-reduce 覆盖${RESET}\n"
fi

# ============================================================
# 4. box-shadow / shadow-*（仅 overlay 允许）
# ============================================================
echo ""
echo "━━━ 层次 (Elevation) ━━━"
grep -nH -E 'shadow-(lg|sm|md|xl|2xl|inner)' "${FILES[@]}" 2>/dev/null > "$TMPFILE" || true
SHADOW_COUNT=$(wc -l < "$TMPFILE" | tr -d ' ')
if [[ $SHADOW_COUNT -gt 0 ]]; then
  printf "${YELLOW}⚠️  shadow-* 使用（仅 Dropdown/Tooltip/Modal/Toast/Toogle thumb 允许）：${RESET}\n"
  while IFS= read -r line; do
    printf "   ${DIM}%s${RESET}\n" "$line"
  done < "$TMPFILE"
  echo "   ${DIM}👆 逐条确认：是否为 overlay 元素？Toggle thumb 的 shadow-sm 属于例外${RESET}"
  WARNINGS=$((WARNINGS + 1))
else
  printf "${GREEN}✅ 无 shadow-* 使用${RESET}\n"
fi

# ============================================================
# 5. border（非 border-b/t/l/r 分割线）应用 inset-ring
# ============================================================
grep -nH -E '\bborder\b' "${FILES[@]}" 2>/dev/null | \
  grep -v 'border-b' | grep -v 'border-t' | grep -v 'border-l' | grep -v 'border-r' | \
  grep -v 'border-collapse' | grep -v 'border-spacing' > "$TMPFILE" || true
BORDER_COUNT=$(wc -l < "$TMPFILE" | tr -d ' ')
if [[ $BORDER_COUNT -gt 0 ]]; then
  printf "${YELLOW}⚠️  border 声明（非分割线应改用 inset-ring）：${RESET}\n"
  head -20 "$TMPFILE" | while IFS= read -r line; do
    printf "   ${DIM}%s${RESET}\n" "$line"
  done
  [[ $BORDER_COUNT -gt 20 ]] && printf "   ${DIM}... 还有 %d 处${RESET}\n" $((BORDER_COUNT - 20))
  WARNINGS=$((WARNINGS + 1))
else
  printf "${GREEN}✅ border 仅用于分割线${RESET}\n"
fi

# ============================================================
# 6. 表单焦点环——应用 gray 而非 indigo/brand
# ============================================================
echo ""
echo "━━━ 表单 (Forms) ━━━"
check_err \
  "表单焦点环使用品牌色（应用 gray: focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10）" \
  'focus:(ring|inset-ring)-(indigo|blue|brand)'

# ============================================================
# 7. rounded-full 于交互元素
# ============================================================
echo ""
echo "━━━ 圆角 ━━━"
# 排除已知例外: Toggle, Radio, Checkbox 指示器, Avatar, Progress bar, Status
grep -nH 'rounded-full' "${FILES[@]}" 2>/dev/null | \
  grep -vE '(toggle|peer-checked|progress|avatar|size-[0-9]+ rounded-full|h-2 rounded-full|h-6 w-11 rounded-full|size-[0-9.]+ rounded-full|indicator|dot|bg-white transition-transform|bg-gray-200 transition-colors|bg-indigo-600 transition-colors)' \
  > "$TMPFILE" || true
FULL_COUNT=$(wc -l < "$TMPFILE" | tr -d ' ')
if [[ $FULL_COUNT -gt 0 ]]; then
  check_err \
    "rounded-full 用于交互元素（button/input/select 应用 rounded-lg）" \
    'rounded-full'
else
  printf "${GREEN}✅ rounded-full 未用于交互元素${RESET}\n"
fi

# ============================================================
# 8. 纯黑/纯白硬编码
# ============================================================
echo ""
echo "━━━ 颜色 ━━━"
check_err \
  "纯黑/纯白硬编码（用 gray-900 / gray-50 代替）" \
  '#[0]{3,6}[;\"[:space:]]|#[Ff]{3,6}[;\"[:space:]]'

# ============================================================
# 9. font-family 声明
# ============================================================
check_err \
  "font-family 声明（应使用系统字体栈）" \
  'font-family'

# ============================================================
# 10. 汇总
# ============================================================
echo ""
echo "━━━ 组件 ━━━"
grep -nH 'bg-indigo-600' "${FILES[@]}" 2>/dev/null > "$TMPFILE" || true
INDIGO_COUNT=$(wc -l < "$TMPFILE" | tr -d ' ')
if [[ $INDIGO_COUNT -gt 0 ]]; then
  printf "   ${DIM}ℹ️  发现 %d 处 bg-indigo-600（确认仅用于主按钮/选中态/链接）${RESET}\n" "$INDIGO_COUNT"
fi
printf "${GREEN}✅ 组件合规检查完成${RESET}\n"

# ============================================================
# 汇总
# ============================================================
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
printf "检查文件: ${CYAN}%d${RESET}\n" "$FILES_CHECKED"
printf "违规 (❌): ${RED}%d${RESET}\n" "$VIOLATIONS"
printf "警告 (⚠️): ${YELLOW}%d${RESET}\n" "$WARNINGS"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

if [[ $VIOLATIONS -gt 0 ]] || [[ $WARNINGS -gt 0 ]]; then
  echo ""
  echo "📋 快速修复指南："
  echo ""
  [[ $VIOLATIONS -gt 0 ]] && echo "  🔴 违规项：逐条修改上述 ❌ 标记的行"
  [[ $WARNINGS -gt 0 ]] && echo "  🟡 警告项：逐条确认上述 ⚠️ 标记的行"
  echo ""
  echo "  常用替换："
  echo "  ┌──────────────────────────────────────────────────────┐"
  echo "  │ transition-all                → transition-colors duration-150   │"
  echo "  │ duration-100/duration-500     → duration-150/200/300             │"
  echo "  │ focus:ring-indigo-* (表单)    → focus:ring-gray-950/10           │"
  echo "  │ border (非分割线)              → inset-ring inset-ring-gray-950/8 │"
  echo "  │ box-shadow (非 overlay)        → 删除，用 inset-ring + 背景明度差 │"
  echo "  │ font-family: ...              → 删除（使用系统字体栈）             │"
  echo "  │ #000 / #FFF                   → gray-900 / gray-50               │"
  echo "  └──────────────────────────────────────────────────────┘"
fi

exit $VIOLATIONS
