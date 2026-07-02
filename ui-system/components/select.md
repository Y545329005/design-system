# Select

Select 是下拉选择组件，用于从预定义选项列表中选择一个或多个值。使用原生 `<select>` 元素确保最佳可访问性。完全复用 [Input](./input.md) 的 `inset-ring` 描边体系与状态样式。

> **Design Tokens**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Elevation](../design-tokens/elevation.md)
>
> **相关组件**: [Input](./input.md)（共享 border / focus / error / disabled 状态模式）
>
> **依赖**: 无额外插件依赖（使用 `inset-ring` 替代 `@tailwindcss/forms` 的 border 方案）

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 描边 | `inset-ring` 透明度方案 | 与 Input 完全一致——Level 1 (Raised)，focus 升至 Level 2 |
| 圆角 | `rounded-lg` (8px) | 统一交互元素圆角 |
| Focus | inset-ring 加深 + 外部 ring | 双层焦点反馈，与 Input 保持一致 |
| 暗色模式 | 透明度自动反转 | `white/10` / `white/20` |
| Chevron | 自定义 SVG | `appearance-none` 移除浏览器默认箭头 |

---

## 变体

### 1. Base Select（基础下拉）

最常用的下拉选择。自定义 chevron 图标替换浏览器默认样式。

```html
<!-- Base Select -->
<div class="flex flex-col gap-1.5">
  <label for="country" class="text-sm font-medium text-gray-900 dark:text-gray-100">
    Country
  </label>
  <div class="relative">
    <select
      id="country"
      name="country"
      class="w-full appearance-none rounded-lg bg-white px-3 py-2 pr-10 text-sm/6 text-gray-900
        inset-ring inset-ring-gray-950/8
        transition-colors duration-150
        focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none
        disabled:cursor-not-allowed disabled:opacity-50 disabled:bg-gray-50
        dark:bg-gray-900 dark:text-gray-100
        dark:inset-ring-white/10
        dark:focus:inset-ring-white/20 dark:focus:ring-white/10
        dark:disabled:bg-gray-800
        motion-reduce:transition-none"
    >
      <option value="" disabled selected>Select a country</option>
      <option value="us">United States</option>
      <option value="uk">United Kingdom</option>
      <option value="de">Germany</option>
      <option value="jp">Japan</option>
      <option value="cn">China</option>
    </select>
    <svg
      class="pointer-events-none absolute right-3 top-1/2 size-4 -translate-y-1/2 text-gray-400
        dark:text-gray-500"
      fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
      aria-hidden="true"
    >
      <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
    </svg>
  </div>
</div>
```

> **关键点**: `appearance-none` 移除浏览器默认下拉箭头，`pr-10` 为自定义 chevron 留空间。`pointer-events-none` 确保点击穿透到 `<select>`。

---

### 2. With Icon（带图标下拉）

在下拉框左侧添加语义图标，表示选择内容类型。

```html
<!-- With Icon -->
<div class="flex flex-col gap-1.5">
  <label for="language" class="text-sm font-medium text-gray-900 dark:text-gray-100">
    Language
  </label>
  <div class="relative">
    <svg
      class="pointer-events-none absolute left-3 top-1/2 size-4 -translate-y-1/2 text-gray-400
        dark:text-gray-500"
      fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
      aria-hidden="true"
    >
      <path stroke-linecap="round" stroke-linejoin="round"
        d="m10.5 21 5.25-11.25L21 21m-9-3h7.5M3 5.621a48.474 48.474 0 0 1 6-.371m0 0c1.12 0 2.233.038 3.334.114M9 5.25V3m3.334 2.364C11.176 10.658 7.69 15.08 3 17.502m9.334-12.138c.896.061 1.785.137 2.666.221" />
    </svg>
    <select
      id="language"
      class="w-full appearance-none rounded-lg bg-white py-2 pl-10 pr-10 text-sm/6 text-gray-900
        inset-ring inset-ring-gray-950/8
        transition-colors duration-150
        focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none
        dark:bg-gray-900 dark:text-gray-100
        dark:inset-ring-white/10
        dark:focus:inset-ring-white/20 dark:focus:ring-white/10
        motion-reduce:transition-none"
    >
      <option value="en">English</option>
      <option value="zh">中文</option>
      <option value="ja">日本語</option>
      <option value="ko">한국어</option>
    </select>
    <svg
      class="pointer-events-none absolute right-3 top-1/2 size-4 -translate-y-1/2 text-gray-400
        dark:text-gray-500"
      fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
      aria-hidden="true"
    >
      <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
    </svg>
  </div>
</div>
```

---

### 3. Multiple Select（多选下拉）

使用 `multiple` 属性启用多选。配合 `size` 属性显示多个选项。

```html
<!-- Multiple Select -->
<div class="flex flex-col gap-1.5">
  <label for="tags" class="text-sm font-medium text-gray-900 dark:text-gray-100">
    Tags
  </label>
  <select
    id="tags"
    name="tags"
    multiple
    size="4"
    class="w-full rounded-lg bg-white px-3 py-2 text-sm/6 text-gray-900
      inset-ring inset-ring-gray-950/8
      transition-colors duration-150
      focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none
      disabled:cursor-not-allowed disabled:opacity-50 disabled:bg-gray-50
      dark:bg-gray-900 dark:text-gray-100
      dark:inset-ring-white/10
      dark:focus:inset-ring-white/20 dark:focus:ring-white/10
      dark:disabled:bg-gray-800
      [&_option]:py-1 [&_option]:px-1
      [&_option:checked]:bg-gray-900 [&_option:checked]:text-white
      dark:[&_option:checked]:bg-white dark:[&_option:checked]:text-gray-900
      motion-reduce:transition-none"
  >
    <option value="design">Design</option>
    <option value="development">Development</option>
    <option value="research">Research</option>
    <option value="marketing">Marketing</option>
    <option value="sales">Sales</option>
    <option value="support">Support</option>
  </select>
  <p class="text-xs text-gray-500 dark:text-gray-400">
    Hold <kbd class="rounded border border-gray-300 px-1 py-0.5 text-xs dark:border-gray-600">⌘</kbd> to select multiple
  </p>
</div>
```

---

### 4. Error State（错误状态）

复用 [Input](./input.md) 的错误状态模式：红色 `inset-ring` + `aria-invalid` + 错误消息。

```html
<!-- Error State -->
<div class="flex flex-col gap-1.5">
  <label for="role-error" class="text-sm font-medium text-gray-900 dark:text-gray-100">
    Role
  </label>
  <div class="relative">
    <select
      id="role-error"
      class="w-full appearance-none rounded-lg bg-white px-3 py-2 pr-10 text-sm/6 text-gray-900
        inset-ring inset-ring-red-500
        transition-colors duration-150
        focus:inset-ring-red-600 focus:ring-2 focus:ring-red-500/10 focus:outline-none
        dark:bg-gray-900 dark:text-gray-100
        dark:inset-ring-red-400/50
        dark:focus:inset-ring-red-400 dark:focus:ring-red-400/20
        motion-reduce:transition-none"
      aria-invalid="true"
      aria-describedby="role-error-message"
    >
      <option value="" selected>Select a role</option>
      <option value="admin">Admin</option>
      <option value="editor">Editor</option>
      <option value="viewer">Viewer</option>
    </select>
    <svg
      class="pointer-events-none absolute right-3 top-1/2 size-4 -translate-y-1/2 text-gray-400
        dark:text-gray-500"
      fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
      aria-hidden="true"
    >
      <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
    </svg>
  </div>
  <p id="role-error-message" class="text-xs text-red-600 dark:text-red-400" role="alert">
    Please select a role.
  </p>
</div>
```

---

### 5. Inline Select（行内下拉）

紧凑的下拉选择，适合表格单元格或工具条。使用 inline SVG background-image 代替独立的 `<svg>` 元素，减少 DOM 节点。

```html
<!-- Inline Select -->
<select
  class="appearance-none rounded-lg bg-white py-1.5 pl-2.5 pr-8 text-sm/6 text-gray-900
    inset-ring inset-ring-gray-950/8
    transition-colors duration-150
    focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none
    dark:bg-gray-900 dark:text-gray-100
    dark:inset-ring-white/10
    dark:focus:inset-ring-white/20 dark:focus:ring-white/10
    motion-reduce:transition-none"
  style="background-image: url('data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 fill=%22none%22 viewBox=%220 0 24 24%22 stroke=%22%239ca3af%22 stroke-width=%222%22><path stroke-linecap=%22round%22 stroke-linejoin=%22round%22 d=%22M19.5 8.25l-7.5 7.5-7.5-7.5%22/></svg>'); background-position: right 0.5rem center; background-repeat: no-repeat; background-size: 1rem;"
>
  <option>10</option>
  <option>25</option>
  <option selected>50</option>
  <option>100</option>
</select>
```

---

## 状态总览

| 状态 | 描边 (Light) | 描边 (Dark) | 其他 |
|------|-------------|------------|------|
| Default | `inset-ring-gray-950/8` | `inset-ring-white/10` | `bg-white` / `dark:bg-gray-900` |
| Hover | 无独立 hover 态（forms 插件已不再使用） | — | — |
| Focus | `inset-ring-gray-950/20` + `ring-2 ring-gray-950/10` | `inset-ring-white/20` + `ring-2 ring-white/10` | 描边加深 + 外部微光环 |
| Filled | 无额外样式 | 无额外样式 | 有选中值时可选视觉反馈 |
| Error | `inset-ring-red-500` | `inset-ring-red-400/50` | `aria-invalid="true"` + 错误消息 |
| Error Focus | `inset-ring-red-600` + `ring-red-500/10` | `inset-ring-red-400` + `ring-red-400/20` | — |
| Disabled | `inset-ring-gray-950/5` (implicit) | `inset-ring-white/5` | `opacity-50` + `bg-gray-50` + `cursor-not-allowed` |

> Select 的状态样式与 [Input](./input.md) 完全一致，确保表单元素的视觉统一。

---

## Design Tokens

| Token | Light | Dark | Tailwind | 说明 |
|-------|-------|------|----------|------|
| 圆角 | 8px | 8px | `rounded-lg` | 与 Input 一致 |
| Padding | 8px 12px | 8px 12px | `px-3 py-2` | 标准内边距 |
| Padding (inline) | 6px 10px | — | `py-1.5 pl-2.5` | 紧凑内边距 |
| Chevron 右边距 | 12px | 12px | `right-3` | 下拉箭头位置 |
| Chevron 大小 | 16px | 16px | `size-4` | 自定义图标 |
| Chevron 颜色 | `gray-400` | `gray-500` | — | 默认箭头颜色 |
| 字号 | 14px / 24px | 14px / 24px | `text-sm/6` | 与 Input 一致 |
| Label 字号 | 14px | 14px | `text-sm font-medium` | 标签样式 |
| Label gap | 6px | 6px | `gap-1.5` | Label 与 Select 间距 |
| 背景 | `white` | `gray-900` | — | 可编辑区域 |
| 描边 默认 | `gray-950/8` | `white/10` | `inset-ring` + 透明度 | Level 1 |
| 描边 Focus | `gray-950/20` | `white/20` | `focus:inset-ring` + 透明度 | Level 2 |
| Focus 光环 | `gray-950/10` | `white/10` | `focus:ring-2` | 外部 2px 微光 |
| Error 描边 | `red-500` | `red-400/50` | `inset-ring-red-500` | 错误边框 |
| Error 文字 | `red-600` | `red-400` | `text-red-600` | 错误消息 |
| Disabled 透明度 | 50% | 50% | `disabled:opacity-50` | 禁用态 |
| 过渡 | 150ms | 150ms | `transition-colors duration-150` | 仅颜色过渡 |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| Label 关联 | `<label for="id">` + `<select id="id">` 必须配对 |
| 自定义 chevron | `<svg aria-hidden="true">` — 纯装饰，对屏幕阅读器隐藏 |
| 错误状态 | `aria-invalid="true"` + `aria-describedby` 关联错误消息 |
| 错误消息 | `role="alert"` 确保屏幕阅读器实时播报 |
| 键盘操作 | 原生 `<select>` 支持所有键盘操作（↑↓ 导航，Enter 选择，Space 打开） |
| 禁用态 | `disabled` 属性 + `disabled:cursor-not-allowed` |
| 多选提示 | `<kbd>` 样式提示多选快捷键 |
| Focus 可见 | `focus:ring-2` + `focus:inset-ring` 加深 —— 双重焦点指示 |
| 减少动画 | `motion-reduce:transition-none` |

---

## 复用指南

**何时使用 Select:**
- 选项 4–20 个 → Base Select（< 4 个考虑 Radio，> 20 个考虑 Searchable Select）
- 需要区分选项类别 → With Icon
- 允许选择多个选项 → Multiple Select
- 表单验证失败 → Error State
- 表格/工具栏中紧凑选择 → Inline Select

**何时不用 Select:**
- 选项 ≤ 3 个 → 使用 Radio Group
- 选项 > 20 个 → 使用 Searchable Select 或 Autocomplete（后续补充）
- 开/关切换 → 使用 [Toggle](./toggle.md)
- 层级选择（树形）→ 使用 Cascader / Tree Select（后续补充）
- 日期选择 → 使用 Date Picker（后续补充）

**组合规则:**
- Select 的 border / focus / error / disabled 样式与 [Input](./input.md) 完全一致
- 同一表单内 Select 和 Input 混合使用不会产生视觉差异
- `appearance-none` + 自定义 chevron 是标准做法，不要使用浏览器默认箭头

---

## 与旧版的主要变更

| 变更 | 旧值 | 新值 | 依据 |
|------|------|------|------|
| 描边方式 | `border-gray-300` + forms 插件 | `inset-ring-gray-950/8` | Elevation 体系；与 Input 同步 |
| 描边颜色 | 固定色 `gray-300` | 透明度 `gray-950/8` | Colors 透明度优先原则 |
| Focus 描边 | `border-gray-900` | `inset-ring-gray-950/20` | Elevation Level 1 → Level 2 |
| Focus 光环 | `ring-2 ring-gray-900/10` | `ring-2 ring-gray-950/10` | 统一透明度单位 |
| 暗色描边 | `dark:border-gray-600` | `dark:inset-ring-white/10` | 透明度自动反转 |
| 暗色 Focus | `dark:focus:border-gray-400` | `dark:focus:inset-ring-white/20` | 透明度自动反转 |
| 暗色 Focus 光环 | `dark:focus:ring-gray-400/20` | `dark:focus:ring-white/10` | 统一透明度方案 |
| Error 描边 | `border-red-500` | `inset-ring-red-500` | 统一描边方式 |
| Error Focus | `focus:ring-red-500/10` | `focus:inset-ring-red-600` + `focus:ring-red-500/10` | 双层焦点反馈 |
| 动效尊重 | 无 | `motion-reduce:transition-none` | 可访问性 |
| 颜色过渡 | 无 | `transition-colors duration-150` | 全局统一定义 |
| 插件依赖 | 依赖 `@tailwindcss/forms` | 无额外依赖 | inset-ring 原生支持 |

---

> 参考: [Input](./input.md) · [Elevation](../design-tokens/elevation.md) · [Colors](../design-tokens/colors.md) · [HyperUI Selects](https://hyperui.dev/components/application/selects) · [MDN `<select>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/select)
