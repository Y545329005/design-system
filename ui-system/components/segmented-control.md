# Segmented Control

Segmented Control 分段控制器，用于在有限的几个选项中切换视图或筛选条件。与 Tabs 的区别：Segmented Control 切换的是同一数据的视图（如筛选状态），不改变页面内容区域。

> **Design Tokens**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Motion](../design-tokens/motion.md)
>
> **关联组件**: [Tabs](./tabs.md) · [Button](./button.md) · [Badge](./badge.md)
>
> **依赖**: 无额外依赖

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 圆角 | 容器 `rounded-lg` (8px) / 项目 `rounded-md` (6px) | 与 Pill Tabs 一致 |
| 激活态背景 | `bg-white + inset-ring` | 白色卡片浮在底板上的效果——与 Pill Tabs 完全相同 |
| 底板色 | `bg-gray-950/[2.5%]` | 2.5% 透明度底板 |
| 字号 | `text-sm font-medium` | 与 Tabs / Button sm 一致 |
| Padding | `px-3 py-1.5` | 紧凑型——与 Pill Tabs 完全一致 |
| 容器 padding | `p-1` | 4px 内边距 |
| 动效 | `transition-colors duration-150` | Hover 文字色变化 |
| 与 Tabs 的区别 | Segmented Control 用于**数据筛选/排序**，Tabs 用于**内容区切换** | |

---

## 变体

### 1. Base — 基础分段控制器

```html
<!-- Segmented Control — Filter by Status -->
<div class="inline-flex rounded-lg bg-gray-950/[2.5%] p-1 dark:bg-white/[2.5%]" role="radiogroup" aria-label="Filter by status">
  <button role="radio" aria-checked="true"
    class="rounded-md px-3 py-1.5 text-sm font-medium text-gray-900 bg-white inset-ring inset-ring-gray-950/8 transition-colors duration-150 motion-reduce:transition-none dark:bg-gray-700 dark:text-white dark:inset-ring-white/10">
    All
  </button>
  <button role="radio" aria-checked="false"
    class="rounded-md px-3 py-1.5 text-sm font-medium text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-300">
    Active
  </button>
  <button role="radio" aria-checked="false"
    class="rounded-md px-3 py-1.5 text-sm font-medium text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-300">
    Draft
  </button>
  <button role="radio" aria-checked="false"
    class="rounded-md px-3 py-1.5 text-sm font-medium text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-300">
    Archived
  </button>
</div>
```

---

### 2. With Badge Count — 带数量标记

```html
<!-- Segmented Control With Counts -->
<div class="inline-flex rounded-lg bg-gray-950/[2.5%] p-1 dark:bg-white/[2.5%]" role="radiogroup" aria-label="Filter by status">
  <button role="radio" aria-checked="true"
    class="inline-flex items-center gap-1.5 rounded-md px-3 py-1.5 text-sm font-medium text-gray-900 bg-white inset-ring inset-ring-gray-950/8 transition-colors duration-150 motion-reduce:transition-none dark:bg-gray-700 dark:text-white dark:inset-ring-white/10">
    All
    <span class="inline-flex items-center justify-center rounded px-1.5 py-px text-xs font-medium text-gray-500 bg-gray-950/5 dark:text-gray-400 dark:bg-white/10">24</span>
  </button>
  <button role="radio" aria-checked="false"
    class="inline-flex items-center gap-1.5 rounded-md px-3 py-1.5 text-sm font-medium text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-300">
    Active
    <span class="inline-flex items-center justify-center rounded px-1.5 py-px text-xs font-medium text-gray-500 bg-gray-950/5 dark:text-gray-400 dark:bg-white/10">12</span>
  </button>
  <button role="radio" aria-checked="false"
    class="inline-flex items-center gap-1.5 rounded-md px-3 py-1.5 text-sm font-medium text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-300">
    Archived
    <span class="inline-flex items-center justify-center rounded px-1.5 py-px text-xs font-medium text-gray-500 bg-gray-950/5 dark:text-gray-400 dark:bg-white/10">8</span>
  </button>
</div>
```

**设计要点：**
- 数量标记使用 `bg-gray-950/5` 半透明背景——比 Badge 更轻量
- `gap-1.5` (6px)——计数与文字之间的间距
- `px-1.5 py-px`——紧凑的计数标记 padding

---

### 3. Icon Only — 图标模式

```html
<!-- Segmented Control — View Mode -->
<div class="inline-flex rounded-lg bg-gray-950/[2.5%] p-1 dark:bg-white/[2.5%]" role="radiogroup" aria-label="View mode">
  <button role="radio" aria-checked="true" aria-label="Grid view"
    class="rounded-md p-2 text-gray-900 bg-white inset-ring inset-ring-gray-950/8 transition-colors duration-150 motion-reduce:transition-none dark:bg-gray-700 dark:text-white dark:inset-ring-white/10">
    <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6A2.25 2.25 0 016 3.75h2.25A2.25 2.25 0 0110.5 6v2.25a2.25 2.25 0 01-2.25 2.25H6a2.25 2.25 0 01-2.25-2.25V6zM3.75 15.75A2.25 2.25 0 016 13.5h2.25a2.25 2.25 0 012.25 2.25V18a2.25 2.25 0 01-2.25 2.25H6A2.25 2.25 0 013.75 18v-2.25zM13.5 6a2.25 2.25 0 012.25-2.25H18A2.25 2.25 0 0120.25 6v2.25A2.25 2.25 0 0118 10.5h-2.25a2.25 2.25 0 01-2.25-2.25V6zM13.5 15.75a2.25 2.25 0 012.25-2.25H18a2.25 2.25 0 012.25 2.25V18A2.25 2.25 0 0118 20.25h-2.25A2.25 2.25 0 0113.5 18v-2.25z"/></svg>
  </button>
  <button role="radio" aria-checked="false" aria-label="List view"
    class="rounded-md p-2 text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-300">
    <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M8.25 6.75h12M8.25 12h12m-12 5.25h12M3.75 6.75h.007v.008H3.75V6.75zm.375 5.25h.007v.008H3.75V12zm.375 5.25h.007v.008H3.75V17.25z"/></svg>
  </button>
</div>
```

**设计要点：**
- 纯图标时 `p-2` (8px)——方形触控区域，不需要横向 padding
- `aria-label` 在每个按钮上——图标没文字，必须提供 label

---

## 使用场景矩阵

| 场景 | 变体 | 说明 |
|------|------|------|
| 列表筛选（All / Active / Draft） | Base | 最常用 |
| 多状态分类切换 | Base | 2-5 个选项 |
| 带计数（"All 24"） | With Badge Count | 需要显示各状态数量 |
| 视图切换（Grid / List） | Icon Only | 仅 2-3 个图标选项 |
| 排序切换（New / Hot / Top） | Base | 轻量级排序 |

---

## Segmented Control vs Tabs

| 维度 | Segmented Control | Tabs |
|------|-----------------|------|
| 用途 | 数据筛选/排序/视图切换 | 内容区域切换 |
| 影响范围 | 当前列表/区域的数据 | 整个内容面板 |
| ARIA | `role="radiogroup"` | `role="tablist"` |
| 关联内容 | 无需 `tabpanel` | 必须有 `tabpanel` |
| URL 变更 | 通常不改变 URL | 可以改变 URL |
| 选项数 | 2-5 | 2-6 |

**选择规则**：
```
内容区切换 → Tabs
数据筛选/排序/视图模式 → Segmented Control
```

---

## Design Tokens

| Token | Tailwind | 值 | 说明 |
|-------|----------|-----|------|
| 容器圆角 | `rounded-lg` | 8px | |
| 项目圆角 | `rounded-md` | 6px | 内圈比外圈小 2px |
| 容器背景 | `bg-gray-950/[2.5%]` | 2.5% 黑 | |
| 容器 padding | `p-1` | 4px | |
| 项目 padding | `px-3 py-1.5` | 12px 6px | |
| 图标项目 padding | `p-2` | 8px | 纯图标方形触控区 |
| 字号 | `text-sm` | 14px | |
| 字重 | `font-medium` | 500 | |
| 计数标签 padding | `px-1.5 py-px` | 6px 1px | |
| 过渡 | `transition-colors duration-150` | 150ms | |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| 语义元素 | `role="radiogroup"` + `role="radio"` |
| 选中状态 | `aria-checked="true/false"` |
| 标签 | `aria-label="Filter by status"` 在容器上 |
| 图标模式 | `aria-label` 在每个按钮上 |
| 键盘导航 | Tab 进入组内，←→ 切换选项 |

---

## 复用指南

### 何时使用

- 列表状态筛选切换
- 视图模式切换（Grid/List）
- 排序方式切换（New/Hot/Top）
- 数据分类切换（All/Mine/Shared）

### 何时不用

| 场景 | 替代方案 |
|------|---------|
| 内容区切换 | [Tabs](./tabs.md) |
| 选项 > 5 | [Select](./select.md) |
| 多选筛选 | Checkbox Group |
| 表单输入 | Radio Group |

---

> 参考: [Apple Human Interface — Segmented Control](https://developer.apple.com/design/human-interface-guidelines/segmented-controls) · [Linear Filters](https://linear.app)
