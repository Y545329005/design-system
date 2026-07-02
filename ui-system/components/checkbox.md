# Checkbox

复选框是用于多选操作的基础表单控件。采用 `inset-ring` 描边体系，与 [Input](./input.md)、[Select](./select.md)、[Textarea](./textarea.md) 保持一致的表单控件设计语言。

> **Design Tokens**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Elevation](../design-tokens/elevation.md)
>
> **关联组件**: [Input](./input.md) · [Select](./select.md) · [Textarea](./textarea.md)（共享 error / disabled 语义色体系）
>
> **依赖**: 无额外插件依赖（使用 `peer` + `inset-ring` 替代传统 checkbox 样式）

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 描边 | `inset-ring` 透明度方案 | 与 Input / Select / Textarea 共享 Level 1 (Default) 描边模式 |
| 圆角 | `rounded` (4px) | 复选框传统语义——小圆角，区别于交互按钮的 `rounded-lg` (8px) |
| 选中背景 | `indigo-600` | 与 Button Primary 一致——选中态 = 最高视觉权重 |
| 选中标记 | 白色 SVG checkmark | 与 Button Primary 文字颜色一致 |
| Focus | `ring-2 ring-offset-2` | 与 Button 相同的小目标 Focus 模式——外扩 ring 确保可访问性 |
| 禁用 | `opacity-50` | 与 Input / Button 禁用态保持一致 |
| 过渡 | `transition-colors duration-150` | 全局统一 150ms |
| 暗色模式 | 透明度反转 + 黑白反转 | `inset-ring-white/10` + 选中态 `bg-white` |

---

## 变体

### 1. Base Checkbox（基础复选框）

最常用的复选框。整个 `<label>` 区域可点击。

```html
<!-- Base Checkbox -->
<label class="inline-flex items-start gap-2 cursor-pointer">
  <input
    type="checkbox"
    class="peer sr-only"
  />
  <span
    class="mt-0.5 flex size-4 shrink-0 items-center justify-center rounded
      bg-white
      inset-ring inset-ring-gray-950/8
      peer-checked:bg-indigo-600 peer-checked:inset-ring-indigo-600
      peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10
      peer-disabled:opacity-50 peer-disabled:cursor-not-allowed
      dark:bg-gray-900 dark:inset-ring-white/10
      dark:peer-checked:bg-indigo-500 dark:peer-checked:inset-ring-indigo-500
      dark:peer-focus-visible:ring-white/10
      transition-colors duration-150
      motion-reduce:transition-none"
    aria-hidden="true"
  >
    <svg
      class="size-3 text-white dark:text-gray-900"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      stroke-width="3"
      aria-hidden="true"
    >
      <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
    </svg>
  </span>
  <span class="text-sm text-gray-700 dark:text-gray-300">
    Accept terms and conditions
  </span>
</label>
```

**设计要点：**
- `peer sr-only` — 隐藏原生 input，但保留可聚焦和可访问性
- `mt-0.5` — 视觉对齐：16px checkbox 与 14px 文字的基线微调
- `size-4` (16px) — 与 Input 图标尺寸一致
- `rounded` (4px) — 复选框传统小圆角，与交互按钮 `rounded-lg` 形成层级差异
- `inset-ring-gray-950/8` — 与 Input 默认态共享 Level 1 描边
- `peer-checked:bg-indigo-600` — 选中态使用品牌色（当前占位），与 Button Primary 一致
- checkmark 颜色技巧：Light 模式 `text-white`（unchecked 时与 `bg-white` 同色→不可见；checked 时 `bg-indigo-600` 上可见）；Dark 模式 `dark:text-gray-900`（unchecked 时与 `bg-gray-900` 同色→不可见；checked 时 `bg-indigo-500` 上可见）
- 整个 `<label>` 可点击——扩大触控区域

---

### 2. With Description（带描述复选框）

复选框附带说明文字，用于需要解释选项含义的场景（如设置页、权限列表）。

```html
<!-- With Description -->
<label class="inline-flex items-start gap-2 cursor-pointer">
  <input
    type="checkbox"
    class="peer sr-only"
  />
  <span
    class="mt-0.5 flex size-4 shrink-0 items-center justify-center rounded
      bg-white
      inset-ring inset-ring-gray-950/8
      peer-checked:bg-indigo-600 peer-checked:inset-ring-indigo-600
      peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10
      peer-disabled:opacity-50 peer-disabled:cursor-not-allowed
      dark:bg-gray-900 dark:inset-ring-white/10
      dark:peer-checked:bg-indigo-500 dark:peer-checked:inset-ring-indigo-500
      dark:peer-focus-visible:ring-white/10
      transition-colors duration-150
      motion-reduce:transition-none"
    aria-hidden="true"
  >
    <svg
      class="size-3 text-white dark:text-gray-900"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      stroke-width="3"
      aria-hidden="true"
    >
      <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
    </svg>
  </span>
  <span class="flex flex-col gap-0.5">
    <span class="text-sm font-medium text-gray-900 dark:text-gray-100">
      Email notifications
    </span>
    <span class="text-sm text-gray-500 dark:text-gray-400">
      Receive email updates about your account activity and security alerts.
    </span>
  </span>
</label>
```

**设计要点：**
- Label + Description 双层文字结构
- 主标签 `font-medium` — 与 Input label 的 `font-medium` 保持一致
- 描述文字 `text-gray-500` — 辅助信息层级低于主标签
- `gap-0.5` (2px) — 主标签与描述的紧凑间距

---

### 3. Indeterminate（半选状态）

表示"部分选中"，用于父级复选框（如全选场景：部分子项已选，但未全部选中）。

```html
<!-- Indeterminate — 使用 JavaScript 设置 indeterminate 属性 -->
<label class="inline-flex items-start gap-2 cursor-pointer" id="parent-checkbox">
  <input
    type="checkbox"
    class="peer sr-only"
    id="select-all"
  />
  <span
    class="mt-0.5 flex size-4 shrink-0 items-center justify-center rounded
      bg-indigo-600
      inset-ring inset-ring-indigo-600
      peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10
      dark:bg-indigo-500 dark:inset-ring-indigo-500
      dark:peer-focus-visible:ring-white/10
      transition-colors duration-150
      motion-reduce:transition-none"
    aria-hidden="true"
  >
    <!-- 半选态使用横线图标（-），替代 checkmark -->
    <svg
      class="size-3 text-white dark:text-gray-900"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      stroke-width="3"
      aria-hidden="true"
    >
      <path stroke-linecap="round" stroke-linejoin="round" d="M5 12h14" />
    </svg>
  </span>
  <span class="text-sm font-medium text-gray-900 dark:text-gray-100">
    Select all
  </span>
</label>

<script>
  // 设置 indeterminate 属性（无法通过 HTML 属性设置）
  const checkbox = document.getElementById('select-all')
  checkbox.indeterminate = true
</script>
```

**设计要点：**
- Indeterminate 视觉上等同于 checked 态（填充背景），但使用横线而非勾选标记
- `indeterminate` 是 JavaScript-only 属性 —— HTML 无法直接设置
- `peer-indeterminate:` Tailwind 变体不支持 → 使用 JS 动态添加类名，或直接使用 checked 样式（视觉一致）
- 横线 SVG：`M5 12h14`（一条水平线）
- 当全选场景中部分子项选中时使用；全部选中→显示 checkmark；全部取消→显示 empty

---

### 4. Error 状态

复用语义色系统（[Colors](../design-tokens/colors.md) 第三节）。错误态用于表单验证失败的复选框（如"请同意条款"）。

```html
<!-- Error State -->
<label class="inline-flex items-start gap-2 cursor-pointer">
  <input
    type="checkbox"
    class="peer sr-only"
    aria-invalid="true"
    aria-describedby="terms-error"
  />
  <span
    class="mt-0.5 flex size-4 shrink-0 items-center justify-center rounded
      bg-white
      inset-ring inset-ring-red-500
      peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-red-500/10
      dark:bg-gray-900 dark:inset-ring-red-400/50
      dark:peer-focus-visible:ring-red-400/20
      transition-colors duration-150
      motion-reduce:transition-none"
    aria-hidden="true"
  >
    <svg
      class="size-3 text-white dark:text-gray-900"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      stroke-width="3"
      aria-hidden="true"
    >
      <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
    </svg>
  </span>
  <span class="flex flex-col gap-0.5">
    <span class="text-sm text-gray-700 dark:text-gray-300">
      I agree to the terms and conditions
    </span>
    <span id="terms-error" class="text-xs text-red-600 dark:text-red-400" role="alert">
      You must accept the terms to continue.
    </span>
  </span>
</label>
```

**设计要点：**
- `inset-ring-red-500` — 与 Input Error 状态完全一致
- Focus 时 `ring-red-500/10` — 红色微光环，与 Input Error Focus 一致
- 暗色模式 `inset-ring-red-400/50` — 暗背景降低红色饱和度
- `aria-invalid="true"` + `aria-describedby` + `role="alert"` — 完整的可访问错误关联
- 错误消息 `text-xs text-red-600` — 与 Input 错误消息层级一致

---

### 5. Disabled 状态

禁用态覆盖 unchecked 和 checked 两种场景。

```html
<!-- Disabled — Unchecked -->
<label class="inline-flex items-start gap-2 cursor-not-allowed">
  <input
    type="checkbox"
    class="peer sr-only"
    disabled
  />
  <span
    class="mt-0.5 flex size-4 shrink-0 items-center justify-center rounded
      bg-gray-50
      inset-ring inset-ring-gray-950/5
      peer-disabled:opacity-50
      dark:bg-gray-800 dark:inset-ring-white/5
      transition-colors duration-150
      motion-reduce:transition-none"
    aria-hidden="true"
  >
    <svg
      class="size-3 text-gray-50 dark:text-gray-800"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      stroke-width="3"
      aria-hidden="true"
    >
      <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
    </svg>
  </span>
  <span class="text-sm text-gray-400 dark:text-gray-500">
    Disabled option
  </span>
</label>

<!-- Disabled — Checked -->
<label class="inline-flex items-start gap-2 cursor-not-allowed">
  <input
    type="checkbox"
    class="peer sr-only"
    disabled
    checked
  />
  <span
    class="mt-0.5 flex size-4 shrink-0 items-center justify-center rounded
      bg-gray-50
      inset-ring inset-ring-gray-950/5
      peer-disabled:opacity-50
      dark:bg-gray-800 dark:inset-ring-white/5
      transition-colors duration-150
      motion-reduce:transition-none"
    aria-hidden="true"
  >
    <svg
      class="size-3 text-gray-400 dark:text-gray-500"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      stroke-width="3"
      aria-hidden="true"
    >
      <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
    </svg>
  </span>
  <span class="text-sm text-gray-400 dark:text-gray-500">
    Disabled selected option
  </span>
</label>
```

**设计要点：**
- `opacity-50` — 与 Button / Input 禁用态保持 50% 透明度一致性
- `bg-gray-50` + `inset-ring-gray-950/5` — 与 Input Disabled 的 Level 0- 模式一致
- `cursor-not-allowed` — 整个 label 区域禁止点击
- Label 文字同步变淡 `text-gray-400` — 整体传达"不可用"
- Checked Disabled 的 checkmark 颜色 `text-gray-400`（而非 white）—— 因为 `opacity-50` 已降低了整个选框，checkmark 应选择中间灰以避免过亮/过暗

---

### 6. Checkbox Group（复选框组 — 垂直排列）

多个复选框的垂直列表，用于多选表单场景。

```html
<!-- Checkbox Group -->
<fieldset>
  <legend class="text-sm font-medium text-gray-900 dark:text-gray-100 mb-3">
    Notification preferences
  </legend>
  <div class="flex flex-col gap-3">
    <!-- Item 1 — Checked -->
    <label class="inline-flex items-start gap-2 cursor-pointer">
      <input type="checkbox" class="peer sr-only" checked />
      <span
        class="mt-0.5 flex size-4 shrink-0 items-center justify-center rounded
          bg-indigo-600
          inset-ring inset-ring-indigo-600
          peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10
          dark:bg-indigo-500 dark:inset-ring-indigo-500
          dark:peer-focus-visible:ring-white/10
          transition-colors duration-150
          motion-reduce:transition-none"
        aria-hidden="true"
      >
        <svg class="size-3 text-white dark:text-gray-900" viewBox="0 0 24 24"
          fill="none" stroke="currentColor" stroke-width="3" aria-hidden="true">
          <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
        </svg>
      </span>
      <span class="text-sm text-gray-700 dark:text-gray-300">Comments</span>
    </label>

    <!-- Item 2 — Checked -->
    <label class="inline-flex items-start gap-2 cursor-pointer">
      <input type="checkbox" class="peer sr-only" checked />
      <span
        class="mt-0.5 flex size-4 shrink-0 items-center justify-center rounded
          bg-indigo-600
          inset-ring inset-ring-indigo-600
          peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10
          dark:bg-indigo-500 dark:inset-ring-indigo-500
          dark:peer-focus-visible:ring-white/10
          transition-colors duration-150
          motion-reduce:transition-none"
        aria-hidden="true"
      >
        <svg class="size-3 text-white dark:text-gray-900" viewBox="0 0 24 24"
          fill="none" stroke="currentColor" stroke-width="3" aria-hidden="true">
          <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
        </svg>
      </span>
      <span class="text-sm text-gray-700 dark:text-gray-300">Replies to my messages</span>
    </label>

    <!-- Item 3 — Unchecked -->
    <label class="inline-flex items-start gap-2 cursor-pointer">
      <input type="checkbox" class="peer sr-only" />
      <span
        class="mt-0.5 flex size-4 shrink-0 items-center justify-center rounded
          bg-white
          inset-ring inset-ring-gray-950/8
          peer-checked:bg-indigo-600 peer-checked:inset-ring-indigo-600
          peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10
          dark:bg-gray-900 dark:inset-ring-white/10
          dark:peer-checked:bg-indigo-500 dark:peer-checked:inset-ring-indigo-500
          dark:peer-focus-visible:ring-white/10
          transition-colors duration-150
          motion-reduce:transition-none"
        aria-hidden="true"
      >
        <svg class="size-3 text-white dark:text-gray-900" viewBox="0 0 24 24"
          fill="none" stroke="currentColor" stroke-width="3" aria-hidden="true">
          <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
        </svg>
      </span>
      <span class="text-sm text-gray-700 dark:text-gray-300">Marketing emails</span>
    </label>

    <!-- Item 4 — Disabled -->
    <label class="inline-flex items-start gap-2 cursor-not-allowed">
      <input type="checkbox" class="peer sr-only" disabled />
      <span
        class="mt-0.5 flex size-4 shrink-0 items-center justify-center rounded
          bg-gray-50
          inset-ring inset-ring-gray-950/5
          peer-disabled:opacity-50
          dark:bg-gray-800 dark:inset-ring-white/5
          transition-colors duration-150
          motion-reduce:transition-none"
        aria-hidden="true"
      >
        <svg class="size-3 text-gray-50 dark:text-gray-800" viewBox="0 0 24 24"
          fill="none" stroke="currentColor" stroke-width="3" aria-hidden="true">
          <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
        </svg>
      </span>
      <span class="text-sm text-gray-400 dark:text-gray-500">System alerts (required)</span>
    </label>
  </div>
</fieldset>
```

**设计要点：**
- `<fieldset>` + `<legend>` — 语义化 HTML，屏幕阅读器友好
- `gap-3` (12px) — 复选框之间标准间距
- `mb-3` (12px) — legend 与选项之间间距
- 每个 `<label>` 独立可点击 — 不依赖 checkbox group 的全局行为
- 混合展示 checked / unchecked / disabled 状态

---

### 7. Inline Group（行内复选框组）

水平排列，适用于筛选栏、工具栏等紧凑场景。

```html
<!-- Inline Checkbox Group -->
<fieldset>
  <legend class="sr-only">Filter by status</legend>
  <div class="flex flex-wrap items-center gap-4">
    <label class="inline-flex items-center gap-2 cursor-pointer">
      <input type="checkbox" class="peer sr-only" checked />
      <span
        class="flex size-4 shrink-0 items-center justify-center rounded
          bg-indigo-600
          inset-ring inset-ring-indigo-600
          peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10
          dark:bg-indigo-500 dark:inset-ring-indigo-500
          dark:peer-focus-visible:ring-white/10
          transition-colors duration-150
          motion-reduce:transition-none"
        aria-hidden="true"
      >
        <svg class="size-3 text-white dark:text-gray-900" viewBox="0 0 24 24"
          fill="none" stroke="currentColor" stroke-width="3" aria-hidden="true">
          <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
        </svg>
      </span>
      <span class="text-sm text-gray-700 dark:text-gray-300">Active</span>
    </label>

    <label class="inline-flex items-center gap-2 cursor-pointer">
      <input type="checkbox" class="peer sr-only" />
      <span
        class="flex size-4 shrink-0 items-center justify-center rounded
          bg-white
          inset-ring inset-ring-gray-950/8
          peer-checked:bg-indigo-600 peer-checked:inset-ring-indigo-600
          peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10
          dark:bg-gray-900 dark:inset-ring-white/10
          dark:peer-checked:bg-indigo-500 dark:peer-checked:inset-ring-indigo-500
          dark:peer-focus-visible:ring-white/10
          transition-colors duration-150
          motion-reduce:transition-none"
        aria-hidden="true"
      >
        <svg class="size-3 text-white dark:text-gray-900" viewBox="0 0 24 24"
          fill="none" stroke="currentColor" stroke-width="3" aria-hidden="true">
          <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
        </svg>
      </span>
      <span class="text-sm text-gray-700 dark:text-gray-300">Pending</span>
    </label>

    <label class="inline-flex items-center gap-2 cursor-pointer">
      <input type="checkbox" class="peer sr-only" />
      <span
        class="flex size-4 shrink-0 items-center justify-center rounded
          bg-white
          inset-ring inset-ring-gray-950/8
          peer-checked:bg-indigo-600 peer-checked:inset-ring-indigo-600
          peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10
          dark:bg-gray-900 dark:inset-ring-white/10
          dark:peer-checked:bg-indigo-500 dark:peer-checked:inset-ring-indigo-500
          dark:peer-focus-visible:ring-white/10
          transition-colors duration-150
          motion-reduce:transition-none"
        aria-hidden="true"
      >
        <svg class="size-3 text-white dark:text-gray-900" viewBox="0 0 24 24"
          fill="none" stroke="currentColor" stroke-width="3" aria-hidden="true">
          <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
        </svg>
      </span>
      <span class="text-sm text-gray-700 dark:text-gray-300">Archived</span>
    </label>
  </div>
</fieldset>
```

**设计要点：**
- `items-center`（而非 `items-start`）—— 行内模式下 checkbox 与文字垂直居中
- 无需 `mt-0.5` 偏移 —— 垂直居中时基线自动对齐
- `gap-4` (16px) — 行内选项之间宽松间距
- `flex-wrap` — 选项过多时自动换行
- `sr-only` legend — 视觉隐藏但屏幕阅读器可访问

---

## 尺寸

两种尺寸覆盖所有场景。

| Size | 复选框 | 文字 | 间距 | 用途 |
|------|--------|------|------|------|
| **md** (默认) | `size-4` (16px) | `text-sm` (14px) | `gap-2` (8px) | 标准表单、设置页 |
| **lg** | `size-5` (20px) | `text-base` (16px) | `gap-3` (12px) | 大表单、Hero 选项 |

```html
<!-- lg 尺寸 -->
<label class="inline-flex items-start gap-3 cursor-pointer">
  <input type="checkbox" class="peer sr-only" />
  <span
    class="mt-0.5 flex size-5 shrink-0 items-center justify-center rounded
      bg-white
      inset-ring inset-ring-gray-950/8
      peer-checked:bg-indigo-600 peer-checked:inset-ring-indigo-600
      peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10
      dark:bg-gray-900 dark:inset-ring-white/10
      dark:peer-checked:bg-indigo-500 dark:peer-checked:inset-ring-indigo-500
      dark:peer-focus-visible:ring-white/10
      transition-colors duration-150
      motion-reduce:transition-none"
    aria-hidden="true"
  >
    <svg class="size-3.5 text-white dark:text-gray-900" viewBox="0 0 24 24"
      fill="none" stroke="currentColor" stroke-width="3" aria-hidden="true">
      <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
    </svg>
  </span>
  <span class="text-base text-gray-700 dark:text-gray-300">
    Large checkbox option
  </span>
</label>
```

---

## 状态总览

| 状态 | 背景 (Light) | 描边 (Light) | 背景 (Dark) | 描边 (Dark) | 其他 |
|------|-------------|-------------|------------|------------|------|
| Unchecked | `bg-white` | `inset-ring-gray-950/8` | `bg-gray-900` | `inset-ring-white/10` | — |
| Checked | `bg-indigo-600` | `inset-ring-indigo-600` | `bg-indigo-500` | `inset-ring-indigo-500` | checkmark 可见 |
| Indeterminate | `bg-indigo-600` | `inset-ring-indigo-600` | `bg-indigo-500` | `inset-ring-indigo-500` | 横线标记 (JS 设置) |
| Focus | — | `ring-2 ring-offset-2 ring-gray-950/10` | — | `ring-white/10` | 仅 focus-visible |
| Error | `bg-white` | `inset-ring-red-500` | `bg-gray-900` | `inset-ring-red-400/50` | `aria-invalid` + 错误消息 |
| Error Focus | — | `ring-red-500/10` | — | `ring-red-400/20` | — |
| Disabled (Unchecked) | `bg-gray-50` | `inset-ring-gray-950/5` | `bg-gray-800` | `inset-ring-white/5` | `opacity-50` + `cursor-not-allowed` |
| Disabled (Checked) | `bg-gray-50` | `inset-ring-gray-950/5` | `bg-gray-800` | `inset-ring-white/5` | `opacity-50` + `cursor-not-allowed` + checkmark 可见 |

### 层次模型

```
Level 1 (Default)  → bg-white + inset-ring 8%    标准复选框
Level 2 (Checked)  → bg-indigo-600 + 白色 checkmark  选中态 = 最高视觉权重
Level 0- (Disabled)→ bg-gray-50 + opacity-50      不可交互
Level E (Error)    → inset-ring-red-500            语义覆盖
```

> 与 Input / Select / Textarea 共享 Level 1 / Level 0- / Level E 层次模式。Checked 态不单独对应 Elevation Level——它是语义状态（类似于 Input 的 Filled 态），通过背景反色传达选中信息。

---

## Design Tokens

| Token | Light | Dark | Tailwind | 说明 |
|-------|-------|------|----------|------|
| 尺寸 (默认) | 16px | 16px | `size-4` | 复选框视觉区域 |
| 尺寸 (大) | 20px | 20px | `size-5` | 大尺寸变体 |
| 圆角 | 4px | 4px | `rounded` | 传统复选框圆角 |
| 字间距 (默认) | 8px | 8px | `gap-2` | checkbox 与 label 间距 |
| 字间距 (大) | 12px | 12px | `gap-3` | 大尺寸间距 |
| Label 字号 | 14px | 14px | `text-sm` | 标签文字 |
| Label 颜色 | `gray-700` | `gray-300` | — | 标签文字颜色 |
| Description 字号 | 14px | 14px | `text-sm` | 描述文字 |
| Description 颜色 | `gray-500` | `gray-400` | — | 描述文字颜色 |
| 背景 未选中 | `white` | `gray-900` | — | 复选框背景 |
| 描边 未选中 | `gray-950/8` | `white/10` | `inset-ring` + 透明度 | Level 1 |
| 背景 选中 | `indigo-600` | `indigo-500` | — | 品牌色选中态 |
| 描边 选中 | `indigo-600` | `indigo-500` | — | 选中态描边 = 背景色 |
| Checkmark 颜色 | `white` | `white` | — | 选中标记 |
| Checkmark 尺寸 | 12px | 12px | `size-3` | 默认尺寸 |
| Checkmark 尺寸 (大) | 14px | 14px | `size-3.5` | 大尺寸变体 |
| Focus ring | `gray-950/10` | `white/10` | `ring-2 ring-offset-2` | 焦点指示 |
| Error 描边 | `red-500` | `red-400/50` | `inset-ring-red-500` | 错误边框 |
| Error 文字 | `red-600` | `red-400` | `text-red-600` | 错误消息 |
| Disabled 背景 | `gray-50` | `gray-800` | — | 禁用底色 |
| Disabled 描边 | `gray-950/5` | `white/5` | `inset-ring` 5% | 最轻描边 |
| Disabled 透明度 | 50% | 50% | `opacity-50` | 整体降低 |
| Disabled 文字 | `gray-400` | `gray-500` | — | 禁用标签 |
| Group 选项间距 | 12px | 12px | `gap-3` | 垂直组内间距 |
| Group 行内间距 | 16px | 16px | `gap-4` | 行内选项间距 |
| 过渡 | 150ms | 150ms | `transition-colors duration-150` | 仅颜色过渡 |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| Label 关联 | `<label>` 包裹 `<input>` + 文字 —— 扩大可点击区域 |
| 键盘操作 | 原生 `<input type="checkbox">` 支持 Space 切换 |
| 可见焦点 | `peer-focus-visible:ring-2 ring-offset-2`，仅键盘导航时显示 |
| 屏幕阅读器 | 原生 input 保留（`sr-only` 仅视觉隐藏），`aria-hidden="true"` 在视觉 span 和 SVG 上 |
| 错误提示 | `aria-describedby="error-id"` 关联错误消息 + `role="alert"` |
| 错误状态 | `aria-invalid="true"` 标记无效输入 |
| 禁用态 | `disabled` 属性 + `cursor-not-allowed` |
| 复选框组 | `<fieldset>` + `<legend>` 提供分组语义 |
| 减少动画 | `motion-reduce:transition-none` |
| 颜色对比度 | Checked: `indigo-600` (#4F46E5) : `white` (#FFF) = 6.54:1 (WCAG AA) ✅ |
| 颜色对比度 | Unchecked (Light): `gray-950/8` ≈ #D1D5DB : `white` (#FFF) = 满足 WCAG AA 非文本对比度 |
| 视觉指示 | 选中态不仅仅是颜色变化（checkmark 形状变化），符合 WCAG 1.4.1 |

---

## 复用指南

### 何时使用 Checkbox

- 多选列表（设置页、权限列表）
- 同意条款 / 确认操作
- 筛选栏多选（状态、标签、分类）
- 表格行批量选择
- 全选 / 取消全选（搭配 Indeterminate）

### 何时不用 Checkbox

| 场景 | 替代方案 | 原因 |
|------|---------|------|
| 单选（互斥） | Radio | 单选语义不同——圆形 + 互斥行为 |
| 即时生效的开关 | Toggle / Switch | 开关暗示即时生效，Checkbox 暗示需提交 |
| 二选一 | Radio 或 Segmented Control | Checkbox 用于多选，不适合二选一 |
| 表格排序 / 筛选触发 | Button Ghost | 非选择操作 |

### 组合规则

```
✅ Checkbox Group (垂直)   → gap-3，<fieldset> + <legend>
✅ Inline Group (水平)     → gap-4，items-center，flex-wrap
✅ Checkbox + Description  → 双层文字，主标签 font-medium
✅ Parent + Indeterminate  → 全选场景，JS 控制 indeterminate
❌ 混用 Checkbox 和 Radio  → 选择语义冲突
❌ 单个 Checkbox 直接控制 → 搭配"保存/应用"按钮提交
```

---

> 参考: [Elevation](../design-tokens/elevation.md) · [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Input](./input.md) · [Button](./button.md) · [语义色统一](../principles/semantic-color-unification.md)
