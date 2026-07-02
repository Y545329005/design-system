# Card

> 基于 [设计共同规律](../../principles/design.md) 重新设计。
> 适用原则：表面抬升替代阴影、不用纯黑、透明度层次、单字体族、动画 ≤200ms、8px 网格、可访问性地基。

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 层次方案 | 背景色明度差 + `inset-ring` | 原则三——六款产品放弃阴影，用表面抬升区分层次 |
| 阴影 | 无 | Linear / Vercel / Notion / Tailwind 均无卡片阴影 |
| 描边方式 | `inset-ring` 透明度 | 与 Button 统一；透明度自动适配暗色模式 |
| 圆角 | `rounded-xl` (12px) | Design Tokens 定义——卡片/Modal 统一使用 |
| 圆角（内部元素） | `rounded-lg` (8px) | 与 Button / Badge 统一，不混用 `rounded-full` |
| hover 反馈 | 背景微变 + ring 加深 | 原则五——仅反馈不表演，150ms |
| press 反馈 | `active:scale-[0.99]` | 比 Button (0.97) 更克制——卡片面积大，缩放需更微妙 |
| 过渡 | `transition-colors duration-150` | 全局统一，仅颜色过渡 |
| 标题字号 | `text-base` ~ `text-lg` | 原则四——有限字重，标题不过大 |

---

## Elevation 体系

卡片层次不依赖阴影，用三层信息建立深度感：

| 层级 | 背景 | 描边 | 用途 |
|------|------|------|------|
| **Page (0)** | `bg-gray-50` | 无 | 页面底色 |
| **Card (1)** | `bg-white` | `inset-ring-gray-950/8` | 标准卡片——白色浮于灰色页面之上 |
| **Card Hover (2)** | `bg-white` → `bg-gray-50/50` | `inset-ring-gray-950/8` → `/20` | 可交互卡片 hover 时微微变暖 |

```
Page (gray-50)
 └── Card (white + inset-ring 8%)     ← 白卡浮于灰底，天然层次感
      └── Card Hover (white→gray-50/50 + ring 20%)  ← hover 时 ring 加深，背景微暖
```

**核心思路**：页面底色 `gray-50` 与卡片 `white` 之间已有明度差（#f9fafb vs #fff），不需要阴影来"告诉"用户这里有层次——用户能"感觉到"。

---

## 变体

共 6 种变体，覆盖内容展示、特性介绍、人员展示、数据概览、商品卡片、高亮推荐。

### 1. Blog Card — 内容卡片

最常用的内容卡片。图片 + 元数据 + 标题 + 描述。适用：博客列表、文章首页、资源库。

```html
<article
  class="group overflow-hidden rounded-xl bg-white
    inset-ring inset-ring-gray-950/8
    transition-colors duration-150
    hover:bg-gray-50/50 hover:inset-ring-gray-950/20
    active:scale-[0.99]
    motion-reduce:transition-none"
>
  <img
    class="aspect-video w-full object-cover"
    src="https://images.unsplash.com/photo-1499750310107-5fef28a66643?w=800&h=400&fit=crop"
    alt="Desk setup with laptop and notebook"
  />
  <div class="p-4 sm:p-6">
    <div class="flex items-center gap-3 text-xs text-gray-500">
      <time datetime="2026-06-15">Jun 15, 2026</time>
      <span>·</span>
      <span>5 min read</span>
    </div>
    <h3 class="mt-2 text-base font-semibold text-gray-900 sm:text-lg">
      <a href="#" class="transition-colors duration-150 hover:text-gray-600">
        Building a Design System with Tailwind CSS
      </a>
    </h3>
    <p class="mt-2 text-sm/relaxed text-gray-600 line-clamp-2">
      Learn how to create a scalable design system that grows with your project,
      using Tailwind CSS utility classes and component patterns.
    </p>
  </div>
</article>
```

```html
<!-- Dark mode -->
<article
  class="group overflow-hidden rounded-xl bg-white
    inset-ring inset-ring-gray-950/8
    transition-colors duration-150
    hover:bg-gray-50/50 hover:inset-ring-gray-950/20
    active:scale-[0.99]
    dark:bg-gray-900 dark:inset-ring-white/10
    dark:hover:bg-gray-800/50 dark:hover:inset-ring-white/20
    motion-reduce:transition-none"
>
  <!-- img unchanged -->
  <div class="p-4 sm:p-6">
    <div class="flex items-center gap-3 text-xs text-gray-500 dark:text-gray-400">...</div>
    <h3 class="mt-2 text-base font-semibold text-gray-900 sm:text-lg dark:text-gray-100">
      <a href="#" class="transition-colors duration-150 hover:text-gray-600 dark:hover:text-gray-300">...</a>
    </h3>
    <p class="mt-2 text-sm/relaxed text-gray-600 line-clamp-2 dark:text-gray-400">...</p>
  </div>
</article>
```

**设计要点：**
- 图片使用 `aspect-video`（16:9）替代固定高度——更灵活，响应式更简单
- 元数据使用 `·` 分隔而非图标——更轻量，不引入不必要的视觉噪音
- `hover:bg-gray-50/50`——仅 50% 透明度的灰底叠加，几乎不可见但能感知
- 标题 `text-base`（mobile）→ `text-lg`（desktop）——信息密度递进
- `<article>` 语义标签——可访问性地基

---

### 2. Feature Card — 特性卡片

图标 + 标题 + 描述。适用：特性展示、服务介绍、能力列表。

```html
<div
  class="group rounded-xl bg-white p-6
    inset-ring inset-ring-gray-950/8
    transition-colors duration-150
    hover:bg-gray-50/50 hover:inset-ring-gray-950/20
    motion-reduce:transition-none"
>
  <div class="flex size-11 items-center justify-center rounded-lg bg-indigo-600
              dark:bg-indigo-500">
    <svg class="size-5 text-white dark:text-white" fill="none" viewBox="0 0 24 24"
         stroke="currentColor" stroke-width="2">
      <path stroke-linecap="round" stroke-linejoin="round"
        d="M3.75 13.5l10.5-11.25L12 10.5h8.25L9.75 21.75 12 13.5H3.75z" />
    </svg>
  </div>
  <h3 class="mt-5 text-base font-semibold text-gray-900 dark:text-gray-100">
    Lightning Fast
  </h3>
  <p class="mt-2 text-sm/relaxed text-gray-600 dark:text-gray-400">
    Optimized build times and instant hot reload so you can stay in flow
    without waiting for compilation.
  </p>
</div>
```

**设计要点：**
- 图标容器 `size-11` (44px)——比旧版 48px 更紧凑，视觉重心在文字而非图标
- `mt-5` (20px) 图标与标题间距——比 `mt-4` (16px) 多一档，给图标呼吸空间
- 无交互元素时仍保留 `group`——为未来可能的整卡链接预留

---

### 3. Profile Card — 人员卡片

头像 + 名称 + 角色 + 社交链接。适用：团队成员、作者信息、用户卡片。

```html
<div
  class="rounded-xl bg-white p-6 text-center
    inset-ring inset-ring-gray-950/8
    motion-reduce:transition-none"
>
  <img
    class="mx-auto size-20 rounded-full object-cover"
    src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=160&h=160&fit=crop&crop=face"
    alt="Portrait of Alex Chen"
  />
  <h3 class="mt-4 text-base font-semibold text-gray-900 dark:text-gray-100">
    Alex Chen
  </h3>
  <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">
    Senior Product Designer
  </p>
  <div class="mt-4 flex justify-center gap-1">
    <a href="#"
      class="inline-flex items-center justify-center rounded-lg p-2
        text-gray-400
        transition-colors duration-150
        hover:bg-gray-950/[2.5%] hover:text-gray-700
        dark:hover:bg-white/[2.5%] dark:hover:text-gray-300"
      aria-label="Twitter"
    >
      <svg class="size-4" fill="currentColor" viewBox="0 0 24 24">
        <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/>
      </svg>
    </a>
    <a href="#"
      class="inline-flex items-center justify-center rounded-lg p-2
        text-gray-400
        transition-colors duration-150
        hover:bg-gray-950/[2.5%] hover:text-gray-700
        dark:hover:bg-white/[2.5%] dark:hover:text-gray-300"
      aria-label="GitHub"
    >
      <svg class="size-4" fill="currentColor" viewBox="0 0 24 24">
        <path d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"/>
      </svg>
    </a>
  </div>
</div>
```

**设计要点：**
- Profile Card 通常不可交互（展示用途），不添加 hover 效果
- 头像保留 `rounded-full`——圆形是头像的语义约定，不属于"按钮圆角"范畴
- 社交链接 `rounded-lg` + Ghost hover 模式——与 Button Ghost 完全一致
- `gap-1` (4px) 链接间距——比 `gap-3` 更紧凑，社交图标彼此关联

---

### 4. Stat Card — 数据卡片

大数字 + 标签 + 趋势指示。适用：仪表盘、数据概览、Analytics。

```html
<div
  class="rounded-xl bg-white p-5 sm:p-6
    inset-ring inset-ring-gray-950/8
    motion-reduce:transition-none"
>
  <div class="flex items-center justify-between">
    <p class="text-sm font-medium text-gray-500 dark:text-gray-400">
      Total Revenue
    </p>
    <span
      class="inline-flex items-center gap-1 rounded-lg bg-green-50 px-2 py-0.5
        text-xs font-medium text-green-700
        dark:bg-green-900/30 dark:text-green-400"
    >
      <svg class="size-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="3">
        <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 19.5l15-15m0 0H8.25m11.25 0v11.25" />
      </svg>
      12.5%
    </span>
  </div>
  <p class="mt-2 text-3xl font-bold tracking-tight text-gray-900 dark:text-gray-100">
    $48,295
  </p>
  <p class="mt-1 text-xs text-gray-500 dark:text-gray-400">
    vs. $42,920 last month
  </p>
</div>
```

```html
<!-- Stat Card Grid (3 columns) -->
<div class="grid gap-4 sm:gap-6 sm:grid-cols-2 lg:grid-cols-3">
  <div class="rounded-xl bg-white p-5 sm:p-6
    inset-ring inset-ring-gray-950/8
    dark:bg-gray-900 dark:inset-ring-white/10">
    <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Total Users</p>
    <p class="mt-2 text-3xl font-bold tracking-tight text-gray-900 dark:text-gray-100">12,845</p>
    <p class="mt-1 text-xs text-gray-500 dark:text-gray-400">
      <span class="text-green-600 dark:text-green-400">↑ 8.2%</span> from last month
    </p>
  </div>
  <!-- Repeat for more stats -->
</div>
```

**设计要点：**
- `tracking-tight`——数字使用紧凑字母间距，大数字更整洁（参考 Stripe 的 `tabular-nums`）
- 趋势 Badge 使用 `rounded-lg` (8px)——与全局圆角统一
- `p-5` (mobile) → `p-6` (desktop)——响应式内边距
- 网格 `gap-4` → `sm:gap-6`——移动端更紧凑
- 趋势色使用语义色 green/red——仅用于状态传达

---

### 5. Product Card — 商品卡片

图片 + 标签 + 名称 + 价格 + CTA。适用：电商、SaaS 定价、应用展示。

```html
<div
  class="group overflow-hidden rounded-xl bg-white
    inset-ring inset-ring-gray-950/8
    transition-colors duration-150
    hover:inset-ring-gray-950/20
    motion-reduce:transition-none"
>
  <div class="relative overflow-hidden">
    <img
      class="aspect-square w-full object-cover
        transition-transform duration-200
        group-hover:scale-[1.03]
        motion-reduce:transition-none"
      src="https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=600&h=800&fit=crop"
      alt="Minimal watch with leather strap"
    />
    <span
      class="absolute left-3 top-3 inline-flex rounded-lg bg-indigo-600 px-2.5 py-0.5
        text-xs font-medium text-white
        dark:bg-indigo-500 dark:text-white"
    >
      New
    </span>
  </div>
  <div class="p-4 sm:p-5">
    <div class="flex items-start justify-between gap-3">
      <div class="min-w-0">
        <h3 class="text-sm font-semibold text-gray-900 dark:text-gray-100 truncate">
          Minimal Watch
        </h3>
        <p class="mt-1 text-xs text-gray-500 dark:text-gray-400">
          Analog · Leather Strap
        </p>
      </div>
      <p class="shrink-0 text-base font-semibold text-gray-900 dark:text-gray-100">
        $129
      </p>
    </div>
    <button
      type="button"
      class="mt-4 w-full inline-flex items-center justify-center rounded-lg
        bg-indigo-600 px-4 py-2.5
        text-sm font-semibold text-white
        transition-colors duration-150
        hover:bg-indigo-700
        active:scale-[0.97]
        focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600
        dark:bg-indigo-500 dark:text-white dark:hover:bg-indigo-400 dark:focus-visible:outline-indigo-400
        motion-reduce:transition-none"
    >
      Add to cart
    </button>
  </div>
</div>
```

**设计要点：**
- 图片 `aspect-square`——商品卡片统一 1:1，比固定高度更灵活
- 图片 hover `scale-[1.03]`——仅 3% 缩放，远比旧版 5% 克制
- 图片过渡 `duration-200`——略长于 150ms，图片缩放需要稍缓的节奏
- Badge `rounded-lg`——统一 8px，不再使用 `rounded-full`
- 按钮复用 [Button](./button.md) Primary 完整样式——不内联自己的按钮风格
- 名称 `truncate`——防止长标题撑破布局

---

### 6. Highlighted Card — 高亮卡片

2px 品牌色 ring 突出显示推荐选项。适用：Pricing 推荐套餐、Featured 内容、首选操作。

```html
<div
  class="relative rounded-xl bg-white p-6
    inset-ring-2 inset-ring-indigo-600
    transition-colors duration-150
    hover:inset-ring-indigo-700
    dark:bg-gray-950 dark:inset-ring-indigo-500
    dark:hover:inset-ring-indigo-400
    motion-reduce:transition-none"
>
  <!-- Floating badge -->
  <div class="absolute -top-3 left-1/2 -translate-x-1/2">
    <span class="inline-flex items-center rounded-full bg-indigo-600 px-3 py-1 text-xs font-semibold text-white dark:bg-indigo-500">
      Most popular
    </span>
  </div>

  <h3 class="text-base font-semibold text-gray-900 dark:text-gray-100">Pro</h3>
  <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">For growing teams.</p>
  <div class="mt-4">
    <span class="text-4xl font-bold tabular-nums text-gray-900 dark:text-white">$79</span>
    <span class="text-sm text-gray-500 dark:text-gray-400">/month</span>
  </div>
  <ul class="mt-6 space-y-3 text-sm text-gray-600 dark:text-gray-400" role="list">
    <li class="flex items-center gap-2">
      <svg class="size-4 shrink-0 text-emerald-500" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" /></svg>
      Feature item one
    </li>
    <li class="flex items-center gap-2">
      <svg class="size-4 shrink-0 text-emerald-500" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" /></svg>
      Feature item two
    </li>
  </ul>
  <button
    type="button"
    class="mt-6 w-full inline-flex items-center justify-center rounded-lg
      bg-indigo-600 px-4 py-2.5
      text-sm font-semibold text-white
      transition-colors duration-150
      hover:bg-indigo-700
      active:scale-[0.97]
      focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600
      dark:bg-indigo-500 dark:hover:bg-indigo-400 dark:focus-visible:outline-indigo-400
      motion-reduce:transition-none"
  >
    Get started
  </button>
</div>
```

**设计要点：**
- `inset-ring-2` (2px) 而非默认 `inset-ring` (1px)——更重的 ring 传达"推荐/重要"
- ring 色使用品牌色 `indigo-600`——唯一使用 2px 品牌色 ring 的场景
- `relative` + `absolute -top-3`——浮动 Badge 跨在卡片顶部边缘，Half-in / Half-out 效果
- Badge 使用 `rounded-full`（胶囊）——这是 Badge 的合法场景（非交互元素）
- 内部按钮复用 [Button](./button.md) Primary——不自定义
- 与常规 Card 并排时形成对比——普通卡 `inset-ring-gray-950/8` (1px) vs 高亮卡 `inset-ring-2 inset-ring-indigo-600` (2px)

**何时使用：**
- ✅ 定价页推荐套餐
- ✅ 多选项中的首选/推荐
- ✅ Featured 内容卡片
- ❌ 一般内容展示——用 Blog Card 或 Feature Card
- ❌ 表单/设置页——高亮在此上下文无意义

---

## 布局模式

### Card Grid（卡片网格）

标准响应式网格，移动端单列 → 平板双列 → 桌面三列。

```html
<div class="grid gap-4 sm:gap-6 sm:grid-cols-2 lg:grid-cols-3">
  <!-- 重复使用任意 Card 变体 -->
</div>
```

### Horizontal Card（横向卡片）

适用：列表视图、紧凑布局、搜索结果。

```html
<article
  class="group flex flex-col overflow-hidden rounded-xl bg-white
    inset-ring inset-ring-gray-950/8
    transition-colors duration-150
    hover:bg-gray-50/50 hover:inset-ring-gray-950/20
    active:scale-[0.99]
    sm:flex-row
    motion-reduce:transition-none"
>
  <img
    class="aspect-video w-full object-cover sm:w-48 sm:aspect-auto lg:w-64"
    src="..."
    alt="..."
  />
  <div class="flex flex-1 flex-col justify-center p-4 sm:p-6">
    <h3 class="text-base font-semibold text-gray-900 dark:text-gray-100">
      Title
    </h3>
    <p class="mt-2 text-sm/relaxed text-gray-600 line-clamp-2 dark:text-gray-400">
      Description...
    </p>
    <div class="mt-4 flex items-center gap-3 text-xs text-gray-500 dark:text-gray-400">
      <time datetime="2026-06-15">Jun 15, 2026</time>
      <span>·</span>
      <span>5 min read</span>
    </div>
  </div>
</article>
```

**设计要点：**
- `sm:flex-row`——移动端仍纵向堆叠（图片在上），平板起横向排列
- `flex-1`——内容区自动填充剩余空间
- `justify-center`——内容垂直居中（图片高度可能大于内容）

### Card Link（整卡可点击）

当整张卡片都是链接时，使用 `<a>` 替代 `<article>`。

```html
<a
  href="#"
  class="group block overflow-hidden rounded-xl bg-white
    inset-ring inset-ring-gray-950/8
    transition-colors duration-150
    hover:bg-gray-50/50 hover:inset-ring-gray-950/20
    active:scale-[0.99]
    motion-reduce:transition-none"
>
  <img class="aspect-video w-full object-cover" src="..." alt="..." />
  <div class="p-4 sm:p-6">
    <h3 class="text-base font-semibold text-gray-900 sm:text-lg dark:text-gray-100">
      Card Title
    </h3>
    <p class="mt-2 text-sm/relaxed text-gray-600 line-clamp-2 dark:text-gray-400">
      Description text...
    </p>
  </div>
</a>
```

**设计要点：**
- 使用 `<a>` 而非 `<article>`——整卡为链接时语义更准确
- 不在卡内嵌套独立链接——避免嵌套交互元素的 a11y 问题
- `block`——`<a>` 默认为 inline，需显式设置

### Card with Section（分区卡片）

复杂内容使用内部分区：Header / Body / Footer。

```html
<div
  class="overflow-hidden rounded-xl bg-white
    inset-ring inset-ring-gray-950/8
    motion-reduce:transition-none"
>
  <!-- Header -->
  <div class="border-b border-gray-950/5 px-5 py-4 sm:px-6 dark:border-white/5">
    <h3 class="text-base font-semibold text-gray-900 dark:text-gray-100">
      Card Header
    </h3>
    <p class="mt-0.5 text-xs text-gray-500 dark:text-gray-400">
      Optional description
    </p>
  </div>

  <!-- Body -->
  <div class="px-5 py-4 sm:px-6">
    <!-- 任意内容 -->
  </div>

  <!-- Footer -->
  <div class="flex items-center justify-end gap-3 border-t border-gray-950/5 px-5 py-3 sm:px-6 dark:border-white/5">
    <button type="button" class="inline-flex items-center justify-center gap-2 rounded-lg px-3 py-2 text-sm font-medium text-gray-700 transition-colors duration-150 hover:bg-gray-950/[2.5%] hover:text-gray-900 active:scale-[0.97] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900 disabled:cursor-not-allowed disabled:opacity-50 dark:text-gray-400 dark:hover:bg-white/[2.5%] dark:hover:text-white motion-reduce:transition-none">Cancel</button>
    <button type="button" class="inline-flex items-center justify-center gap-2 rounded-lg bg-indigo-600 px-4 py-2.5 text-sm font-semibold text-white transition-colors duration-150 hover:bg-indigo-700 active:scale-[0.97] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 disabled:cursor-not-allowed disabled:opacity-50 dark:bg-indigo-500 dark:hover:bg-indigo-400 dark:focus-visible:outline-indigo-400 motion-reduce:transition-none">Save</button>
  </div>
</div>
```

**设计要点：**
- 分隔线使用 `border-gray-950/5`——透明度方案，比 `gray-200` 更轻
- Footer 按钮右对齐——操作区自然流向
- Footer 按钮直接引用 [Button](./button.md) 组件样式：Cancel 为 Ghost，Save/Confirm 为 Primary
- Footer padding `px-5 py-3 sm:px-6`——比 Body 略紧凑，视觉上与内容区区分
- 按钮间距 `gap-3` (12px)——Primary 与 Ghost 之间的呼吸感

### Card Footer 使用模式

```html
<!-- 标准 Footer: Ghost + Primary -->
<div class="flex items-center justify-end gap-3 border-t border-gray-950/5 px-5 py-3 sm:px-6 dark:border-white/5">
  <button type="button" class="inline-flex items-center justify-center gap-2 rounded-lg px-3 py-2 text-sm font-medium text-gray-700 transition-colors duration-150 hover:bg-gray-950/[2.5%] hover:text-gray-900 active:scale-[0.97] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900 dark:text-gray-400 dark:hover:bg-white/[2.5%] dark:hover:text-white motion-reduce:transition-none">Cancel</button>
  <button type="button" class="inline-flex items-center justify-center gap-2 rounded-lg bg-indigo-600 px-4 py-2.5 text-sm font-semibold text-white transition-colors duration-150 hover:bg-indigo-700 active:scale-[0.97] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 dark:bg-indigo-500 dark:hover:bg-indigo-400 dark:focus-visible:outline-indigo-400 motion-reduce:transition-none">Save</button>
</div>

<!-- Danger Footer: Ghost + Danger -->
<div class="flex items-center justify-end gap-3 border-t border-gray-950/5 px-5 py-3 sm:px-6 dark:border-white/5">
  <button type="button" class="inline-flex items-center justify-center gap-2 rounded-lg px-3 py-2 text-sm font-medium text-gray-700 transition-colors duration-150 hover:bg-gray-950/[2.5%] hover:text-gray-900 active:scale-[0.97] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900 dark:text-gray-400 dark:hover:bg-white/[2.5%] dark:hover:text-white motion-reduce:transition-none">Cancel</button>
  <button type="button" class="inline-flex items-center justify-center gap-2 rounded-lg bg-red-600 px-4 py-2.5 text-sm font-semibold text-white transition-colors duration-150 hover:bg-red-700 active:scale-[0.97] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-red-600 dark:bg-red-500 dark:hover:bg-red-400 dark:focus-visible:outline-red-400 motion-reduce:transition-none">Delete</button>
</div>

<!-- Footer with left-aligned secondary action -->
<div class="flex items-center justify-between border-t border-gray-950/5 px-5 py-3 sm:px-6 dark:border-white/5">
  <button type="button" class="inline-flex items-center justify-center gap-2 rounded-lg px-3 py-2 text-sm font-medium text-red-600 transition-colors duration-150 hover:bg-red-50 hover:text-red-700 active:scale-[0.97] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-red-600 dark:text-red-400 dark:hover:bg-red-900/30 dark:hover:text-red-300 motion-reduce:transition-none">Delete project</button>
  <div class="flex items-center gap-3">
    <button type="button" class="inline-flex items-center justify-center gap-2 rounded-lg px-3 py-2 text-sm font-medium text-gray-700 transition-colors duration-150 hover:bg-gray-950/[2.5%] hover:text-gray-900 active:scale-[0.97] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900 dark:text-gray-400 dark:hover:bg-white/[2.5%] dark:hover:text-white motion-reduce:transition-none">Cancel</button>
    <button type="button" class="inline-flex items-center justify-center gap-2 rounded-lg bg-indigo-600 px-4 py-2.5 text-sm font-semibold text-white transition-colors duration-150 hover:bg-indigo-700 active:scale-[0.97] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 dark:bg-indigo-500 dark:hover:bg-indigo-400 dark:focus-visible:outline-indigo-400 motion-reduce:transition-none">Save</button>
  </div>
</div>
```

---

## Design Tokens

| Token | Tailwind | 值 | 说明 |
|-------|----------|-----|------|
| 卡片圆角 | `rounded-xl` | 12px | 所有卡片容器 |
| 内部元素圆角 | `rounded-lg` | 8px | 图标容器、Badge、按钮 |
| 头像圆角 | `rounded-full` | 9999px | 仅头像——语义约定 |
| 描边 | `inset-ring-gray-950/8` | 8% 黑 | 卡片边界 |
| 描边 hover | `inset-ring-gray-950/20` | 20% 黑 | 可交互卡片 |
| 背景 | `bg-white` | `#fff` | 卡片背景 |
| 背景 hover | `bg-gray-50/50` | 50% gray-50 | 可交互卡片 hover |
| 页面底色 | `bg-gray-50` | `#f9fafb` | 卡片所在页面背景 |
| 分隔线 | `border-gray-950/5` | 5% 黑 | 分区卡片内分隔线 |
| Padding 标准 | `p-4 sm:p-6` | 16px → 24px | 内容区内边距 |
| Padding 紧凑 | `p-5 sm:p-6` | 20px → 24px | Stat Card 内边距 |
| 标题字号 | `text-base` ~ `text-lg` | 16px ~ 18px | 卡片标题 |
| 描述字号 | `text-sm/relaxed` | 14px / 1.625 | 卡片描述 |
| 元数据字号 | `text-xs` | 12px | 日期、阅读时长等 |
| 图片比例 | `aspect-video` | 16:9 | Blog Card |
| 图片比例 (商品) | `aspect-square` | 1:1 | Product Card |
| 描述截断 | `line-clamp-2` | 2 行 | 长文本省略 |
| 网格间距 | `gap-4 sm:gap-6` | 16px → 24px | 卡片网格 |
| 过渡 | `transition-colors duration-150` | 150ms | 仅颜色 |
| 图片缩放 | `duration-200` | 200ms | 图片 hover——略缓 |
| Press | `active:scale-[0.99]` | 99% | 整卡点击反馈 |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| 语义元素 | Blog Card 使用 `<article>`；整卡链接使用 `<a>` |
| 图片 alt | 所有图片必须有描述性 `alt` |
| 键盘导航 | 卡内链接/按钮支持 Tab 访问；整卡链接通过 `<a>` 原生支持 |
| 可见焦点 | 按钮使用 `focus-visible:outline-2`；链接 hover 变色 |
| heading 层级 | 卡片标题统一 `h3`（页面 h1 → section h2 → card h3） |
| 颜色对比度 | `text-gray-600` : `bg-white` = 5.74:1 (WCAG AA) |
| 减少动画 | 所有过渡响应 `motion-reduce:transition-none` |
| 嵌套交互 | 不使用卡内嵌套 `<a>` 的整卡链接——避免辅助技术混淆 |

---

## 复用指南

### 何时使用

| 场景 | 变体 | 说明 |
|------|------|------|
| 文章列表 / 资源库 | Blog Card | 图片 + 标题 + 摘要 |
| 特性展示 / 服务介绍 | Feature Card | 图标 + 标题 + 描述 |
| 团队成员 / 作者卡片 | Profile Card | 头像 + 信息 + 社交 |
| 仪表盘 / 数据概览 | Stat Card | 大数字 + 趋势 |
| 商品列表 / 定价 | Product Card | 图片 + 价格 + CTA |
| 推荐套餐 / Featured | Highlighted Card | 2px 品牌色 ring + 浮动 Badge |
| 列表视图 / 搜索结果 | Horizontal Card | 横排布局 |
| 整卡跳转 | Card Link (`<a>`) | 替代 `<article>` |
| 表单 / 复杂内容 | Card with Section | Header/Body/Footer 分区 |

### 何时不用

| 场景 | 替代方案 |
|------|---------|
| 纯文本段落 | 留白 + 标题分隔（Notion 风格） |
| 交互式弹窗 | [Modal](./modal.md) |
| 临时通知 | [Toast](./toast.md) |
| 表格数据 | Table 组件 |
| 简单列表 | `<ul>` + 分隔线 |

### 组合规则

```
✅ 同类变体成组  → grid + 统一变体
✅ 混合变体      → 同一页面可使用多种变体（Feature + Stat + Profile）
✅ 卡片内按钮    → 引用 Button 组件样式，不自行定义
❌ 有图 + 无图混排在同一行 → 视觉节奏不一致
❌ 卡片内嵌套卡片 → 层次混乱
❌ 同一网格混合 rounded-xl 和其他圆角 → 统一圆角
```

---

## 与旧版的变更

| 变更 | 旧值 | 新值 | 依据 |
|------|------|------|------|
| 层次方案 | `shadow-sm` + `hover:shadow-md` | `inset-ring` + 背景明度差 | 原则三——六款产品放弃阴影 |
| 描边方式 | `border border-gray-200` | `inset-ring inset-ring-gray-950/8` | 原则二——透明度方案，暗色自动适配 |
| Badge 圆角 | `rounded-full` | `rounded-lg` (8px) | 与 Button/Badge 统一 |
| 图片过渡 | `duration-300` | `duration-200` | 原则五——≤200ms，图片缩放可略缓 |
| 图片缩放 | `scale-105` (5%) | `scale-[1.03]` (3%) | 克制放大，不做表演式动画 |
| Feature 图标容器 | `size-12` (48px) | `size-11` (44px) | 视觉重心回归文字，图标辅助 |
| 元数据分隔 | SVG 时钟图标 | `·` 字符 | 减少视觉噪音 |
| Blog 图片 | 固定 `h-48 sm:h-56 lg:h-64` | `aspect-video` | 响应式比例，更灵活 |
| Product 图片 | 固定 `h-64` | `aspect-square` | 商品卡片 1:1 语义 |
| Stat Card Badge | `rounded-full` | `rounded-lg` | 全局统一 8px |
| Card with Section | 未定义 | Header/Body/Footer 分区 | 新增模式 |
| 整卡链接 | 未定义 | `<a>` + `block` | 新增 a11y 最佳实践 |
| Press 反馈 | 无 | `active:scale-[0.99]` | 比 Button 更克制 (0.97 vs 0.99) |

---

> 参考: [设计共同规律](../../principles/design.md) · [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Button](./button.md)
