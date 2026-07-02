# Sidebar

App 内页面的主导航组件。固定左侧，提供层级清晰的应用导航。遵循"倒 L 型"布局模式——侧边栏 + 内容区。

> **Design Tokens**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Elevation](../design-tokens/elevation.md)
>
> **关联组件**: [Navbar](./navbar.md)（顶部导航——Sidebar + Navbar 组合使用或二选一） · [Button](./button.md)（Ghost 按钮风格——侧边栏导航项的默认交互模式）
>
> **依赖**: 无外部插件依赖。纯 Tailwind CSS + 少量 JS 用于折叠/展开。

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 宽度 | `w-60` (240px) | 设计原则七——App 内固定 240-260px；240px 是最小保证——容纳图标 + 中文标签 + Badge |
| 折叠宽度 | `w-16` (64px) | 仅图标模式——16px 内边距 × 2 + 32px 图标区 |
| Elevation | `inset-ring` 右侧描边 | 与内容区通过一条 1px 线分隔，不占布局空间 |
| 背景 | `bg-white` (Light) / `dark:bg-gray-900` (Dark) | 与 Card Level 1 一致——白色表面浮于页面底色 |
| 导航项圆角 | `rounded-lg` (8px) | 统一交互元素圆角规范 |
| 导航项 Hover | `bg-gray-50` (Light) / `dark:bg-gray-800/50` (Dark) | 中性灰——不抢品牌色，与 Table Row hover 一致 |
| 导航项 Active | `brand-subtle` 背景 + `brand-text` 文字 | Colors 规范——Sidebar Active = `indigo-50` + `indigo-600` |
| 导航项字号 | `text-sm font-medium` | 与 Linear 一致——侧边栏信息密度高，sm 字号最合适 |
| 图标尺寸 | `size-5` (20px) | 与导航文字视觉平衡；与 Button 图标尺寸一致 |
| 过渡 | `transition-colors duration-150` | 全局统一——仅颜色过渡 |
| 移动端 | 默认隐藏，hamburger 触发展开 | Overlay 模式——不挤占内容区 |
| 分区标题 | `text-xs font-medium text-gray-400 uppercase` | 低视觉权重——辅助信息，不与导航项竞争 |

---

## 变体

### 1. Base Sidebar（基础侧边栏）

标准 App 侧边栏。包含 Logo、导航分区、用户信息 Footer。导航项使用 Ghost 按钮风格——默认无背景，hover 显现底色。

```html
<!-- Base Sidebar -->
<aside
  id="sidebar"
  class="fixed inset-y-0 left-0 z-30 flex w-60 flex-col bg-white
    inset-ring inset-ring-gray-950/8
    dark:bg-gray-900 dark:inset-ring-white/10"
  aria-label="Main navigation"
>
  <!-- ========== Logo 区域 ========== -->
  <div class="flex h-14 items-center gap-2.5 px-4">
    <svg class="size-6 shrink-0 text-indigo-600 dark:text-indigo-500" fill="none" viewBox="0 0 24 24"
      stroke="currentColor" stroke-width="2" aria-hidden="true">
      <path stroke-linecap="round" stroke-linejoin="round"
        d="M3.75 6A2.25 2.25 0 016 3.75h2.25A2.25 2.25 0 0110.5 6v2.25a2.25 2.25 0 01-2.25 2.25H6a2.25 2.25 0 01-2.25-2.25V6zM3.75 15.75A2.25 2.25 0 016 13.5h2.25a2.25 2.25 0 012.25 2.25V18a2.25 2.25 0 01-2.25 2.25H6A2.25 2.25 0 013.75 18v-2.25zM13.5 6a2.25 2.25 0 012.25-2.25H18A2.25 2.25 0 0120.25 6v2.25A2.25 2.25 0 0118 10.5h-2.25a2.25 2.25 0 01-2.25-2.25V6zM13.5 15.75a2.25 2.25 0 012.25-2.25H18a2.25 2.25 0 012.25 2.25V18A2.25 2.25 0 0118 20.25h-2.25A2.25 2.25 0 0113.5 18v-2.25z" />
    </svg>
    <span class="text-lg font-bold text-gray-900 dark:text-white">Acme</span>
  </div>

  <!-- ========== 导航项 ========== -->
  <nav class="flex-1 overflow-y-auto px-3 py-2" aria-label="Primary navigation">
    <ul class="flex flex-col gap-0.5" role="list">

      <!-- Active 态 -->
      <li>
        <a href="#"
          class="flex items-center gap-3 rounded-lg px-3 py-2
            text-sm font-medium text-indigo-600
            bg-indigo-50
            transition-colors duration-150
            hover:bg-indigo-50 hover:text-indigo-700
            focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600
            dark:text-indigo-400 dark:bg-indigo-950
            dark:hover:bg-indigo-950 dark:hover:text-indigo-300
            dark:focus-visible:outline-indigo-400
            motion-reduce:transition-none"
          aria-current="page">
          <!-- Heroicon: home -->
          <svg class="size-5 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
            aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round"
              d="M2.25 12l8.954-8.955a1.126 1.126 0 011.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25" />
          </svg>
          Dashboard
        </a>
      </li>

      <!-- Default 态 -->
      <li>
        <a href="#"
          class="flex items-center gap-3 rounded-lg px-3 py-2
            text-sm font-medium text-gray-700
            transition-colors duration-150
            hover:bg-gray-50 hover:text-gray-900
            focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900
            dark:text-gray-300 dark:hover:bg-gray-800/50 dark:hover:text-gray-100
            dark:focus-visible:outline-white
            motion-reduce:transition-none">
          <!-- Heroicon: chart-bar -->
          <svg class="size-5 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
            aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round"
              d="M3 13.125C3 12.504 3.504 12 4.125 12h2.25c.621 0 1.125.504 1.125 1.125v6.75C7.5 20.496 6.996 21 6.375 21h-2.25A1.125 1.125 0 013 19.875v-6.75zM9.75 8.625c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125v11.25c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 01-1.125-1.125V8.625zM16.5 4.125c0-.621.504-1.125 1.125-1.125h2.25C20.496 3 21 3.504 21 4.125v15.75c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 01-1.125-1.125V4.125z" />
          </svg>
          Analytics
        </a>
      </li>

      <li>
        <a href="#"
          class="flex items-center gap-3 rounded-lg px-3 py-2
            text-sm font-medium text-gray-700
            transition-colors duration-150
            hover:bg-gray-50 hover:text-gray-900
            focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900
            dark:text-gray-300 dark:hover:bg-gray-800/50 dark:hover:text-gray-100
            dark:focus-visible:outline-white
            motion-reduce:transition-none">
          <!-- Heroicon: inbox -->
          <svg class="size-5 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
            aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round"
              d="M2.25 13.5h3.86a2.25 2.25 0 012.012 1.244l.256.512a2.25 2.25 0 002.013 1.244h3.218a2.25 2.25 0 002.013-1.244l.256-.512a2.25 2.25 0 012.013-1.244h3.859M12 3v8.25m0 0l-3-3m3 3l3-3" />
          </svg>
          Inbox

          <!-- Badge: 未读计数 -->
          <span class="ml-auto inline-flex items-center rounded-full bg-gray-100 px-2 py-0.5
            text-xs font-medium text-gray-600
            dark:bg-gray-800 dark:text-gray-400">
            3
          </span>
        </a>
      </li>

    </ul>

    <!-- ========== 分区标题 ========== -->
    <h3 class="mt-5 mb-1 px-3 text-xs font-medium uppercase tracking-wider text-gray-400
      dark:text-gray-500">
      Work
    </h3>

    <ul class="flex flex-col gap-0.5" role="list">
      <li>
        <a href="#"
          class="flex items-center gap-3 rounded-lg px-3 py-2
            text-sm font-medium text-gray-700
            transition-colors duration-150
            hover:bg-gray-50 hover:text-gray-900
            focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900
            dark:text-gray-300 dark:hover:bg-gray-800/50 dark:hover:text-gray-100
            dark:focus-visible:outline-white
            motion-reduce:transition-none">
          <!-- Heroicon: clipboard-document-list -->
          <svg class="size-5 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
            aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round"
              d="M9 12h3.75M9 15h3.75M9 18h3.75m3 .75H18a2.25 2.25 0 002.25-2.25V6.108c0-1.135-.845-2.098-1.976-2.192a48.424 48.424 0 00-1.123-.08m-5.801 0c-.065.21-.1.433-.1.664 0 .414.336.75.75.75h4.5a.75.75 0 00.75-.75 2.25 2.25 0 00-.1-.664m-5.8 0A2.251 2.251 0 0113.5 2.25H15a2.25 2.25 0 012.15 1.586m-5.8 0c-.376.023-.75.05-1.124.08C9.095 4.01 8.25 4.973 8.25 6.108V8.25m0 0H4.875c-.621 0-1.125.504-1.125 1.125v11.25c0 .621.504 1.125 1.125 1.125h9.75c.621 0 1.125-.504 1.125-1.125V9.375c0-.621-.504-1.125-1.125-1.125H8.25zM6.75 12h.008v.008H6.75V12zm0 3h.008v.008H6.75V15zm0 3h.008v.008H6.75V18z" />
          </svg>
          Tasks
        </a>
      </li>

      <li>
        <a href="#"
          class="flex items-center gap-3 rounded-lg px-3 py-2
            text-sm font-medium text-gray-700
            transition-colors duration-150
            hover:bg-gray-50 hover:text-gray-900
            focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900
            dark:text-gray-300 dark:hover:bg-gray-800/50 dark:hover:text-gray-100
            dark:focus-visible:outline-white
            motion-reduce:transition-none">
          <!-- Heroicon: users -->
          <svg class="size-5 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
            aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round"
              d="M15 19.128a9.38 9.38 0 002.625.372 9.337 9.337 0 004.121-.952 4.125 4.125 0 00-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 018.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0111.964-3.07M12 6.375a3.375 3.375 0 11-6.75 0 3.375 3.375 0 016.75 0zm8.25 2.25a2.625 2.625 0 11-5.25 0 2.625 2.625 0 015.25 0z" />
          </svg>
          Team
        </a>
      </li>
    </ul>

    <!-- ========== 分区标题 2 ========== -->
    <h3 class="mt-5 mb-1 px-3 text-xs font-medium uppercase tracking-wider text-gray-400
      dark:text-gray-500">
      Settings
    </h3>

    <ul class="flex flex-col gap-0.5" role="list">
      <li>
        <a href="#"
          class="flex items-center gap-3 rounded-lg px-3 py-2
            text-sm font-medium text-gray-700
            transition-colors duration-150
            hover:bg-gray-50 hover:text-gray-900
            focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900
            dark:text-gray-300 dark:hover:bg-gray-800/50 dark:hover:text-gray-100
            dark:focus-visible:outline-white
            motion-reduce:transition-none">
          <!-- Heroicon: cog-6-tooth -->
          <svg class="size-5 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
            aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round"
              d="M9.594 3.94c.09-.542.56-.94 1.11-.94h2.593c.55 0 1.02.398 1.11.94l.213 1.281c.063.374.313.686.645.87.074.04.147.083.22.127.324.196.72.257 1.075.124l1.217-.456a1.125 1.125 0 011.37.49l1.296 2.247a1.125 1.125 0 01-.26 1.431l-1.003.827c-.293.24-.438.613-.431.992a6.759 6.759 0 010 .255c-.007.378.138.75.43.99l1.005.828c.424.35.534.954.26 1.43l-1.298 2.247a1.125 1.125 0 01-1.369.491l-1.217-.456c-.355-.133-.75-.072-1.076.124a6.57 6.57 0 01-.22.128c-.331.183-.581.495-.644.869l-.213 1.28c-.09.543-.56.941-1.11.941h-2.594c-.55 0-1.02-.398-1.11-.94l-.213-1.281c-.062-.374-.312-.686-.644-.87a6.52 6.52 0 01-.22-.127c-.325-.196-.72-.257-1.076-.124l-1.217.456a1.125 1.125 0 01-1.369-.49l-1.297-2.247a1.125 1.125 0 01.26-1.431l1.004-.827c.292-.24.437-.613.43-.992a6.932 6.932 0 010-.255c.007-.378-.138-.75-.43-.99l-1.004-.828a1.125 1.125 0 01-.26-1.43l1.297-2.247a1.125 1.125 0 011.37-.491l1.216.456c.356.133.751.072 1.076-.124.072-.044.146-.087.22-.128.332-.183.582-.495.644-.869l.214-1.281z" />
            <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
          </svg>
          General
        </a>
      </li>

      <li>
        <a href="#"
          class="flex items-center gap-3 rounded-lg px-3 py-2
            text-sm font-medium text-gray-700
            transition-colors duration-150
            hover:bg-gray-50 hover:text-gray-900
            focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900
            dark:text-gray-300 dark:hover:bg-gray-800/50 dark:hover:text-gray-100
            dark:focus-visible:outline-white
            motion-reduce:transition-none">
          <!-- Heroicon: credit-card -->
          <svg class="size-5 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
            aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round"
              d="M2.25 8.25h19.5M2.25 9h19.5m-16.5 5.25h6m-6 2.25h3m-3.75 3h15a2.25 2.25 0 002.25-2.25V6.75A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25v10.5A2.25 2.25 0 004.5 19.5z" />
          </svg>
          Billing
        </a>
      </li>
    </ul>
  </nav>

  <!-- ========== 底部用户信息 ========== -->
  <div class="border-t border-gray-950/5 p-3 dark:border-white/5">
    <button type="button"
      class="flex w-full items-center gap-3 rounded-lg p-2 text-left
        transition-colors duration-150
        hover:bg-gray-50
        focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900
        dark:hover:bg-gray-800/50 dark:focus-visible:outline-white
        motion-reduce:transition-none">
      <img class="size-8 rounded-full object-cover"
        src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=64&h=64&fit=crop&crop=face"
        alt="User avatar" />
      <div class="flex-1 min-w-0 text-left">
        <p class="text-sm font-medium text-gray-900 dark:text-gray-100 truncate">Alex Chen</p>
        <p class="text-xs text-gray-500 dark:text-gray-400 truncate">alex@acme.com</p>
      </div>
      <!-- Heroicon: ellipsis-vertical -->
      <svg class="size-5 shrink-0 text-gray-400 dark:text-gray-500" fill="none" viewBox="0 0 24 24"
        stroke="currentColor" stroke-width="2" aria-hidden="true">
        <path stroke-linecap="round" stroke-linejoin="round"
          d="M12 6.75a.75.75 0 110-1.5.75.75 0 010 1.5zM12 12.75a.75.75 0 110-1.5.75.75 0 010 1.5zM12 18.75a.75.75 0 110-1.5.75.75 0 010 1.5z" />
      </svg>
    </button>
  </div>
</aside>
```

**设计要点：**
- 使用 `<aside>` + `aria-label="Main navigation"` — 语义 HTML
- 当前页使用 `aria-current="page"` — 屏幕阅读器友好
- 导航项 `gap-0.5` — 项间距极小，集合同类元素
- 分区标题 `mt-5` — 段落间距，视觉分组
- 底部用户信息 `border-t` 分隔——固定在侧边栏底部
- Badge 使用 `ml-auto` 靠右——不挤压导航文字

---

### 2. Collapsed Sidebar（折叠侧边栏）

仅显示图标。鼠标 hover 时展开完整侧边栏（Tooltip 替代方案）。适用于需要最大化内容区的场景。

```html
<!-- Collapsed Sidebar -->
<aside
  id="sidebar-collapsed"
  class="fixed inset-y-0 left-0 z-30 flex w-16 flex-col items-center bg-white
    inset-ring inset-ring-gray-950/8
    dark:bg-gray-900 dark:inset-ring-white/10"
  aria-label="Main navigation"
>
  <!-- Logo (icon only) -->
  <div class="flex h-14 items-center justify-center">
    <svg class="size-6 shrink-0 text-indigo-600 dark:text-indigo-500" fill="none" viewBox="0 0 24 24"
      stroke="currentColor" stroke-width="2" aria-hidden="true">
      <path stroke-linecap="round" stroke-linejoin="round"
        d="M3.75 6A2.25 2.25 0 016 3.75h2.25A2.25 2.25 0 0110.5 6v2.25a2.25 2.25 0 01-2.25 2.25H6a2.25 2.25 0 01-2.25-2.25V6zM3.75 15.75A2.25 2.25 0 016 13.5h2.25a2.25 2.25 0 012.25 2.25V18a2.25 2.25 0 01-2.25 2.25H6A2.25 2.25 0 013.75 18v-2.25zM13.5 6a2.25 2.25 0 012.25-2.25H18A2.25 2.25 0 0120.25 6v2.25A2.25 2.25 0 0118 10.5h-2.25a2.25 2.25 0 01-2.25-2.25V6zM13.5 15.75a2.25 2.25 0 012.25-2.25H18a2.25 2.25 0 012.25 2.25V18A2.25 2.25 0 0118 20.25h-2.25A2.25 2.25 0 0113.5 18v-2.25z" />
    </svg>
  </div>

  <!-- Nav items (icon only) -->
  <nav class="flex-1 overflow-y-auto px-2 py-2" aria-label="Primary navigation">
    <ul class="flex flex-col items-center gap-0.5" role="list">

      <!-- Active -->
      <li class="w-full">
        <a href="#"
          class="flex items-center justify-center rounded-lg p-2.5
            text-indigo-600 bg-indigo-50
            transition-colors duration-150
            hover:bg-indigo-50 hover:text-indigo-700
            focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600
            dark:text-indigo-400 dark:bg-indigo-950
            dark:hover:text-indigo-300 dark:focus-visible:outline-indigo-400
            motion-reduce:transition-none"
          aria-current="page"
          title="Dashboard">
          <svg class="size-5 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
            aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round"
              d="M2.25 12l8.954-8.955a1.126 1.126 0 011.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25" />
          </svg>
        </a>
      </li>

      <!-- Default -->
      <li class="w-full">
        <a href="#"
          class="flex items-center justify-center rounded-lg p-2.5
            text-gray-400
            transition-colors duration-150
            hover:bg-gray-50 hover:text-gray-700
            focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900
            dark:text-gray-500 dark:hover:bg-gray-800/50 dark:hover:text-gray-300
            dark:focus-visible:outline-white
            motion-reduce:transition-none"
          title="Analytics">
          <svg class="size-5 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
            aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round"
              d="M3 13.125C3 12.504 3.504 12 4.125 12h2.25c.621 0 1.125.504 1.125 1.125v6.75C7.5 20.496 6.996 21 6.375 21h-2.25A1.125 1.125 0 013 19.875v-6.75zM9.75 8.625c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125v11.25c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 01-1.125-1.125V8.625zM16.5 4.125c0-.621.504-1.125 1.125-1.125h2.25C20.496 3 21 3.504 21 4.125v15.75c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 01-1.125-1.125V4.125z" />
          </svg>
        </a>
      </li>

    </ul>
  </nav>

  <!-- User (avatar only) -->
  <div class="w-full border-t border-gray-950/5 p-2 dark:border-white/5">
    <button type="button"
      class="mx-auto flex items-center justify-center rounded-lg p-1.5
        transition-colors duration-150 hover:bg-gray-50
        focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900
        dark:hover:bg-gray-800 dark:focus-visible:outline-white
        motion-reduce:transition-none"
      title="Alex Chen">
      <img class="size-8 rounded-full object-cover"
        src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=64&h=64&fit=crop&crop=face"
        alt="Alex Chen" />
    </button>
  </div>
</aside>
```

**设计要点：**
- `w-16` (64px) — 图标 20px + 内边距 24px × 2 = 68px，64px 紧凑但不拥挤
- 所有可交互元素添加 `title` 属性 — 鼠标 hover 时浏览器原生 tooltip
- 默认态图标 `text-gray-400` — 比展开态更淡，因为缺少文字标签辅助识别
- Active 态保留完整品牌色 — 唯一不需要文字就能识别当前位置的信号

---

## 元素总览

| 元素 | 字号 | 字重 | 颜色 (Light) | 颜色 (Dark) | 特殊样式 |
|------|------|------|-------------|------------|---------|
| Logo 文字 | `text-lg` (18px) | `font-bold` (700) | `text-gray-900` | `dark:text-white` | — |
| 导航项 (Default) | `text-sm` (14px) | `font-medium` (500) | `text-gray-700` | `dark:text-gray-300` | `rounded-lg` |
| 导航项 (Hover) | `text-sm` | `font-medium` | `text-gray-900` + `bg-gray-50` | `dark:text-gray-100` + `dark:bg-gray-800/50` | — |
| 导航项 (Active) | `text-sm` | `font-medium` | `text-indigo-600` + `bg-indigo-50` | `dark:text-indigo-400` + `dark:bg-indigo-950` | `rounded-lg` |
| 导航图标 | `size-5` (20px) | — | 跟随父元素文字色 | 跟随父元素 | `shrink-0` |
| 分区标题 | `text-xs` (12px) | `font-medium` (500) | `text-gray-400` | `dark:text-gray-500` | `uppercase tracking-wider` |
| 用户姓名 | `text-sm` | `font-medium` | `text-gray-900` | `dark:text-gray-100` | `truncate` |
| 用户邮箱 | `text-xs` (12px) | — | `text-gray-500` | `dark:text-gray-400` | `truncate` |
| Badge 计数 | `text-xs` | `font-medium` | `text-gray-600` + `bg-gray-100` | `dark:text-gray-400` + `dark:bg-gray-800` | `rounded-full` |
| 折叠图标 (Default) | `size-5` | — | `text-gray-400` | `dark:text-gray-500` | — |
| 折叠图标 (Active) | `size-5` | — | `text-indigo-600` + `bg-indigo-50` | `dark:text-indigo-400` + `dark:bg-indigo-950` | `rounded-lg` |

---

## Design Tokens

| Token | Light | Dark | Tailwind | 说明 |
|-------|-------|------|----------|------|
| `sidebar-bg` | `white` | `gray-900` | `bg-white dark:bg-gray-900` | 侧边栏背景 |
| `sidebar-width` | `240px` | `240px` | `w-60` | 展开宽度 |
| `sidebar-collapsed-width` | `64px` | `64px` | `w-16` | 折叠宽度 |
| `sidebar-ring` | `gray-950/8` | `white/10` | `inset-ring-gray-950/8 dark:inset-ring-white/10` | 右侧描边 |
| `sidebar-item-default` | `text-gray-700` | `text-gray-300` | `text-gray-700 dark:text-gray-300` | 导航项默认文字 |
| `sidebar-item-hover-bg` | `gray-50` | `gray-800/50` | `bg-gray-50 dark:bg-gray-800/50` | 导航项 Hover 背景 |
| `sidebar-item-active-bg` | `brand-subtle` (indigo-50) | `indigo-950` | `bg-indigo-50 dark:bg-indigo-950` | 导航项 Active 背景 |
| `sidebar-item-active-text` | `brand-text` (indigo-600) | `indigo-400` | `text-indigo-600 dark:text-indigo-400` | 导航项 Active 文字 |
| `sidebar-section-title` | `text-gray-400` | `text-gray-500` | `text-gray-400 dark:text-gray-500` | 分区标题 |
| `sidebar-divider` | `gray-950/5` | `white/5` | `border-gray-950/5 dark:border-white/5` | Footer 分隔线 |

---

## 状态矩阵

| 状态 | 背景 | 文字色 | 图标色 | 触发条件 |
|------|------|--------|--------|---------|
| **Default** | `transparent` | `gray-700` / `gray-300` | 跟随文字 | 可导航但非当前页 |
| **Hover** | `gray-50` / `gray-800/50` | `gray-900` / `gray-100` | 跟随文字 | 鼠标悬停 |
| **Active** | `indigo-50` / `indigo-950` | `indigo-600` / `indigo-400` | 跟随文字 | 当前所在页面 |
| **Active + Hover** | `indigo-50` / `indigo-950` | `indigo-700` / `indigo-300` | 跟随文字 | 鼠标悬停当前页 |
| **Focus-visible** | 保持当前背景 | 保持当前文字 | — | Tab 键聚焦（`outline-2 outline-offset-2`） |
| **Disabled** | `transparent` | `gray-400/50` / `gray-600/50` | 跟随文字 | 不可用的导航项 |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| 语义 HTML | `<aside>` + `<nav>` + `<ul>` / `<li>` + `<a>` — 正确的文档结构 |
| 当前页标识 | `aria-current="page"` — 屏幕阅读器可识别当前位置 |
| 导航标签 | `aria-label="Main navigation"` 和 `aria-label="Primary navigation"` |
| Focus ring | 所有交互元素保留 `focus-visible:outline-2 outline-offset-2` |
| 键盘导航 | Tab 在导航项之间移动，Enter 激活链接 |
| 对比度 (Active) | `indigo-600` : `indigo-50` = ~4.8:1 (WCAG AA) ✅ |
| 对比度 (Default) | `gray-700` : `white` = 10.4:1 (WCAG AAA) ✅ |
| 图标隐藏 | `aria-hidden="true"` — 图标为装饰性，不需要屏幕阅读器朗读 |
| 折叠态 Tooltip | `title` 属性 — 原生浏览器 tooltip，无需 JS |
| 动画尊重 | 所有过渡添加 `motion-reduce:transition-none` |

---

## 响应式行为

| 断点 | 行为 | 实现 |
|------|------|------|
| Desktop (≥ 1024px) | 固定左侧，始终可见 | `fixed inset-y-0 left-0`，内容区 `lg:pl-60` |
| Tablet (< 1024px) | 默认隐藏，Hamburger 触发展开 | Overlay 模式 + 半透明遮罩 |
| Mobile (< 640px) | 全宽展开 | 展开时 `w-full`，关闭时隐藏 |

### 移动端 Overlay 实现

```html
<!-- Hamburger 按钮 — 放在内容区顶部 -->
<button
  type="button"
  id="sidebar-toggle"
  class="rounded-lg p-2 text-gray-500 transition-colors duration-150
    hover:bg-gray-100 hover:text-gray-700
    dark:text-gray-400 dark:hover:bg-gray-800 dark:hover:text-gray-300
    lg:hidden
    motion-reduce:transition-none"
  aria-label="Open sidebar"
  aria-expanded="false"
>
  <svg class="size-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
    <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
  </svg>
</button>

<!-- 遮罩层 — 点击关闭 Sidebar -->
<div
  id="sidebar-overlay"
  class="fixed inset-0 z-20 bg-gray-950/50 opacity-0 pointer-events-none
    transition-opacity duration-200 lg:hidden"
  aria-hidden="true"
></div>
```

**JS 逻辑：**
1. 点击 Hamburger → Sidebar `translate-x-0`（从 `-translate-x-full` 滑入）+ Overlay `opacity-100`
2. 点击 Overlay → Sidebar `-translate-x-full` + Overlay `opacity-0`
3. ≥ 1024px → 移除所有 transform，Sidebar 始终可见，Hamburger 隐藏

---

## 复用指南

### 何时使用 Sidebar

| 场景 | 变体 | 说明 |
|------|------|------|
| SaaS App 后台导航 | Base | 分区标题 + 图标 + 文字标签 |
| 数据密集型工具（需最大化内容区） | Collapsed | 仅图标，hover 展开或使用 tooltip |
| 管理面板 | Base | 多分区模式（Main / Work / Settings） |
| 文档站 | Base (简化版) | 无用户 Footer，纯导航链接 |

### 何时不用 Sidebar

| 场景 | 替代方案 | 原因 |
|------|---------|------|
| 首页 / 落地页 | 无侧边栏 | 设计原则七——首页是叙事页面，单栏纵向流 |
| 简单工具（≤ 3 个页面） | Top Navbar | 侧边栏对少量页面过于重量级 |
| 内容为主（博客 / 文档） | 右侧目录 (TOC) | 侧边栏应在左侧——导航；目录应在右侧——辅助 |
| 移动端优先的 App | Bottom Tab Bar | 移动端底部标签栏比侧边栏更符合拇指区习惯 |

### 内容区布局配合

```
✅ 正确:
<Sidebar /> + <main class="lg:pl-60">   → 侧边栏固定，内容区自适应
<Sidebar collapsed /> + <main class="lg:pl-16"> → 折叠模式

❌ 错误:
<Sidebar /> + <main class="ml-60">      → 用 margin 而非 padding（侧边栏有 inset-ring 时会有间隙）
<Sidebar /> + 内部再嵌套 Sidebar       → 不要嵌套侧边栏
```

### 组合规则

```
✅ Sidebar + Navbar (Top)  → 侧边栏主导航 + 顶部次级操作（搜索、通知、用户菜单）
✅ Sidebar only            → 导航项 ≤ 10 个时，无需顶部栏
✅ Sidebar collapsed       → 高级用户 / 数据密集型工具
❌ Sidebar + 另一 Sidebar  → 不要双栏嵌套
```

---

> 参考: [设计共同规律](../../principles/design.md) · [Colors](../design-tokens/colors.md) · [Elevation](../design-tokens/elevation.md) · [Button](./button.md) · [Dashboard Template](../templates/dashboard.md)
