# Input

输入框是用户输入文本的基础表单组件。采用 `inset-ring` 描边体系，与 [Button](./button.md) Secondary 变体及 [Card](./card.md) 保持一致。

> **Design Tokens**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Elevation](../design-tokens/elevation.md)
>
> **关联组件**: [Select](./select.md) · [Textarea](./textarea.md)（共享 border / focus / error 状态模式）
>
> **依赖**: 无额外插件依赖（使用 `inset-ring` 替代 `@tailwindcss/forms` 的 border 方案）

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 描边 | `inset-ring` 透明度方案 | 与 Elevation 体系一致——Input 处于 Level 1 (Raised)，focus 时升至 Level 2 |
| 圆角 | `rounded-lg` (8px) | 统一交互元素圆角，与 Button / Select 一致 |
| 阴影 | 无 | 遵循"表面抬升替代阴影"原则 |
| Focus | inset-ring 加深 + 外部 ring | inset-ring 传达层次变化，外部 ring 确保可访问的焦点指示 |
| 过渡 | `transition-colors duration-150` | 全局统一 150ms，仅颜色 |
| 暗色模式 | 透明度自动反转 | `white/10` / `white/20` 替代固定色值 |

---

## 变体

### 1. Base Input（基础输入框）

最常用的输入框。包含 label + input。

```html
<!-- Base Input -->
<div class="flex flex-col gap-1.5">
  <label for="email" class="text-sm font-medium text-gray-900 dark:text-gray-100">
    Email address
  </label>
  <input
    type="email"
    id="email"
    placeholder="you@example.com"
    class="w-full rounded-lg bg-white px-3 py-2 text-sm/6 text-gray-900
      inset-ring inset-ring-gray-950/8
      placeholder:text-gray-400
      transition-colors duration-150
      focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none
      disabled:cursor-not-allowed disabled:opacity-50 disabled:bg-gray-50
      dark:bg-gray-900 dark:text-gray-100
      dark:inset-ring-white/10
      dark:placeholder:text-gray-500
      dark:focus:inset-ring-white/20 dark:focus:ring-white/10
      dark:disabled:bg-gray-800
      motion-reduce:transition-none"
  />
</div>
```

**设计要点：**
- `inset-ring-gray-950/8` — Light 模式 8% 透明度描边，Level 1 (Raised)
- `focus:inset-ring-gray-950/20` — focus 时描边加深至 20%，Level 2 (Interactive)
- `focus:ring-2 focus:ring-gray-950/10` — 外部 2px 微光环，确保足够的焦点可见性
- `bg-white` — 明确的可编辑区域，浮于页面底色 (`bg-gray-50`) 之上
- 暗色模式 `inset-ring-white/10` → `focus:inset-ring-white/20` — 透明度自动反转
- `motion-reduce:transition-none` — 尊重用户的减少动画偏好

---

### 2. With Icon（带图标输入框）

在输入框左侧放置图标，表示输入内容类型（搜索、邮箱、用户等）。

```html
<!-- With Icon - Search -->
<div class="flex flex-col gap-1.5">
  <label for="search" class="text-sm font-medium text-gray-900 dark:text-gray-100">
    Search
  </label>
  <div class="relative">
    <svg
      class="pointer-events-none absolute left-3 top-1/2 size-4 -translate-y-1/2 text-gray-400
        dark:text-gray-500"
      fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
      aria-hidden="true"
    >
      <path stroke-linecap="round" stroke-linejoin="round"
        d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z" />
    </svg>
    <input
      type="search"
      id="search"
      placeholder="Search..."
      class="w-full rounded-lg bg-white py-2 pl-10 pr-3 text-sm/6 text-gray-900
        inset-ring inset-ring-gray-950/8
        placeholder:text-gray-400
        transition-colors duration-150
        focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none
        dark:bg-gray-900 dark:text-gray-100
        dark:inset-ring-white/10
        dark:placeholder:text-gray-500
        dark:focus:inset-ring-white/20 dark:focus:ring-white/10
        motion-reduce:transition-none"
    />
  </div>
</div>

<!-- With Icon - Email -->
<div class="flex flex-col gap-1.5">
  <label for="email-icon" class="text-sm font-medium text-gray-900 dark:text-gray-100">
    Email
  </label>
  <div class="relative">
    <svg
      class="pointer-events-none absolute left-3 top-1/2 size-4 -translate-y-1/2 text-gray-400
        dark:text-gray-500"
      fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
      aria-hidden="true"
    >
      <path stroke-linecap="round" stroke-linejoin="round"
        d="M21.75 6.75v10.5a2.25 2.25 0 01-2.25 2.25h-15a2.25 2.25 0 01-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25m19.5 0v.243a2.25 2.25 0 01-1.07 1.916l-7.5 4.615a2.25 2.25 0 01-2.36 0L3.32 8.91a2.25 2.25 0 01-1.07-1.916V6.75" />
    </svg>
    <input
      type="email"
      id="email-icon"
      placeholder="you@example.com"
      class="w-full rounded-lg bg-white py-2 pl-10 pr-3 text-sm/6 text-gray-900
        inset-ring inset-ring-gray-950/8
        placeholder:text-gray-400
        transition-colors duration-150
        focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none
        dark:bg-gray-900 dark:text-gray-100
        dark:inset-ring-white/10
        dark:placeholder:text-gray-500
        dark:focus:inset-ring-white/20 dark:focus:ring-white/10
        motion-reduce:transition-none"
    />
  </div>
</div>
```

**设计要点：**
- 图标 `size-4` (16px) + `left-3` (12px) + `pl-10` (40px) — 图标居中，左右各留 12px
- `aria-hidden="true"` + `pointer-events-none` — 图标纯装饰，点击穿透到 input
- 暗色模式图标 `dark:text-gray-500` — 与 placeholder 颜色一致

---

### 3. With Button（带按钮输入框）

输入框与按钮组合为一行，用于搜索栏、订阅、优惠码输入。右侧按钮直接引用 [Button](./button.md) Solid Primary 样式。

```html
<!-- With Button - Search Bar -->
<div class="flex flex-col gap-1.5">
  <label for="search-btn" class="text-sm font-medium text-gray-900 dark:text-gray-100">
    Search
  </label>
  <div class="flex">
    <input
      type="search"
      id="search-btn"
      placeholder="Search documentation..."
      class="w-full rounded-l-lg bg-white px-3 py-2 text-sm/6 text-gray-900
        inset-ring inset-ring-gray-950/8
        placeholder:text-gray-400
        transition-colors duration-150
        focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none
        dark:bg-gray-900 dark:text-gray-100
        dark:inset-ring-white/10
        dark:placeholder:text-gray-500
        dark:focus:inset-ring-white/20 dark:focus:ring-white/10
        motion-reduce:transition-none"
    />
    <button
      type="submit"
      class="-ml-px inline-flex items-center rounded-r-lg bg-gray-900 px-4 py-2
        text-sm font-semibold text-white
        transition-colors duration-150
        hover:bg-gray-800
        active:scale-[0.97]
        focus-visible:outline-2 focus-visible:outline-offset-[-2px] focus-visible:outline-gray-900
        dark:bg-white dark:text-gray-900 dark:hover:bg-gray-100
        dark:focus-visible:outline-white
        motion-reduce:transition-none"
    >
      Search
    </button>
  </div>
</div>

<!-- With Button - Newsletter -->
<div class="flex flex-col gap-1.5">
  <label for="newsletter" class="text-sm font-medium text-gray-900 dark:text-gray-100">
    Subscribe to newsletter
  </label>
  <div class="flex">
    <input
      type="email"
      id="newsletter"
      placeholder="Enter your email"
      class="w-full rounded-l-lg bg-white px-3 py-2 text-sm/6 text-gray-900
        inset-ring inset-ring-gray-950/8
        placeholder:text-gray-400
        transition-colors duration-150
        focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none
        dark:bg-gray-900 dark:text-gray-100
        dark:inset-ring-white/10
        dark:placeholder:text-gray-500
        dark:focus:inset-ring-white/20 dark:focus:ring-white/10
        motion-reduce:transition-none"
    />
    <button
      type="submit"
      class="-ml-px inline-flex items-center gap-2 rounded-r-lg bg-gray-900 px-4 py-2
        text-sm font-semibold text-white
        transition-colors duration-150
        hover:bg-gray-800
        active:scale-[0.97]
        focus-visible:outline-2 focus-visible:outline-offset-[-2px] focus-visible:outline-gray-900
        dark:bg-white dark:text-gray-900 dark:hover:bg-gray-100
        dark:focus-visible:outline-white
        motion-reduce:transition-none"
    >
      Subscribe
      <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
        aria-hidden="true">
        <path stroke-linecap="round" stroke-linejoin="round" d="M13 7l5 5m0 0l-5 5m5-5H6" />
      </svg>
    </button>
  </div>
</div>
```

**设计要点：**
- `-ml-px` 消除输入框和按钮之间的双描边重叠
- `focus-visible:outline-offset-[-2px]` 使 focus ring 在按钮内部显示，避免与输入框边界冲突
- 按钮完整复用 [Button](./button.md) Solid Primary 样式（包括 `active:scale-[0.97]` 按下反馈）
- 输入框 `rounded-l-lg` + 按钮 `rounded-r-lg` — 组合后形成完整 8px 圆角
- 暗色模式按钮黑白反转 — 与 Button Primary 的暗色模式保持一致

---

### 4. Floating Label（浮动标签）

标签从输入框内部开始，用户输入时浮动到上方。使用 CSS `peer` 技巧，无需 JavaScript。适合密集表单，节省垂直空间。

```html
<!-- Floating Label -->
<div class="relative">
  <input
    type="email"
    id="floating-email"
    placeholder=" "
    class="peer w-full rounded-lg bg-white px-3 pb-2 pt-5 text-sm/6 text-gray-900
      inset-ring inset-ring-gray-950/8
      placeholder:text-transparent
      transition-colors duration-150
      focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none
      dark:bg-gray-900 dark:text-gray-100
      dark:inset-ring-white/10
      dark:focus:inset-ring-white/20 dark:focus:ring-white/10
      motion-reduce:transition-none"
  />
  <label
    for="floating-email"
    class="pointer-events-none absolute left-3 top-3.5 text-sm text-gray-500
      transition-all duration-150
      peer-focus:top-1.5 peer-focus:text-xs peer-focus:text-gray-900
      peer-[:not(:placeholder-shown)]:top-1.5 peer-[:not(:placeholder-shown)]:text-xs
      dark:text-gray-400 dark:peer-focus:text-gray-100
      motion-reduce:transition-none"
  >
    Email address
  </label>
</div>

<!-- Floating Label - 带图标 -->
<div class="relative">
  <input
    type="search"
    id="floating-search"
    placeholder=" "
    class="peer w-full rounded-lg bg-white py-2 pl-10 pr-3 text-sm/6 text-gray-900
      inset-ring inset-ring-gray-950/8
      placeholder:text-transparent
      transition-colors duration-150
      focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none
      dark:bg-gray-900 dark:text-gray-100
      dark:inset-ring-white/10
      dark:focus:inset-ring-white/20 dark:focus:ring-white/10
      motion-reduce:transition-none"
  />
  <svg
    class="pointer-events-none absolute left-3 top-1/2 size-4 -translate-y-1/2 text-gray-400
      dark:text-gray-500"
    fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
    aria-hidden="true"
  >
    <path stroke-linecap="round" stroke-linejoin="round"
      d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z" />
  </svg>
  <label
    for="floating-search"
    class="pointer-events-none absolute left-10 top-1/2 -translate-y-1/2 text-sm text-gray-500
      transition-all duration-150
      peer-focus:top-1.5 peer-focus:translate-y-0 peer-focus:text-xs peer-focus:text-gray-900
      peer-[:not(:placeholder-shown)]:top-1.5 peer-[:not(:placeholder-shown)]:translate-y-0
      peer-[:not(:placeholder-shown)]:text-xs
      dark:text-gray-400 dark:peer-focus:text-gray-100
      motion-reduce:transition-none"
  >
    Search
  </label>
</div>
```

**Floating Label 原理：**
1. `placeholder=" "`（空格）— 使 input 在无输入时为 `:placeholder-shown` 状态
2. `peer` 标记 input 为锚点
3. `peer-focus:` — 聚焦时标签上浮
4. `peer-[:not(:placeholder-shown)]:` — 有内容时标签保持上浮（即使用户失焦）
5. `placeholder:text-transparent` — 隐藏 placeholder 空格，避免显示

**带图标的 Floating Label：**
- 图标 `left-3`，label `left-10` — label 右移至图标之后
- `peer-focus:translate-y-0` — 聚焦时取消垂直居中偏移，配合 `top-1.5` 定位

---

## 状态变体

### Error 状态

复用语义色系统（[Colors](../design-tokens/colors.md) 第三节）。

```html
<!-- Error State -->
<div class="flex flex-col gap-1.5">
  <label for="email-error" class="text-sm font-medium text-gray-900 dark:text-gray-100">
    Email address
  </label>
  <input
    type="email"
    id="email-error"
    value="not-an-email"
    class="w-full rounded-lg bg-white px-3 py-2 text-sm/6 text-gray-900
      inset-ring inset-ring-red-500
      placeholder:text-gray-400
      transition-colors duration-150
      focus:inset-ring-red-600 focus:ring-2 focus:ring-red-500/10 focus:outline-none
      dark:bg-gray-900 dark:text-gray-100
      dark:inset-ring-red-400/50
      dark:focus:inset-ring-red-400 dark:focus:ring-red-400/20
      motion-reduce:transition-none"
    aria-invalid="true"
    aria-describedby="email-error-message"
  />
  <p id="email-error-message" class="text-xs text-red-600 dark:text-red-400" role="alert">
    Please enter a valid email address.
  </p>
</div>
```

**设计要点：**
- Error 状态下 `inset-ring-red-500` 替换默认灰色描边 — 红色语义传达错误
- Focus 时 `inset-ring-red-600` 加深 + `ring-red-500/10` 微红光环
- 暗色模式 `inset-ring-red-400/50` — 暗背景上降低红色饱和度
- `aria-invalid="true"` + `aria-describedby` + `role="alert"` — 完整的可访问错误关联

### Disabled 状态

```html
<!-- Disabled State -->
<div class="flex flex-col gap-1.5">
  <label for="disabled-input" class="text-sm font-medium text-gray-400 dark:text-gray-500">
    Disabled field
  </label>
  <input
    type="text"
    id="disabled-input"
    value="Cannot edit this"
    disabled
    class="w-full rounded-lg bg-gray-50 px-3 py-2 text-sm/6 text-gray-500
      inset-ring inset-ring-gray-950/5
      disabled:cursor-not-allowed disabled:opacity-50
      dark:bg-gray-800 dark:text-gray-500
      dark:inset-ring-white/5
      motion-reduce:transition-none"
  />
</div>
```

**设计要点：**
- 禁用态降低为 Level 0 以下：`bg-gray-50` + `inset-ring-gray-950/5` (5% 最轻描边)
- `opacity-50` 整体降低可见度 — 与 Button 禁用态保持一致
- Label 颜色同步变淡 `text-gray-400` — 整体传达"不可用"

---

## 状态总览

| 状态 | 描边 (Light) | 描边 (Dark) | 其他 |
|------|-------------|------------|------|
| Default | `inset-ring-gray-950/8` | `inset-ring-white/10` | `bg-white` / `dark:bg-gray-900` |
| Hover | 无独立 hover 态（聚焦后才有视觉变化） | — | — |
| Focus | `inset-ring-gray-950/20` + `ring-2 ring-gray-950/10` | `inset-ring-white/20` + `ring-2 ring-white/10` | 描边加深 + 外部微光环 |
| Filled | 无额外样式 | 无额外样式 | 有内容时可选的 visual feedback |
| Error | `inset-ring-red-500` | `inset-ring-red-400/50` | `aria-invalid="true"` + 错误消息 |
| Error Focus | `inset-ring-red-600` + `ring-red-500/10` | `inset-ring-red-400` + `ring-red-400/20` | — |
| Disabled | `inset-ring-gray-950/5` | `inset-ring-white/5` | `opacity-50` + `bg-gray-50` + `cursor-not-allowed` |

### 层次模型

```
Level 0 (Page)    → bg-gray-50                           页面底色
Level 0- (Disabled) → bg-gray-50 + inset-ring 5% + 50% opacity  不可交互
Level 1 (Default) → bg-white + inset-ring 8%             标准输入框
Level 2 (Focus)   → bg-white + inset-ring 20% + ring 2px 聚焦交互
Level E (Error)   → bg-white + inset-ring-red-500         语义覆盖
```

---

## Design Tokens

| Token | Light | Dark | Tailwind | 说明 |
|-------|-------|------|----------|------|
| 圆角 | 8px | 8px | `rounded-lg` | 所有输入框 |
| Padding | 8px 12px | 8px 12px | `px-3 py-2` | 标准内边距 |
| Padding (带图标) | 8px 12px (l: 40px) | — | `py-2 pl-10 pr-3` | 左侧图标空间 |
| Floating Padding | 4px 12px 8px 12px | — | `pt-5 pb-2 px-3` | 顶部留标签空间 |
| 字号 | 14px / 24px | 14px / 24px | `text-sm/6` | 输入文本 |
| Label 字号 | 14px | 14px | `text-sm font-medium` | 标签 |
| Label 颜色 | `gray-900` | `gray-100` | — | 标签文字 |
| Placeholder | `gray-400` | `gray-500` | `placeholder:text-gray-400` | 占位文字 |
| 背景 | `white` | `gray-900` | — | 可编辑区域 |
| 描边 默认 | `gray-950/8` | `white/10` | `inset-ring` + 透明度 | Level 1 |
| 描边 Focus | `gray-950/20` | `white/20` | `focus:inset-ring` + 透明度 | Level 2 |
| Focus 光环 | `gray-950/10` | `white/10` | `focus:ring-2` | 外部 2px 微光 |
| Error 描边 | `red-500` | `red-400/50` | `inset-ring-red-500` | 错误边框 |
| Error 文字 | `red-600` | `red-400` | `text-red-600` | 错误消息 |
| Disabled 描边 | `gray-950/5` | `white/5` | `inset-ring` 5% | 最轻描边 |
| Disabled 背景 | `gray-50` | `gray-800` | `disabled:bg-gray-50` | 禁用底色 |
| Disabled 透明度 | 50% | 50% | `disabled:opacity-50` | 整体降低 |
| 图标尺寸 | 16px | 16px | `size-4` | 左侧图标 |
| 图标颜色 | `gray-400` | `gray-500` | — | 图标颜色 |
| Label gap | 6px | 6px | `gap-1.5` | Label 与 Input 间距 |
| 过渡 | 150ms | 150ms | `transition-colors duration-150` | 仅颜色过渡 |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| Label 关联 | `<label for="id">` + `<input id="id">` 必须配对 |
| 必填字段 | 使用 `aria-required="true"`，避免只用 `*` 号 |
| 错误提示 | `aria-describedby="error-id"` 关联错误消息 + `role="alert"` |
| 错误状态 | `aria-invalid="true"` 标记无效输入 |
| 禁用态 | `disabled` 属性 + `disabled:cursor-not-allowed` |
| 图标输入框 | SVG 使用 `aria-hidden="true"` + `pointer-events-none` |
| Placeholder | 不作为 label 的替代品 —— 必须有 `<label>` |
| Focus 可见 | `focus:ring-2` + `focus:inset-ring` 加深 —— 双重焦点指示 |
| 减少动画 | `motion-reduce:transition-none` |

---

## 复用指南

**何时使用 Input:**
- 短文本输入 → Base Input
- 搜索 → With Icon（搜索图标）或 With Button（搜索按钮）
- 邮箱/用户名 → With Icon（语义图标）
- 订阅/CTA 输入 → With Button
- 密集表单 → Floating Label

**何时不用 Input:**
- 长文本（多行）→ 使用 [Textarea](./textarea.md)
- 选择项（固定选项）→ 使用 [Select](./select.md)
- 开关/布尔值 → 使用 [Toggle](./toggle.md)
- 数字增减 → 使用 Quantity Input（后续补充）

**组合规则:**
- 表单内多个 Input 使用 `gap-4` 垂直排列
- Label 必须始终存在
- 一个表单内混用 Base + Floating 会破坏一致性 —— 选择一种并坚持
- With Button 中的按钮完整复用 [Button](./button.md) Solid Primary 样式
- [Select](./select.md) 和 [Textarea](./textarea.md) 的 border / focus / error / disabled 样式与 Input 完全一致

---

## 与旧版的主要变更

| 变更 | 旧值 | 新值 | 依据 |
|------|------|------|------|
| 描边方式 | `border-gray-300` + forms 插件 | `inset-ring-gray-950/8` | Elevation 体系；不占布局空间 |
| 描边颜色 | 固定色 `gray-300` | 透明度 `gray-950/8` | Colors 透明度优先原则 |
| Focus 描边 | `border-gray-900` | `inset-ring-gray-950/20` | Elevation Level 1 → Level 2 |
| Focus 光环 | `ring-2 ring-gray-900/10` | `ring-2 ring-gray-950/10` | 统一透明度单位 |
| 暗色描边 | `dark:border-gray-600` | `dark:inset-ring-white/10` | 透明度自动反转 |
| 暗色 Focus | `dark:focus:border-gray-400` | `dark:focus:inset-ring-white/20` | 透明度自动反转 |
| 暗色 Focus 光环 | `dark:focus:ring-gray-400/20` | `dark:focus:ring-white/10` | 统一透明度方案 |
| Error Focus | `focus:ring-red-500/10` | `focus:ring-red-500/10` + `focus:inset-ring-red-600` | 双层焦点反馈 |
| 动效尊重 | 无 | `motion-reduce:transition-none` | 可访问性 |
| 插件依赖 | 依赖 `@tailwindcss/forms` | 无额外依赖 | inset-ring 原生支持 |

---

> 参考: [Elevation](../design-tokens/elevation.md) · [Colors](../design-tokens/colors.md) · [Button](./button.md) · [HyperUI Inputs](https://hyperui.dev/components/application/inputs) · [Floating Label Pattern](https://tailwindcss.com/docs/hover-focus-and-other-states#styling-based-on-sibling-state)
