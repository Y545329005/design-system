# Button

> 基于 [设计共同规律](../../principles/design.md) 重新设计。
> 适用原则：色彩纪律、不用纯黑、表面抬升替代阴影、单字体族、动画 ≤200ms、8px 网格。

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 圆角 | `rounded-lg` (8px) | Linear/Stripe/Notion 的共识——专业感强于全胶囊 |
| 阴影 | 无 | 六款产品放弃 box-shadow，用明度差区分层次 |
| 主色 | `indigo-600` | Indigo 品牌色，唯一交互强调色，见 [Colors](../design-tokens/colors.md#四品牌强调色--indigo) |
| 按下反馈 | `active:scale-[0.97]` | Linear/Stripe 的微缩放——可感知的品质感 |
| 过渡 | `transition-colors duration-150` | 全局统一 150ms，只过渡颜色 |
| 描边 | `inset-ring` | Tailwind v4 方案——不占布局空间，比 border 更干净 |

---

## 变体

共 4 种变体。遵循"色彩纪律"原则——Primary 是页面上唯一的强调色按钮。

### 1. Primary — 实心主按钮

每屏/每区块最多一个。使用唯一的品牌强调色 indigo-600。

```html
<button
  type="button"
  class="inline-flex items-center justify-center gap-2 rounded-lg
    bg-indigo-600 px-4 py-2.5
    text-sm font-semibold text-white
    transition-colors duration-150
    hover:bg-indigo-700
    active:scale-[0.97]
    focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600
    disabled:cursor-not-allowed disabled:opacity-50
    motion-reduce:transition-none"
>
  Get started
</button>
```

```html
<!-- Dark mode -->
<button
  type="button"
  class="inline-flex items-center justify-center gap-2 rounded-lg
    bg-indigo-600 px-4 py-2.5
    text-sm font-semibold text-white
    transition-colors duration-150
    hover:bg-indigo-700
    active:scale-[0.97]
    focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600
    disabled:cursor-not-allowed disabled:opacity-50
    dark:bg-indigo-500 dark:text-white dark:hover:bg-indigo-400 dark:focus-visible:outline-indigo-400
    motion-reduce:transition-none"
>
  Get started
</button>
```

**设计要点：**
- 无 `shadow-sm`——遵循"表面抬升替代阴影"原则，用颜色变化传达深度
- `active:scale-[0.97]`——遵循"动画 ≤200ms，仅反馈不表演"
- 暗色模式：`indigo-500` 背景，白色文字——品牌色略降饱和度，保持视觉权重

---

### 2. Secondary — 线框次按钮

与 Primary 并排时提供视觉降级。使用 `inset-ring` 而非 `border`——不影响布局，且适配圆角。

```html
<button
  type="button"
  class="inline-flex items-center justify-center gap-2 rounded-lg
    px-4 py-2.5
    text-sm font-semibold text-gray-900
    inset-ring inset-ring-gray-950/8
    transition-colors duration-150
    hover:bg-gray-950/[2.5%] hover:inset-ring-gray-950/20
    active:scale-[0.97]
    focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900
    disabled:cursor-not-allowed disabled:opacity-50
    motion-reduce:transition-none"
>
  Learn more
</button>
```

```html
<!-- Dark mode -->
<button
  type="button"
  class="inline-flex items-center justify-center gap-2 rounded-lg
    px-4 py-2.5
    text-sm font-semibold text-gray-900
    inset-ring inset-ring-gray-950/8
    transition-colors duration-150
    hover:bg-gray-950/[2.5%] hover:inset-ring-gray-950/20
    active:scale-[0.97]
    focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900
    disabled:cursor-not-allowed disabled:opacity-50
    dark:text-gray-100 dark:inset-ring-white/10 dark:hover:bg-white/[2.5%]
    dark:hover:inset-ring-white/20 dark:focus-visible:outline-white
    motion-reduce:transition-none"
>
  Learn more
</button>
```

**设计要点：**
- `inset-ring-gray-950/8`——遵循透明度层次替代固定颜色（2.5%/5%/8% 体系）
- hover 时背景仅 2.5% 透明度——几乎不可见但能感觉到，精准克制
- 暗色模式自动使用 `white/10` 反转——透明度方案的优势

---

### 3. Ghost — 幽灵按钮

用于最低优先级操作。默认无背景无边框，hover 时才显现底色。**这是工具栏和侧边栏的默认按钮风格**（参考 Linear）。

```html
<button
  type="button"
  class="inline-flex items-center justify-center gap-2 rounded-lg
    px-3 py-2
    text-sm font-medium text-gray-700
    transition-colors duration-150
    hover:bg-gray-950/[2.5%] hover:text-gray-900
    active:scale-[0.97]
    focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900
    disabled:cursor-not-allowed disabled:opacity-50
    motion-reduce:transition-none"
>
  Cancel
</button>
```

```html
<!-- Dark mode -->
<button
  type="button"
  class="inline-flex items-center justify-center gap-2 rounded-lg
    px-3 py-2
    text-sm font-medium text-gray-700
    transition-colors duration-150
    hover:bg-gray-950/[2.5%] hover:text-gray-900
    active:scale-[0.97]
    focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900
    disabled:cursor-not-allowed disabled:opacity-50
    dark:text-gray-400 dark:hover:bg-white/[2.5%] dark:hover:text-gray-100
    dark:focus-visible:outline-white
    motion-reduce:transition-none"
>
  Cancel
</button>
```

**设计要点：**
- `font-medium` (500) 而非 `font-semibold` (600) —— Ghost 应比 Primary/Secondary 轻一级
- `text-gray-700` 而非 `text-gray-900` —— 视觉层级最低
- hover 时上升至 `text-gray-900` —— 即时反馈，无动画延迟

---

### 4. Danger — 破坏性操作

仅用于不可逆的破坏性操作：删除、移除、注销。遵循"语义色仅用于状态"原则——红色在此的唯一意义是"危险"。

```html
<button
  type="button"
  class="inline-flex items-center justify-center gap-2 rounded-lg
    bg-red-600 px-4 py-2.5
    text-sm font-semibold text-white
    transition-colors duration-150
    hover:bg-red-700
    active:scale-[0.97]
    focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-red-600
    disabled:cursor-not-allowed disabled:opacity-50
    motion-reduce:transition-none"
>
  Delete project
</button>
```

```html
<!-- Danger Secondary（线框） -->
<button
  type="button"
  class="inline-flex items-center justify-center gap-2 rounded-lg
    px-4 py-2.5
    text-sm font-semibold text-red-600
    inset-ring inset-ring-red-200
    transition-colors duration-150
    hover:bg-red-50 hover:inset-ring-red-300
    active:scale-[0.97]
    focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-red-600
    disabled:cursor-not-allowed disabled:opacity-50
    motion-reduce:transition-none"
>
  Remove
</button>
```

**设计要点：**
- 不与 Primary 同时以实心形式出现——避免红色和品牌色竞争
- 提供 Secondary 变体用于低优先级的破坏性操作（如"移除"而非"删除"）
- 文案使用 `Verb + Noun`（参考 Vercel 命名规范）

---

## 尺寸

三种尺寸覆盖所有场景。高度对齐 8px 网格。

| Size | Height | Padding | 字号 | 用途 |
|------|--------|---------|------|------|
| **sm** | 32px | `py-1.5 px-3` | `text-xs` (12px) | 表格内操作、紧凑工具栏 |
| **md** (默认) | 40px | `py-2.5 px-4` | `text-sm` (14px) | 标准按钮 |
| **lg** | 48px | `py-3 px-6` | `text-sm` (14px) | Hero CTA、大表单 |

```html
<!-- sm -->
<button class="... py-1.5 px-3 text-xs font-semibold rounded-lg ...">
  Edit
</button>

<!-- md (default) -->
<button class="... py-2.5 px-4 text-sm font-semibold rounded-lg ...">
  Get started
</button>

<!-- lg -->
<button class="... py-3 px-6 text-sm font-semibold rounded-lg ...">
  Start free trial
</button>
```

---

## 带图标

图标不是独立的变体——它是所有变体的**组合模式**。使用 `gap-2` 控制图标与文字间距。

```html
<!-- Primary + 右箭头 -->
<button
  type="button"
  class="group inline-flex items-center justify-center gap-2 rounded-lg
    bg-indigo-600 px-4 py-2.5
    text-sm font-semibold text-white
    transition-colors duration-150
    hover:bg-indigo-700
    active:scale-[0.97]
    focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600
    disabled:cursor-not-allowed disabled:opacity-50
    motion-reduce:transition-none"
>
  Get started
  <svg
    class="size-4 transition-transform duration-150 group-hover:translate-x-0.5
           motion-reduce:transition-none"
    fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
  >
    <path stroke-linecap="round" stroke-linejoin="round" d="M13 7l5 5m0 0l-5 5m5-5H6" />
  </svg>
</button>
```

**设计要点：**
- 图标 `size-4` (16px) 与 14px 文字视觉平衡
- 箭头 hover 时 `translate-x-0.5` (2px) —— 仅 2px 微动，克制不喧哗
- `group` + `group-hover:` 实现图标单独响应按钮 hover

---

## 纯图标按钮

用于工具栏、关闭按钮。必须提供 `aria-label`。

```html
<!-- 实心圆形 -->
<button
  type="button"
  class="inline-flex items-center justify-center rounded-lg
    bg-indigo-600 p-2.5
    text-white
    transition-colors duration-150
    hover:bg-indigo-700
    active:scale-[0.97]
    focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600
    disabled:cursor-not-allowed disabled:opacity-50
    motion-reduce:transition-none"
  aria-label="Close"
>
  <svg class="size-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
  </svg>
</button>

<!-- Ghost 纯图标 -->
<button
  type="button"
  class="inline-flex items-center justify-center rounded-lg
    p-2.5
    text-gray-700
    transition-colors duration-150
    hover:bg-gray-950/[2.5%] hover:text-gray-900
    active:scale-[0.97]
    focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900
    disabled:cursor-not-allowed disabled:opacity-50
    dark:text-gray-400 dark:hover:bg-white/[2.5%] dark:hover:text-gray-100
    dark:focus-visible:outline-white
    motion-reduce:transition-none"
  aria-label="Settings"
>
  <svg class="size-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
    <path stroke-linecap="round" stroke-linejoin="round"
      d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.066 2.573c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.573 1.066c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.066-2.573c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" />
    <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
  </svg>
</button>
```

**设计要点：**
- 纯图标按钮与文字按钮使用相同的 `rounded-lg` (8px) —— 统一圆角
- `p-2.5` (10px) 确保 40px 最小触控区域

---

## 状态

所有变体覆盖以下 6 种状态：

| 状态 | 表现 | 实现 |
|------|------|------|
| **Default** | 变体默认样式 | — |
| **Hover** | Primary: 背景变深一级 / Secondary: 背景 2.5% + 边框变深 / Ghost: 背景 2.5% + 文字变深 | `transition-colors duration-150` |
| **Active** | 按下缩放至 97% | `active:scale-[0.97]` |
| **Focus** | 2px outline + 2px offset | `focus-visible:outline-2 focus-visible:outline-offset-2` |
| **Disabled** | 50% 透明度 + 禁止点击 | `disabled:opacity-50 disabled:cursor-not-allowed` |
| **Loading** | 左侧 spinner + 保持宽度 + 保持可聚焦 | 见下方 Loading 模式 |

### Loading 状态

遵循 Vercel 的做法——loading 时保持按钮宽度和可聚焦性，不替换为 spinner。

```html
<button
  type="button"
  disabled
  class="inline-flex items-center justify-center gap-2 rounded-lg
    bg-indigo-600 px-4 py-2.5
    text-sm font-semibold text-white
    transition-colors duration-150
    disabled:cursor-wait disabled:opacity-100
    motion-reduce:transition-none"
>
  <svg class="size-4 animate-spin" fill="none" viewBox="0 0 24 24">
    <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4" />
    <path class="opacity-75" fill="currentColor"
      d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z" />
  </svg>
  Saving...
</button>
```

**设计要点：**
- `disabled:cursor-wait` 而非 `cursor-not-allowed` —— 操作仍在进行中
- `disabled:opacity-100` 而非 `opacity-50` —— 保持完整视觉权重
- spinner 使用 `animate-spin` —— 唯一使用 animation 的场景
- 文字变为进行时："Saving..." 替代 "Save"

---

## Design Tokens

| Token | Tailwind | 值 | 说明 |
|-------|----------|-----|------|
| 主背景 | `bg-indigo-600` | `#4F46E5` | Primary 按钮品牌色 |
| 主背景 hover | `bg-indigo-700` | `#4338CA` | 加深一阶 |
| 主背景 dark | `bg-indigo-500` | `#6366F1` | 暗色模式略降饱和度 |
| 主文字 | `text-white` | `#fff` | Primary 按钮文字 |
| 次描边 | `inset-ring-gray-950/8` | 8% 黑 | Secondary 按钮 |
| 次描边 hover | `inset-ring-gray-950/20` | 20% 黑 | 加深描边 |
| 表面 hover | `bg-gray-950/[2.5%]` | 2.5% 黑 | Secondary / Ghost hover |
| Ghost 默认文字 | `text-gray-700` | `#374151` | Ghost 按钮 |
| Ghost hover 文字 | `text-gray-900` | `#111827` | Ghost hover |
| Danger 背景 | `bg-red-600` | — | Danger 按钮 |
| Danger hover | `bg-red-700` | — | 加深一阶 |
| 字号 | `text-sm` | 14px / 20px | 所有按钮（sm: text-xs 12px） |
| 字重 | `font-semibold` | 600 | Primary / Secondary / Danger |
| 字重 Ghost | `font-medium` | 500 | Ghost 较轻 |
| Padding md | `px-4 py-2.5` | 16px / 10px | 40px 高度 |
| Padding sm | `px-3 py-1.5` | 12px / 6px | 32px 高度 |
| Padding lg | `px-6 py-3` | 24px / 12px | 48px 高度 |
| 圆角 | `rounded-lg` (8px) | | 所有按钮统一 |
| 图标间距 | `gap-2` | 8px | 图标与文字 |
| 过渡 | `transition-colors duration-150` | 150ms | 仅颜色 |
| 按下 | `active:scale-[0.97]` | 97% | 微缩放反馈 |
| Focus ring | `outline-2 outline-offset-2` | 2px + 2px | 仅 focus-visible |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| 键盘操作 | `<button>` 原生支持 Enter / Space |
| 可见焦点 | `focus-visible:outline-2 outline-offset-2`，仅在键盘导航时显示 |
| 屏幕阅读器 | 纯图标按钮必须包含 `aria-label` |
| 禁用态 | `disabled` 属性 + `disabled:cursor-not-allowed` |
| Loading 态 | `disabled` 属性 + `cursor-wait`，保持可聚焦 |
| 减少动画 | `motion-reduce:transition-none` |
| 颜色对比度 | `indigo-600` (#4F46E5) : `white` (#FFF) = 6.54:1 (WCAG AA) ✅ |

---

## 复用指南

### 何时使用

| 场景 | 变体 | 说明 |
|------|------|------|
| 表单提交 / 页面主 CTA | Primary | 每屏最多一个 |
| 取消 / 返回 / 次要操作 | Secondary | 与 Primary 搭配时使用 |
| 工具栏 / 侧边栏 / 最低优先级 | Ghost | 默认按钮风格 |
| 删除 / 移除 / 注销 | Danger | 需二次确认 |
| 导航跳转 | 使用 `<a>` 标签 + 按钮样式 | 语义正确 |

### 何时不用

| 场景 | 替代方案 |
|------|---------|
| Header 中的文字链接 | 纯 `<a>` 文字链接 |
| 标签 / 分类标记 | [Badge](badge.md) |
| 开关 / 切换 | Toggle 组件 |
| 多个选项的选择 | Segmented Control / Button Group |
| 提交后跳转 | `<a>` 使用按钮样式 |

### 组合规则

```
✅ Primary + Secondary     → gap-3, Primary 在右
✅ Primary + Ghost         → gap-3
✅ Ghost only              → 工具栏 / 侧边栏
❌ Secondary + Ghost 并排  → 视觉层级冲突
❌ 同一区块两个 Primary    → 违反色彩纪律
```

---

## 与旧版的变更

| 变更 | 旧值 | 新值 | 依据 |
|------|------|------|------|
| 圆角 | `rounded-full` (全胶囊) | `rounded-lg` (8px) | 原则八 (8px 网格)；Linear/Stripe/Notion 共识 |
| 阴影 | `shadow-sm` | 无 | 原则三 (表面抬升替代阴影) |
| 描边方式 | `border` | `inset-ring` | Tailwind/原则三 (不占布局的描边) |
| Ghost 圆角 | `rounded-lg` (不一致) | `rounded-lg` (统一) | 一致性 |
| 暗色 hover | 固定颜色 | 透明度自动反转 | 原则二 (透明度方案优于固定色) |
| Loading 态 | 未定义 | `cursor-wait` + spinner + 保持宽度 | Vercel/原则五 (仅反馈) |

---

> 参考: [设计共同规律](../../principles/design.md) · [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md)
