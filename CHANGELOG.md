# Changelog

All notable changes to this Design System project.

---

## [0.1.1] — 2026-07-03

### 🎯 Overview

反馈闭环：外部项目（bili-summary）提出的 11 条 DS 反馈 → 逐条核验 → 排除 4 条误报 → 执行 6 条有效修改 + 3 项结构改进。核心教训：**外部反馈不等于外部审计——不溯源 token 文件的反馈，即使是高优先级标记，也可能是错的。**

### Cheatsheet 修改

- **Progress Bar** `transition-all` → `transition-[width]`（L773）——符合 motion.md §四 `transition-all` 禁令，同 §九 Progress Bar 例外
- **新增 Page Hero 布局模式**（Layout Patterns 区域）——渐变背景 + 标题/副标题组合，light/dark 双模式
- **新增暗色模式变体速查表**（11 行映射表）——cheatsheet 以 light 为主，dark 变体集中在速查表，避免双栏膨胀
- **新增 Token 溯源索引**（文件头部 9 行表格）——每类组件 → 对应源 token 文件 + 关键 token 名，让 AI 反馈前先定位源文件

### Workflow 修改

- **§3.4 边框映射表**：新增 `input:focus` 行 + box-shadow 例外说明
- **§3.5 验证清单**：更新 box-shadow 删除项——明确 overlay 例外（Dropdown、Tooltip、Modal）
- **§4 常见错误**：box-shadow 行更新为非 overlay 限定
- **§5.1 动效**：`transition-[width]` 例外说明（进度条）
- **§5.2 知识沉淀**：新增「反馈规范问题必须先打开源 token 文件确认」
- **§七 新增「DS 问题反馈指南」**：4 步流程（定位→溯源→分类→写反馈）+ 反馈模板 + 常见误解表

### 工具链

- **`scripts/lint-cheatsheet.sh`** — DS 内部自检：7 条规则（transition-all、shadow-*、duration、rounded-full、纯黑/白、font-family、border），运行通过 0 违规
- **`scripts/check-ds-compliance.sh`** — 外部项目一键合规检查：10 条规则，零依赖，curl 即用，支持 CI 集成（exit code = 违规数）

### 关键设计决策

- **反馈必须溯源**：任何 DS 反馈必须先打开 token 源文件引用具体行号和 token 名，禁止凭记忆
- **外部合规检查独立于 DS 仓库**：一个 curl 命令即可在外部项目运行，不需要克隆 DS 仓库
- **cheatsheet 单文件策略延续**：暗色模式不双栏展示，用速查表引用

---

## [0.1.0] — 2026-07-02

### 🎯 Overview

Initial release. 27 components, 5 design tokens, 3 page templates, 3 design principles, research analysis of 6 reference sites, and a comprehensive component cheatsheet for AI-driven development.

### Design Tokens (5)

- **Colors** — Neutral grays with transparency layers, semantic colors, dark mode palette
- **Spacing** — Spacing scale, border radius tiers, responsive breakpoints
- **Typography** — System font stack, type scale, font weights, line heights, text colors
- **Motion** — Transition durations, easing functions, animation modes, GPU compositing
- **Elevation** — Z-index layers, inset-ring specification, form control hierarchy

### Base Components (10)

| Component | Variants | File |
|-----------|---------|------|
| Button | 5 (Primary, Secondary, Ghost, Danger, Danger Secondary) + 3 sizes + Icon | `ui-system/components/button.md` |
| Badge | 4 (Solid, Outline, Icon, Dismissible) × 6 colors | `ui-system/components/badge.md` |
| Input | 4 (Base, Icon, Error, Disabled) + states | `ui-system/components/input.md` |
| Select | 5 (Base, Icon, Multiple, Error, Inline) + states | `ui-system/components/select.md` |
| Toggle | 5 (Base, Label, Icon, Color, Disabled) + sizes | `ui-system/components/toggle.md` |
| Checkbox | 7 (Base, Description, Indeterminate, Error, Group, Inline, Disabled) + sizes | `ui-system/components/checkbox.md` |
| Textarea | 5 (Base, CharacterCount, AutoResize, Error, Disabled) + states | `ui-system/components/textarea.md` |
| Radio | 7 (Base, Description, Card, Group, Inline, Error, Disabled) + sizes | `ui-system/components/radio.md` |
| Tabs | 4 (Underline, Pill, Block, Icon) | `ui-system/components/tabs.md` |
| Segmented Control | 3 (Base, BadgeCount, IconOnly) | `ui-system/components/segmented-control.md` |

### Composite Components (15)

| Component | Variants | File |
|-----------|---------|------|
| Card | 6 (Blog, Feature, Profile, Stat, Product, Pricing) + layouts | `ui-system/components/card.md` |
| Modal | 4 (Base, Close, Confirm, Form) + sizes | `ui-system/components/modal.md` |
| Toast | 6 (Success, Error, Warning, Info, Action, Standout) × 4 colors | `ui-system/components/toast.md` |
| Table | 5 (Base, Striped, Actions, Checkbox, Responsive) | `ui-system/components/table.md` |
| Sidebar | 3 (Base, Collapsed, Compact) + responsive | `ui-system/components/sidebar.md` |
| Navbar | 3 (Standalone, Companion, Simple) + responsive | `ui-system/components/navbar.md` |
| Footer | 3 (Base, Compact, Simple) | `ui-system/components/footer.md` |
| Empty State | 4 (Base, WithAction, Inline, FullPage) + icons | `ui-system/components/empty-state.md` |
| Pagination | 4 (Base, Simple, Compact, WithPageSize) + logic | `ui-system/components/pagination.md` |
| Dropdown Menu | 3 (Base, UserMenu, ContextMenu) | `ui-system/components/dropdown-menu.md` |
| Tooltip | 4 directions (Top, Bottom, Left, Right) | `ui-system/components/tooltip.md` |
| Avatar | 4 (Image, Initials, Status, Group) + 5 sizes | `ui-system/components/avatar.md` |
| Skeleton | 6 (Text, Circle, Card, List, Table, FullPage) | `ui-system/components/skeleton.md` |
| Breadcrumb | 4 (Base, Slash, HomeIcon, Mobile) | `ui-system/components/breadcrumb.md` |
| Progress Bar | 6 (Base, Semantic, Indeterminate, Multi, Steps, Icon) | `ui-system/components/progress-bar.md` |

### Data Visualization (1)

- **Chart** — 4 types (Bar, Donut, Sparkline, Area) + 3 states (Loading, Empty, Error)

### Content Presentation (1)

- **Prose** — 3 variants × 17 HTML elements for long-form content

### Page Templates (3)

- **Dashboard** — Sidebar + Navbar + Cards + Table + Chart + Badges
- **Settings** — Sidebar + Navbar + full form components validation
- **Landing Page** — Simple Navbar + Hero + Features + Pricing Cards + Footer

### Design Principles (3)

- **Semantic Color Unification** — Cross-component color consistency rules
- **Compose Don't Duplicate** — Component dependency and composition patterns
- **Naming** — Component / Token / Template naming conventions

### Engineering

- **`components-cheatsheet.md`** — All 27 components' primary variants in a single copyable file (839 lines)
- **`preview-all.html`** — Visual preview of all 27 components with Light/Dark toggle
- **`preview-settings.html`** — Settings page preview
- **`battle-test-dashboard.html`** — Real-world dashboard built purely from cheatsheet (15 components, 0 errors)
- **`design-tokens.json`** + **`design-tokens.css`** — Programmatic token access
- **Project template** — Starter files for new projects
- **`workflow.md`** — Development workflow reference
- **`REVIEW_GUIDE.md`** — Design review checklist
- **`AI_Guide.md`** — AI usage instructions

### Research (6 reference sites)

- Linear, Notion, Stripe, Vercel, TailwindCSS, Anthropic
- Design patterns, component analysis, typography, spacing, interaction patterns

### Key Design Decisions

- **inset-ring** over `border` for all form controls and containers
- **rounded-lg (8px)** for interactive elements, **rounded-xl (12px)** for containers
- **rounded-full** ONLY for Avatar, Progress Bar, Radio, and Toggle (explicitly documented exceptions — these are circular by design)
- **bg-gray-950/[2.5%]** for hover backgrounds (transparency-based, Light/Dark compatible)
- **transition-colors duration-150** for hover/focus feedback
- **motion-reduce:transition-none** on all interactive elements
- **shadow-lg/shadow-sm** only in overlay elements: Dropdown Menu, Tooltip, Toggle thumb (floating panels and physical switch knobs need elevation — documented exception)
- **System font stack** only (no web fonts)
- **300ms delay** for Tooltip display to prevent flickering
