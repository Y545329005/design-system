# UI System

本目录是整个项目唯一可信的 UI 设计规范来源（Single Source of Truth）。

所有 AI（Claude Code、Codex、Gemini 等）在生成页面前，应优先阅读本目录，而不是自行设计新的 UI 风格。

设计原则：

- 优先复用已有组件
- 优先遵循 Design Tokens
- 缺少组件时先提出建议，再新增
- 禁止重复定义已有组件

## ## AI 使用规则

所有 AI 在生成页面前必须遵循：

① 阅读 README

② 阅读 Principles

③ 阅读 Design Tokens

④ 阅读相关 Components

⑤ 阅读 Template（如果存在）

然后：

开始设计。

设计完成以后：

必须执行：

REVIEW_GUIDE.md

最后判断：

今天是否值得更新 Design System。

如果值得，

请提出建议。

未经确认，

不要直接修改规范。

# 

## 快速开始

所有组件使用 Tailwind CSS，复制代码块即可使用。

```html
<!-- 复制任意组件代码，粘贴到你的 Tailwind 项目中 -->
```

## Design Tokens

| Token      | 文件                                                   | 说明                        |
| ---------- | ---------------------------------------------------- | ------------------------- |
| Colors     | [design-tokens/colors.md](design-tokens/colors.md)   | 中性色 · 透明度层次 · 语义色 · 暗色模式  |
| Spacing    | [design-tokens/spacing.md](design-tokens/spacing.md) | 间距 · 圆角 · 响应式断点 |
| Typography | [design-tokens/typography.md](design-tokens/typography.md) | 字体族 · 字号层级 · 字重 · 行高 · 文字色 |
| Motion     | [design-tokens/motion.md](design-tokens/motion.md)   | 过渡时长 · 缓动函数 · 动画模式 · GPU 合成 |
| Elevation  | [design-tokens/elevation.md](design-tokens/elevation.md) | 层级 · inset-ring · 表单控件层次 |

## Components

### 基础组件

| 组件       | 变体数          | 文件                                               | 状态   |
| -------- | ------------ | ------------------------------------------------ | ---- |
| Button   | 5            | [components/button.md](components/button.md)     | ✅ 可用 |
| Badge    | 4 × 5 colors | [components/badge.md](components/badge.md)       | ✅ 可用 |
| Input    | 4 + states   | [components/input.md](components/input.md)       | ✅ 可用 |
| Select   | 5 + states   | [components/select.md](components/select.md)     | ✅ 可用 |
| Toggle   | 5 + sizes    | [components/toggle.md](components/toggle.md)     | ✅ 可用 |
| Checkbox | 7 + sizes    | [components/checkbox.md](components/checkbox.md) | ✅ 可用 |
| Textarea | 5 + states   | [components/textarea.md](components/textarea.md) | ✅ 可用 |
| Radio    | 7 + sizes    | [components/radio.md](components/radio.md)       | ✅ 可用 |
| Tabs     | 4            | [components/tabs.md](components/tabs.md)         | ✅ 可用 |
| Segmented Control | 3     | [components/segmented-control.md](components/segmented-control.md) | ✅ 可用 |

### 复合组件

| 组件    | 变体数            | 文件                                         | 状态   |
| ----- | -------------- | ------------------------------------------ | ---- |
| Card  | 6 + layouts    | [components/card.md](components/card.md)   | ✅ 可用 |
| Modal | 4 + sizes      | [components/modal.md](components/modal.md) | ✅ 可用 |
| Toast | 6 × 4 colors   | [components/toast.md](components/toast.md) | ✅ 可用 |
| Table | 5 + responsive | [components/table.md](components/table.md) | ✅ 可用 |
| Sidebar | 3 + responsive | [components/sidebar.md](components/sidebar.md) | ✅ 可用 |
| Navbar  | 3 + responsive | [components/navbar.md](components/navbar.md) | ✅ 可用 |
| Footer  | 3              | [components/footer.md](components/footer.md) | ✅ 可用 |
| Empty State | 4 + icons | [components/empty-state.md](components/empty-state.md) | ✅ 可用 |
| Pagination | 4 + logic | [components/pagination.md](components/pagination.md) | ✅ 可用 |
| Dropdown Menu | 3 | [components/dropdown-menu.md](components/dropdown-menu.md) | ✅ 可用 |
| Tooltip   | 4 directions | [components/tooltip.md](components/tooltip.md) | ✅ 可用 |
| Avatar    | 4 + sizes | [components/avatar.md](components/avatar.md) | ✅ 可用 |
| Skeleton  | 6 | [components/skeleton.md](components/skeleton.md) | ✅ 可用 |
| Breadcrumb | 4 | [components/breadcrumb.md](components/breadcrumb.md) | ✅ 可用 |
| Progress Bar | 6 | [components/progress-bar.md](components/progress-bar.md) | ✅ 可用 |

### 数据可视化

| 组件   | 变体数          | 文件                                         | 状态   |
| ---- | ------------- | ------------------------------------------ | ---- |
| Chart | 4 + 3 states  | [components/chart.md](components/chart.md) | ✅ 可用 |

### 内容呈现

| 模块    | 变体            | 文件                                              | 状态   |
| ------- | --------------- | ------------------------------------------------- | ------ |
| Content | 2 + 7 规划中    | [components/content/README.md](components/content/README.md) | ✅ 可用 |
| Prose   | 3 × 17 elements | [components/content/prose.md](components/content/prose.md)   | ✅ 可用 |

### 计划中

*暂无计划中的组件。新需求请参考 [CLAUDE.md](../../CLAUDE.md) 流程提交。*

## Principles

| 原则        | 文件                                                                                   | 说明        |
| --------- | ------------------------------------------------------------------------------------ | --------- |
| 语义色统一     | [principles/semantic-color-unification.md](principles/semantic-color-unification.md) | 跨组件色彩一致性  |
| 组件间引用而非重复 | [principles/compose-dont-duplicate.md](principles/compose-dont-duplicate.md)         | 组件依赖与组合模式 |
| 命名原则     | [principles/naming.md](principles/naming.md)                                         | 组件/Token/Template 命名规范 |

## Templates

| 模板        | 文件                                               | 使用的组件                                                   |
| --------- | ------------------------------------------------ | ------------------------------------------------------- |
| Dashboard | [templates/dashboard.md](templates/dashboard.md) | Card · Table · Chart · Badge · Select · Toggle · Toast · Button |
| Settings  | [templates/settings.md](templates/settings.md)   | Sidebar · Navbar · Card · Input · Textarea · Select · Toggle · Checkbox · Button · Toast |
| Landing Page | [templates/landing-page.md](templates/landing-page.md) | Simple Navbar · Feature Card · Button · Badge · Pricing Card · Footer |

---

## 目录结构

```
ui-system/
├── README.md           ← 本文件
├── AI_Guide.md         ← AI 使用指南
├── REVIEW_GUIDE.md     ← Design Review 检查清单
├── design-tokens/
│   ├── colors.md       ← 色彩规范
│   ├── spacing.md      ← 间距 / 圆角 / 响应式断点
│   ├── typography.md   ← 字体 / 字号层级 / 字重 / 行高 / 文字色
│   ├── motion.md       ← 过渡时长 / 缓动函数 / 动画模式 / GPU 合成
│   └── elevation.md    ← 层级 / 阴影 / inset-ring 规范
├── components/
│   ├── button.md       ← 按钮：Primary, Secondary, Ghost, Danger
│   ├── badge.md        ← 标签：Solid, Outline, Icon, Dismissible
│   ├── input.md        ← 输入框：Base, Icon, Button, Floating
│   ├── select.md       ← 下拉选择：Base, Icon, Multiple, Error, Inline
│   ├── toggle.md       ← 开关：Base, Label, Icon, Color, Disabled
│   ├── checkbox.md     ← 复选框：Base, Description, Indeterminate, Error, Group, Inline
│   ├── textarea.md     ← 文本域：Base, CharacterCount, AutoResize, Error, Disabled
│   ├── radio.md        ← 单选按钮：Base, Description, Card, Group, Inline, Error, Disabled
│   ├── tabs.md         ← 标签切换：Underline, Pill, Block, Icon
│   ├── segmented-control.md ← 分段控制器：Base, BadgeCount, IconOnly
│   ├── card.md         ← 卡片：Blog, Feature, Profile, Stat, Product, Pricing
│   ├── modal.md        ← 弹窗：Base, Close, Confirm, Form
│   ├── toast.md        ← 通知：Success, Error, Warning, Info, Action, Standout
│   ├── table.md        ← 表格：Base, Striped, Actions, Checkbox, Responsive
│   ├── sidebar.md      ← 侧边栏：Base, Collapsed（折叠图标模式）
│   ├── navbar.md       ← 顶部栏：Standalone, Companion（配合 Sidebar）, Simple
│   ├── footer.md       ← 页脚：Base（5列）, Compact（单行）, Simple（居中）
│   ├── empty-state.md   ← 空态：Base, With Action, Inline, Full Page
│   ├── pagination.md    ← 分页：Base, Simple, Compact, With Page Size
│   ├── chart.md        ← 图表：Bar, Donut, Sparkline, Area + 加载/空/错误态
│   ├── dropdown-menu.md ← 下拉菜单：Base, UserMenu, ContextMenu
│   ├── tooltip.md      ← 提示框：Top, Bottom, Left, Right
│   ├── avatar.md       ← 头像：Image, Initials, Status, Group
│   ├── skeleton.md     ← 骨架屏：Text, Circle, Card, List, Table, FullPage
│   ├── breadcrumb.md   ← 面包屑：Base, Slash, HomeIcon, Mobile
│   ├── progress-bar.md ← 进度条：Base, Semantic, Indeterminate, Multi, Steps, Icon
│   └── content/        ← 内容呈现体系
│       ├── README.md   ← Content 架构说明
│       └── prose.md    ← 基础排版：3 变体 × 17 种元素
├── templates/
│   ├── component-spec.md ← 组件规范模板
│   ├── dashboard.md    ← 仪表盘模板（Card + Table + Chart + Toggle + Select + Toast）
│   ├── settings.md     ← 设置页模板（Sidebar + Navbar + 全表单组件验证）
│   └── landing-page.md ← 落地页模板（Simple Navbar + Hero + Features + Pricing + Footer）
└── principles/
    ├── semantic-color-unification.md  ← 语义色统一原则
    ├── compose-dont-duplicate.md      ← 组件间引用而非重复
    └── naming.md                      ← 组件 / Token / Template 命名规范
```
