# Project Template

将此文件夹中的内容复制到新项目根目录以接入 Design System。

---

## 如何使用

### 1. 复制 design-tokens.css（必须）

```
cp design-tokens.css /path/to/your-project/
```

页面中通过 `<link>` 引用：

```html
<link rel="stylesheet" href="design-tokens.css" />
```

### 2. index.html（可选）

新项目的起始骨架，已配好 Tailwind CDN + tokens + 暗色模式 + body 基础样式。

已有页面的项目不需要复制此文件。

### 3. 无需复制 CLAUDE.md

Design System 的流程和组件通过 **workflow 系统** 注入，不需要在项目根目录放额外的 CLAUDE.md。

在你的 workflow 配置中添加以下文件引用即可：

```
UI：
- CLAUDE.md
- /Users/yangqing/Desktop/design/workflow.md
- /Users/yangqing/Desktop/design/components-cheatsheet.md
```

- `workflow.md`：三场景流程（首次生成 / 增量开发 / 重构）+ 样式映射表 + 硬约束
- `components-cheatsheet.md`：全部组件的可复制 Tailwind HTML 代码

---

## 已有旧页面的项目如何接入

1. 复制 `design-tokens.css` 到项目根目录
2. 在 workflow 中添加上方两个绝对路径引用
3. 对 Claude 说："重构这个页面，完全替换为 Design System 组件"

Claude 会按照 `workflow.md` 中的场景 C 执行：
- 引入 Tailwind CDN
- 按映射表替换所有旧样式
- 用 cheatsheet 组件替换每个元素
- 禁止保留旧 class 和 inline style

---

## DS 合规自检

项目接入后，运行合规检查确认所有模板文件符合 Design System 规范：

```bash
# 从 DS 仓库获取检查脚本（零依赖，单文件）
curl -O https://raw.githubusercontent.com/.../main/scripts/check-ds-compliance.sh
bash check-ds-compliance.sh ./templates/
```

检查 10 条规则：`transition-all` · duration 值 · `shadow-*` · `border` · 焦点环颜色 · `rounded-full` · 纯黑/白 · `font-family` · `motion-reduce`。

Exit code = 违规数，可集成到 CI。
