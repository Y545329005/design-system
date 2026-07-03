# 隐私检查清单

> 每次提交前必须执行。目标：杜绝真实个人信息进入 Git 历史。
>
> 关联规范：`CLAUDE.md` §九 · `workflow.md` §5.3

---

## 占位值表（全仓库统一使用）

| 类型 | 占位值 | 禁止 |
|------|--------|------|
| 姓名 | `Alex Morgan` | 任何真实姓名（含拼音） |
| 缩写 | `AM` | 任何真实缩写 |
| 邮箱 | `alex@example.com` | 非 example.com 域名 |
| 公司 | `Acme Corp` | 任何真实公司名 |
| 项目名 | `MySaaS` | 任何真实项目名/内部代号 |
| 路径 | `$DESIGN_SYSTEM_ROOT` 或 `./` | `/Users/xxx/...` 等绝对路径 |

> `example.com` 是 IETF 预留的示例域名（RFC 2606），永远不会被注册，安全可用。

---

## 提交前检查

```bash
# 1. 真实姓名
grep -rn '真实姓名关键词' . --include='*.md' --include='*.html' --include='*.css' --include='*.json' | grep -v .git

# 2. 非示例邮箱
grep -rnE '[a-zA-Z0-9._%+-]+@(?!example\.com)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}' . --include='*.md' --include='*.html' | grep -v .git

# 3. 本地绝对路径
grep -rn '/Users/' . --include='*.md' --include='*.html' | grep -v .git

# 4. 真实公司名
grep -rn '公司名关键词' . --include='*.md' --include='*.html' | grep -v .git
```

全部命令返回空 → 通过 ✅

---

## 失败了怎么办

1. 全局 `sed` 替换为占位值表中的对应项
2. **单独 commit**（不和其他改动混合，便于 review）
3. Commit message 使用 `🔒 隐私脱敏:` 前缀
4. Push 前再次确认已替换干净

---

## 历史记录

| 日期 | 问题 | 修复 |
|------|------|------|
| 2026-07-03 | `Yang Qing` / `YQ` 出现在 avatar / dropdown 示例中 | 替换为 `Raymond Yang`（用户英文名，用户确认可用） |
| 2026-07-03 | 第三次出现同类问题 → 建立本清单 + CLAUDE.md §九 + workflow.md §5.3 | — |
