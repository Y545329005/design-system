# Badge

Badge 是状态标签组件，用于传达分类、状态、优先级等信息。所有语义色严格遵循 [语义色统一原则](../principles/semantic-color-unification.md)。

> **Design Tokens**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md)
>
> **关联组件**: [Toast](./toast.md) · [Table](./table.md) · [Chart](./chart.md)（均复用 Badge 的语义色彩映射）
>
> **依赖**: 无额外依赖

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 圆角 | `rounded-lg` (8px) | 全局统一——Badge 是小型容器，不应使用 `rounded-full` |
| 字体 | `text-xs font-medium` | 最小可读字号 + 中等字重，标签不抢正文注意力 |
| 内边距 | `px-2 py-0.5` | 紧凑但不拥挤——适合行内混排 |
| 语义色 | 5 色映射 (green/amber/red/blue/gray) | 与 Toast / Table Status / Chart Legend 完全一致 |
| 暗色模式 | 背景 `900/30` + 文字 `400` | 暗背景上降饱和度，避免荧光感 |
| 描边 | Outline 变体使用 `inset-ring` | 与全局 inset-ring 体系一致 |

---

## 语义色映射

所有 Badge 变体使用以下统一色彩映射（与 [语义色统一](../principles/semantic-color-unification.md) 零偏差）：

| 语义 | Light 背景 | Light 文字 | Dark 背景 | Dark 文字 |
|------|-----------|-----------|----------|----------|
| Success | `bg-green-50` | `text-green-700` | `dark:bg-green-900/30` | `dark:text-green-400` |
| Warning | `bg-amber-50` | `text-amber-700` | `dark:bg-amber-900/30` | `dark:text-amber-400` |
| Error | `bg-red-50` | `text-red-700` | `dark:bg-red-900/30` | `dark:text-red-400` |
| Info | `bg-blue-50` | `text-blue-700` | `dark:bg-blue-900/30` | `dark:text-blue-400` |
| Neutral | `bg-gray-50` | `text-gray-700` | `dark:bg-gray-800` | `dark:text-gray-300` |
| Brand | `bg-indigo-50` | `text-indigo-700` | `dark:bg-indigo-900/30` | `dark:text-indigo-400` |

---

## 变体

### 1. Solid — 实心标签

最常用的标签变体。纯色背景 + 同色系深色文字。

```html
<!-- Success -->
<span class="inline-flex items-center rounded-lg bg-green-50 px-2 py-0.5 text-xs font-medium text-green-700 dark:bg-green-900/30 dark:text-green-400">
  Active
</span>

<!-- Warning -->
<span class="inline-flex items-center rounded-lg bg-amber-50 px-2 py-0.5 text-xs font-medium text-amber-700 dark:bg-amber-900/30 dark:text-amber-400">
  Pending
</span>

<!-- Error -->
<span class="inline-flex items-center rounded-lg bg-red-50 px-2 py-0.5 text-xs font-medium text-red-700 dark:bg-red-900/30 dark:text-red-400">
  Overdue
</span>

<!-- Info -->
<span class="inline-flex items-center rounded-lg bg-blue-50 px-2 py-0.5 text-xs font-medium text-blue-700 dark:bg-blue-900/30 dark:text-blue-400">
  New
</span>

<!-- Neutral -->
<span class="inline-flex items-center rounded-lg bg-gray-50 px-2 py-0.5 text-xs font-medium text-gray-700 dark:bg-gray-800 dark:text-gray-300">
  Draft
</span>

<!-- Brand Accent -->
<span class="inline-flex items-center rounded-lg bg-indigo-50 px-2 py-0.5 text-xs font-medium text-indigo-700 dark:bg-indigo-900/30 dark:text-indigo-400">
  Featured
</span>
```

**设计要点：**
- 不使用 `rounded-full`——与全局 8px 圆角保持一致
- `inline-flex items-center` 确保与文字、图标、按钮行内混排时基线对齐
- Brand 变体仅用于非状态传达场景（如 "Featured"、"Premium"）——不与 Success/Error 等语义色竞争

---

### 2. Outline — 线框标签

透明背景 + 彩色描边。适用：次级信息、标签云、低视觉权重场景。

```html
<!-- Success Outline -->
<span class="inline-flex items-center rounded-lg px-2 py-0.5 text-xs font-medium text-green-700 inset-ring inset-ring-green-300 dark:text-green-400 dark:inset-ring-green-400/50">
  Completed
</span>

<!-- Warning Outline -->
<span class="inline-flex items-center rounded-lg px-2 py-0.5 text-xs font-medium text-amber-700 inset-ring inset-ring-amber-300 dark:text-amber-400 dark:inset-ring-amber-400/50">
  Review
</span>

<!-- Error Outline -->
<span class="inline-flex items-center rounded-lg px-2 py-0.5 text-xs font-medium text-red-700 inset-ring inset-ring-red-300 dark:text-red-400 dark:inset-ring-red-400/50">
  Failed
</span>

<!-- Info Outline -->
<span class="inline-flex items-center rounded-lg px-2 py-0.5 text-xs font-medium text-blue-700 inset-ring inset-ring-blue-300 dark:text-blue-400 dark:inset-ring-blue-400/50">
  Beta
</span>

<!-- Neutral Outline -->
<span class="inline-flex items-center rounded-lg px-2 py-0.5 text-xs font-medium text-gray-700 inset-ring inset-ring-gray-300 dark:text-gray-400 dark:inset-ring-gray-600">
  Archived
</span>
```

**设计要点：**
- `inset-ring` 而非 `border`——与全局描边体系一致，不占布局空间
- 暗色模式描边使用 `400/50` 半透明——比纯色更柔和
- Outline 与 Solid 不应在同一区域混用——每种场景选择一种，保持视觉统一

---

### 3. With Icon — 带图标标签

在 Solid 变体基础上，左侧添加语义图标。图标颜色与文字一致。

```html
<!-- Success + Check -->
<span class="inline-flex items-center gap-1 rounded-lg bg-green-50 px-2 py-0.5 text-xs font-medium text-green-700 dark:bg-green-900/30 dark:text-green-400">
  <svg class="size-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
    <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" />
  </svg>
  Verified
</span>

<!-- Warning + Alert -->
<span class="inline-flex items-center gap-1 rounded-lg bg-amber-50 px-2 py-0.5 text-xs font-medium text-amber-700 dark:bg-amber-900/30 dark:text-amber-400">
  <svg class="size-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
    <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126zM12 15.75h.007v.008H12v-.008z" />
  </svg>
  Attention
</span>

<!-- Info + Info circle -->
<span class="inline-flex items-center gap-1 rounded-lg bg-blue-50 px-2 py-0.5 text-xs font-medium text-blue-700 dark:bg-blue-900/30 dark:text-blue-400">
  <svg class="size-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
    <path stroke-linecap="round" stroke-linejoin="round" d="M11.25 11.25l.041-.02a.75.75 0 011.063.852l-.708 2.836a.75.75 0 001.063.853l.041-.021M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-9-3.75h.008v.008H12V8.25z" />
  </svg>
  Information
</span>

<!-- Error + X -->
<span class="inline-flex items-center gap-1 rounded-lg bg-red-50 px-2 py-0.5 text-xs font-medium text-red-700 dark:bg-red-900/30 dark:text-red-400">
  <svg class="size-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
  </svg>
  Blocked
</span>
```

**设计要点：**
- `gap-1` (4px) 图标与文字间距——比按钮的 `gap-2` 更紧凑
- `size-3.5` (14px) 图标——略小于文字行高，视觉平衡
- `aria-hidden="true"`——图标纯装饰，不传达额外信息（文字已说明）

---

### 4. Dismissible — 可关闭标签

Solid 变体 + 右侧关闭按钮。适用：过滤标签、已选标签、芯片输入。

```html
<!-- Dismissible Badge -->
<span class="inline-flex items-center gap-1 rounded-lg bg-gray-50 pl-2 pr-1 py-0.5 text-xs font-medium text-gray-700 dark:bg-gray-800 dark:text-gray-300">
  Design
  <button
    type="button"
    class="inline-flex items-center justify-center rounded p-0.5 text-gray-400 transition-colors duration-150 hover:bg-gray-200 hover:text-gray-600 dark:hover:bg-gray-700 dark:hover:text-gray-300 motion-reduce:transition-none"
    aria-label="Remove Design"
  >
    <svg class="size-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
      <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
    </svg>
  </button>
</span>

<!-- Dismissible with semantic color -->
<span class="inline-flex items-center gap-1 rounded-lg bg-indigo-50 pl-2 pr-1 py-0.5 text-xs font-medium text-indigo-700 dark:bg-indigo-900/30 dark:text-indigo-400">
  Frontend
  <button
    type="button"
    class="inline-flex items-center justify-center rounded p-0.5 text-indigo-400 transition-colors duration-150 hover:bg-indigo-200 hover:text-indigo-600 dark:hover:bg-indigo-800 dark:hover:text-indigo-300 motion-reduce:transition-none"
    aria-label="Remove Frontend"
  >
    <svg class="size-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
      <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
    </svg>
  </button>
</span>
```

**设计要点：**
- `pl-2 pr-1`——左侧正常内边距，右侧减半为关闭按钮留空间
- 关闭按钮 `p-0.5` (2px) 扩大触控区域至 20px，同时视觉不显笨重
- `aria-label="Remove {label}"`——描述性标签，而非通用的 "Close"
- hover 时关闭按钮背景加深——即时视觉反馈

### Dismissible 组合示例

```html
<!-- Filter Tags Row -->
<div class="flex flex-wrap items-center gap-2">
  <span class="inline-flex items-center gap-1 rounded-lg bg-indigo-50 pl-2 pr-1 py-0.5 text-xs font-medium text-indigo-700 dark:bg-indigo-900/30 dark:text-indigo-400">
    Design
    <button type="button" class="inline-flex items-center justify-center rounded p-0.5 text-indigo-400 transition-colors duration-150 hover:bg-indigo-200 hover:text-indigo-600 dark:hover:bg-indigo-800 dark:hover:text-indigo-300 motion-reduce:transition-none" aria-label="Remove Design">
      <svg class="size-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5"><path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"/></svg>
    </button>
  </span>
  <span class="inline-flex items-center gap-1 rounded-lg bg-green-50 pl-2 pr-1 py-0.5 text-xs font-medium text-green-700 dark:bg-green-900/30 dark:text-green-400">
    Active
    <button type="button" class="inline-flex items-center justify-center rounded p-0.5 text-green-400 transition-colors duration-150 hover:bg-green-200 hover:text-green-600 dark:hover:bg-green-800 dark:hover:text-green-300 motion-reduce:transition-none" aria-label="Remove Active">
      <svg class="size-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5"><path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"/></svg>
    </button>
  </span>
  <span class="inline-flex items-center gap-1 rounded-lg bg-amber-50 pl-2 pr-1 py-0.5 text-xs font-medium text-amber-700 dark:bg-amber-900/30 dark:text-amber-400">
    In Review
    <button type="button" class="inline-flex items-center justify-center rounded p-0.5 text-amber-400 transition-colors duration-150 hover:bg-amber-200 hover:text-amber-600 dark:hover:bg-amber-800 dark:hover:text-amber-300 motion-reduce:transition-none" aria-label="Remove In Review">
      <svg class="size-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5"><path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"/></svg>
    </button>
  </span>
</div>
```

**设计要点：**
- 容器使用 `flex flex-wrap items-center gap-2`——标签自动换行
- 不同语义色的标签可以在同一行混合使用

---

## 使用场景矩阵

| 场景 | 推荐变体 | 配色 |
|------|---------|------|
| 表格状态列 (Active / Inactive / Pending) | Solid | 语义色 |
| 表格状态列 (Draft / Archived) | Outline | Neutral |
| 通知/提示中的状态指示 | Solid with Icon | 语义色 |
| 过滤标签 / 已选标签 | Dismissible | Neutral 或 Brand |
| 标签云 / 分类列表 | Outline | Neutral |
| 价格标签 (Free / Pro / Enterprise) | Solid | Brand |
| 产品卡片角标 (New / Sale) | Solid | Brand 或 Error |
| 趋势指示器 (↑12.5%) | Solid with Icon | Success / Error |
| 功能标记 (Beta / Coming Soon) | Solid 或 Outline | Info |

---

## Design Tokens

| Token | Tailwind | 值 | 说明 |
|-------|----------|-----|------|
| 圆角 | `rounded-lg` | 8px | 全局统一 |
| Padding | `px-2 py-0.5` | 8px 2px | 紧凑行内标签 |
| 字号 | `text-xs` | 12px / 16px | 最小可读字号 |
| 字重 | `font-medium` | 500 | 半粗，不抢正文注意力 |
| 图标尺寸 | `size-3.5` | 14px | 视觉平衡 |
| 图标间距 | `gap-1` | 4px | 图标与文字 |
| 关闭按钮 padding | `p-0.5` | 2px | 扩大触控区域 |
| 关闭图标尺寸 | `size-3` | 12px | 关闭 × 图标 |
| 过渡 | `transition-colors duration-150` | 150ms | 仅关闭按钮 hover |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| 语义元素 | 非交互标签使用 `<span>`；可关闭标签内的按钮用 `<button>` |
| 图标装饰 | 所有 SVG 使用 `aria-hidden="true"`——文字已传达语义 |
| 关闭按钮 | `aria-label="Remove {label}"`——描述性标签 |
| 颜色对比度 | `text-green-700` (#15803D) : `bg-green-50` (#F0FDF4) = 5.5:1 (WCAG AA) ✅ |
| 颜色传达 | 颜色不是唯一的信息传达方式——始终配合文字标签 |
| 减少动画 | `motion-reduce:transition-none` |

---

## 复用指南

### 何时使用

| 场景 | 变体 | 说明 |
|------|------|------|
| 状态传达 (Active/Draft/Error) | Solid | 最常用 |
| 次级信息 / 低视觉权重 | Outline | 不抢主要内容 |
| 需要语义图标辅助 | With Icon | 图标增强理解 |
| 可移除标签 (过滤/芯片) | Dismissible | 用户可操作 |

### 何时不用

| 场景 | 替代方案 |
|------|---------|
| 可点击的操作按钮 | [Button](./button.md) |
| 浮动通知 | [Toast](./toast.md) |
| 开关状态 | [Toggle](./toggle.md) |
| 选中/未选中 | Checkbox 或 Toggle |
| 进度阶段 (Step 1/2/3) | Stepper 或 Progress Indicator |

### 组合规则

```
✅ Badge 内联混排文字 → inline-flex items-center 基线对齐
✅ 多个 Badge 同行  → flex flex-wrap gap-2
✅ Solid + Outline 分场景使用 → 同一区域不混用两种变体
❌ Badge 用作按钮    → 使用 Button Ghost sm
❌ Badge 使用 rounded-full → 统一 rounded-lg
❌ 自行选择语义色    → 必须从映射表取值
```

---

## 与其他组件的关系

Badge 是语义色彩的 **定义者**——所有需要状态色彩的组件都从此引用：

```
Badge（定义语义色映射）
 ├── Toast  → 复用 Success/Warning/Error/Info 四色映射
 ├── Table  → Status 列使用 Badge Solid 变体
 ├── Chart  → 图例指示点复用 Badge 点状标记模式
 └── Card   → Stat Card 趋势指示器复用 Badge Solid 变体
```

新组件如需传达状态，**禁止**自行选择色彩——从 Badge 的语义色映射表取值。

---

> 参考: [语义色统一](../principles/semantic-color-unification.md) · [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Compose, Don't Duplicate](../principles/compose-dont-duplicate.md)
