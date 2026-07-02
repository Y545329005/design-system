# Breadcrumb

Breadcrumb 面包屑导航，展示当前页面在网站层级中的位置，并提供返回上级的快捷导航。

> **Design Tokens**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Motion](../design-tokens/motion.md)
>
> **关联组件**: [Button](./button.md)
>
> **依赖**: 无额外依赖

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 分隔符 | `/` 斜线（`text-gray-400`） | 最简洁通用——比 `>` 或 `›` 更中性 |
| 字号 | `text-sm` (14px) | 次级导航——不抢页面标题注意力 |
| 当前页 | `text-gray-900 font-medium` + 不可点击 | 明确当前位置——与其他层级区分 |
| 上级链接 | `text-gray-500 hover:text-gray-700` | 辅助色 + hover 加深——暗示可点击 |
| 间距 | `gap-1.5` (6px) | 分隔符与链接的间距 |
| 过渡 | `transition-colors duration-150` | 仅链接 hover 颜色变化 |
| 暗色模式 | 链接 `dark:text-gray-400 dark:hover:text-gray-200`，当前 `dark:text-white` | |

---

## 变体

### 1. Base — 基础面包屑

```html
<nav aria-label="Breadcrumb" class="flex items-center gap-1.5 text-sm">
  <a href="/" class="text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-200">
    Home
  </a>
  <svg class="size-4 text-gray-400 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
    <path stroke-linecap="round" stroke-linejoin="round" d="m8.25 4.5 7.5 7.5-7.5 7.5"/>
  </svg>
  <a href="/products" class="text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-200">
    Products
  </a>
  <svg class="size-4 text-gray-400 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
    <path stroke-linecap="round" stroke-linejoin="round" d="m8.25 4.5 7.5 7.5-7.5 7.5"/>
  </svg>
  <span class="text-gray-900 font-medium dark:text-white" aria-current="page">
    Wireless Headphones
  </span>
</nav>
```

---

### 2. Slash Separator — 斜线分隔符

使用 `/` 字符作为分隔符（更紧凑，视觉更轻量）。

```html
<nav aria-label="Breadcrumb" class="flex items-center gap-1.5 text-sm">
  <a href="/" class="text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-200">
    Home
  </a>
  <span class="text-gray-400 select-none" aria-hidden="true">/</span>
  <a href="/docs" class="text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-200">
    Docs
  </a>
  <span class="text-gray-400 select-none" aria-hidden="true">/</span>
  <a href="/docs/components" class="text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-200">
    Components
  </a>
  <span class="text-gray-400 select-none" aria-hidden="true">/</span>
  <span class="text-gray-900 font-medium dark:text-white" aria-current="page">
    Breadcrumb
  </span>
</nav>
```

**设计要点：**
- `/` 使用 `aria-hidden="true"`——分隔符是纯装饰
- `select-none`——防止用户选中分隔符
- `/` 比 `›` 更现代、更中性——Vercel / Stripe Docs 风格

---

### 3. With Home Icon — 带首页图标

```html
<nav aria-label="Breadcrumb" class="flex items-center gap-1.5 text-sm">
  <a href="/" class="text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-200" aria-label="Home">
    <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
      <path stroke-linecap="round" stroke-linejoin="round" d="m2.25 12 8.954-8.955c.44-.439 1.152-.439 1.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25"/>
    </svg>
  </a>
  <span class="text-gray-400 select-none" aria-hidden="true">/</span>
  <a href="/settings" class="text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-200">
    Settings
  </a>
  <span class="text-gray-400 select-none" aria-hidden="true">/</span>
  <span class="text-gray-900 font-medium dark:text-white" aria-current="page">
    Profile
  </span>
</nav>
```

---

### 4. Mobile — 仅显示上一级（紧凑）

在移动端，只显示返回上一级的链接，省略完整路径。

```html
<!-- Mobile Breadcrumb (hidden on desktop) -->
<nav aria-label="Breadcrumb" class="flex items-center gap-1.5 text-sm lg:hidden">
  <a href="/docs/components" class="inline-flex items-center gap-1 text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-200">
    <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
      <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 19.5 8.25 12l7.5-7.5"/>
    </svg>
    Components
  </a>
</nav>

<!-- Desktop Breadcrumb (hidden on mobile) -->
<nav aria-label="Breadcrumb" class="hidden lg:flex items-center gap-1.5 text-sm">
  <a href="/" class="text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-200">Home</a>
  <span class="text-gray-400 select-none" aria-hidden="true">/</span>
  <a href="/docs" class="text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-200">Docs</a>
  <span class="text-gray-400 select-none" aria-hidden="true">/</span>
  <a href="/docs/components" class="text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-200">Components</a>
  <span class="text-gray-400 select-none" aria-hidden="true">/</span>
  <span class="text-gray-900 font-medium dark:text-white" aria-current="page">Breadcrumb</span>
</nav>
```

**设计要点：**
- 移动端只需要回到上一级——不需要完整路径
- `lg:hidden` / `hidden lg:flex`——断点切换
- 左箭头 `<` + 上级名——简单明了

---

## 截断策略（Collapsing）

路径过长时，中间层级使用 `...` 省略。

```html
<nav aria-label="Breadcrumb" class="flex items-center gap-1.5 text-sm">
  <a href="/" class="text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-200">Home</a>
  <span class="text-gray-400 select-none" aria-hidden="true">/</span>
  <!-- Collapsed middle levels -->
  <button type="button" class="text-gray-400 hover:text-gray-600 transition-colors duration-150 motion-reduce:transition-none dark:hover:text-gray-300" aria-label="Show more breadcrumb levels" title="Show path">
    …
  </button>
  <span class="text-gray-400 select-none" aria-hidden="true">/</span>
  <a href="/docs/components" class="text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-200">Components</a>
  <span class="text-gray-400 select-none" aria-hidden="true">/</span>
  <span class="text-gray-900 font-medium dark:text-white" aria-current="page">Breadcrumb</span>
</nav>
```

---

## Design Tokens

| Token | Tailwind | 值 | 说明 |
|-------|----------|-----|------|
| 字号 | `text-sm` | 14px | |
| 链接色 | `text-gray-500` | #6B7280 | |
| Hover 色 | `hover:text-gray-700` | #374151 | |
| 当前页色 | `text-gray-900` | #111827 | |
| 当前页字重 | `font-medium` | 500 | |
| 分隔符色 | `text-gray-400` | #9CA3AF | |
| 分隔符尺寸 | `size-4` | 16px | SVG 箭头 |
| 间距 | `gap-1.5` | 6px | |
| 过渡 | `transition-colors duration-150` | 150ms | |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| 语义元素 | `<nav aria-label="Breadcrumb">`——标识为面包屑导航 |
| 当前页 | `aria-current="page"`——屏幕阅读器知道当前位置 |
| 分隔符 | `aria-hidden="true"`——不朗读分隔符 |
| 链接 | `<a href>` 可导航链接 |
| 省略号按钮 | `aria-label="Show more breadcrumb levels"` |

---

## 复用指南

### 何时使用

- 页面层级 ≥ 3 级
- 内容型网站（Blog、Docs、E-commerce）
- 需要让用户知道当前位置

### 何时不用

| 场景 | 替代方案 |
|------|---------|
| 层级 ≤ 2 级 | 不需要面包屑 |
| App 内导航 | Sidebar 或 Navbar |
| 多步骤流程 | Stepper（未来组件） |
| Landing Page（单页） | 不需要 |

---

> 参考: [WAI-ARIA Breadcrumb Pattern](https://www.w3.org/WAI/ARIA/apg/patterns/breadcrumb/) · [Vercel Design — Breadcrumb](https://vercel.com/design/breadcrumb)
