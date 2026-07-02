# Dashboard Template

仪表盘页面模板。组合 Stat Card + Chart + Table + Badge + Select + Toggle + Toast，覆盖数据分析场景的常见布局模式。

> **使用组件**: [Stat Card](../components/card.md#4-stat-card数据卡片) · [Chart](../components/chart.md) · [Table](../components/table.md) · [Badge](../components/badge.md) · [Select](../components/select.md) · [Toggle](../components/toggle.md) · [Toast](../components/toast.md)
>
> **Elevation 规范**: 遵循 [Elevation](../design-tokens/elevation.md) — 使用 `inset-ring` + 背景明度差替代 `box-shadow` + `border`
>
> **品牌色**: Indigo — 遵循 [Colors](../design-tokens/colors.md#四brand-accent品牌强调色-indigo) 语义 Token

---

## 预览

```
┌──────────────────────────────────────────────────────┐
│  Dashboard                          Settings  Profile │  ← 简易顶部栏
├──────────────────────────────────────────────────────┤
│                                                       │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐│
│  │ Revenue  │ │  Users   │ │  Orders  │ │   Conv.  ││  ← Stat Cards 4 列
│  │ $48,295  │ │  12,845  │ │   1,204  │ │   3.24%  ││
│  └──────────┘ └──────────┘ └──────────┘ └──────────┘│
│                                                       │
│  ┌──────────────────────────────────────┐             │
│  │  Revenue Overview                    │             │  ← 图表卡片（全宽）
│  │  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓  │             │
│  │  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓  │             │
│  └──────────────────────────────────────┘             │
│                                                       │
│  ┌─────────────────────────┐ ┌──────────────────────┐│
│  │  Recent Orders          │ │  Quick Settings      ││  ← 双列布局
│  │  ┌───────────────────┐  │ │  [Toggle] Email      ││
│  │  │ Table with Status │  │ │  [Toggle] 2FA        ││
│  │  │ Badges + Actions  │  │ │  [Select]  Timezone  ││
│  │  └───────────────────┘  │ │  [Button]  Save      ││
│  └─────────────────────────┘ └──────────────────────┘│
│                                                       │
└──────────────────────────────────────────────────────┘
```

---

## 完整页面代码

```html
<!DOCTYPE html>
<html lang="en" class="bg-gray-50 dark:bg-gray-950">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Dashboard — Design System</title>
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
  <!-- 顶部导航栏（简易版——可替换为 [Navbar Standalone](../components/navbar.md#1-standalone-navbar独立顶部导航) + [Sidebar](../components/sidebar.md)） -->
  <!-- ================================================================ -->
  <header class="sticky top-0 z-40 border-b border-gray-950/5 bg-white dark:border-white/5 dark:bg-gray-900">
    <div class="mx-auto flex h-14 max-w-7xl items-center gap-4 px-4 sm:px-6">
      <!-- Logo -->
      <a href="#" class="flex items-center gap-2 text-lg font-bold text-gray-900 dark:text-white">
        <svg class="size-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
          <path stroke-linecap="round" stroke-linejoin="round"
            d="M3.75 6A2.25 2.25 0 016 3.75h2.25A2.25 2.25 0 0110.5 6v2.25a2.25 2.25 0 01-2.25 2.25H6a2.25 2.25 0 01-2.25-2.25V6zM3.75 15.75A2.25 2.25 0 016 13.5h2.25a2.25 2.25 0 012.25 2.25V18a2.25 2.25 0 01-2.25 2.25H6A2.25 2.25 0 013.75 18v-2.25zM13.5 6a2.25 2.25 0 012.25-2.25H18A2.25 2.25 0 0120.25 6v2.25A2.25 2.25 0 0118 10.5h-2.25a2.25 2.25 0 01-2.25-2.25V6zM13.5 15.75a2.25 2.25 0 012.25-2.25H18a2.25 2.25 0 012.25 2.25V18A2.25 2.25 0 0118 20.25h-2.25A2.25 2.25 0 0113.5 18v-2.25z" />
        </svg>
        Design System
      </a>

      <div class="flex-1"></div>

      <!-- 暗色模式切换 -->
      <button onclick="document.documentElement.classList.toggle('dark')"
        class="rounded-lg p-2 text-gray-400 transition-colors hover:bg-gray-100 hover:text-gray-700
          dark:text-gray-500 dark:hover:bg-gray-800 dark:hover:text-gray-300"
        aria-label="Toggle dark mode">
        <svg class="size-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
          <path stroke-linecap="round" stroke-linejoin="round"
            d="M21.752 15.002A9.718 9.718 0 0118 15.75c-5.385 0-9.75-4.365-9.75-9.75 0-1.33.266-2.597.748-3.752A9.753 9.753 0 003 11.25C3 16.635 7.365 21 12.75 21a9.753 9.753 0 009.002-5.998z" />
        </svg>
      </button>

      <!-- 用户头像 -->
      <img class="size-8 rounded-full object-cover"
        src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=64&h=64&fit=crop&crop=face"
        alt="User avatar" />
    </div>
  </header>

  <!-- ================================================================ -->
  <!-- 主内容区                                                           -->
  <!-- ================================================================ -->
  <main class="mx-auto max-w-7xl px-4 py-6 sm:px-6 lg:py-8">

    <!-- 页面标题 + 操作 -->
    <div class="mb-6 flex flex-wrap items-center justify-between gap-4">
      <div>
        <h1 class="text-2xl font-bold text-gray-900 dark:text-white">Dashboard</h1>
        <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">
          Overview of your business metrics.
        </p>
      </div>
      <div class="flex items-center gap-3">
        <!-- 日期选择（遵循 Select 组件 inset-ring 规范） -->
        <div class="relative">
          <select
            class="w-full appearance-none rounded-lg bg-white py-2 pl-3 pr-9 text-sm/6 text-gray-900
              inset-ring inset-ring-gray-950/8
              transition-colors duration-150
              focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none
              dark:bg-gray-900 dark:text-gray-100
              dark:inset-ring-white/10
              dark:focus:inset-ring-white/20 dark:focus:ring-white/10
              motion-reduce:transition-none">
            <option>Last 7 days</option>
            <option>Last 30 days</option>
            <option>Last quarter</option>
            <option>This year</option>
          </select>
          <svg class="pointer-events-none absolute right-3 top-1/2 size-4 -translate-y-1/2 text-gray-400
            dark:text-gray-500"
            fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
          </svg>
        </div>

        <!-- 导出按钮（遵循 Button Solid Primary 规范） -->
        <button type="button"
          class="inline-flex items-center gap-2 rounded-lg bg-indigo-600 px-4 py-2
            text-sm/6 font-semibold text-white transition-colors duration-150
            hover:bg-indigo-700
            focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600
            active:bg-indigo-800 active:scale-[0.97]
            dark:bg-indigo-500 dark:hover:bg-indigo-400 dark:focus-visible:outline-indigo-400
            motion-reduce:transition-none">
          <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
            <path stroke-linecap="round" stroke-linejoin="round"
              d="M3 16.5v2.25A2.25 2.25 0 005.25 21h13.5A2.25 2.25 0 0021 18.75V16.5M16.5 12L12 16.5m0 0L7.5 12m4.5 4.5V3" />
          </svg>
          Export
        </button>
      </div>
    </div>

    <!-- ================================================================ -->
    <!-- Stat Cards Grid（Elevation Level 1: inset-ring + 背景抬升）        -->
    <!-- ================================================================ -->
    <div class="mb-8 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">

      <!-- 卡片 1: Revenue -->
      <div class="rounded-xl bg-white p-5
        inset-ring inset-ring-gray-950/8
        transition-colors duration-150
        hover:bg-gray-50/50 hover:inset-ring-gray-950/20
        dark:bg-gray-900 dark:inset-ring-white/10
        dark:hover:bg-gray-800/50 dark:hover:inset-ring-white/20
        motion-reduce:transition-none">
        <div class="flex items-center justify-between">
          <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Total Revenue</p>
          <span class="inline-flex items-center gap-1 rounded-lg bg-green-100 px-2 py-0.5
            text-xs font-medium text-green-700 dark:bg-green-900/30 dark:text-green-400">
            <svg class="size-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="3">
              <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 19.5l15-15m0 0H8.25m11.25 0v11.25" />
            </svg>
            12.5%
          </span>
        </div>
        <p class="mt-2 text-2xl font-bold text-gray-900 dark:text-gray-100">$48,295</p>
        <p class="mt-1 text-xs text-gray-500 dark:text-gray-400">vs. $42,920 last period</p>
      </div>

      <!-- 卡片 2: Users -->
      <div class="rounded-xl bg-white p-5
        inset-ring inset-ring-gray-950/8
        transition-colors duration-150
        hover:bg-gray-50/50 hover:inset-ring-gray-950/20
        dark:bg-gray-900 dark:inset-ring-white/10
        dark:hover:bg-gray-800/50 dark:hover:inset-ring-white/20
        motion-reduce:transition-none">
        <div class="flex items-center justify-between">
          <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Total Users</p>
          <span class="inline-flex items-center gap-1 rounded-lg bg-green-100 px-2 py-0.5
            text-xs font-medium text-green-700 dark:bg-green-900/30 dark:text-green-400">
            <svg class="size-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="3">
              <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 19.5l15-15m0 0H8.25m11.25 0v11.25" />
            </svg>
            8.2%
          </span>
        </div>
        <p class="mt-2 text-2xl font-bold text-gray-900 dark:text-gray-100">12,845</p>
        <p class="mt-1 text-xs text-gray-500 dark:text-gray-400">↑ 974 from last period</p>
      </div>

      <!-- 卡片 3: Orders — 下降趋势（使用红色） -->
      <div class="rounded-xl bg-white p-5
        inset-ring inset-ring-gray-950/8
        transition-colors duration-150
        hover:bg-gray-50/50 hover:inset-ring-gray-950/20
        dark:bg-gray-900 dark:inset-ring-white/10
        dark:hover:bg-gray-800/50 dark:hover:inset-ring-white/20
        motion-reduce:transition-none">
        <div class="flex items-center justify-between">
          <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Orders</p>
          <span class="inline-flex items-center gap-1 rounded-lg bg-red-100 px-2 py-0.5
            text-xs font-medium text-red-700 dark:bg-red-900/30 dark:text-red-400">
            <svg class="size-3 rotate-180" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="3">
              <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 19.5l15-15m0 0H8.25m11.25 0v11.25" />
            </svg>
            3.1%
          </span>
        </div>
        <p class="mt-2 text-2xl font-bold text-gray-900 dark:text-gray-100">1,204</p>
        <p class="mt-1 text-xs text-gray-500 dark:text-gray-400">↓ 39 from last period</p>
      </div>

      <!-- 卡片 4: Conversion -->
      <div class="rounded-xl bg-white p-5
        inset-ring inset-ring-gray-950/8
        transition-colors duration-150
        hover:bg-gray-50/50 hover:inset-ring-gray-950/20
        dark:bg-gray-900 dark:inset-ring-white/10
        dark:hover:bg-gray-800/50 dark:hover:inset-ring-white/20
        motion-reduce:transition-none">
        <div class="flex items-center justify-between">
          <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Conversion</p>
          <span class="inline-flex items-center gap-1 rounded-lg bg-amber-100 px-2 py-0.5
            text-xs font-medium text-amber-700 dark:bg-amber-900/30 dark:text-amber-400">
            —
            0.0%
          </span>
        </div>
        <p class="mt-2 text-2xl font-bold text-gray-900 dark:text-gray-100">3.24%</p>
        <p class="mt-1 text-xs text-gray-500 dark:text-gray-400">No change from last period</p>
      </div>

    </div>

    <!-- ================================================================ -->
    <!-- 双列布局：表格 + 设置面板                                          -->
    <!-- ================================================================ -->
    <div class="grid gap-6 lg:grid-cols-3">

      <!-- 左列：Recent Orders Table -->
      <div class="lg:col-span-2">
        <div class="rounded-xl bg-white
          inset-ring inset-ring-gray-950/8
          dark:bg-gray-900 dark:inset-ring-white/10">
          <!-- Table Header -->
          <div class="flex items-center justify-between border-b border-gray-950/5 px-5 py-4
            dark:border-white/5">
            <h2 class="text-sm font-semibold text-gray-900 dark:text-gray-100">
              Recent Orders
            </h2>
            <a href="#" class="text-xs font-medium text-indigo-600 transition-colors duration-150
              hover:text-indigo-700 dark:text-indigo-400 dark:hover:text-indigo-300
              motion-reduce:transition-none">
              View all →
            </a>
          </div>

          <!-- Table Body -->
          <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-950/5 text-sm dark:divide-white/5">
              <thead>
                <tr>
                  <th class="px-5 py-3 text-left text-xs font-medium text-gray-500 uppercase
                    dark:text-gray-400">Order</th>
                  <th class="px-5 py-3 text-left text-xs font-medium text-gray-500 uppercase
                    dark:text-gray-400">Customer</th>
                  <th class="px-5 py-3 text-left text-xs font-medium text-gray-500 uppercase
                    dark:text-gray-400">Amount</th>
                  <th class="px-5 py-3 text-left text-xs font-medium text-gray-500 uppercase
                    dark:text-gray-400">Status</th>
                  <th class="px-5 py-3 text-right text-xs font-medium text-gray-500 uppercase
                    dark:text-gray-400">
                    <span class="sr-only">Actions</span>
                  </th>
                </tr>
              </thead>
              <tbody class="divide-y divide-gray-950/5 bg-white dark:divide-white/5 dark:bg-gray-900">
                <!-- Row 1 -->
                <tr class="transition-colors duration-150 hover:bg-gray-50 dark:hover:bg-gray-800/50
                  motion-reduce:transition-none">
                  <td class="whitespace-nowrap px-5 py-3 font-medium text-gray-900 dark:text-gray-100">
                    #ORD-001
                  </td>
                  <td class="whitespace-nowrap px-5 py-3 text-gray-700 dark:text-gray-300">
                    Alex Chen
                  </td>
                  <td class="whitespace-nowrap px-5 py-3 text-gray-900 dark:text-gray-100">
                    $1,200.00
                  </td>
                  <td class="whitespace-nowrap px-5 py-3">
                    <span class="inline-flex items-center rounded-lg bg-green-100 px-2.5 py-0.5
                      text-xs font-medium text-green-700
                      dark:bg-green-900/30 dark:text-green-400">Paid</span>
                  </td>
                  <td class="whitespace-nowrap px-5 py-3 text-right">
                    <button type="button"
                      class="rounded-lg px-2 py-1 text-xs font-medium text-gray-400
                        transition-colors duration-150 hover:bg-gray-100 hover:text-gray-700
                        dark:text-gray-500 dark:hover:bg-gray-800 dark:hover:text-gray-300
                        motion-reduce:transition-none">
                      View
                    </button>
                  </td>
                </tr>
                <!-- Row 2 -->
                <tr class="transition-colors duration-150 hover:bg-gray-50 dark:hover:bg-gray-800/50
                  motion-reduce:transition-none">
                  <td class="whitespace-nowrap px-5 py-3 font-medium text-gray-900 dark:text-gray-100">
                    #ORD-002
                  </td>
                  <td class="whitespace-nowrap px-5 py-3 text-gray-700 dark:text-gray-300">
                    Sarah Kim
                  </td>
                  <td class="whitespace-nowrap px-5 py-3 text-gray-900 dark:text-gray-100">
                    $850.00
                  </td>
                  <td class="whitespace-nowrap px-5 py-3">
                    <span class="inline-flex items-center rounded-lg bg-amber-100 px-2.5 py-0.5
                      text-xs font-medium text-amber-700
                      dark:bg-amber-900/30 dark:text-amber-400">Pending</span>
                  </td>
                  <td class="whitespace-nowrap px-5 py-3 text-right">
                    <button type="button"
                      class="rounded-lg px-2 py-1 text-xs font-medium text-gray-400
                        transition-colors duration-150 hover:bg-gray-100 hover:text-gray-700
                        dark:text-gray-500 dark:hover:bg-gray-800 dark:hover:text-gray-300
                        motion-reduce:transition-none">
                      View
                    </button>
                  </td>
                </tr>
                <!-- Row 3 -->
                <tr class="transition-colors duration-150 hover:bg-gray-50 dark:hover:bg-gray-800/50
                  motion-reduce:transition-none">
                  <td class="whitespace-nowrap px-5 py-3 font-medium text-gray-900 dark:text-gray-100">
                    #ORD-003
                  </td>
                  <td class="whitespace-nowrap px-5 py-3 text-gray-700 dark:text-gray-300">
                    Mike Johnson
                  </td>
                  <td class="whitespace-nowrap px-5 py-3 text-gray-900 dark:text-gray-100">
                    $2,400.00
                  </td>
                  <td class="whitespace-nowrap px-5 py-3">
                    <span class="inline-flex items-center rounded-lg bg-red-100 px-2.5 py-0.5
                      text-xs font-medium text-red-700
                      dark:bg-red-900/30 dark:text-red-400">Failed</span>
                  </td>
                  <td class="whitespace-nowrap px-5 py-3 text-right">
                    <button type="button"
                      class="rounded-lg px-2 py-1 text-xs font-medium text-gray-400
                        transition-colors duration-150 hover:bg-gray-100 hover:text-gray-700
                        dark:text-gray-500 dark:hover:bg-gray-800 dark:hover:text-gray-300
                        motion-reduce:transition-none">
                      View
                    </button>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <!-- 右列：Quick Settings -->
      <div class="rounded-xl bg-white p-5
        inset-ring inset-ring-gray-950/8
        dark:bg-gray-900 dark:inset-ring-white/10">
        <h2 class="text-sm font-semibold text-gray-900 dark:text-gray-100">
          Quick Settings
        </h2>

        <!-- Toggle 1: Email Notifications -->
        <div class="mt-4 flex items-center justify-between">
          <div>
            <p class="text-sm font-medium text-gray-900 dark:text-gray-100">Email notifications</p>
            <p class="text-xs text-gray-500 dark:text-gray-400">Receive weekly digests</p>
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

        <!-- Toggle 2: Two-factor Auth -->
        <div class="mt-5 flex items-center justify-between border-t border-gray-950/5 pt-4
          dark:border-white/5">
          <div>
            <p class="text-sm font-medium text-gray-900 dark:text-gray-100">Two-factor auth</p>
            <p class="text-xs text-gray-500 dark:text-gray-400">Add extra security</p>
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

        <!-- Select: Timezone（遵循 Select 组件 inset-ring 规范） -->
        <div class="mt-5 border-t border-gray-950/5 pt-4 dark:border-white/5">
          <label for="tz" class="text-sm font-medium text-gray-900 dark:text-gray-100">
            Timezone
          </label>
          <div class="relative mt-1.5">
            <select id="tz"
              class="w-full appearance-none rounded-lg bg-white py-2 pl-3 pr-9 text-sm/6 text-gray-900
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
              <option>UTC+8 (Shanghai)</option>
              <option>UTC+9 (Tokyo)</option>
            </select>
            <svg class="pointer-events-none absolute right-3 top-1/2 size-4 -translate-y-1/2
              text-gray-400 dark:text-gray-500"
              fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
              aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
            </svg>
          </div>
        </div>

        <!-- Save Button（遵循 Button Solid Primary 规范） -->
        <button type="button"
          class="mt-5 w-full rounded-lg bg-indigo-600 px-4 py-2 text-sm/6 font-semibold text-white
            transition-colors duration-150
            hover:bg-indigo-700
            focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600
            active:bg-indigo-800 active:scale-[0.97]
            dark:bg-indigo-500 dark:hover:bg-indigo-400 dark:focus-visible:outline-indigo-400
            motion-reduce:transition-none">
          Save Settings
        </button>
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

  <!-- Toast JS -->
  <script>
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

    // 演示：点击 Save Settings 按钮触发 Toast
    document.querySelector('button')?.addEventListener('click', function(e) {
      if (e.target.textContent.includes('Save Settings')) {
        showToast({ type: 'success', title: 'Saved', message: 'Settings updated successfully.' });
      }
    });
  </script>

</body>
</html>
```

---

## 布局分解

### 顶部栏（简易版）

| 元素 | 说明 | 后续计划 |
|------|------|---------|
| Logo + 名称 | 左侧品牌标识 | 可替换为 [Sidebar](../components/sidebar.md) + [Navbar](../components/navbar.md) |
| 暗色模式按钮 | 一键切换 Light/Dark | 可提取为独立 Toggle 组件 |
| 用户头像 | 右侧个人入口 | Profile Card 组件 |

### Stat Cards Grid

| 断点 | 列数 | 代码 |
|------|------|------|
| Mobile | 1 列 | `grid-cols-1`（默认） |
| Tablet | 2 列 | `sm:grid-cols-2` |
| Desktop | 4 列 | `lg:grid-cols-4` |

**Elevation 方案**: 遵循 [Elevation 规范](../design-tokens/elevation.md) — `inset-ring-gray-950/8` + `bg-white` 替代 `border border-gray-200 shadow-sm`，hover 使用 `inset-ring-gray-950/20` + `bg-gray-50/50`。

趋势指示器（Badge）：
- 上升 → `bg-green-100 text-green-700` + 向上箭头
- 下降 → `bg-red-100 text-red-700` + 向下箭头
- 持平 → `bg-amber-100 text-amber-700` + 横线

### Chart Card（图表卡片）

Dashboard 核心数据展示区域——全宽面积图展示时间序列趋势。嵌入 Card 容器，使用品牌色系列色盘。

| 属性 | 值 | 说明 |
|------|-----|------|
| 图表类型 | Area Chart | 面积图展示 Revenue 时间序列 |
| 容器 | Card（全宽） | `rounded-xl bg-white inset-ring inset-ring-gray-950/8` |
| 系列色 | `indigo-600` | 单系列使用品牌基准色 |
| 渐变填充 | `indigo-600/30` → `indigo-600/5` | 从上到下透明度递减 |
| 网格线 | `gray-950/5` | 4 条水平参考线 |
| 坐标轴标签 | `text-xs text-gray-500 tabular-nums` | 等宽数字防抖动 |
| 时间选择器 | Select（紧凑版 `px-2.5 py-1.5 text-xs`） | 右上角切换时间范围 |
| 响应式高度 | `h-48 sm:h-56 lg:h-64` | 渐进式增高 |

```html
<!-- Chart Card — 嵌入 Dashboard 全宽区域 -->
<div class="rounded-xl bg-white p-4 sm:p-6
  inset-ring inset-ring-gray-950/8
  transition-colors duration-150
  hover:bg-gray-50/50 hover:inset-ring-gray-950/20
  dark:bg-gray-900 dark:inset-ring-white/10
  dark:hover:bg-gray-800/50 dark:hover:inset-ring-white/20
  motion-reduce:transition-none">
  <!-- Header -->
  <div class="mb-4 flex items-start justify-between gap-4">
    <div>
      <h3 class="text-base font-semibold text-gray-900 dark:text-gray-100">Revenue Overview</h3>
      <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">Monthly revenue for H1 2026</p>
    </div>
    <select class="rounded-lg bg-white px-2.5 py-1.5 text-xs text-gray-700
      inset-ring inset-ring-gray-950/8
      transition-colors duration-150
      focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none
      dark:bg-gray-800 dark:text-gray-300
      dark:inset-ring-white/10
      dark:focus:inset-ring-white/20 dark:focus:ring-white/10
      motion-reduce:transition-none"
      aria-label="Select time range">
      <option>Last 6 months</option>
      <option>Last 12 months</option>
      <option>Last 30 days</option>
    </select>
  </div>
  <!-- Chart -->
  <div class="h-48 sm:h-56 lg:h-64" role="img" aria-label="Revenue trend: increasing from $8.2k to $16.1k">
    <svg viewBox="0 0 400 160" class="h-full w-full" preserveAspectRatio="none">
      <defs>
        <linearGradient id="areaGrad" x1="0" y1="0" x2="0" y2="1">
          <stop offset="0%" stop-color="#4F46E5" stop-opacity="0.30" />
          <stop offset="100%" stop-color="#4F46E5" stop-opacity="0.05" />
        </linearGradient>
      </defs>
      <!-- Grid -->
      <line x1="0" y1="32" x2="400" y2="32" stroke="rgb(3 7 18 / 0.05)" stroke-width="1" />
      <line x1="0" y1="64" x2="400" y2="64" stroke="rgb(3 7 18 / 0.05)" stroke-width="1" />
      <line x1="0" y1="96" x2="400" y2="96" stroke="rgb(3 7 18 / 0.05)" stroke-width="1" />
      <line x1="0" y1="128" x2="400" y2="128" stroke="rgb(3 7 18 / 0.05)" stroke-width="1" />
      <!-- Area -->
      <path d="M0 128 L80 112 L160 96 L240 104 L320 72 L400 48 L400 160 L0 160 Z" fill="url(#areaGrad)" />
      <!-- Line -->
      <path d="M0 128 L80 112 L160 96 L240 104 L320 72 L400 48" fill="none" stroke="#4F46E5" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
      <!-- Points -->
      <circle cx="0" cy="128" r="3" fill="white" stroke="#4F46E5" stroke-width="2" />
      <circle cx="80" cy="112" r="3" fill="white" stroke="#4F46E5" stroke-width="2" />
      <circle cx="160" cy="96" r="3" fill="white" stroke="#4F46E5" stroke-width="2" />
      <circle cx="240" cy="104" r="3" fill="white" stroke="#4F46E5" stroke-width="2" />
      <circle cx="320" cy="72" r="3" fill="white" stroke="#4F46E5" stroke-width="2" />
      <circle cx="400" cy="48" r="3" fill="white" stroke="#4F46E5" stroke-width="2" />
    </svg>
  </div>
  <!-- X Labels -->
  <div class="mt-2 flex justify-between px-1">
    <span class="text-xs text-gray-500 dark:text-gray-400">Jan</span>
    <span class="text-xs text-gray-500 dark:text-gray-400">Feb</span>
    <span class="text-xs text-gray-500 dark:text-gray-400">Mar</span>
    <span class="text-xs text-gray-500 dark:text-gray-400">Apr</span>
    <span class="text-xs text-gray-500 dark:text-gray-400">May</span>
    <span class="text-xs text-gray-500 dark:text-gray-400">Jun</span>
  </div>
  <!-- Legend -->
  <div class="mt-3 flex items-center gap-4">
    <div class="flex items-center gap-1.5">
      <span class="inline-block h-2.5 w-2.5 rounded-full bg-indigo-600 dark:bg-indigo-400"></span>
      <span class="text-xs text-gray-600 dark:text-gray-400">Revenue</span>
    </div>
  </div>
</div>
```

### 双列布局

```
lg:grid-cols-3
├── 左列 lg:col-span-2 → Table（占 2/3 宽度）
└── 右列（占 1/3 宽度）→ Quick Settings Panel
```

移动端自动切换为单列堆叠。

### 组件清单

| 模板位置 | 使用的组件 | 变体 | Elevation 规范 |
|---------|----------|------|---------------|
| 日期筛选 | Select | Inline | `inset-ring-gray-950/8` → focus: `inset-ring-gray-950/20` + `ring-2` |
| 导出按钮 | Button | Solid Primary | `bg-indigo-600` → hover: `bg-indigo-700`, dark: `bg-indigo-500` |
| 指标卡片 × 4 | Card | Stat | Level 1 (Raised): `inset-ring-gray-950/8` |
| 趋势标签 | Badge | Solid (green/red/amber) | N/A（内联标签） |
| 收入趋势图 | Chart | Area | 嵌入 Card，系列色 `indigo-600`，网格 `gray-950/5` |
| 订单表格 | Table | Base + Actions | Level 1 (Raised): `inset-ring-gray-950/8` |
| 表格分隔线 | — | — | `divide-gray-950/5`（5% 透明度分隔） |
| Email 通知 | Toggle | Base (On) | `bg-indigo-600` checked, focus: `outline-indigo-600` |
| 2FA | Toggle | Base (Off) | `peer-checked:bg-indigo-600`, focus: `outline-indigo-600` |
| 时区选择 | Select | Base | `inset-ring-gray-950/8`（表单控件聚焦不用品牌色） |
| 保存按钮 | Button | Solid Primary | `bg-indigo-600`, `rounded-lg`（非 `rounded-full`） |
| 保存成功反馈 | Toast | Success | `inset-ring-green-300`（替代 `shadow-lg` + `border`） |

---

## 本次更新记录 (P0-2)

### Elevation 迁移 (shadow → inset-ring)

| 位置 | 旧方案 | 新方案 |
|------|--------|--------|
| Stat Cards | `border border-gray-200 shadow-sm hover:shadow-md` | `inset-ring inset-ring-gray-950/8 hover:inset-ring-gray-950/20` + `bg-white/50` hover |
| Table 容器 | `border border-gray-200 shadow-sm` | `inset-ring inset-ring-gray-950/8` |
| Settings 面板 | `border border-gray-200 shadow-sm` | `inset-ring inset-ring-gray-950/8` |
| 表格分隔线 | `divide-gray-200 border-gray-200` | `divide-gray-950/5 border-gray-950/5`（5% 透明度，暗色模式自动反转） |
| Toast | `shadow-lg border` | `inset-ring`（语义色透明度 ring） |

### Brand Color 迁移

| 位置 | 旧方案 | 新方案 |
|------|--------|--------|
| Export 按钮 | `bg-gray-900 rounded-full` | `bg-indigo-600 rounded-lg` |
| Save 按钮 | `bg-gray-900 rounded-full` | `bg-indigo-600 rounded-lg` |
| Toggle ON 背景 | `bg-gray-900 dark:bg-white` | `bg-indigo-600 dark:bg-indigo-500` |
| Toggle OFF checked | `peer-checked:bg-gray-900` | `peer-checked:bg-indigo-600` |
| Toggle focus ring | `outline-gray-900` | `outline-indigo-600` |
| "View all" 链接 | `text-gray-500 hover:text-gray-900` | `text-indigo-600 hover:text-indigo-700` |

### 圆角统一

| 位置 | 旧 | 新 |
|------|----|----|
| Export 按钮 | `rounded-full` | `rounded-lg` |
| Save Settings 按钮 | `rounded-full` | `rounded-lg` |
| Toast 关闭按钮 | `rounded-full` | `rounded-lg` |
| Toast 容器 | `rounded-lg`（已符合） | — |
| Badge 趋势标签 | `rounded-full`（保留） | `rounded-lg`（统一圆角，与 [Badge 组件](../components/badge.md) 一致） |

### 动画规范

- 所有过渡从 `transition-shadow` / `transition-colors` 统一为 `transition-colors duration-150`
- 新增 `motion-reduce:transition-none` 到所有可交互元素
- 按钮新增 `active:scale-[0.97]` press 反馈

---

## 响应式行为

| 断点 | 布局变化 |
|------|---------|
| Default (< 640px) | 单列：Stat Cards 堆叠，Table 水平滚动，Settings 在最下方 |
| sm (≥ 640px) | Stat Cards 2 列 |
| lg (≥ 1024px) | Stat Cards 4 列，Table + Settings 双列并排 |

---

## 可扩展点

1. **更多图表类型** — 在 Stat Cards 下方增加 Donut Chart（流量来源）或 Grouped Bar（多系列对比），见 [Chart](../components/chart.md)
2. **搜索/筛选栏** — Table 上方添加 Search Input + Filter Select
3. **Pagination** — Table 下方添加分页组件
4. **Sidebar 替换** — 将顶部栏替换为 [Sidebar](../components/sidebar.md) + [Navbar Companion](../components/navbar.md#2-companion-navbar配合-sidebar-的顶部栏)
5. **更多 Toast 演示** — 订单操作（Approve/Reject）触发不同 Toast

---

## 复用指南

**何时使用此 Template:**
- 数据分析类后台页面（SaaS Dashboard）
- 项目概览页面
- 管理面板主页

**如何复用:**
1. 复制完整 HTML
2. 替换 Stat Card 数据和标签
3. 替换 Table 列和数据
4. 替换 Settings 中的 Toggle/Select 项
5. 接入真实数据 API

**不要:**
- 随意修改卡片/表格的 Tailwind 类名（会破坏与组件库的一致性）
- 在未创建 Sidebar 组件前自行设计侧边栏（后续统一替换）

---

> 组件依赖: [Card](../components/card.md) · [Table](../components/table.md) · [Badge](../components/badge.md) · [Select](../components/select.md) · [Toggle](../components/toggle.md) · [Toast](../components/toast.md) · [Button](../components/button.md)
>
> 规范依赖: [Elevation](../design-tokens/elevation.md) · [Colors](../design-tokens/colors.md)
