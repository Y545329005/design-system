# Settings Page

App 内设置页面模板。展示 Sidebar + Navbar 倒 L 型布局下，多个设置分区的完整页面。验证 Design System 所有核心组件在真实场景中的协作。

> **验证组件**: [Sidebar](../components/sidebar.md) · [Navbar](../components/navbar.md) · [Card](../components/card.md) · [Input](../components/input.md) · [Textarea](../components/textarea.md) · [Select](../components/select.md) · [Toggle](../components/toggle.md) · [Button](../components/button.md) · [Toast](../components/toast.md)
>
> **验证规范**: [Elevation](../design-tokens/elevation.md) · [Colors](../design-tokens/colors.md)

---

## 预览

```
┌──────────┬──────────────────────────────────────────────────┐
│ Sidebar  │  Navbar (Companion)           Search  🔔  👤    │
│          ├──────────────────────────────────────────────────┤
│ ● Dash.. │                                                  │
│   Analy.. │  Settings                                       │
│   Inbox 3 │                                                  │
│          │  ┌────────────────────────────────────────────┐  │
│ WORK     │  │  Profile                          Card     │  │
│   Tasks  │  │  ┌──────────────┐ ┌──────────────────────┐ │  │
│   Team   │  │  │ Full Name    │ │ Email                │ │  │
│          │  │  └──────────────┘ └──────────────────────┘ │  │
│ SETTINGS │  │  ┌──────────────────────────────────────┐   │  │
│ ● Gener. │  │  │ Bio                         Textarea │   │  │
│   Bill.. │  │  └──────────────────────────────────────┘   │  │
│          │  │  [Timezone Select]         [Save Changes]   │  │
│          │  └────────────────────────────────────────────┘  │
│ ──────── │                                                  │
│ Alex Ch. │  ┌────────────────────────────────────────────┐  │
│ alex@... │  │  Notifications                    Card     │  │
└──────────┘  │  [Toggle] Email  [Toggle] Push              │  │
              │  [Toggle] Weekly Digest                     │  │
              └────────────────────────────────────────────┘  │
              ┌────────────────────────────────────────────┐  │
              │  Danger Zone                       Card     │  │
              │  ⚠ Delete your account permanently          │  │
              │  [Delete Account]  Outline/Destructive      │  │
              └────────────────────────────────────────────┘  │
              └────────────────────────────────────────────────┘
```

---

## 完整页面代码

```html
<!DOCTYPE html>
<html lang="en" class="bg-gray-50 dark:bg-gray-950">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Settings — Acme</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    tailwind.config = {
      darkMode: 'class',
      theme: { extend: {} }
    }
  </script>
</head>
<body class="min-h-screen bg-gray-50 dark:bg-gray-950">

  <!-- ================================================================ -->
  <!-- Sidebar（Base 变体）                                               -->
  <!-- ================================================================ -->
  <aside
    id="sidebar"
    class="fixed inset-y-0 left-0 z-30 flex w-60 flex-col bg-white
      inset-ring inset-ring-gray-950/8
      transition-transform duration-200
      max-lg:-translate-x-full max-lg:shadow-lg
      dark:bg-gray-900 dark:inset-ring-white/10
      motion-reduce:transition-none"
    aria-label="Main navigation"
  >
    <!-- Logo -->
    <div class="flex h-14 items-center gap-2.5 px-4">
      <svg class="size-6 shrink-0 text-indigo-600 dark:text-indigo-500" fill="none" viewBox="0 0 24 24"
        stroke="currentColor" stroke-width="2" aria-hidden="true">
        <path stroke-linecap="round" stroke-linejoin="round"
          d="M3.75 6A2.25 2.25 0 016 3.75h2.25A2.25 2.25 0 0110.5 6v2.25a2.25 2.25 0 01-2.25 2.25H6a2.25 2.25 0 01-2.25-2.25V6zM3.75 15.75A2.25 2.25 0 016 13.5h2.25a2.25 2.25 0 012.25 2.25V18a2.25 2.25 0 01-2.25 2.25H6A2.25 2.25 0 013.75 18v-2.25zM13.5 6a2.25 2.25 0 012.25-2.25H18A2.25 2.25 0 0120.25 6v2.25A2.25 2.25 0 0118 10.5h-2.25a2.25 2.25 0 01-2.25-2.25V6zM13.5 15.75a2.25 2.25 0 012.25-2.25H18a2.25 2.25 0 012.25 2.25V18A2.25 2.25 0 0118 20.25h-2.25A2.25 2.25 0 0113.5 18v-2.25z" />
      </svg>
      <span class="text-lg font-bold text-gray-900 dark:text-white">Acme</span>
    </div>

    <!-- Nav items -->
    <nav class="flex-1 overflow-y-auto px-3 py-2" aria-label="Primary navigation">
      <ul class="flex flex-col gap-0.5" role="list">

        <!-- Dashboard（非 Active） -->
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
            <svg class="size-5 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
              aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round"
                d="M2.25 12l8.954-8.955a1.126 1.126 0 011.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25" />
            </svg>
            Dashboard
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
            <svg class="size-5 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
              aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round"
                d="M2.25 13.5h3.86a2.25 2.25 0 012.012 1.244l.256.512a2.25 2.25 0 002.013 1.244h3.218a2.25 2.25 0 002.013-1.244l.256-.512a2.25 2.25 0 012.013-1.244h3.859M12 3v8.25m0 0l-3-3m3 3l3-3" />
            </svg>
            Inbox
            <span class="ml-auto inline-flex items-center rounded-full bg-gray-100 px-2 py-0.5
              text-xs font-medium text-gray-600 dark:bg-gray-800 dark:text-gray-400">3</span>
          </a>
        </li>

      </ul>

      <!-- Section: Settings -->
      <h3 class="mt-5 mb-1 px-3 text-xs font-medium uppercase tracking-wider text-gray-400
        dark:text-gray-500">
        Settings
      </h3>

      <ul class="flex flex-col gap-0.5" role="list">
        <!-- General（Active） -->
        <li>
          <a href="#"
            class="flex items-center gap-3 rounded-lg px-3 py-2
              text-sm font-medium text-indigo-600 bg-indigo-50
              transition-colors duration-150
              hover:bg-indigo-50 hover:text-indigo-700
              focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600
              dark:text-indigo-400 dark:bg-indigo-950
              dark:hover:text-indigo-300 dark:focus-visible:outline-indigo-400
              motion-reduce:transition-none"
            aria-current="page">
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

    <!-- User Footer -->
    <div class="border-t border-gray-950/5 p-3 dark:border-white/5">
      <button type="button"
        class="flex w-full items-center gap-3 rounded-lg p-2 text-left
          transition-colors duration-150 hover:bg-gray-50
          dark:hover:bg-gray-800/50
          motion-reduce:transition-none">
        <img class="size-8 rounded-full object-cover"
          src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=64&h=64&fit=crop&crop=face"
          alt="User avatar" />
        <div class="flex-1 min-w-0 text-left">
          <p class="text-sm font-medium text-gray-900 dark:text-gray-100 truncate">Alex Chen</p>
          <p class="text-xs text-gray-500 dark:text-gray-400 truncate">alex@acme.com</p>
        </div>
        <svg class="size-5 shrink-0 text-gray-400 dark:text-gray-500" fill="none" viewBox="0 0 24 24"
          stroke="currentColor" stroke-width="2" aria-hidden="true">
          <path stroke-linecap="round" stroke-linejoin="round"
            d="M12 6.75a.75.75 0 110-1.5.75.75 0 010 1.5zM12 12.75a.75.75 0 110-1.5.75.75 0 010 1.5zM12 18.75a.75.75 0 110-1.5.75.75 0 010 1.5z" />
        </svg>
      </button>
    </div>
  </aside>

  <!-- ================================================================ -->
  <!-- Sidebar Overlay（移动端）                                          -->
  <!-- ================================================================ -->
  <div
    id="sidebar-overlay"
    class="fixed inset-0 z-20 bg-gray-950/50 opacity-0 pointer-events-none
      transition-opacity duration-200 lg:hidden
      motion-reduce:transition-none"
    aria-hidden="true"
  ></div>

  <!-- ================================================================ -->
  <!-- Navbar（Companion 变体 — 配合 Sidebar）                            -->
  <!-- ================================================================ -->
  <header class="sticky top-0 z-30 border-b border-gray-200 bg-white
    dark:border-gray-800 dark:bg-gray-900">
    <div class="flex h-14 items-center gap-3 px-4 sm:gap-4 sm:px-6 lg:pl-64">

      <!-- 移动端 Sidebar Toggle -->
      <button type="button" id="sidebar-toggle"
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

      <!-- 页面标题 -->
      <h1 class="text-sm font-medium text-gray-900 dark:text-gray-100 truncate">
        Settings
      </h1>

      <div class="flex-1"></div>

      <!-- 搜索框 -->
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

      <!-- 暗色模式 -->
      <button type="button" onclick="document.documentElement.classList.toggle('dark')"
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

      <!-- 用户头像 -->
      <button type="button"
        class="rounded-full transition-opacity duration-150 hover:opacity-80
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

  <!-- ================================================================ -->
  <!-- 主内容区                                                           -->
  <!-- ================================================================ -->
  <main class="py-6 lg:pl-60 lg:py-8">

    <div class="mx-auto max-w-3xl px-4 sm:px-6 lg:px-8">

      <!-- ============================================================ -->
      <!-- 页面标题                                                       -->
      <!-- ============================================================ -->
      <div class="mb-8">
        <h2 class="text-lg font-bold text-gray-900 dark:text-white">General Settings</h2>
        <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">
          Manage your profile, notifications, and account settings.
        </p>
      </div>

      <div class="flex flex-col gap-6">

        <!-- ========================================================== -->
        <!-- Card 1: Profile                                              -->
        <!-- ========================================================== -->
        <section class="rounded-xl bg-white
          inset-ring inset-ring-gray-950/8
          dark:bg-gray-900 dark:inset-ring-white/10">

          <div class="border-b border-gray-950/5 px-5 py-4 dark:border-white/5">
            <h3 class="text-sm font-semibold text-gray-900 dark:text-gray-100">Profile</h3>
            <p class="mt-0.5 text-xs text-gray-500 dark:text-gray-400">
              Your public display information.
            </p>
          </div>

          <div class="space-y-5 p-5">
            <!-- Full Name + Email（双列） -->
            <div class="grid gap-4 sm:grid-cols-2">
              <div class="flex flex-col gap-1.5">
                <label for="full-name" class="text-sm font-medium text-gray-900 dark:text-gray-100">
                  Full name
                </label>
                <input
                  type="text"
                  id="full-name"
                  value="Alex Chen"
                  class="w-full rounded-lg bg-white px-3 py-2 text-sm/6 text-gray-900
                    inset-ring inset-ring-gray-950/8
                    transition-colors duration-150
                    placeholder:text-gray-400
                    focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none
                    dark:bg-gray-900 dark:text-gray-100 dark:placeholder:text-gray-500
                    dark:inset-ring-white/10
                    dark:focus:inset-ring-white/20 dark:focus:ring-white/10
                    motion-reduce:transition-none"
                />
              </div>

              <div class="flex flex-col gap-1.5">
                <label for="email" class="text-sm font-medium text-gray-900 dark:text-gray-100">
                  Email
                </label>
                <input
                  type="email"
                  id="email"
                  value="alex@acme.com"
                  class="w-full rounded-lg bg-white px-3 py-2 text-sm/6 text-gray-900
                    inset-ring inset-ring-gray-950/8
                    transition-colors duration-150
                    placeholder:text-gray-400
                    focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none
                    dark:bg-gray-900 dark:text-gray-100 dark:placeholder:text-gray-500
                    dark:inset-ring-white/10
                    dark:focus:inset-ring-white/20 dark:focus:ring-white/10
                    motion-reduce:transition-none"
                />
              </div>
            </div>

            <!-- Bio（Textarea） -->
            <div class="flex flex-col gap-1.5">
              <label for="bio" class="text-sm font-medium text-gray-900 dark:text-gray-100">
                Bio
              </label>
              <textarea
                id="bio"
                rows="3"
                placeholder="Tell us about yourself..."
                class="w-full rounded-lg bg-white px-3 py-2 text-sm/6 text-gray-900
                  inset-ring inset-ring-gray-950/8
                  transition-colors duration-150
                  placeholder:text-gray-400
                  focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none
                  dark:bg-gray-900 dark:text-gray-100 dark:placeholder:text-gray-500
                  dark:inset-ring-white/10
                  dark:focus:inset-ring-white/20 dark:focus:ring-white/10
                  motion-reduce:transition-none">Product designer at Acme. Building tools for the modern web.</textarea>
            </div>

            <!-- Timezone（Select） -->
            <div class="flex flex-col gap-1.5">
              <label for="tz" class="text-sm font-medium text-gray-900 dark:text-gray-100">
                Timezone
              </label>
              <div class="relative">
                <select id="tz"
                  class="w-full appearance-none rounded-lg bg-white py-2 pl-3 pr-10 text-sm/6 text-gray-900
                    inset-ring inset-ring-gray-950/8
                    transition-colors duration-150
                    focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none
                    dark:bg-gray-900 dark:text-gray-100
                    dark:inset-ring-white/10
                    dark:focus:inset-ring-white/20 dark:focus:ring-white/10
                    motion-reduce:transition-none">
                  <option>UTC−8 (Pacific)</option>
                  <option>UTC−5 (Eastern)</option>
                  <option>UTC+0 (London)</option>
                  <option selected>UTC+8 (Shanghai)</option>
                  <option>UTC+9 (Tokyo)</option>
                </select>
                <svg class="pointer-events-none absolute right-3 top-1/2 size-4 -translate-y-1/2
                  text-gray-400 dark:text-gray-500"
                  fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
                </svg>
              </div>
            </div>
          </div>

          <!-- Card Footer: Save Button -->
          <div class="flex items-center justify-end gap-3 border-t border-gray-950/5 px-5 py-4
            dark:border-white/5">
            <button type="button"
              class="rounded-lg px-4 py-2 text-sm font-medium text-gray-600
                transition-colors duration-150
                hover:bg-gray-100 hover:text-gray-900
                dark:text-gray-400 dark:hover:bg-gray-800 dark:hover:text-gray-100
                motion-reduce:transition-none">
              Cancel
            </button>
            <button type="button"
              onclick="showToast({ type: 'success', title: 'Profile updated', message: 'Your profile has been saved successfully.' })"
              class="inline-flex items-center justify-center rounded-lg
                bg-indigo-600 px-4 py-2
                text-sm font-semibold text-white
                transition-colors duration-150
                hover:bg-indigo-700
                active:scale-[0.97]
                focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600
                dark:bg-indigo-500 dark:hover:bg-indigo-400 dark:focus-visible:outline-indigo-400
                motion-reduce:transition-none">
              Save changes
            </button>
          </div>
        </section>

        <!-- ========================================================== -->
        <!-- Card 2: Notifications                                       -->
        <!-- ========================================================== -->
        <section class="rounded-xl bg-white
          inset-ring inset-ring-gray-950/8
          dark:bg-gray-900 dark:inset-ring-white/10">

          <div class="border-b border-gray-950/5 px-5 py-4 dark:border-white/5">
            <h3 class="text-sm font-semibold text-gray-900 dark:text-gray-100">Notifications</h3>
            <p class="mt-0.5 text-xs text-gray-500 dark:text-gray-400">
              Choose what you want to be notified about.
            </p>
          </div>

          <div class="divide-y divide-gray-950/5 dark:divide-white/5">

            <!-- Toggle 1: Email -->
            <div class="flex items-center justify-between px-5 py-4">
              <div>
                <p class="text-sm font-medium text-gray-900 dark:text-gray-100">Email notifications</p>
                <p class="text-xs text-gray-500 dark:text-gray-400">Receive weekly digests and updates</p>
              </div>
              <label class="relative inline-flex cursor-pointer items-center">
                <input type="checkbox" class="peer sr-only" checked />
                <span class="block h-6 w-11 rounded-full bg-indigo-600 transition-colors duration-150
                  peer-focus-visible:outline-2 peer-focus-visible:outline-offset-2
                  peer-focus-visible:outline-indigo-600
                  dark:bg-indigo-500
                  motion-reduce:transition-none"
                  aria-hidden="true"></span>
                <span class="absolute start-0.5 top-0.5 size-5 rounded-full bg-white shadow-sm
                  transition-transform duration-150 peer-checked:translate-x-[22px]
                  dark:bg-gray-900
                  motion-reduce:transition-none"
                  aria-hidden="true"></span>
              </label>
            </div>

            <!-- Toggle 2: Push -->
            <div class="flex items-center justify-between px-5 py-4">
              <div>
                <p class="text-sm font-medium text-gray-900 dark:text-gray-100">Push notifications</p>
                <p class="text-xs text-gray-500 dark:text-gray-400">Get notified in real-time</p>
              </div>
              <label class="relative inline-flex cursor-pointer items-center">
                <input type="checkbox" class="peer sr-only" checked />
                <span class="block h-6 w-11 rounded-full bg-indigo-600 transition-colors duration-150
                  peer-focus-visible:outline-2 peer-focus-visible:outline-offset-2
                  peer-focus-visible:outline-indigo-600
                  dark:bg-indigo-500
                  motion-reduce:transition-none"
                  aria-hidden="true"></span>
                <span class="absolute start-0.5 top-0.5 size-5 rounded-full bg-white shadow-sm
                  transition-transform duration-150 peer-checked:translate-x-[22px]
                  dark:bg-gray-900
                  motion-reduce:transition-none"
                  aria-hidden="true"></span>
              </label>
            </div>

            <!-- Toggle 3: Weekly Digest (OFF) -->
            <div class="flex items-center justify-between px-5 py-4">
              <div>
                <p class="text-sm font-medium text-gray-900 dark:text-gray-100">Weekly digest</p>
                <p class="text-xs text-gray-500 dark:text-gray-400">A summary of the week's activity</p>
              </div>
              <label class="relative inline-flex cursor-pointer items-center">
                <input type="checkbox" class="peer sr-only" />
                <span class="block h-6 w-11 rounded-full bg-gray-200 transition-colors duration-150
                  peer-checked:bg-indigo-600
                  peer-focus-visible:outline-2 peer-focus-visible:outline-offset-2
                  peer-focus-visible:outline-indigo-600
                  dark:bg-gray-700 dark:peer-checked:bg-indigo-500
                  motion-reduce:transition-none"
                  aria-hidden="true"></span>
                <span class="absolute start-0.5 top-0.5 size-5 rounded-full bg-white shadow-sm
                  transition-transform duration-150 peer-checked:translate-x-[22px]
                  dark:bg-gray-300 dark:peer-checked:bg-gray-900
                  motion-reduce:transition-none"
                  aria-hidden="true"></span>
              </label>
            </div>
          </div>
        </section>

        <!-- ========================================================== -->
        <!-- Card 3: Danger Zone                                         -->
        <!-- ========================================================== -->
        <section class="rounded-xl bg-white
          inset-ring inset-ring-gray-950/8
          dark:bg-gray-900 dark:inset-ring-white/10">

          <div class="border-b border-gray-950/5 px-5 py-4 dark:border-white/5">
            <h3 class="text-sm font-semibold text-red-600 dark:text-red-400">Danger zone</h3>
            <p class="mt-0.5 text-xs text-gray-500 dark:text-gray-400">
              Irreversible actions. Proceed with caution.
            </p>
          </div>

          <div class="flex items-center justify-between px-5 py-4">
            <div>
              <p class="text-sm font-medium text-gray-900 dark:text-gray-100">Delete account</p>
              <p class="text-xs text-gray-500 dark:text-gray-400">
                Permanently delete your account and all data
              </p>
            </div>
            <button type="button"
              onclick="if(confirm('Are you sure? This action cannot be undone.')) showToast({ type: 'error', title: 'Account deleted', message: 'Your account has been scheduled for deletion.' })"
              class="inline-flex shrink-0 items-center justify-center rounded-lg
                border border-red-300 px-4 py-2
                text-sm font-semibold text-red-600
                transition-colors duration-150
                hover:bg-red-50 hover:border-red-400
                active:scale-[0.97]
                focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-red-600
                dark:border-red-400/50 dark:text-red-400
                dark:hover:bg-red-900/30 dark:hover:border-red-400
                dark:focus-visible:outline-red-400
                motion-reduce:transition-none">
              Delete account
            </button>
          </div>
        </section>

      </div>

    </div>

  </main>

  <!-- ================================================================ -->
  <!-- Toast 容器                                                        -->
  <!-- ================================================================ -->
  <div id="toast-container"
    class="pointer-events-none fixed right-4 top-16 z-50 flex flex-col gap-3 sm:right-6"
    aria-live="polite"
    aria-label="Notifications">
  </div>

  <!-- ================================================================ -->
  <!-- JS: Sidebar Toggle + Toast                                        -->
  <!-- ================================================================ -->
  <script>
    // ── Sidebar Toggle ────────────────────────────────────────────
    const sidebar = document.getElementById('sidebar');
    const overlay = document.getElementById('sidebar-overlay');
    const toggle = document.getElementById('sidebar-toggle');

    function openSidebar() {
      sidebar.classList.remove('max-lg:-translate-x-full');
      overlay.classList.remove('opacity-0', 'pointer-events-none');
      overlay.classList.add('opacity-100');
      toggle.setAttribute('aria-expanded', 'true');
    }

    function closeSidebar() {
      sidebar.classList.add('max-lg:-translate-x-full');
      overlay.classList.add('opacity-0', 'pointer-events-none');
      overlay.classList.remove('opacity-100');
      toggle.setAttribute('aria-expanded', 'false');
    }

    toggle.addEventListener('click', () => {
      sidebar.classList.contains('max-lg:-translate-x-full') ? openSidebar() : closeSidebar();
    });

    overlay.addEventListener('click', closeSidebar);

    // Close on Escape
    document.addEventListener('keydown', (e) => {
      if (e.key === 'Escape' && !sidebar.classList.contains('max-lg:-translate-x-full')) {
        closeSidebar();
      }
    });

    // ── Toast ─────────────────────────────────────────────────────
    const toastContainer = document.getElementById('toast-container');

    function showToast({ type = 'info', title, message, duration = 5000 }) {
      const colors = {
        success: {
          ring: 'inset-ring-green-300 dark:inset-ring-green-400/50',
          bg: 'bg-green-50 dark:bg-green-900/30',
          icon: 'text-green-600 dark:text-green-400',
          title: 'text-green-800 dark:text-green-100',
          text: 'text-green-700 dark:text-green-200',
          closeHover: 'hover:bg-green-200 dark:hover:bg-green-800'
        },
        error: {
          ring: 'inset-ring-red-300 dark:inset-ring-red-400/50',
          bg: 'bg-red-50 dark:bg-red-900/30',
          icon: 'text-red-600 dark:text-red-400',
          title: 'text-red-800 dark:text-red-100',
          text: 'text-red-700 dark:text-red-200',
          closeHover: 'hover:bg-red-200 dark:hover:bg-red-800'
        },
        warning: {
          ring: 'inset-ring-amber-300 dark:inset-ring-amber-400/50',
          bg: 'bg-amber-50 dark:bg-amber-900/30',
          icon: 'text-amber-600 dark:text-amber-400',
          title: 'text-amber-800 dark:text-amber-100',
          text: 'text-amber-700 dark:text-amber-200',
          closeHover: 'hover:bg-amber-200 dark:hover:bg-amber-800'
        },
        info: {
          ring: 'inset-ring-blue-300 dark:inset-ring-blue-400/50',
          bg: 'bg-blue-50 dark:bg-blue-900/30',
          icon: 'text-blue-600 dark:text-blue-400',
          title: 'text-blue-800 dark:text-blue-100',
          text: 'text-blue-700 dark:text-blue-200',
          closeHover: 'hover:bg-blue-200 dark:hover:bg-blue-800'
        }
      };

      const c = colors[type] || colors.info;
      const toast = document.createElement('div');
      toast.setAttribute('role', type === 'error' ? 'alert' : 'status');
      toast.className = `pointer-events-auto w-full max-w-sm rounded-lg p-4 inset-ring ${c.ring} ${c.bg}`;
      toast.innerHTML = `
        <div class="flex items-start gap-3">
          <div class="flex-1 min-w-0">
            <p class="text-sm font-medium ${c.title}">${title}</p>
            <p class="mt-0.5 text-sm ${c.text}">${message}</p>
          </div>
          <button type="button"
            class="shrink-0 rounded-lg p-1 ${c.icon} transition-colors duration-150 ${c.closeHover}
              motion-reduce:transition-none"
            aria-label="Dismiss">
            <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
              <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>`;
      toastContainer.appendChild(toast);

      if (duration > 0) {
        setTimeout(() => {
          toast.style.opacity = '0';
          toast.style.transition = 'opacity 200ms ease-out';
          setTimeout(() => toast.remove(), 200);
        }, duration);
      }

      toast.querySelector('button')?.addEventListener('click', () => toast.remove());
    }
  </script>

</body>
</html>
```

---

## 页面结构分解

### 布局（倒 L 型）

```
┌──────────┬────────────────────────────────────────┐
│ Sidebar  │  Navbar (Companion)                    │
│ w-60     │  h-14, sticky top-0                    │
│ fixed    │  lg:pl-64（为 Sidebar 留空间）          │
│          ├────────────────────────────────────────┤
│          │  main                                  │
│          │  lg:pl-60（内容区避开 Sidebar）          │
│          │  max-w-3xl mx-auto（内容居中）           │
└──────────┴────────────────────────────────────────┘
```

### 组件使用清单

| 位置 | 组件 | 变体 | 验证点 |
|------|------|------|--------|
| 左侧导航 | Sidebar | Base | Active 态 (General)、Badge 计数 (Inbox)、分区标题、用户 Footer |
| 顶部栏 | Navbar | Companion | 搜索框、通知红点、暗色切换、Sidebar Toggle |
| 设置分区 ×3 | Card | Base | `inset-ring` Elevation、Card Header + Body + Footer 模式 |
| Profile → Name | Input | Base | `inset-ring` 描边、Focus ring、Label |
| Profile → Email | Input | Base | 同上 |
| Profile → Bio | Textarea | Base | 3 行高度、Placeholder |
| Profile → Timezone | Select | Base | 自定义 Chevron、`inset-ring` 描边 |
| Profile → Save | Button | Primary | `bg-indigo-600`、`active:scale-[0.97]`、Toast 触发 |
| Profile → Cancel | Button | Ghost | 中性灰——不抢 Primary 注意力 |
| Notifications | Toggle ×3 | Base | ON 态 indigo-600、OFF 态 gray-200、Focus ring |
| Danger Zone | Button | Outline/Destructive | 红色描边 + 文字 + hover 背景——语义色规范 |
| 删除确认 | Browser | `confirm()` | 二次确认弹窗 |
| 保存反馈 | Toast | Success | `inset-ring-green-300`、自动消失 |
| 删除反馈 | Toast | Error | `inset-ring-red-300`、`role="alert"` |

### Design System 验证矩阵

| 验证维度 | 关键类 | 状态 |
|----------|--------|------|
| **Elevation** | 所有 Card 使用 `inset-ring-gray-950/8`，无 `shadow-sm` | ✅ |
| **Brand Color** | Primary 按钮 `bg-indigo-600`，Toggle ON `bg-indigo-600`，Sidebar Active `text-indigo-600 bg-indigo-50` | ✅ |
| **表单 Focus** | Input/Textarea/Select Focus 使用灰阶 `gray-950/20`——不用品牌色 | ✅ |
| **语义色** | Danger Zone 使用 red-600/400——仅状态传达 | ✅ |
| **圆角统一** | 交互元素 `rounded-lg`，容器 `rounded-xl`，头像 `rounded-full` | ✅ |
| **动画** | `transition-colors duration-150` + `motion-reduce:transition-none` | ✅ |
| **Press 反馈** | 按钮 `active:scale-[0.97]` | ✅ |
| **可访问性** | `aria-current`, `aria-label`, `aria-expanded`, `role="alert"`, `aria-live` | ✅ |
| **暗色模式** | 全组件 `dark:` 变体覆盖 | ✅ |
| **响应式** | 移动端 Sidebar Overlay、Navbar 搜索框 `hidden sm:block`、表单 Grid `sm:grid-cols-2` | ✅ |

---

## 关键设计决策（本次页面验证发现）

### 1. Card 内部 Footer 模式

Profile Card 的底部按钮栏使用了 `border-t border-gray-950/5` 分隔 + 右对齐按钮组。这是 Card 组件未定义但在实践中自然出现的模式——**Card Footer**。建议后续更新 Card 组件规范。

### 2. Danger Zone 的语义色应用

Danger Zone 分区标题使用 `text-red-600`——这是语义色在非状态传达场景的少数正当使用之一。它与"删除"按钮的红色形成呼应，建立了连贯的视觉语言。

### 3. 内容区宽度策略

Settings 页面使用 `max-w-3xl` (768px) 居中——比 Dashboard 的全宽更聚焦。表单密集型页面受益于较窄的内容区（减少眼动距离，降低填写疲劳）。

---

## 响应式行为

| 断点 | Sidebar | Navbar | 内容区 |
|------|---------|--------|--------|
| < 640px | 隐藏 (translate-x-full)，Hamburger 触发展开 | 搜索框隐藏，页面标题显示 | 单列，全宽 |
| 640–1023px | 隐藏，Hamburger 触发展开 | 搜索框显示 | Profile 名称/邮箱双列 |
| ≥ 1024px | 固定显示 (w-60) | Sidebar Toggle 隐藏 | `max-w-3xl mx-auto` |

---

## 复用指南

**何时使用此 Template:**
- App 内设置页
- 用户偏好页
- 团队/项目管理配置页
- 任何需要 Sidebar + 表单内容的 App 内页面

**如何复用:**
1. 保留 Sidebar + Navbar 结构
2. 替换设置分区内容（Card sections）
3. 替换 Sidebar 导航项和 Active 页
4. 接入真实表单提交逻辑

**此模板验证了:**
- ✅ Sidebar + Navbar 倒 L 型布局可正常工作
- ✅ Card 的 section header + body + footer 模式实用
- ✅ 多 Toggle 集中排列时 `divide-y` 分隔清晰
- ✅ Danger Zone 的语义色使用一致
- ✅ 表单 Focus ring 保持灰阶（不用品牌色）决策正确

---

> 组件依赖: [Sidebar](../components/sidebar.md) · [Navbar](../components/navbar.md) · [Card](../components/card.md) · [Input](../components/input.md) · [Textarea](../components/textarea.md) · [Select](../components/select.md) · [Toggle](../components/toggle.md) · [Button](../components/button.md) · [Toast](../components/toast.md)
>
> 规范依赖: [Elevation](../design-tokens/elevation.md) · [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md)
