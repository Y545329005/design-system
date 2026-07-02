# Footer

页面底部导航与版权区域。提供品牌信息、链接分组、版权声明——任何多页面产品的标准收尾。

> **Design Tokens**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Elevation](../design-tokens/elevation.md)
>
> **关联组件**: [Navbar](./navbar.md)（头部导航——Footer 是页面导航的对称收尾）
>
> **依赖**: 无外部依赖。纯 HTML + Tailwind CSS。

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 背景色 | `bg-white`（浅色）/ `dark:bg-gray-950`（暗色） | 与页面背景一致——Footer 是页面的一部分，不需要额外层次 |
| 顶部分隔 | `border-t border-gray-950/5` | 透明度分隔——轻量级视觉分割，不抢注意力 |
| 链接颜色 | `text-gray-500` → hover `text-gray-900` | Ghost 按钮模式——默认低调，hover 时增强 |
| 链接间距 | `space-y-3`（垂直列表）/ `gap-6`（水平网格） | 8px 网格对齐——`space-y-3` = 12px |
| 列标题 | `text-sm font-semibold text-gray-900` | 与正文同字号但加粗——足够的层次区分 |
| 移动端布局 | 2 列网格 → 单列堆叠 | Mobile First——最窄时单列，与 Navbar 对称 |
| 版权字号 | `text-xs text-gray-400` | 最小字号——版权信息重要性最低，不应抢夺注意力 |
| 品牌描述 | `max-w-xs` | 限制行宽——防止品牌描述在宽屏上过长 |

---

## 变体

### 1. Base Footer — 标准页脚

5 列网格：品牌区（占 2 列） + 3 组链接。适用：SaaS 官网、产品主页。

```html
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

      <!-- Link Group 1 -->
      <div>
        <h3 class="text-sm font-semibold text-gray-900 dark:text-gray-100">Product</h3>
        <ul class="mt-4 space-y-3" role="list">
          <li><a href="#" class="text-sm text-gray-500 transition-colors duration-150 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200 motion-reduce:transition-none">Features</a></li>
          <li><a href="#" class="text-sm text-gray-500 transition-colors duration-150 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200 motion-reduce:transition-none">Pricing</a></li>
          <li><a href="#" class="text-sm text-gray-500 transition-colors duration-150 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200 motion-reduce:transition-none">Changelog</a></li>
          <li><a href="#" class="text-sm text-gray-500 transition-colors duration-150 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200 motion-reduce:transition-none">Integrations</a></li>
        </ul>
      </div>

      <!-- Link Group 2 -->
      <div>
        <h3 class="text-sm font-semibold text-gray-900 dark:text-gray-100">Resources</h3>
        <ul class="mt-4 space-y-3" role="list">
          <li><a href="#" class="text-sm text-gray-500 transition-colors duration-150 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200 motion-reduce:transition-none">Documentation</a></li>
          <li><a href="#" class="text-sm text-gray-500 transition-colors duration-150 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200 motion-reduce:transition-none">API Reference</a></li>
          <li><a href="#" class="text-sm text-gray-500 transition-colors duration-150 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200 motion-reduce:transition-none">Blog</a></li>
          <li><a href="#" class="text-sm text-gray-500 transition-colors duration-150 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200 motion-reduce:transition-none">Community</a></li>
        </ul>
      </div>

      <!-- Link Group 3 -->
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
```

**设计要点：**
- 品牌列 `lg:col-span-2`——Logo + 描述占据更多空间，视觉上更重的左侧锚点
- 链接列标题 `font-semibold`——与链接文字的 `font-normal` 形成层次
- 底部版权 `text-center`——居中为页面提供最终的对称感
- 品牌描述 `max-w-xs`——限制行宽，防止在大屏上变成单行长文本
- 链接 hover 从 `text-gray-500` → `text-gray-900`——Ghost 模式，与 Navbar 链接一致

---

### 2. Compact Footer — 紧凑页脚

2 列布局，仅品牌 + 链接。适用：Dashboard 页脚、文档站、简单应用。

```html
<footer class="border-t border-gray-950/5 bg-white px-4 py-10 sm:px-6 lg:px-8 dark:border-white/5 dark:bg-gray-950" role="contentinfo">
  <div class="mx-auto flex max-w-7xl flex-col items-center justify-between gap-4 sm:flex-row">

    <!-- Logo + Copyright -->
    <div class="flex items-center gap-4">
      <a href="#" class="text-sm font-semibold text-gray-900 dark:text-gray-100">Acme</a>
      <span class="text-xs text-gray-400 dark:text-gray-500">&copy; 2026</span>
    </div>

    <!-- Links -->
    <nav class="flex items-center gap-6" aria-label="Footer navigation">
      <a href="#" class="text-sm text-gray-500 transition-colors duration-150 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200 motion-reduce:transition-none">Privacy</a>
      <a href="#" class="text-sm text-gray-500 transition-colors duration-150 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200 motion-reduce:transition-none">Terms</a>
      <a href="#" class="text-sm text-gray-500 transition-colors duration-150 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200 motion-reduce:transition-none">Status</a>
    </nav>

  </div>
</footer>
```

**设计要点：**
- 单行布局——Logo + 版权 左对齐，链接右对齐
- 无列标题——链接直接暴露，适用于少量链接
- `py-10`（40px）比 Base `py-12`（48px）更紧凑
- 适合已登录状态的 Dashboard 或 Settings 页面

---

### 3. Simple Footer — 极简页脚

居中单列，仅品牌 + 版权。适用：Blog、个人站、最简页面。

```html
<footer class="border-t border-gray-950/5 bg-white px-4 py-8 dark:border-white/5 dark:bg-gray-950" role="contentinfo">
  <div class="mx-auto max-w-7xl text-center">

    <!-- Logo -->
    <a href="#" class="inline-flex items-center gap-2 text-base font-bold text-gray-900 dark:text-white">
      <svg class="size-5 text-indigo-600 dark:text-indigo-500" fill="none" viewBox="0 0 24 24"
        stroke="currentColor" stroke-width="2" aria-hidden="true">
        <path stroke-linecap="round" stroke-linejoin="round"
          d="M3.75 6A2.25 2.25 0 016 3.75h2.25A2.25 2.25 0 0110.5 6v2.25a2.25 2.25 0 01-2.25 2.25H6a2.25 2.25 0 01-2.25-2.25V6zM3.75 15.75A2.25 2.25 0 016 13.5h2.25a2.25 2.25 0 012.25 2.25V18a2.25 2.25 0 01-2.25 2.25H6A2.25 2.25 0 013.75 18v-2.25zM13.5 6a2.25 2.25 0 012.25-2.25H18A2.25 2.25 0 0120.25 6v2.25A2.25 2.25 0 0118 10.5h-2.25a2.25 2.25 0 01-2.25-2.25V6zM13.5 15.75a2.25 2.25 0 012.25-2.25H18a2.25 2.25 0 012.25 2.25V18A2.25 2.25 0 0118 20.25h-2.25A2.25 2.25 0 0113.5 18v-2.25z" />
      </svg>
      Acme
    </a>

    <!-- Copyright -->
    <p class="mt-4 text-xs text-gray-400 dark:text-gray-500">
      &copy; 2026 Acme. All rights reserved.
    </p>

  </div>
</footer>
```

**设计要点：**
- `py-8`（32px）——最紧凑的内边距
- 无链接列表——仅品牌和版权
- 所有内容居中——对称、安静地收尾
- Logo 字号 `text-base`——比 Base 的 `text-lg` 小一档，匹配页脚的轻微感

---

## 元素总览

| 元素 | 字号 | 字重 | 颜色 (Light) | 颜色 (Dark) | 特殊样式 |
|------|------|------|-------------|------------|---------|
| Footer 容器 | — | — | `bg-white` | `dark:bg-gray-950` | `border-t border-gray-950/5` |
| 列标题 | `text-sm` (14px) | `font-semibold` (600) | `text-gray-900` | `text-gray-100` | — |
| 链接 (Default) | `text-sm` (14px) | `font-normal` (400) | `text-gray-500` | `text-gray-400` | `transition-colors duration-150` |
| 链接 (Hover) | `text-sm` | `font-normal` | `text-gray-900` | `text-gray-200` | — |
| 品牌描述 | `text-sm` (14px) | `font-normal` (400) | `text-gray-500` | `text-gray-400` | `max-w-xs` |
| Logo 文字 (Base) | `text-lg` (18px) | `font-bold` (700) | `text-gray-900` | `text-white` | — |
| Logo 文字 (Compact) | `text-sm` (14px) | `font-semibold` (600) | `text-gray-900` | `text-gray-100` | — |
| Logo 文字 (Simple) | `text-base` (16px) | `font-bold` (700) | `text-gray-900` | `text-white` | — |
| Logo 图标 | `size-5/6` | — | `text-indigo-600` | `text-indigo-500` | `shrink-0` |
| 版权文字 | `text-xs` (12px) | `font-normal` (400) | `text-gray-400` | `text-gray-500` | `text-center` |
| 上下分隔线 | — | — | `border-gray-950/5` | `border-white/5` | `border-t` |

---

## 尺寸

| 变体 | 内边距 (y) | 布局 | 最大宽度 | 列数 | 适用 |
|------|-----------|------|---------|------|------|
| **Base** | `py-12` (48px) | Grid | `max-w-7xl` | 5 列 (lg) → 2 列 (sm) → 1 列 | SaaS 官网、产品主页 |
| **Compact** | `py-10` (40px) | Flex row | `max-w-7xl` | 单行 (Logo + 版权 + 链接) | Dashboard、文档站 |
| **Simple** | `py-8` (32px) | 居中单列 | `max-w-7xl` | 1 列 | Blog、个人站 |

---

## Design Tokens

| Token | Light | Dark | Tailwind | 说明 |
|-------|-------|------|----------|------|
| `footer-bg` | `white` | `gray-950` | `bg-white dark:bg-gray-950` | Footer 背景——与页面一致 |
| `footer-border` | `gray-950/5` | `white/5` | `border-gray-950/5 dark:border-white/5` | 顶部分隔线 + 版权上分隔 |
| `footer-link` | `gray-500` | `gray-400` | `text-gray-500 dark:text-gray-400` | 链接默认色 |
| `footer-link-hover` | `gray-900` | `gray-200` | `hover:text-gray-900 dark:hover:text-gray-200` | 链接 hover |
| `footer-heading` | `gray-900` | `gray-100` | `text-gray-900 dark:text-gray-100` | 列标题 |
| `footer-copyright` | `gray-400` | `gray-500` | `text-gray-400 dark:text-gray-500` | 版权文字 |
| `footer-logo-icon` | `indigo-600` | `indigo-500` | `text-indigo-600 dark:text-indigo-500` | Logo 图标 |
| `footer-logo-text` | `gray-900` | `white` | `text-gray-900 dark:text-white` | Logo 文字（Base/Simple） |
| `footer-description` | `gray-500` | `gray-400` | `text-gray-500 dark:text-gray-400` | 品牌描述文字 |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| 语义角色 | `role="contentinfo"` — 标识为页面页脚 |
| 导航标签 | `aria-label="Footer navigation"` 用于链接组 `<nav>` |
| 链接列表 | `role="list"` — 明确标识列表结构 |
| 对比度 | `text-gray-500` (#6b7280) : `bg-white` (#fff) = 3.91:1（非交互文字达到 ≥ 3:1 大文字标准） |
| 链接 hover 对比 | `text-gray-900` (#111827) : `bg-white` = 16.75:1 ✅ |
| Focus 可见 | 所有链接继承全局 `focus-visible:outline-2` 策略 |
| 键盘导航 | 链接为原生 `<a>` — 完整 Tab/Enter 支持 |
| 动画 | `motion-reduce:transition-none` |

---

## 复用指南

### 何时使用 Footer

| 场景 | 变体 | 说明 |
|------|------|------|
| SaaS 官网 / 产品主页 | Base | 完整 5 列——最多链接，最全信息 |
| 多页面应用 / 复杂产品 | Base | 用户需要完整的导航入口 |
| Dashboard / Settings | Compact | 已登录状态——少量必要链接 |
| 文档站 | Compact | 单行——不抢文档内容注意力 |
| Blog / 个人站 | Simple | 极简——安静收尾 |
| Landing Page 底部 | Base 或 Compact | 根据链接数量选择 |

### 何时不用 Footer

| 场景 | 替代方案 | 原因 |
|------|---------|------|
| 单页全屏应用 | 无 Footer | 全屏 App 没有"页面底部"概念 |
| 移动端优先且链接极多 | Base → 手风琴折叠 | 移动端 5 列全部展开过长 |
| Dashboard（极简版） | 无 Footer 或 Simple | Sidebar + Navbar 已提供导航 |

### 组合规则

```
✅ Footer 在 <main> 之后、</body> 之前    → 语义正确的页面收尾
✅ Footer 在页面最底部                      → 不在任何容器内
✅ Footer 使用 border-t 分隔                → 与上方内容清晰分割
✅ Base Footer + Landing Page               → 完整链接矩阵
✅ Compact Footer + Dashboard               → 少量必要链接
❌ Footer 在 <main> 内部                    → 语义错误
❌ Footer 在 Sidebar 下方                    → 层叠混乱
❌ Footer 背景色与页面不同                   → 中断视觉流
```

---

## 与 Navbar 的对称关系

Footer 是 Navbar 的视觉对称物——头部和底部共同构成页面的导航框架。

| 维度 | Navbar | Footer |
|------|--------|--------|
| 位置 | `sticky top-0` | 页面底部 |
| 内边距 (y) | `h-14` (56px) | `py-12/10/8` (48/40/32px) |
| 背景 | `white/80 backdrop-blur` | `white`（无 blur） |
| Logo 字号 | `text-lg` | Base `text-lg`, Compact `text-sm`, Simple `text-base` |
| 链接颜色 | `text-gray-600` | `text-gray-500` |
| 链接 hover | `text-gray-900` | `text-gray-900` |
| 品牌色使用 | Logo 图标 `indigo-600` | Logo 图标 `indigo-600` |
| z-index | `z-40` | 无（正常文档流） |
| 分隔线 | `border-b` | `border-t` |

Footer 比 Navbar 更安静——链接颜色降一档（600→500）、无 sticky/backdrop/blur——因为页面底部不需要争夺注意力。

---

> **参考链接**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Navbar](./navbar.md) · [Landing Page Template](../templates/landing-page.md)
