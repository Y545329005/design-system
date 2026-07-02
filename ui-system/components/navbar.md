# Navbar

App 内页面的顶部导航栏组件。提供品牌标识、全局搜索、快捷操作和用户入口。可与 Sidebar 组合使用（倒 L 型布局），也可独立作为简单应用的唯一导航。

> **Design Tokens**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Elevation](../design-tokens/elevation.md)
>
> **关联组件**: [Sidebar](./sidebar.md)（侧边导航——Navbar + Sidebar 组合使用） · [Button](./button.md)（Ghost 按钮风格——顶部栏操作的默认交互模式）
>
> **依赖**: 无外部插件依赖。纯 Tailwind CSS。

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 高度 | `h-14` (56px) | Linear / Vercel 共识——足够容纳 32px 头像 + 上下各 12px 呼吸空间 |
| Elevation | `border-b` 底部边框 | 顶部栏与内容区之间通过一条 1px 线分隔——clear 但不喧宾夺主 |
| 背景 | `bg-white` (Light) / `dark:bg-gray-900` (Dark) | 与 Sidebar 背景一致——统一表面 |
| 导航链接样式 | Ghost 按钮风格 | 与 Sidebar 导航项一致——默认无背景，hover 显现底色 |
| 导航链接 Active | `brand-text` (indigo-600) | 品牌色用于当前位置——与 Sidebar Active 一致，但不使用背景色（顶部栏空间有限） |
| 搜索框 | `inset-ring` + `w-80` | Elevation 规范——表单控件使用 inset-ring |
| 用户头像 | `size-8 rounded-full` | 32px 圆形头像——行业标准 |
| 圆角 | `rounded-lg` | 统一交互元素圆角 |
| 过渡 | `transition-colors duration-150` | 全局统一——仅颜色过渡 |
| 移动端 | 菜单折叠为 Hamburger | < 768px 时主导航隐藏，Hamburger 触发展开菜单 |

---

## 变体

### 1. Standalone Navbar（独立顶部导航）

适用于无 Sidebar 的简单应用或落地页。包含 Logo、主导航链接、操作区。

```html
<!-- Standalone Navbar -->
<header class="sticky top-0 z-40 border-b border-gray-200 bg-white
  dark:border-gray-800 dark:bg-gray-900">
  <div class="mx-auto flex h-14 max-w-7xl items-center gap-4 px-4 sm:px-6">

    <!-- Logo -->
    <a href="#" class="flex shrink-0 items-center gap-2 text-lg font-bold text-gray-900
      dark:text-white">
      <svg class="size-6 text-indigo-600 dark:text-indigo-500" fill="none" viewBox="0 0 24 24"
        stroke="currentColor" stroke-width="2" aria-hidden="true">
        <path stroke-linecap="round" stroke-linejoin="round"
          d="M3.75 6A2.25 2.25 0 016 3.75h2.25A2.25 2.25 0 0110.5 6v2.25a2.25 2.25 0 01-2.25 2.25H6a2.25 2.25 0 01-2.25-2.25V6zM3.75 15.75A2.25 2.25 0 016 13.5h2.25a2.25 2.25 0 012.25 2.25V18a2.25 2.25 0 01-2.25 2.25H6A2.25 2.25 0 013.75 18v-2.25zM13.5 6a2.25 2.25 0 012.25-2.25H18A2.25 2.25 0 0120.25 6v2.25A2.25 2.25 0 0118 10.5h-2.25a2.25 2.25 0 01-2.25-2.25V6zM13.5 15.75a2.25 2.25 0 012.25-2.25H18a2.25 2.25 0 012.25 2.25V18A2.25 2.25 0 0118 20.25h-2.25A2.25 2.25 0 0113.5 18v-2.25z" />
      </svg>
      Acme
    </a>

    <!-- 主导航链接 -->
    <nav class="hidden items-center gap-1 sm:flex" aria-label="Main navigation">
      <!-- Active 态 -->
      <a href="#"
        class="rounded-lg px-3 py-1.5 text-sm font-medium text-indigo-600
          transition-colors duration-150
          hover:bg-indigo-50
          focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600
          dark:text-indigo-400 dark:hover:bg-indigo-950
          dark:focus-visible:outline-indigo-400
          motion-reduce:transition-none"
        aria-current="page">
        Dashboard
      </a>

      <!-- Default 态 -->
      <a href="#"
        class="rounded-lg px-3 py-1.5 text-sm font-medium text-gray-600
          transition-colors duration-150
          hover:bg-gray-50 hover:text-gray-900
          focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900
          dark:text-gray-400 dark:hover:bg-gray-800 dark:hover:text-gray-100
          dark:focus-visible:outline-white
          motion-reduce:transition-none">
        Projects
      </a>

      <a href="#"
        class="rounded-lg px-3 py-1.5 text-sm font-medium text-gray-600
          transition-colors duration-150
          hover:bg-gray-50 hover:text-gray-900
          focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900
          dark:text-gray-400 dark:hover:bg-gray-800 dark:hover:text-gray-100
          dark:focus-visible:outline-white
          motion-reduce:transition-none">
        Docs
      </a>

      <a href="#"
        class="rounded-lg px-3 py-1.5 text-sm font-medium text-gray-600
          transition-colors duration-150
          hover:bg-gray-50 hover:text-gray-900
          focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900
          dark:text-gray-400 dark:hover:bg-gray-800 dark:hover:text-gray-100
          dark:focus-visible:outline-white
          motion-reduce:transition-none">
        Settings
      </a>
    </nav>

    <!-- 右侧操作区 -->
    <div class="flex flex-1 items-center justify-end gap-2 sm:gap-3">

      <!-- 搜索按钮（Ghost） -->
      <button type="button"
        class="rounded-lg p-2 text-gray-400 transition-colors duration-150
          hover:bg-gray-100 hover:text-gray-600
          focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900
          dark:text-gray-500 dark:hover:bg-gray-800 dark:hover:text-gray-300
          dark:focus-visible:outline-white
          motion-reduce:transition-none"
        aria-label="Search">
        <svg class="size-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
          aria-hidden="true">
          <path stroke-linecap="round" stroke-linejoin="round"
            d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z" />
        </svg>
      </button>

      <!-- 通知按钮（Ghost + Badge） -->
      <button type="button"
        class="relative rounded-lg p-2 text-gray-400 transition-colors duration-150
          hover:bg-gray-100 hover:text-gray-600
          focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900
          dark:text-gray-500 dark:hover:bg-gray-800 dark:hover:text-gray-300
          dark:focus-visible:outline-white
          motion-reduce:transition-none"
        aria-label="Notifications">
        <svg class="size-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
          aria-hidden="true">
          <path stroke-linecap="round" stroke-linejoin="round"
            d="M14.857 17.082a23.848 23.848 0 005.454-1.31A8.967 8.967 0 0118 9.75V9A6 6 0 006 9v.75a8.967 8.967 0 01-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 01-5.714 0m5.714 0a3 3 0 11-5.714 0" />
        </svg>
        <!-- 通知红点 -->
        <span class="absolute right-1.5 top-1.5 size-2 rounded-full bg-red-500"
          aria-hidden="true"></span>
      </button>

      <!-- 暗色模式切换（Ghost） -->
      <button type="button"
        onclick="document.documentElement.classList.toggle('dark')"
        class="rounded-lg p-2 text-gray-400 transition-colors duration-150
          hover:bg-gray-100 hover:text-gray-600
          dark:text-gray-500 dark:hover:bg-gray-800 dark:hover:text-gray-300
          motion-reduce:transition-none"
        aria-label="Toggle dark mode">
        <svg class="size-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
          aria-hidden="true">
          <path stroke-linecap="round" stroke-linejoin="round"
            d="M21.752 15.002A9.718 9.718 0 0118 15.75c-5.385 0-9.75-4.365-9.75-9.75 0-1.33.266-2.597.748-3.752A9.753 9.753 0 003 11.25C3 16.635 7.365 21 12.75 21a9.753 9.753 0 009.002-5.998z" />
        </svg>
      </button>

      <!-- 用户头像 + Dropdown 触发 -->
      <button type="button"
        class="rounded-full transition-opacity duration-150
          hover:opacity-80
          focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900
          dark:focus-visible:outline-white
          motion-reduce:transition-none"
        aria-label="User menu">
        <img class="size-8 rounded-full object-cover"
          src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=64&h=64&fit=crop&crop=face"
          alt="Alex Chen" />
      </button>

    </div>

    <!-- 移动端 Hamburger -->
    <button type="button"
      class="rounded-lg p-2 text-gray-400 transition-colors duration-150
        hover:bg-gray-100 hover:text-gray-600
        dark:text-gray-500 dark:hover:bg-gray-800 dark:hover:text-gray-300
        sm:hidden
        motion-reduce:transition-none"
      aria-label="Open menu"
      aria-expanded="false">
      <svg class="size-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
        <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
      </svg>
    </button>
  </div>
</header>
```

**设计要点：**
- `<header>` + `<nav>` — 语义 HTML
- 主导航在 < 640px 时隐藏（`hidden sm:flex`）——Hamburger 取而代之
- Active 态仅使用文字色（`text-indigo-600`），不加背景——顶部栏空间有限，文字色变换已足够
- 搜索按钮使用 Ghost 图标按钮——点击后展开搜索框或跳转搜索页
- 通知红点使用 `absolute` 定位——不占布局空间
- 移动端 Hamburger 在 `sm:hidden` ——平板及以上显示完整导航

---

### 2. Companion Navbar（配合 Sidebar 的顶部栏）

当页面有 Sidebar 时，Navbar 简化为操作栏——仅包含搜索、通知、用户菜单等辅助功能。无主导航链接（已在 Sidebar 中）。

```html
<!-- Companion Navbar（配合 Sidebar） -->
<header class="sticky top-0 z-30 border-b border-gray-200 bg-white
  dark:border-gray-800 dark:bg-gray-900">
  <div class="flex h-14 items-center gap-3 px-4 sm:gap-4 sm:px-6">

    <!-- 移动端 Sidebar Toggle（仅在 < 1024px 可见） -->
    <button type="button"
      class="rounded-lg p-2 text-gray-400 transition-colors duration-150
        hover:bg-gray-100 hover:text-gray-600
        dark:text-gray-500 dark:hover:bg-gray-800 dark:hover:text-gray-300
        lg:hidden
        motion-reduce:transition-none"
      aria-label="Toggle sidebar">
      <svg class="size-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
        aria-hidden="true">
        <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
      </svg>
    </button>

    <!-- 面包屑 / 页面标题 -->
    <h1 class="text-sm font-medium text-gray-900 dark:text-gray-100 truncate">
      Dashboard
    </h1>

    <div class="flex-1"></div>

    <!-- 搜索框（展开态） -->
    <div class="relative hidden sm:block">
      <svg class="pointer-events-none absolute left-3 top-1/2 size-4 -translate-y-1/2 text-gray-400
        dark:text-gray-500"
        fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
        <path stroke-linecap="round" stroke-linejoin="round"
          d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z" />
      </svg>
      <input
        type="search"
        placeholder="Search..."
        class="w-64 rounded-lg bg-gray-50 py-1.5 pl-9 pr-3 text-sm/6 text-gray-900
          inset-ring inset-ring-gray-950/8
          transition-colors duration-150
          placeholder:text-gray-400
          focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none
          dark:bg-gray-800 dark:text-gray-100 dark:placeholder:text-gray-500
          dark:inset-ring-white/10
          dark:focus:inset-ring-white/20 dark:focus:ring-white/10
          motion-reduce:transition-none"
      />
    </div>

    <!-- 通知 -->
    <button type="button"
      class="relative rounded-lg p-2 text-gray-400 transition-colors duration-150
        hover:bg-gray-100 hover:text-gray-600
        dark:text-gray-500 dark:hover:bg-gray-800 dark:hover:text-gray-300
        motion-reduce:transition-none"
      aria-label="Notifications">
      <svg class="size-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
        aria-hidden="true">
        <path stroke-linecap="round" stroke-linejoin="round"
          d="M14.857 17.082a23.848 23.848 0 005.454-1.31A8.967 8.967 0 0118 9.75V9A6 6 0 006 9v.75a8.967 8.967 0 01-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 01-5.714 0m5.714 0a3 3 0 11-5.714 0" />
      </svg>
      <span class="absolute right-1.5 top-1.5 size-2 rounded-full bg-red-500" aria-hidden="true"></span>
    </button>

    <!-- 用户头像 -->
    <button type="button"
      class="rounded-full transition-opacity duration-150
        hover:opacity-80
        focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900
        dark:focus-visible:outline-white
        motion-reduce:transition-none"
      aria-label="User menu">
      <img class="size-8 rounded-full object-cover"
        src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=64&h=64&fit=crop&crop=face"
        alt="Alex Chen" />
    </button>
  </div>
</header>
```

**设计要点：**
- 左侧：Sidebar Toggle（< 1024px 可见）+ 面包屑/页面标题
- 中间：自动撑开（`flex-1`）
- 右侧：搜索框 + 通知 + 用户头像
- 搜索框使用 `inset-ring` 方案——遵循 Input 组件规范
- `z-30`（低于 Sidebar 的 `z-30` 时两者配合——Sidebar 更高以覆盖移动端 overlay）

---

### 3. Simple Navbar（极简顶部栏）

适用于文档站、简单工具。仅 Logo + 少量链接 + CTA 按钮。

```html
<!-- Simple Navbar -->
<header class="sticky top-0 z-40 border-b border-gray-200 bg-white/80 backdrop-blur-md
  dark:border-gray-800 dark:bg-gray-900/80">
  <div class="mx-auto flex h-14 max-w-7xl items-center gap-6 px-4 sm:px-6">

    <!-- Logo -->
    <a href="#" class="flex shrink-0 items-center gap-2 text-lg font-bold text-gray-900
      dark:text-white">
      <svg class="size-6 text-indigo-600 dark:text-indigo-500" fill="none" viewBox="0 0 24 24"
        stroke="currentColor" stroke-width="2" aria-hidden="true">
        <path stroke-linecap="round" stroke-linejoin="round"
          d="M3.75 6A2.25 2.25 0 016 3.75h2.25A2.25 2.25 0 0110.5 6v2.25a2.25 2.25 0 01-2.25 2.25H6a2.25 2.25 0 01-2.25-2.25V6zM3.75 15.75A2.25 2.25 0 016 13.5h2.25a2.25 2.25 0 012.25 2.25V18a2.25 2.25 0 01-2.25 2.25H6A2.25 2.25 0 013.75 18v-2.25zM13.5 6a2.25 2.25 0 012.25-2.25H18A2.25 2.25 0 0120.25 6v2.25A2.25 2.25 0 0118 10.5h-2.25a2.25 2.25 0 01-2.25-2.25V6zM13.5 15.75a2.25 2.25 0 012.25-2.25H18a2.25 2.25 0 012.25 2.25V18A2.25 2.25 0 0118 20.25h-2.25A2.25 2.25 0 0113.5 18v-2.25z" />
      </svg>
      Acme
    </a>

    <nav class="hidden items-center gap-1 sm:flex" aria-label="Main navigation">
      <a href="#" class="rounded-lg px-3 py-1.5 text-sm font-medium text-gray-600
        transition-colors duration-150 hover:bg-gray-50 hover:text-gray-900
        dark:text-gray-400 dark:hover:bg-gray-800 dark:hover:text-gray-100
        motion-reduce:transition-none">Docs</a>
      <a href="#" class="rounded-lg px-3 py-1.5 text-sm font-medium text-gray-600
        transition-colors duration-150 hover:bg-gray-50 hover:text-gray-900
        dark:text-gray-400 dark:hover:bg-gray-800 dark:hover:text-gray-100
        motion-reduce:transition-none">Blog</a>
      <a href="#" class="rounded-lg px-3 py-1.5 text-sm font-medium text-gray-600
        transition-colors duration-150 hover:bg-gray-50 hover:text-gray-900
        dark:text-gray-400 dark:hover:bg-gray-800 dark:hover:text-gray-100
        motion-reduce:transition-none">Pricing</a>
    </nav>

    <div class="flex-1"></div>

    <!-- 登录（Ghost） -->
    <a href="#"
      class="rounded-lg px-3 py-1.5 text-sm font-medium text-gray-600
        transition-colors duration-150
        hover:bg-gray-50 hover:text-gray-900
        dark:text-gray-400 dark:hover:bg-gray-800 dark:hover:text-gray-100
        motion-reduce:transition-none">
      Sign in
    </a>

    <!-- CTA（Primary Solid） -->
    <a href="#"
      class="inline-flex items-center rounded-lg bg-indigo-600 px-4 py-2
        text-sm font-semibold text-white
        transition-colors duration-150
        hover:bg-indigo-700
        active:scale-[0.97]
        focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600
        dark:bg-indigo-500 dark:hover:bg-indigo-400 dark:focus-visible:outline-indigo-400
        motion-reduce:transition-none">
      Get started
    </a>

  </div>
</header>
```

**设计要点：**
- `bg-white/80 backdrop-blur-md` — 半透明毛玻璃效果（文档站/落地页风格）
- 极简链接列表 + 一个 CTA 按钮
- 适用于无需复杂导航的场景

---

## 元素总览

| 元素 | 字号 | 字重 | 颜色 (Light) | 颜色 (Dark) | 特殊样式 |
|------|------|------|-------------|------------|---------|
| Logo 文字 | `text-lg` (18px) | `font-bold` (700) | `text-gray-900` | `dark:text-white` | — |
| Logo 图标 | `size-6` (24px) | — | `text-indigo-600` | `dark:text-indigo-500` | `shrink-0` |
| 导航链接 (Default) | `text-sm` (14px) | `font-medium` (500) | `text-gray-600` | `dark:text-gray-400` | `rounded-lg px-3 py-1.5` |
| 导航链接 (Hover) | `text-sm` | `font-medium` | `text-gray-900` + `bg-gray-50` | `dark:text-gray-100` + `dark:bg-gray-800` | — |
| 导航链接 (Active) | `text-sm` | `font-medium` | `text-indigo-600` | `dark:text-indigo-400` | 无背景——仅文字色 |
| Ghost 操作按钮 | — | — | `text-gray-400` | `dark:text-gray-500` | `rounded-lg p-2` |
| 搜索框 | `text-sm` (14px) | — | `text-gray-900` | `dark:text-gray-100` | `inset-ring` + `w-64` |
| 搜索框 Placeholder | `text-sm` | — | `text-gray-400` | `dark:text-gray-500` | — |
| 用户头像 | — | — | — | — | `size-8 rounded-full` |
| 通知红点 | — | — | `bg-red-500` | `bg-red-500` | `size-2 rounded-full absolute` |
| 页面标题 (Companion) | `text-sm` | `font-medium` | `text-gray-900` | `dark:text-gray-100` | `truncate` |

---

## Design Tokens

| Token | Light | Dark | Tailwind | 说明 |
|-------|-------|------|----------|------|
| `navbar-bg` | `white` | `gray-900` | `bg-white dark:bg-gray-900` | 顶部栏背景 |
| `navbar-bg-glass` | `white/80` | `gray-900/80` | `bg-white/80 dark:bg-gray-900/80` | 毛玻璃背景（Simple 变体） |
| `navbar-height` | `56px` | `56px` | `h-14` | 固定高度 |
| `navbar-border` | `gray-200` | `gray-800` | `border-gray-200 dark:border-gray-800` | 底部边框 |
| `navbar-link-default` | `text-gray-600` | `text-gray-400` | `text-gray-600 dark:text-gray-400` | 导航链接默认文字 |
| `navbar-link-hover-bg` | `gray-50` | `gray-800` | `bg-gray-50 dark:bg-gray-800` | 导航链接 Hover 背景 |
| `navbar-link-active-text` | `brand-text` (indigo-600) | `indigo-400` | `text-indigo-600 dark:text-indigo-400` | 导航链接 Active 文字 |
| `navbar-action-icon` | `text-gray-400` | `text-gray-500` | `text-gray-400 dark:text-gray-500` | Ghost 按钮图标色 |
| `navbar-search-bg` | `gray-50` | `gray-800` | `bg-gray-50 dark:bg-gray-800` | 搜索框背景 |
| `navbar-search-ring` | `gray-950/8` | `white/10` | `inset-ring-gray-950/8 dark:inset-ring-white/10` | 搜索框描边 |

---

## 状态矩阵

| 状态 | 背景 | 文字色 | 触发条件 |
|------|------|--------|---------|
| **Default（链接）** | `transparent` | `gray-600` / `gray-400` | 可导航但非当前页 |
| **Hover（链接）** | `gray-50` / `gray-800` | `gray-900` / `gray-100` | 鼠标悬停 |
| **Active（链接）** | `transparent` | `indigo-600` / `indigo-400` | 当前所在页面 |
| **Active + Hover** | `indigo-50` / `indigo-950` | `indigo-600` / `indigo-400` | 鼠标悬停当前页 |
| **Focus-visible** | 跟随状态 | — | Tab 键聚焦（`outline-2 outline-offset-2`） |
| **Default（Ghost 按钮）** | `transparent` | `gray-400` / `gray-500` | 搜索/通知/暗色模式切换 |
| **Hover（Ghost 按钮）** | `gray-100` / `gray-800` | `gray-600` / `gray-300` | 鼠标悬停 |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| 语义 HTML | `<header>` + `<nav>` — 正确的文档结构 |
| 导航标签 | `aria-label="Main navigation"` |
| 当前页标识 | `aria-current="page"` — 屏幕阅读器可识别 |
| 图标按钮标签 | `aria-label="Search"` / `"Notifications"` / `"Toggle dark mode"` / `"User menu"` |
| 通知红点 | `aria-hidden="true"` — 装饰性，通知数量应有独立 `.sr-only` 文本 |
| Hamburger 状态 | `aria-expanded="false"` / `"true"` + `aria-label="Open menu"` |
| Focus ring | 所有交互元素保留 `focus-visible:outline-2 outline-offset-2` |
| 对比度 (Nav link) | `gray-600` : `white` = 8.3:1 (WCAG AAA) ✅ |
| 对比度 (Active) | `indigo-600` : `white` = 6.54:1 (WCAG AA) ✅ |
| 动画尊重 | 所有过渡添加 `motion-reduce:transition-none` |

---

## 响应式行为

| 断点 | 行为 | 实现 |
|------|------|------|
| Desktop (≥ 640px) | 完整导航链接 + 操作区 | `hidden sm:flex` (nav) |
| Mobile (< 640px) | 导航链接隐藏，Hamburger 显示 | `sm:hidden` (hamburger) |
| Companion 模式 (< 1024px) | Sidebar Toggle 显示 | `lg:hidden` (sidebar toggle) |
| Companion 模式 (≥ 1024px) | Sidebar Toggle 隐藏（Sidebar 始终可见） | — |

### 移动端菜单展开

```html
<!-- 移动端下拉菜单（默认隐藏，Hamburger 点击后展开） -->
<div
  id="mobile-menu"
  class="hidden border-b border-gray-200 bg-white px-4 pb-3 pt-2
    dark:border-gray-800 dark:bg-gray-900
    sm:hidden"
  role="navigation"
  aria-label="Mobile navigation"
>
  <a href="#"
    class="block rounded-lg px-3 py-2 text-sm font-medium text-indigo-600
      bg-indigo-50 dark:text-indigo-400 dark:bg-indigo-950"
    aria-current="page">
    Dashboard
  </a>
  <a href="#"
    class="block rounded-lg px-3 py-2 text-sm font-medium text-gray-600
      hover:bg-gray-50 dark:text-gray-400 dark:hover:bg-gray-800">
    Projects
  </a>
  <a href="#"
    class="block rounded-lg px-3 py-2 text-sm font-medium text-gray-600
      hover:bg-gray-50 dark:text-gray-400 dark:hover:bg-gray-800">
    Docs
  </a>
  <a href="#"
    class="block rounded-lg px-3 py-2 text-sm font-medium text-gray-600
      hover:bg-gray-50 dark:text-gray-400 dark:hover:bg-gray-800">
    Settings
  </a>
</div>
```

---

## 复用指南

### 何时使用 Navbar

| 场景 | 变体 | 说明 |
|------|------|------|
| 无 Sidebar 的 App | Standalone | Logo + 主导航 + 操作区——完整的顶部导航 |
| 有 Sidebar 的 App | Companion | 仅操作区——导航已在 Sidebar 中 |
| 文档站 / 简单工具 | Simple | 极简链接 + CTA——半透明毛玻璃背景 |
| 落地页 | Simple | 品牌 Logo + 少量链接 + 1 个 CTA |

### 何时不用 Navbar

| 场景 | 替代方案 | 原因 |
|------|---------|------|
| 全屏沉浸式应用（如编辑器） | 浮动工具栏 | 固定顶部栏浪费垂直空间 |
| 移动端优先的消费类 App | Bottom Tab Bar | 底部导航更符合拇指区习惯 |
| 仅 Sidebar 已足够 | 无 Navbar | 导航项 ≤ 10 个时，Sidebar 单独使用即可 |

### 与 Sidebar 布局配合

```
✅ Standalone Navbar:
<Navbar standalone />
<main class="mx-auto max-w-7xl ...">

✅ Sidebar + Companion Navbar:
<Sidebar />
<Navbar companion />
<main class="lg:pl-60 pt-14">   ← 内容区避开 Sidebar 宽度 + Navbar 高度

✅ Simple Navbar (落地页):
<Navbar simple />
<section><!-- Hero --></section>

❌ Sidebar + Standalone Navbar  → 导航链接重复（Sidebar 和 Navbar 都有主导航）
```

---

> 参考: [设计共同规律](../../principles/design.md) · [Colors](../design-tokens/colors.md) · [Elevation](../design-tokens/elevation.md) · [Button](./button.md) · [Sidebar](./sidebar.md) · [Dashboard Template](../templates/dashboard.md)
