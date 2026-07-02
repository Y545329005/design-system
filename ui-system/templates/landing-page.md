# Landing Page Template

SaaS 落地页模板。组合 Simple Navbar + Hero + Feature Cards + Pricing + Testimonials + Footer，覆盖产品官网的完整布局模式。

> **使用组件**: [Simple Navbar](../components/navbar.md#3-simple-navbar极简顶部栏) · [Feature Card](../components/card.md#2-feature-card特性卡片) · [Highlighted Card](../components/card.md#6-highlighted-card高亮卡片) · [Button](../components/button.md) · [Badge](../components/badge.md) · [Footer](../components/footer.md#1-base-footer标准页脚)
>
> **Elevation 规范**: 遵循 [Elevation](../design-tokens/elevation.md) — 使用 `inset-ring` + 背景明度差替代 `box-shadow` + `border`
>
> **品牌色**: Indigo — 遵循 [Colors](../design-tokens/colors.md#四brand-accent品牌强调色-indigo) 语义 Token
>
> **设计原则**: 落地页无侧边栏（原则七）· 信息密度从 Hero 向下方递进（原则六）· 顶部毛玻璃导航（Simple Navbar）

---

## 预览

```
┌──────────────────────────────────────────────────────────┐
│  Logo   Docs  Blog  Pricing         Sign in  [Get Started]│  ← Simple Navbar (glass)
├──────────────────────────────────────────────────────────┤
│                                                            │
│                      ┌──────────┐                          │
│                      │  New: 2.0 │  ← Badge                │
│                      └──────────┘                          │
│                    Design at the speed                      │  ← Hero
│                    of thought                               │
│              Build, ship, and iterate faster                │
│              than ever before.                              │
│           [Get Started →]  [View Docs]                      │  ← CTA Buttons
│                                                            │
├──────────────────────────────────────────────────────────┤
│                                                            │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐                │
│  │  ⚡ Icon │  │  🔒 Icon │  │  📊 Icon │                │  ← Features (3-col)
│  │ Fast     │  │ Secure   │  │ Insights │                │
│  │ .......  │  │ .......  │  │ .......  │                │
│  └──────────┘  └──────────┘  └──────────┘                │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐                │
│  │  🌐 Icon │  │  🔧 Icon │  │  💬 Icon │                │
│  │ Global   │  │ Flexible │  │ Support  │                │
│  │ .......  │  │ .......  │  │ .......  │                │
│  └──────────┘  └──────────┘  └──────────┘                │
│                                                            │
├──────────────────────────────────────────────────────────┤
│                    Used by 10,000+ teams                    │  ← Social Proof
│            [logo] [logo] [logo] [logo] [logo]              │
│                                                            │
├──────────────────────────────────────────────────────────┤
│                                                            │
│  ┌──────────────────────────────────────────────────────┐  │
│  │  "This tool changed how our team ships products."    │  │  ← Testimonial
│  │  — Sarah Chen, CTO at Horizon                        │  │
│  └──────────────────────────────────────────────────────┘  │
│                                                            │
├──────────────────────────────────────────────────────────┤
│                                                            │
│  ┌────────────┐  ┌────────────┐  ┌────────────┐          │
│  │   Starter  │  │    Pro     │  │ Enterprise │          │  ← Pricing
│  │   $29/mo   │  │   $79/mo   │  │  Custom    │          │
│  │  [Get St.] │  │  [Get St.] │  │ [Contact]  │          │
│  └────────────┘  └────────────┘  └────────────┘          │
│                                                            │
├──────────────────────────────────────────────────────────┤
│                    Ready to start?                          │  ← Bottom CTA
│              [Get Started Free →]                           │
│                                                            │
├──────────────────────────────────────────────────────────┤
│  Logo                                                      │  ← Footer
│  Product · Resources · Company · Legal                     │
│  © 2026 Acme. All rights reserved.                         │
└──────────────────────────────────────────────────────────┘
```

---

## 完整页面代码

```html
<!DOCTYPE html>
<html lang="en" class="bg-white dark:bg-gray-950">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Acme — Design at the speed of thought</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    tailwind.config = {
      darkMode: 'class',
    }
  </script>
  <style>
    /* Hero gradient background */
    .hero-gradient {
      background:
        radial-gradient(ellipse 80% 60% at 50% -20%, rgb(79 70 229 / 0.08), transparent),
        radial-gradient(ellipse 60% 50% at 80% 80%, rgb(79 70 229 / 0.04), transparent);
    }
    .dark .hero-gradient {
      background:
        radial-gradient(ellipse 80% 60% at 50% -20%, rgb(99 102 241 / 0.12), transparent),
        radial-gradient(ellipse 60% 50% at 80% 80%, rgb(99 102 241 / 0.06), transparent);
    }
  </style>
</head>
<body class="min-h-screen bg-white text-gray-900 antialiased dark:bg-gray-950 dark:text-gray-100">

  <!--
  ═══════════════════════════════════════════════════════════
  1. SIMPLE NAVBAR
  ═══════════════════════════════════════════════════════════
  -->
  <header class="sticky top-0 z-40 border-b border-gray-200 bg-white/80 backdrop-blur-md
    dark:border-gray-800 dark:bg-gray-900/80">
    <div class="mx-auto flex h-14 max-w-7xl items-center gap-6 px-4 sm:px-6 lg:px-8">

      <!-- Logo -->
      <a href="#" class="flex shrink-0 items-center gap-2 text-lg font-bold text-gray-900 dark:text-white">
        <svg class="size-6 text-indigo-600 dark:text-indigo-500" fill="none" viewBox="0 0 24 24"
          stroke="currentColor" stroke-width="2" aria-hidden="true">
          <path stroke-linecap="round" stroke-linejoin="round"
            d="M3.75 6A2.25 2.25 0 016 3.75h2.25A2.25 2.25 0 0110.5 6v2.25a2.25 2.25 0 01-2.25 2.25H6a2.25 2.25 0 01-2.25-2.25V6zM3.75 15.75A2.25 2.25 0 016 13.5h2.25a2.25 2.25 0 012.25 2.25V18a2.25 2.25 0 01-2.25 2.25H6A2.25 2.25 0 013.75 18v-2.25zM13.5 6a2.25 2.25 0 012.25-2.25H18A2.25 2.25 0 0120.25 6v2.25A2.25 2.25 0 0118 10.5h-2.25a2.25 2.25 0 01-2.25-2.25V6zM13.5 15.75a2.25 2.25 0 012.25-2.25H18a2.25 2.25 0 012.25 2.25V18A2.25 2.25 0 0118 20.25h-2.25A2.25 2.25 0 0113.5 18v-2.25z" />
        </svg>
        Acme
      </a>

      <!-- Nav links -->
      <nav class="hidden items-center gap-1 sm:flex" aria-label="Main navigation">
        <a href="#features" class="rounded-lg px-3 py-1.5 text-sm font-medium text-gray-600
          transition-colors duration-150 hover:bg-gray-50 hover:text-gray-900
          dark:text-gray-400 dark:hover:bg-gray-800 dark:hover:text-gray-100
          motion-reduce:transition-none">Features</a>
        <a href="#testimonials" class="rounded-lg px-3 py-1.5 text-sm font-medium text-gray-600
          transition-colors duration-150 hover:bg-gray-50 hover:text-gray-900
          dark:text-gray-400 dark:hover:bg-gray-800 dark:hover:text-gray-100
          motion-reduce:transition-none">Testimonials</a>
        <a href="#pricing" class="rounded-lg px-3 py-1.5 text-sm font-medium text-gray-600
          transition-colors duration-150 hover:bg-gray-50 hover:text-gray-900
          dark:text-gray-400 dark:hover:bg-gray-800 dark:hover:text-gray-100
          motion-reduce:transition-none">Pricing</a>
      </nav>

      <div class="flex-1"></div>

      <!-- Theme Toggle -->
      <button type="button" aria-label="Toggle dark mode"
        class="rounded-lg p-2 text-gray-400 transition-colors duration-150
          hover:bg-gray-50 hover:text-gray-600
          dark:text-gray-500 dark:hover:bg-gray-800 dark:hover:text-gray-300
          motion-reduce:transition-none"
        onclick="document.documentElement.classList.toggle('dark')">
        <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
          <path stroke-linecap="round" stroke-linejoin="round"
            d="M21.752 15.002A9.72 9.72 0 0118 15.75c-5.385 0-9.75-4.365-9.75-9.75 0-1.33.266-2.597.748-3.752A9.753 9.753 0 003 11.25C3 16.635 7.365 21 12.75 21a9.753 9.753 0 009.002-5.998z" />
        </svg>
      </button>

      <!-- Sign in (Ghost) -->
      <a href="#"
        class="rounded-lg px-3 py-1.5 text-sm font-medium text-gray-600
          transition-colors duration-150
          hover:bg-gray-50 hover:text-gray-900
          dark:text-gray-400 dark:hover:bg-gray-800 dark:hover:text-gray-100
          motion-reduce:transition-none">
        Sign in
      </a>

      <!-- CTA (Primary) -->
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

  <main>
    <!--
    ═══════════════════════════════════════════════════════════
    2. HERO SECTION
    ═══════════════════════════════════════════════════════════
    -->
    <section class="hero-gradient px-4 pb-20 pt-16 sm:px-6 sm:pb-28 sm:pt-20 lg:px-8 lg:pb-36 lg:pt-24">
      <div class="mx-auto max-w-4xl text-center">

        <!-- Announcement Badge -->
        <div class="mb-6 inline-flex items-center gap-2 rounded-full
          bg-indigo-50 px-4 py-1.5
          inset-ring inset-ring-indigo-200/50
          dark:bg-indigo-950 dark:inset-ring-indigo-800/50">
          <span class="inline-flex items-center gap-1 rounded-full bg-indigo-600 px-2 py-0.5
            text-xs font-semibold text-white dark:bg-indigo-500">
            New
          </span>
          <span class="text-sm font-medium text-indigo-700 dark:text-indigo-300">
            Version 2.0 is here — see what's new →
          </span>
        </div>

        <!-- Headline -->
        <h1 class="text-4xl font-bold tracking-tight text-gray-900 sm:text-5xl lg:text-6xl dark:text-white">
          Design at the speed<br class="hidden sm:block" />
          of thought
        </h1>

        <!-- Subheadline -->
        <p class="mx-auto mt-6 max-w-2xl text-lg leading-relaxed text-gray-600 sm:text-xl sm:leading-relaxed dark:text-gray-400">
          Build, ship, and iterate faster than ever before.
          A platform that keeps up with your ideas — not the other way around.
        </p>

        <!-- CTAs -->
        <div class="mt-10 flex flex-col items-center justify-center gap-3 sm:flex-row sm:gap-4">
          <a href="#"
            class="inline-flex items-center gap-2 rounded-lg bg-indigo-600 px-6 py-3
              text-base font-semibold text-white
              transition-colors duration-150
              hover:bg-indigo-700
              active:scale-[0.97]
              focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600
              dark:bg-indigo-500 dark:hover:bg-indigo-400 dark:focus-visible:outline-indigo-400
              motion-reduce:transition-none">
            Get started free
            <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3" />
            </svg>
          </a>
          <a href="#"
            class="inline-flex items-center gap-2 rounded-lg px-6 py-3
              text-base font-medium text-gray-700
              transition-colors duration-150
              hover:bg-gray-100 hover:text-gray-900
              focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900
              dark:text-gray-300 dark:hover:bg-gray-800 dark:hover:text-gray-100
              dark:focus-visible:outline-gray-300
              motion-reduce:transition-none">
            <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round"
                d="M19.5 14.25v-2.625a3.375 3.375 0 00-3.375-3.375h-1.5A1.125 1.125 0 0113.5 7.125v-1.5a3.375 3.375 0 00-3.375-3.375H8.25m5.231 13.481L15 17.25m-4.5-15H5.625c-.621 0-1.125.504-1.125 1.125v16.5c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 00-9-9zm3.75 11.625a2.625 2.625 0 11-5.25 0 2.625 2.625 0 015.25 0z" />
            </svg>
            View docs
          </a>
        </div>

        <!-- Hero metrics -->
        <div class="mt-16 grid grid-cols-3 gap-8 sm:gap-12">
          <div>
            <div class="text-3xl font-bold tabular-nums text-gray-900 dark:text-white">10k+</div>
            <div class="mt-1 text-sm text-gray-500 dark:text-gray-400">Teams building</div>
          </div>
          <div>
            <div class="text-3xl font-bold tabular-nums text-gray-900 dark:text-white">99.9%</div>
            <div class="mt-1 text-sm text-gray-500 dark:text-gray-400">Uptime SLA</div>
          </div>
          <div>
            <div class="text-3xl font-bold tabular-nums text-gray-900 dark:text-white">150M+</div>
            <div class="mt-1 text-sm text-gray-500 dark:text-gray-400">API calls daily</div>
          </div>
        </div>

      </div>
    </section>

    <!--
    ═══════════════════════════════════════════════════════════
    3. FEATURES SECTION
    ═══════════════════════════════════════════════════════════
    -->
    <section id="features" class="border-t border-gray-950/5 bg-gray-50 px-4 py-20 sm:px-6 sm:py-28 lg:px-8 dark:border-white/5 dark:bg-gray-900">
      <div class="mx-auto max-w-7xl">

        <!-- Section Header -->
        <div class="mx-auto max-w-2xl text-center">
          <h2 class="text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl dark:text-white">
            Everything you need to ship
          </h2>
          <p class="mt-4 text-lg text-gray-600 dark:text-gray-400">
            Purpose-built tools that get out of your way and let you focus on what matters: building great products.
          </p>
        </div>

        <!-- Feature Cards Grid -->
        <div class="mt-16 grid gap-6 sm:grid-cols-2 lg:grid-cols-3">

          <!-- Feature 1: Speed -->
          <div class="group rounded-xl bg-white p-6
            inset-ring inset-ring-gray-950/8
            transition-colors duration-150
            hover:bg-gray-50/50 hover:inset-ring-gray-950/20
            dark:bg-gray-950 dark:inset-ring-white/10
            dark:hover:bg-gray-900 dark:hover:inset-ring-white/20
            motion-reduce:transition-none">
            <div class="flex size-11 items-center justify-center rounded-lg bg-indigo-600 dark:bg-indigo-500">
              <svg class="size-5 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round"
                  d="M3.75 13.5l10.5-11.25L12 10.5h8.25L9.75 21.75 12 13.5H3.75z" />
              </svg>
            </div>
            <h3 class="mt-5 text-base font-semibold text-gray-900 dark:text-gray-100">Lightning Fast</h3>
            <p class="mt-2 text-sm leading-relaxed text-gray-600 dark:text-gray-400">
              Sub-second build times and instant hot reload keep you in flow. No more waiting for compilation.
            </p>
          </div>

          <!-- Feature 2: Security -->
          <div class="group rounded-xl bg-white p-6
            inset-ring inset-ring-gray-950/8
            transition-colors duration-150
            hover:bg-gray-50/50 hover:inset-ring-gray-950/20
            dark:bg-gray-950 dark:inset-ring-white/10
            dark:hover:bg-gray-900 dark:hover:inset-ring-white/20
            motion-reduce:transition-none">
            <div class="flex size-11 items-center justify-center rounded-lg bg-indigo-600 dark:bg-indigo-500">
              <svg class="size-5 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round"
                  d="M9 12.75L11.25 15 15 9.75m-3-7.036A11.959 11.959 0 013.598 6 11.99 11.99 0 003 9.749c0 5.592 3.824 10.29 9 11.623 5.176-1.332 9-6.03 9-11.622 0-1.31-.21-2.571-.598-3.751h-.152c-3.196 0-6.1-1.248-8.25-3.285z" />
              </svg>
            </div>
            <h3 class="mt-5 text-base font-semibold text-gray-900 dark:text-gray-100">Enterprise Security</h3>
            <p class="mt-2 text-sm leading-relaxed text-gray-600 dark:text-gray-400">
              SOC 2 Type II certified with end-to-end encryption. Your data stays your data — always.
            </p>
          </div>

          <!-- Feature 3: Analytics -->
          <div class="group rounded-xl bg-white p-6
            inset-ring inset-ring-gray-950/8
            transition-colors duration-150
            hover:bg-gray-50/50 hover:inset-ring-gray-950/20
            dark:bg-gray-950 dark:inset-ring-white/10
            dark:hover:bg-gray-900 dark:hover:inset-ring-white/20
            motion-reduce:transition-none">
            <div class="flex size-11 items-center justify-center rounded-lg bg-indigo-600 dark:bg-indigo-500">
              <svg class="size-5 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round"
                  d="M3 13.125C3 12.504 3.504 12 4.125 12h2.25c.621 0 1.125.504 1.125 1.125v6.75C7.5 20.496 6.996 21 6.375 21h-2.25A1.125 1.125 0 013 19.875v-6.75zM9.75 8.625c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125v11.25c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 01-1.125-1.125V8.625zM16.5 4.125c0-.621.504-1.125 1.125-1.125h2.25C20.496 3 21 3.504 21 4.125v15.75c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 01-1.125-1.125V4.125z" />
              </svg>
            </div>
            <h3 class="mt-5 text-base font-semibold text-gray-900 dark:text-gray-100">Real-time Analytics</h3>
            <p class="mt-2 text-sm leading-relaxed text-gray-600 dark:text-gray-400">
              Understand user behavior with beautiful dashboards. Make data-driven decisions in real time.
            </p>
          </div>

          <!-- Feature 4: Collaboration -->
          <div class="group rounded-xl bg-white p-6
            inset-ring inset-ring-gray-950/8
            transition-colors duration-150
            hover:bg-gray-50/50 hover:inset-ring-gray-950/20
            dark:bg-gray-950 dark:inset-ring-white/10
            dark:hover:bg-gray-900 dark:hover:inset-ring-white/20
            motion-reduce:transition-none">
            <div class="flex size-11 items-center justify-center rounded-lg bg-indigo-600 dark:bg-indigo-500">
              <svg class="size-5 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round"
                  d="M18 18.72a9.094 9.094 0 003.741-.479 3 3 0 00-4.682-2.72m.94 3.198l.001.031c0 .225-.012.447-.037.666A11.944 11.944 0 0112 21c-2.17 0-4.207-.576-5.963-1.584A6.062 6.062 0 016 18.719m12 0a5.971 5.971 0 00-.941-3.197m0 0A5.995 5.995 0 0012 12.75a5.995 5.995 0 00-5.058 2.772m0 0a3 3 0 00-4.681 2.72 8.986 8.986 0 003.74.477m.94-3.197a5.971 5.971 0 00-.94 3.197M15 6.75a3 3 0 11-6 0 3 3 0 016 0zm6 3a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0zm-13.5 0a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0z" />
              </svg>
            </div>
            <h3 class="mt-5 text-base font-semibold text-gray-900 dark:text-gray-100">Real-time Collaboration</h3>
            <p class="mt-2 text-sm leading-relaxed text-gray-600 dark:text-gray-400">
              Work together with your team in real time. See changes as they happen, never conflict again.
            </p>
          </div>

          <!-- Feature 5: API First -->
          <div class="group rounded-xl bg-white p-6
            inset-ring inset-ring-gray-950/8
            transition-colors duration-150
            hover:bg-gray-50/50 hover:inset-ring-gray-950/20
            dark:bg-gray-950 dark:inset-ring-white/10
            dark:hover:bg-gray-900 dark:hover:inset-ring-white/20
            motion-reduce:transition-none">
            <div class="flex size-11 items-center justify-center rounded-lg bg-indigo-600 dark:bg-indigo-500">
              <svg class="size-5 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round"
                  d="M17.25 6.75L22.5 12l-5.25 5.25m-10.5 0L1.5 12l5.25-5.25m7.5-3l-4.5 16.5" />
              </svg>
            </div>
            <h3 class="mt-5 text-base font-semibold text-gray-900 dark:text-gray-100">API First</h3>
            <p class="mt-2 text-sm leading-relaxed text-gray-600 dark:text-gray-400">
              Everything is accessible via our REST and GraphQL APIs. Integrate with your existing stack in minutes.
            </p>
          </div>

          <!-- Feature 6: Support -->
          <div class="group rounded-xl bg-white p-6
            inset-ring inset-ring-gray-950/8
            transition-colors duration-150
            hover:bg-gray-50/50 hover:inset-ring-gray-950/20
            dark:bg-gray-950 dark:inset-ring-white/10
            dark:hover:bg-gray-900 dark:hover:inset-ring-white/20
            motion-reduce:transition-none">
            <div class="flex size-11 items-center justify-center rounded-lg bg-indigo-600 dark:bg-indigo-500">
              <svg class="size-5 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round"
                  d="M20.25 8.511c.884.284 1.5 1.128 1.5 2.097v4.286c0 1.136-.847 2.1-1.98 2.193-.34.027-.68.052-1.02.072v3.091l-3-3c-1.354 0-2.694-.055-4.02-.163a2.115 2.115 0 01-.825-.242m9.345-8.334a2.126 2.126 0 00-.476-.095 48.64 48.64 0 00-8.048 0c-1.131.094-1.976 1.057-1.976 2.192v4.286c0 .837.46 1.58 1.155 1.951m9.345-8.334V6.637c0-1.621-1.152-3.026-2.76-3.235A48.455 48.455 0 0011.25 3c-2.115 0-4.198.137-6.24.402-1.608.209-2.76 1.614-2.76 3.235v6.226c0 1.621 1.152 3.026 2.76 3.235.577.075 1.157.14 1.74.194V21l4.155-4.155" />
              </svg>
            </div>
            <h3 class="mt-5 text-base font-semibold text-gray-900 dark:text-gray-100">World-class Support</h3>
            <p class="mt-2 text-sm leading-relaxed text-gray-600 dark:text-gray-400">
              Average response time under 2 minutes. Real humans, real help — available 24/7 when you need it.
            </p>
          </div>

        </div>
      </div>
    </section>

    <!--
    ═══════════════════════════════════════════════════════════
    4. SOCIAL PROOF / LOGO CLOUD
    ═══════════════════════════════════════════════════════════
    -->
    <section class="border-t border-gray-950/5 px-4 py-16 sm:px-6 sm:py-20 lg:px-8 dark:border-white/5">
      <div class="mx-auto max-w-7xl text-center">
        <p class="text-sm font-medium text-gray-500 dark:text-gray-400">
          Trusted by 10,000+ teams worldwide
        </p>
        <div class="mt-8 flex flex-wrap items-center justify-center gap-x-12 gap-y-6 opacity-50 grayscale">
          <!-- Placeholder logos — replace with real SVG logos -->
          <span class="text-xl font-bold text-gray-400 dark:text-gray-500">Stripe</span>
          <span class="text-xl font-bold text-gray-400 dark:text-gray-500">Vercel</span>
          <span class="text-xl font-bold text-gray-400 dark:text-gray-500">Notion</span>
          <span class="text-xl font-bold text-gray-400 dark:text-gray-500">Linear</span>
          <span class="text-xl font-bold text-gray-400 dark:text-gray-500">GitHub</span>
          <span class="text-xl font-bold text-gray-400 dark:text-gray-500">Figma</span>
        </div>
      </div>
    </section>

    <!--
    ═══════════════════════════════════════════════════════════
    5. TESTIMONIALS
    ═══════════════════════════════════════════════════════════
    -->
    <section id="testimonials" class="border-t border-gray-950/5 bg-gray-50 px-4 py-20 sm:px-6 sm:py-28 lg:px-8 dark:border-white/5 dark:bg-gray-900">
      <div class="mx-auto max-w-7xl">

        <!-- Section Header -->
        <div class="mx-auto max-w-2xl text-center">
          <h2 class="text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl dark:text-white">
            Loved by product teams
          </h2>
          <p class="mt-4 text-lg text-gray-600 dark:text-gray-400">
            Don't take our word for it. Here's what our customers have to say.
          </p>
        </div>

        <!-- Testimonial Cards -->
        <div class="mt-16 grid gap-8 lg:grid-cols-3">

          <!-- Testimonial 1 -->
          <blockquote class="rounded-xl bg-white p-6
            inset-ring inset-ring-gray-950/8
            dark:bg-gray-950 dark:inset-ring-white/10">
            <div class="flex items-center gap-1">
              <!-- Stars -->
              <svg class="size-4 text-amber-400" fill="currentColor" viewBox="0 0 20 20" aria-hidden="true"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" /></svg>
              <svg class="size-4 text-amber-400" fill="currentColor" viewBox="0 0 20 20" aria-hidden="true"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" /></svg>
              <svg class="size-4 text-amber-400" fill="currentColor" viewBox="0 0 20 20" aria-hidden="true"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" /></svg>
              <svg class="size-4 text-amber-400" fill="currentColor" viewBox="0 0 20 20" aria-hidden="true"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" /></svg>
              <svg class="size-4 text-amber-400" fill="currentColor" viewBox="0 0 20 20" aria-hidden="true"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" /></svg>
            </div>
            <p class="mt-4 text-sm leading-relaxed text-gray-700 dark:text-gray-300">
              "Switching to Acme cut our release cycle from 2 weeks to 2 days. The developer experience is unmatched — our team actually enjoys deploying now."
            </p>
            <footer class="mt-4 flex items-center gap-3 border-t border-gray-950/5 pt-4 dark:border-white/5">
              <div class="flex size-9 items-center justify-center rounded-full bg-indigo-100 text-sm font-semibold text-indigo-700 dark:bg-indigo-900 dark:text-indigo-300">SC</div>
              <div>
                <div class="text-sm font-semibold text-gray-900 dark:text-gray-100">Sarah Chen</div>
                <div class="text-xs text-gray-500 dark:text-gray-400">CTO at Horizon</div>
              </div>
            </footer>
          </blockquote>

          <!-- Testimonial 2 -->
          <blockquote class="rounded-xl bg-white p-6
            inset-ring inset-ring-gray-950/8
            dark:bg-gray-950 dark:inset-ring-white/10">
            <div class="flex items-center gap-1">
              <svg class="size-4 text-amber-400" fill="currentColor" viewBox="0 0 20 20" aria-hidden="true"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" /></svg>
              <svg class="size-4 text-amber-400" fill="currentColor" viewBox="0 0 20 20" aria-hidden="true"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" /></svg>
              <svg class="size-4 text-amber-400" fill="currentColor" viewBox="0 0 20 20" aria-hidden="true"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" /></svg>
              <svg class="size-4 text-amber-400" fill="currentColor" viewBox="0 0 20 20" aria-hidden="true"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" /></svg>
              <svg class="size-4 text-amber-400" fill="currentColor" viewBox="0 0 20 20" aria-hidden="true"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" /></svg>
            </div>
            <p class="mt-4 text-sm leading-relaxed text-gray-700 dark:text-gray-300">
              "The analytics are a game-changer. We finally understand how our users behave. Migration from our old stack took just one afternoon."
            </p>
            <footer class="mt-4 flex items-center gap-3 border-t border-gray-950/5 pt-4 dark:border-white/5">
              <div class="flex size-9 items-center justify-center rounded-full bg-emerald-100 text-sm font-semibold text-emerald-700 dark:bg-emerald-900 dark:text-emerald-300">MK</div>
              <div>
                <div class="text-sm font-semibold text-gray-900 dark:text-gray-100">Marcus Kim</div>
                <div class="text-xs text-gray-500 dark:text-gray-400">VP Engineering at Stellar</div>
              </div>
            </footer>
          </blockquote>

          <!-- Testimonial 3 -->
          <blockquote class="rounded-xl bg-white p-6
            inset-ring inset-ring-gray-950/8
            dark:bg-gray-950 dark:inset-ring-white/10">
            <div class="flex items-center gap-1">
              <svg class="size-4 text-amber-400" fill="currentColor" viewBox="0 0 20 20" aria-hidden="true"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" /></svg>
              <svg class="size-4 text-amber-400" fill="currentColor" viewBox="0 0 20 20" aria-hidden="true"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" /></svg>
              <svg class="size-4 text-amber-400" fill="currentColor" viewBox="0 0 20 20" aria-hidden="true"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" /></svg>
              <svg class="size-4 text-amber-400" fill="currentColor" viewBox="0 0 20 20" aria-hidden="true"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" /></svg>
              <svg class="size-4 text-amber-400" fill="currentColor" viewBox="0 0 20 20" aria-hidden="true"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" /></svg>
            </div>
            <p class="mt-4 text-sm leading-relaxed text-gray-700 dark:text-gray-300">
              "We evaluated 12 platforms before choosing Acme. The API design is so clean our interns were productive on day one. Can't recommend it enough."
            </p>
            <footer class="mt-4 flex items-center gap-3 border-t border-gray-950/5 pt-4 dark:border-white/5">
              <div class="flex size-9 items-center justify-center rounded-full bg-amber-100 text-sm font-semibold text-amber-700 dark:bg-amber-900 dark:text-amber-300">JP</div>
              <div>
                <div class="text-sm font-semibold text-gray-900 dark:text-gray-100">Julia Park</div>
                <div class="text-xs text-gray-500 dark:text-gray-400">Lead Engineer at Meridian</div>
              </div>
            </footer>
          </blockquote>

        </div>
      </div>
    </section>

    <!--
    ═══════════════════════════════════════════════════════════
    6. PRICING
    ═══════════════════════════════════════════════════════════
    -->
    <section id="pricing" class="border-t border-gray-950/5 px-4 py-20 sm:px-6 sm:py-28 lg:px-8 dark:border-white/5">
      <div class="mx-auto max-w-7xl">

        <!-- Section Header -->
        <div class="mx-auto max-w-2xl text-center">
          <h2 class="text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl dark:text-white">
            Simple, transparent pricing
          </h2>
          <p class="mt-4 text-lg text-gray-600 dark:text-gray-400">
            Start for free. Upgrade when you're ready. No hidden fees, no surprises.
          </p>
        </div>

        <!-- Pricing Cards -->
        <div class="mt-16 grid gap-8 lg:grid-cols-3">

          <!-- Plan 1: Starter -->
          <div class="flex flex-col rounded-xl bg-white p-6
            inset-ring inset-ring-gray-950/8
            dark:bg-gray-950 dark:inset-ring-white/10">
            <div>
              <h3 class="text-base font-semibold text-gray-900 dark:text-gray-100">Starter</h3>
              <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">For individuals and small projects.</p>
              <div class="mt-4">
                <span class="text-4xl font-bold tabular-nums text-gray-900 dark:text-white">$29</span>
                <span class="text-sm text-gray-500 dark:text-gray-400">/month</span>
              </div>
            </div>
            <ul class="mt-8 flex-1 space-y-3 text-sm text-gray-600 dark:text-gray-400" role="list">
              <li class="flex items-center gap-2">
                <svg class="size-4 shrink-0 text-emerald-500" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" /></svg>
                Up to 5 team members
              </li>
              <li class="flex items-center gap-2">
                <svg class="size-4 shrink-0 text-emerald-500" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" /></svg>
                10 GB storage
              </li>
              <li class="flex items-center gap-2">
                <svg class="size-4 shrink-0 text-emerald-500" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" /></svg>
                Basic analytics
              </li>
              <li class="flex items-center gap-2">
                <svg class="size-4 shrink-0 text-emerald-500" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" /></svg>
                Email support
              </li>
            </ul>
            <a href="#"
              class="mt-8 inline-flex items-center justify-center rounded-lg
                bg-indigo-600 px-4 py-2.5
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

          <!-- Plan 2: Pro (Highlighted) -->
          <div class="flex flex-col rounded-xl bg-white p-6
            inset-ring-2 inset-ring-indigo-600
            relative
            dark:bg-gray-950 dark:inset-ring-indigo-500">
            <div class="absolute -top-3 left-1/2 -translate-x-1/2">
              <span class="inline-flex items-center rounded-full bg-indigo-600 px-3 py-1 text-xs font-semibold text-white dark:bg-indigo-500">
                Most popular
              </span>
            </div>
            <div>
              <h3 class="text-base font-semibold text-gray-900 dark:text-gray-100">Pro</h3>
              <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">For growing teams and businesses.</p>
              <div class="mt-4">
                <span class="text-4xl font-bold tabular-nums text-gray-900 dark:text-white">$79</span>
                <span class="text-sm text-gray-500 dark:text-gray-400">/month</span>
              </div>
            </div>
            <ul class="mt-8 flex-1 space-y-3 text-sm text-gray-600 dark:text-gray-400" role="list">
              <li class="flex items-center gap-2">
                <svg class="size-4 shrink-0 text-emerald-500" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" /></svg>
                Up to 50 team members
              </li>
              <li class="flex items-center gap-2">
                <svg class="size-4 shrink-0 text-emerald-500" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" /></svg>
                100 GB storage
              </li>
              <li class="flex items-center gap-2">
                <svg class="size-4 shrink-0 text-emerald-500" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" /></svg>
                Advanced analytics
              </li>
              <li class="flex items-center gap-2">
                <svg class="size-4 shrink-0 text-emerald-500" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" /></svg>
                Priority support
              </li>
              <li class="flex items-center gap-2">
                <svg class="size-4 shrink-0 text-emerald-500" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" /></svg>
                Custom integrations
              </li>
            </ul>
            <a href="#"
              class="mt-8 inline-flex items-center justify-center rounded-lg
                bg-indigo-600 px-4 py-2.5
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

          <!-- Plan 3: Enterprise -->
          <div class="flex flex-col rounded-xl bg-white p-6
            inset-ring inset-ring-gray-950/8
            dark:bg-gray-950 dark:inset-ring-white/10">
            <div>
              <h3 class="text-base font-semibold text-gray-900 dark:text-gray-100">Enterprise</h3>
              <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">For large organizations with advanced needs.</p>
              <div class="mt-4">
                <span class="text-4xl font-bold tabular-nums text-gray-900 dark:text-white">Custom</span>
              </div>
            </div>
            <ul class="mt-8 flex-1 space-y-3 text-sm text-gray-600 dark:text-gray-400" role="list">
              <li class="flex items-center gap-2">
                <svg class="size-4 shrink-0 text-emerald-500" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" /></svg>
                Unlimited team members
              </li>
              <li class="flex items-center gap-2">
                <svg class="size-4 shrink-0 text-emerald-500" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" /></svg>
                Unlimited storage
              </li>
              <li class="flex items-center gap-2">
                <svg class="size-4 shrink-0 text-emerald-500" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" /></svg>
                Custom analytics
              </li>
              <li class="flex items-center gap-2">
                <svg class="size-4 shrink-0 text-emerald-500" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" /></svg>
                Dedicated support
              </li>
              <li class="flex items-center gap-2">
                <svg class="size-4 shrink-0 text-emerald-500" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" /></svg>
                SSO / SAML
              </li>
            </ul>
            <a href="#"
              class="mt-8 inline-flex items-center justify-center rounded-lg
                px-4 py-2.5
                text-sm font-semibold text-gray-700
                transition-colors duration-150
                hover:bg-gray-100 hover:text-gray-900
                inset-ring inset-ring-gray-950/8
                dark:text-gray-300 dark:hover:bg-gray-800 dark:hover:text-gray-100
                dark:inset-ring-white/10
                focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900
                dark:focus-visible:outline-gray-300
                motion-reduce:transition-none">
              Contact sales
            </a>
          </div>

        </div>
      </div>
    </section>

    <!--
    ═══════════════════════════════════════════════════════════
    7. BOTTOM CTA
    ═══════════════════════════════════════════════════════════
    -->
    <section class="border-t border-gray-950/5 bg-gray-50 px-4 py-20 sm:px-6 sm:py-28 lg:px-8 dark:border-white/5 dark:bg-gray-900">
      <div class="mx-auto max-w-2xl text-center">
        <h2 class="text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl dark:text-white">
          Ready to get started?
        </h2>
        <p class="mt-4 text-lg text-gray-600 dark:text-gray-400">
          Join 10,000+ teams already building with Acme. Start your free trial today.
        </p>
        <div class="mt-10 flex flex-col items-center justify-center gap-3 sm:flex-row sm:gap-4">
          <a href="#"
            class="inline-flex items-center gap-2 rounded-lg bg-indigo-600 px-6 py-3
              text-base font-semibold text-white
              transition-colors duration-150
              hover:bg-indigo-700
              active:scale-[0.97]
              focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600
              dark:bg-indigo-500 dark:hover:bg-indigo-400 dark:focus-visible:outline-indigo-400
              motion-reduce:transition-none">
            Start free trial
            <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3" />
            </svg>
          </a>
          <a href="#"
            class="inline-flex items-center gap-2 rounded-lg px-6 py-3
              text-base font-medium text-gray-700
              transition-colors duration-150
              hover:bg-gray-100 hover:text-gray-900
              dark:text-gray-300 dark:hover:bg-gray-800 dark:hover:text-gray-100
              motion-reduce:transition-none">
            Talk to sales
          </a>
        </div>
      </div>
    </section>

  </main>

  <!--
  ═══════════════════════════════════════════════════════════
  8. FOOTER
  ═══════════════════════════════════════════════════════════
  -->
  <footer class="border-t border-gray-950/5 bg-white px-4 py-12 sm:px-6 lg:px-8 dark:border-white/5 dark:bg-gray-950" role="contentinfo">
    <div class="mx-auto max-w-7xl">

      <div class="grid gap-8 sm:grid-cols-2 lg:grid-cols-5">

        <!-- Brand Column -->
        <div class="lg:col-span-2">
          <a href="#" class="flex items-center gap-2 text-lg font-bold text-gray-900 dark:text-white">
            <svg class="size-6 text-indigo-600 dark:text-indigo-500" fill="none" viewBox="0 0 24 24"
              stroke="currentColor" stroke-width="2" aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round"
                d="M3.75 6A2.25 2.25 0 016 3.75h2.25A2.25 2.25 0 0110.5 6v2.25a2.25 2.25 0 01-2.25 2.25H6a2.25 2.25 0 01-2.25-2.25V6zM3.75 15.75A2.25 2.25 0 016 13.5h2.25a2.25 2.25 0 012.25 2.25V18a2.25 2.25 0 01-2.25 2.25H6A2.25 2.25 0 013.75 18v-2.25zM13.5 6a2.25 2.25 0 012.25-2.25H18A2.25 2.25 0 0120.25 6v2.25A2.25 2.25 0 0118 10.5h-2.25a2.25 2.25 0 01-2.25-2.25V6zM13.5 15.75a2.25 2.25 0 012.25-2.25H18a2.25 2.25 0 012.25 2.25V18A2.25 2.25 0 0118 20.25h-2.25A2.25 2.25 0 0113.5 18v-2.25z" />
            </svg>
            Acme
          </a>
          <p class="mt-3 max-w-xs text-sm text-gray-500 dark:text-gray-400">
            Build, ship, and iterate faster than ever before. Designed for product teams who refuse to compromise.
          </p>
        </div>

        <!-- Product Links -->
        <div>
          <h3 class="text-sm font-semibold text-gray-900 dark:text-gray-100">Product</h3>
          <ul class="mt-4 space-y-3" role="list">
            <li><a href="#" class="text-sm text-gray-500 transition-colors duration-150 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200 motion-reduce:transition-none">Features</a></li>
            <li><a href="#" class="text-sm text-gray-500 transition-colors duration-150 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200 motion-reduce:transition-none">Pricing</a></li>
            <li><a href="#" class="text-sm text-gray-500 transition-colors duration-150 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200 motion-reduce:transition-none">Changelog</a></li>
            <li><a href="#" class="text-sm text-gray-500 transition-colors duration-150 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200 motion-reduce:transition-none">Integrations</a></li>
          </ul>
        </div>

        <!-- Resources Links -->
        <div>
          <h3 class="text-sm font-semibold text-gray-900 dark:text-gray-100">Resources</h3>
          <ul class="mt-4 space-y-3" role="list">
            <li><a href="#" class="text-sm text-gray-500 transition-colors duration-150 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200 motion-reduce:transition-none">Documentation</a></li>
            <li><a href="#" class="text-sm text-gray-500 transition-colors duration-150 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200 motion-reduce:transition-none">API Reference</a></li>
            <li><a href="#" class="text-sm text-gray-500 transition-colors duration-150 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200 motion-reduce:transition-none">Blog</a></li>
            <li><a href="#" class="text-sm text-gray-500 transition-colors duration-150 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200 motion-reduce:transition-none">Community</a></li>
          </ul>
        </div>

        <!-- Company Links -->
        <div>
          <h3 class="text-sm font-semibold text-gray-900 dark:text-gray-100">Company</h3>
          <ul class="mt-4 space-y-3" role="list">
            <li><a href="#" class="text-sm text-gray-500 transition-colors duration-150 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200 motion-reduce:transition-none">About</a></li>
            <li><a href="#" class="text-sm text-gray-500 transition-colors duration-150 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200 motion-reduce:transition-none">Careers</a></li>
            <li><a href="#" class="text-sm text-gray-500 transition-colors duration-150 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200 motion-reduce:transition-none">Privacy</a></li>
            <li><a href="#" class="text-sm text-gray-500 transition-colors duration-150 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200 motion-reduce:transition-none">Terms</a></li>
          </ul>
        </div>

      </div>

      <!-- Bottom Bar -->
      <div class="mt-12 border-t border-gray-950/5 pt-8 dark:border-white/5">
        <p class="text-center text-xs text-gray-400 dark:text-gray-500">
          &copy; 2026 Acme. All rights reserved.
        </p>
      </div>

    </div>
  </footer>

  <!--
  ═══════════════════════════════════════════════════════════
  DARK MODE TOGGLE SCRIPT
  ═══════════════════════════════════════════════════════════
  -->
  <script>
    // Simple dark mode toggle
    document.querySelector('[aria-label="Toggle dark mode"]').addEventListener('click', () => {
      document.documentElement.classList.toggle('dark');
    });
  </script>

</body>
</html>
```

---

## 布局分解

### 页面结构（8 个 Section）

| # | Section | 背景 | 用途 |
|---|---------|------|------|
| 1 | **Simple Navbar** | `bg-white/80 backdrop-blur-md` | 毛玻璃导航，sticky 顶部 |
| 2 | **Hero** | `hero-gradient`（品牌放射渐变） | 标题 + 描述 + CTA + 指标 |
| 3 | **Features** | `bg-gray-50` | 6 张 Feature Card，3 列 Grid |
| 4 | **Social Proof** | `bg-white` | Logo Cloud + 信任文字 |
| 5 | **Testimonials** | `bg-gray-50` | 3 列引用卡片 |
| 6 | **Pricing** | `bg-white` | 3 档定价卡片 |
| 7 | **Bottom CTA** | `bg-gray-50` | 行动号召 + Secondary CTA |
| 8 | **Footer** | `bg-white` | 5 列链接 + 版权 |

### 背景交替节奏

```
Section 1 (Navbar)  → white/80 + glass
Section 2 (Hero)    → white + brand gradient (特殊——仅 Hero 使用品牌渐变)
Section 3 (Features) → gray-50 — 从 Hero 的视觉冲击降下来
Section 4 (Logos)   → white — 短暂的白底休息
Section 5 (Testimonials) → gray-50 — 回到灰底，与 Features 呼应
Section 6 (Pricing) → white — 定价区需要白底突出卡片
Section 7 (CTA)     → gray-50 — 最后推动行动
Section 8 (Footer)  → white — 结束页面的清爽收尾
```

**规律**：`white → gray-50 → white → gray-50 → ...` 交替节奏。Hero 是唯一打破此规律的区域（使用品牌渐变）。

### Hero 区域

| 元素 | 字号 | 颜色 | 说明 |
|------|------|------|------|
| Announcement Badge | `text-xs/text-sm` | `indigo-50` 背景 + `indigo-700` 文字 | 胶囊型公告条 |
| Headline | `text-4xl` → `text-6xl` | `gray-900` / `white` | 响应式渐进放大 |
| Subheadline | `text-lg` → `text-xl` | `gray-600` / `gray-400` | 最大宽度 `max-w-2xl` |
| Primary CTA | `text-base font-semibold` | `indigo-600` / `indigo-500` | 右箭头图标强调行动 |
| Secondary CTA | `text-base font-medium` | Ghost 样式 | View docs |
| Metrics | `text-3xl font-bold tabular-nums` | 3 列 + 描述文字 | 社会证明 |

**Hero 背景渐变**：
```css
.hero-gradient {
  background:
    radial-gradient(ellipse 80% 60% at 50% -20%, rgb(79 70 229 / 0.08), transparent),
    radial-gradient(ellipse 60% 50% at 80% 80%, rgb(79 70 229 / 0.04), transparent);
}
```
- 使用品牌色 `indigo-600` 的极低透明度放射渐变
- 不引入新颜色——品牌色延伸
- 暗色模式降半透明度以获得足够的视觉深度

### Feature Cards Grid

| 断点 | 列数 | 代码 |
|------|------|------|
| Mobile | 1 列 | 默认 |
| Tablet | 2 列 | `sm:grid-cols-2` |
| Desktop | 3 列 | `lg:grid-cols-3` |

Feature Card 直接复用 [Card Feature 变体](../components/card.md#2-feature-card特性卡片)，无修改。

### Pricing Cards

| 属性 | Starter / Enterprise | Pro (Highlighted) |
|------|---------------------|-------------------|
| 描边 | `inset-ring-gray-950/8` | `inset-ring-2 inset-ring-indigo-600` |
| Badge | 无 | "Most popular" 胶囊浮于卡片顶部边缘 |
| CTA | Solid Primary | Solid Primary |
| Enterprise CTA | `inset-ring` outline | 非 Primary——购买路径不同 |

Pro 卡片使用 `ring-2` + 品牌色——这是系统中唯一的非-1px ring，传达"推荐选择"。

### Footer

| 属性 | 值 |
|------|-----|
| 列数 | 5 列（Brand 占 2 列 + 3 个链接组） |
| 移动端 | 2 列 → 单列 |
| 链接颜色 | `text-gray-500` → hover `text-gray-900` |
| 版权 | `text-xs text-gray-400` 居中 |
| 分隔线 | `border-t border-gray-950/5` |

### 组件清单

| 模板位置 | 使用的组件 | 变体 | 说明 |
|---------|----------|------|------|
| 顶部导航 | Navbar | Simple | 毛玻璃 + Logo + 4 链接 + CTA |
| Hero CTA | Button | Solid Primary + Ghost | 主次 CTA 并排 |
| Hero Badge | Badge | Solid Accent | "New" 标签 + 版本公告 |
| 特性卡片 × 6 | Card | Feature | `size-11` icon + title + desc |
| Testimonial 卡片 × 3 | Card | Base（无 hover） | 引用内容 + 星级 + 头像 |
| Pricing 卡片 × 3 | Card | Base + Highlighted | Starter/Enterprise 用 Base，Pro 用 Highlighted |
| Bottom CTA | Button | Solid Primary + Ghost | Hero CTA 的弱化重复 |
| Footer | Footer | Base | 5 列链接网格 + 品牌区 + 版权 |

---

## 响应式行为

| 断点 | 布局变化 |
|------|---------|
| Default (< 640px) | 单列——Hero CTA 堆叠，Features 单列，Pricing 单列，Footer 2 列 |
| sm (≥ 640px) | Hero CTA 并排，Features 2 列，Footer 2 列，Headline 放大至 5xl |
| lg (≥ 1024px) | Features/Pricing/Testimonials 3 列，Footer 5 列，Nav 链接显示 |
| xl (≥ 1280px) | `max-w-7xl` 容器居中，最大内容宽度 |

### 移动端特殊处理

- **Navbar**: `sm:` 以下隐藏导航链接，仅显示 Logo + 暗色切换 + CTA
- **Hero Metrics**: 始终 3 列（`grid-cols-3`）——数字足够窄
- **Pricing**: 单列堆叠，Pro 高亮卡片的 `ring-2` 在窄屏同样有效
- **Footer**: 2 列网格 → 手机上可读

---

## 可扩展点

1. **导航移动端菜单** — 添加 Hamburger 按钮 + 滑出菜单（可参照 [Sidebar Mobile Overlay](../components/sidebar.md#3-mobile-overlay移动端覆盖) 的 JS 模式）
2. **定价切换** — 添加 Monthly/Yearly Toggle，切换价格（复用 [Toggle](../components/toggle.md) 组件）
3. **真实 Logo** — 替换 Logo Cloud 的文字占位为真实 SVG Logo
4. **动画 Hero** — 添加 CSS 动画或 Lottie 插画
5. **FAQ Section** — 在 Pricing 和 Footer 之间添加手风琴 FAQ
6. **Newsletter Signup** — Footer 中添加 Email Input + Subscribe Button

---

## 与 Dashboard 模板的对比

| 维度 | Dashboard | Landing Page |
|------|-----------|-------------|
| 目标用户 | 已登录用户 | 潜在客户 |
| 侧边栏 | 无（后续用 Sidebar） | 无（原则七：落地页无侧边栏） |
| Navbar | 简易顶部栏 | Simple Navbar (glass) |
| 信息密度 | 高（数据密集） | 低→中递进（原则六） |
| 背景色 | 全页 `bg-gray-50` | white/gray-50 交替 |
| 品牌色 | 仅交互元素 | 交互 + Hero 渐变背景 |
| CTA 数量 | 极少（仅导出按钮等） | 每屏至少一个 CTA |
| 内容宽度 | `max-w-7xl` 全宽 | `max-w-7xl` + Hero `max-w-4xl` 居中 |

---

## 复用指南

### 何时使用此模板

| 场景 | 说明 |
|------|------|
| 新产品官网 | 完整 8-section 结构，替换文案和图片即可 |
| SaaS 产品落地页 | Feature + Pricing + CTA 是经典 SaaS 模式 |
| 开源项目主页 | 去掉 Pricing，Features + Testimonials + CTA |
| 创业公司官网 | 品牌页 + 团队介绍 |

### 何时不用此模板

| 场景 | 替代方案 |
|------|---------|
| 已登录应用 | [Dashboard](./dashboard.md) 或 [Settings](./settings.md) |
| 文档站 | 独立文档布局（TBD） |
| 单页营销（超长滚动） | 需要更多 Section + 视差效果——此模板为基础起点 |
| 电商落地页 | 需要 Product Card 网格 + 购物车——不同产品形态 |

### 快速定制指南

```
替换内容：
  1. 全局搜索 "Acme" → 替换为你的产品名
  2. 修改 Hero Headline + Subheadline
  3. 修改 6 个 Feature 的图标 + 标题 + 描述
  4. 替换 Testimonial 引用文字和人名
  5. 调整 Pricing 价格和功能列表
  6. 替换 Logo Cloud 为真实 Logo
  7. 更新 Footer 链接

保留不变：
  - 所有 Tailwind 类名（Design System 规范）
  - 背景交替节奏（white/gray-50）
  - Navbar glass 效果
  - Card Elevation 体系
  - CTA 按钮样式
  - 响应式断点策略
```

---

> **参考链接**: [Simple Navbar](../components/navbar.md#3-simple-navbar极简顶部栏) · [Feature Card](../components/card.md#2-feature-card特性卡片) · [Button](../components/button.md) · [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Elevation](../design-tokens/elevation.md)
