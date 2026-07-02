# 新项目接入指南

在一个全新项目中使用本 Design System 的完整步骤。

---

## 方式一：直接复制（推荐，最简单）

### 步骤 1：复制 DS 到新项目

```bash
cp -R /path/to/design/ui-system /path/to/new-project/
cp -R /path/to/design/checklists /path/to/new-project/
cp /path/to/design/design-tokens.css /path/to/new-project/
cp /path/to/design/components-cheatsheet.md /path/to/new-project/
```

### 步骤 2：复制项目模板

```bash
cp /path/to/design/project-template/CLAUDE.md /path/to/new-project/
cp /path/to/design/project-template/index.html /path/to/new-project/
```

### 步骤 3：修改 CLAUDE.md

在新项目的 `CLAUDE.md` 中修改 `{{PROJECT_NAME}}` 为实际项目名。

### 步骤 4：修改 index.html

在新项目的 `index.html` 中修改 `{{PROJECT_NAME}}` 为实际项目名。

---

## 方式二：Git Submodule（可同步更新）

```bash
cd /path/to/new-project
git init
git submodule add <design-system-repo-url> ui-system
```

然后在项目的 `CLAUDE.md` 中指向 `ui-system/` 目录。

---

## AI 在新项目中的工作流程

当 AI 启动并读取到项目的 `CLAUDE.md` 后，它会自动：

1. 读取 `ui-system/README.md` 了解整体架构
2. 需要组件时：读取 `components-cheatsheet.md`（一次读取，获取全部组件代码块）
3. 需要 Token 时：读取 `design-tokens.css`（直接可用）
4. 完成后执行 `checklists/ui-review.md` 自检

这比之前逐个读取 15+ 个文件节省 **约 80% 的 token 消耗**。

---

## 文件说明

| 文件 | 用途 | AI 需要读取？ |
|------|------|-------------|
| `CLAUDE.md` | 项目级 AI 指导 | ✅ 自动读取 |
| `ui-system/README.md` | DS 架构和组件索引进 | ✅ 首次 |
| `components-cheatsheet.md` | 所有组件代码块汇总 | ✅ **每次生成页面** |
| `design-tokens.css` | 可执行 CSS Token | ✅ 需要时 |
| `design-tokens.json` | 结构化 Token 导出 | 可选（工具链用） |
| `checklists/ui-review.md` | 生成后自检 | ✅ 每次生成后 |
| `ui-system/components/*.md` | 完整组件文档 | 深度设计时 |

---

## 预期效果

使用这套 DS 后，AI 生成一个页面的流程从：

```
读取 15+ 个文件 → 翻译 Token → 写代码
```

压缩为：

```
读取 components-cheatsheet.md → 复制组件代码 → 拼装页面
```

Token 消耗降低约 80%，且风格一致性由 DS 保证。
