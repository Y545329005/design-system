# Prose

Prose 是渲染富文本内容的基础展示组件。为所有长文本内容（文章、文档、评论、公告、法律条款）提供统一、可读的 Typography 样式。不绑定内容来源——无论内容来自 Markdown 解析、Headless CMS、富文本编辑器还是手写 HTML，均使用同一套排版规范。

> **Design Tokens**: [Colors](../../design-tokens/colors.md) · [Spacing](../../design-tokens/spacing.md) · [Elevation](../../design-tokens/elevation.md)
>
> **关联组件**: [Card](../card.md)（卡片内嵌 Prose 内容） · [Badge](../badge.md)（语义色共享）
>
> **依赖**: 无额外插件依赖（不依赖 `@tailwindcss/typography`，所有样式显式定义）

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 最大宽度 | `max-w-3xl` (768px) | 65-75 字符/行的最佳阅读宽度——W3C 可读性指南 |
| 字体大小 | `text-base` (16px) | 长文本阅读舒适度优先——UI 组件用 `text-sm`，内容用 `text-base` |
| 标题层级 | h1-h6 逐级递减 | 遵循 Spacing 的 Typography Scale，≤3 级实际使用 |
| 代码块 | 灰色背景 + 等宽字体 | Notion / Linear 的共识——灰底区分代码与正文，不引入新颜色 |
| 引用块 | 左侧 border + 微灰背景 | 遵循透明度方案（`border-gray-950/8`），与 Card 分隔线一致 |
| 链接 | `text-gray-900` + 下划线 | 与品牌色一致（当前 gray-900 占位），hover 降低文字对比度 |
| 表格 | `inset-ring` + 斑马纹 | 与 Card 共享描边方案；斑马纹提升长表格可读性 |
| 图片 | `rounded-xl` | 与 Card 容器圆角一致——内容图片与卡片边界和谐 |
| 过渡 | `transition-colors duration-150` | 仅链接 hover 过渡，全局统一 150ms |

---

## 变体

### 1. Base Prose（标准排版）

最常用的 Prose 内容容器。覆盖所有标准富文本元素的样式。

```html
<!-- Base Prose -->
<div class="prose max-w-3xl text-base text-gray-700 dark:text-gray-300
  [&_h1]:mt-8 [&_h1]:mb-4 [&_h1]:text-3xl [&_h1]:font-semibold [&_h1]:tracking-tight [&_h1]:text-gray-900 [&_h1]:dark:text-gray-100
  [&_h2]:mt-8 [&_h2]:mb-3 [&_h2]:text-xl [&_h2]:font-semibold [&_h2]:tracking-tight [&_h2]:text-gray-900 [&_h2]:dark:text-gray-100
  [&_h3]:mt-6 [&_h3]:mb-2 [&_h3]:text-lg [&_h3]:font-semibold [&_h3]:text-gray-900 [&_h3]:dark:text-gray-100
  [&_h4]:mt-4 [&_h4]:mb-1 [&_h4]:text-base [&_h4]:font-semibold [&_h4]:text-gray-900 [&_h4]:dark:text-gray-100
  [&_p]:my-3 [&_p]:leading-relaxed
  [&_a]:font-medium [&_a]:text-gray-900 [&_a]:underline [&_a]:underline-offset-2 [&_a]:decoration-gray-950/20 [&_a]:transition-colors [&_a]:duration-150 [&_a]:hover:text-gray-600 [&_a]:focus-visible:outline-2 [&_a]:focus-visible:outline-offset-2 [&_a]:focus-visible:outline-gray-900 [&_a]:dark:text-gray-100 [&_a]:dark:decoration-white/20 [&_a]:dark:hover:text-gray-300 [&_a]:dark:focus-visible:outline-white
  [&_strong]:font-semibold [&_strong]:text-gray-900 [&_strong]:dark:text-gray-100
  [&_em]:italic
  [&_del]:text-gray-400 [&_del]:line-through [&_del]:dark:text-gray-500
  [&_ul]:my-3 [&_ul]:list-disc [&_ul]:space-y-1 [&_ul]:pl-6
  [&_ol]:my-3 [&_ol]:list-decimal [&_ol]:space-y-1 [&_ol]:pl-6
  [&_li]:my-0.5 [&_li]:leading-relaxed
  [&_li>p]:my-0
  [&_blockquote]:my-4 [&_blockquote]:border-l-2 [&_blockquote]:border-gray-950/8 [&_blockquote]:bg-gray-50/50 [&_blockquote]:px-4 [&_blockquote]:py-3 [&_blockquote]:text-gray-600 [&_blockquote]:italic [&_blockquote]:dark:border-white/10 [&_blockquote]:dark:bg-white/[2.5%] [&_blockquote]:dark:text-gray-400
  [&_blockquote_p]:my-1
  [&_hr]:my-8 [&_hr]:border-0 [&_hr]:border-t [&_hr]:border-gray-950/8 [&_hr]:dark:border-white/10
  [&_img]:my-6 [&_img]:rounded-xl [&_img]:w-full
  [&_figcaption]:mt-2 [&_figcaption]:text-center [&_figcaption]:text-sm [&_figcaption]:text-gray-500 [&_figcaption]:dark:text-gray-400
  [&_table]:my-6 [&_table]:w-full [&_table]:overflow-hidden [&_table]:rounded-lg [&_table]:text-sm
  [&_thead]:border-b [&_thead]:border-gray-950/8 [&_thead]:bg-gray-50 [&_thead]:dark:border-white/10 [&_thead]:dark:bg-white/[2.5%]
  [&_th]:px-4 [&_th]:py-2.5 [&_th]:text-left [&_th]:text-xs [&_th]:font-semibold [&_th]:uppercase [&_th]:tracking-wider [&_th]:text-gray-500 [&_th]:dark:text-gray-400
  [&_td]:px-4 [&_td]:py-2.5 [&_td]:text-gray-700 [&_td]:dark:text-gray-300
  [&_tbody_tr]:border-b [&_tbody_tr]:border-gray-950/5 [&_tbody_tr]:dark:border-white/5
  [&_tbody_tr:last-child]:border-0
  [&_tbody_tr:nth-child(even)]:bg-gray-50/30 [&_tbody_tr:nth-child(even)]:dark:bg-white/[1.25%]
  [&_pre]:my-4 [&_pre]:overflow-x-auto [&_pre]:rounded-lg
  [&_pre>code]:block [&_pre>code]:px-4 [&_pre>code]:py-3 [&_pre>code]:text-sm/6
  [&_code]:rounded-md [&_code]:bg-gray-100 [&_code]:px-1.5 [&_code]:py-0.5 [&_code]:font-mono [&_code]:text-sm [&_code]:font-medium [&_code]:text-gray-800 [&_code]:dark:bg-gray-800 [&_code]:dark:text-gray-200
  [&_pre_code]:bg-transparent [&_pre_code]:p-0 [&_pre_code]:text-gray-900 [&_pre_code]:dark:text-gray-100
  [&_pre]:bg-gray-950 [&_pre]:dark:bg-gray-800
  [&_pre_code]:dark:bg-transparent
  motion-reduce:[&_a]:transition-none
">
  <!-- Rendered Prose content goes here -->
  <h1>Getting Started Guide</h1>
  <p>This guide will help you get up and running with the Design System in under 10 minutes.</p>

  <h2>Installation</h2>
  <p>Install the package via npm:</p>
  <pre><code>npm install @acme/design-system</code></pre>

  <h2>Quick Start</h2>
  <p>Import the CSS file in your application:</p>
  <pre><code>import '@acme/design-system/styles.css'</code></pre>

  <h2>Core Concepts</h2>
  <p>The design system is built on three core principles:</p>
  <ol>
    <li><strong>Consistency over creativity</strong> — reuse existing patterns</li>
    <li><strong>Maintainability over flash</strong> — simple, predictable code</li>
    <li><strong>Compose, don't duplicate</strong> — build new from existing</li>
  </ol>

  <blockquote>
    <p>Good design is as little design as possible. Less, but better.</p>
  </blockquote>

  <h2>Typography Scale</h2>
  <table>
    <thead>
      <tr>
        <th>Token</th>
        <th>Size</th>
        <th>Usage</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>text-sm</code></td>
        <td>14px</td>
        <td>UI components</td>
      </tr>
      <tr>
        <td><code>text-base</code></td>
        <td>16px</td>
        <td>Body text</td>
      </tr>
      <tr>
        <td><code>text-2xl</code></td>
        <td>24px</td>
        <td>Card titles</td>
      </tr>
    </tbody>
  </table>

  <hr />

  <p>
    Ready to dive deeper? Read the <a href="#">Component Guide</a> for detailed
    documentation on each component.
  </p>
</div>
```

**设计要点：**
- 使用 Tailwind 的 `[&_element]` 语法为所有 Prose 子元素提供样式——无需 `@tailwindcss/typography` 插件
- `max-w-3xl` (768px) —— W3C 推荐的 65-75 字符/行最佳阅读宽度
- `text-base` (16px) —— 长文本阅读舒适度优先，区别于 UI 组件的 `text-sm` (14px)
- 标题 `tracking-tight` —— 与 Stat Card 数字紧凑字距一致，标题更整洁
- 链接下划线使用 `decoration-gray-950/20` 透明度——柔和但清晰的 affordance
- 代码块黑白反转：`bg-gray-950` (Light) / `bg-gray-800` (Dark) —— 深色背景上代码更易读
- 表格斑马纹 `nth-child(even):bg-gray-50/30` —— 提升长表格的可扫描性

---

### 2. Compact Prose（紧凑排版）

用于空间受限的场景：通知内容、评论、卡片摘要。元素间距减小 50%。

```html
<!-- Compact Prose -->
<div class="prose max-w-none text-sm text-gray-600 dark:text-gray-400
  [&_h1]:mt-4 [&_h1]:mb-2 [&_h1]:text-lg [&_h1]:font-semibold [&_h1]:text-gray-900 [&_h1]:dark:text-gray-100
  [&_h2]:mt-4 [&_h2]:mb-1.5 [&_h2]:text-base [&_h2]:font-semibold [&_h2]:text-gray-900 [&_h2]:dark:text-gray-100
  [&_h3]:mt-3 [&_h3]:mb-1 [&_h3]:text-sm [&_h3]:font-semibold [&_h3]:text-gray-900 [&_h3]:dark:text-gray-100
  [&_p]:my-1.5 [&_p]:leading-relaxed
  [&_a]:font-medium [&_a]:text-gray-900 [&_a]:underline [&_a]:underline-offset-2 [&_a]:decoration-gray-950/20 [&_a]:transition-colors [&_a]:duration-150 [&_a]:hover:text-gray-600 [&_a]:focus-visible:outline-2 [&_a]:focus-visible:outline-offset-2 [&_a]:focus-visible:outline-gray-900 [&_a]:dark:text-gray-100 [&_a]:dark:decoration-white/20 [&_a]:dark:hover:text-gray-300 [&_a]:dark:focus-visible:outline-white
  [&_strong]:font-semibold [&_strong]:text-gray-900 [&_strong]:dark:text-gray-100
  [&_ul]:my-1.5 [&_ul]:list-disc [&_ul]:space-y-0.5 [&_ul]:pl-5
  [&_ol]:my-1.5 [&_ol]:list-decimal [&_ol]:space-y-0.5 [&_ol]:pl-5
  [&_li]:my-0 [&_li]:leading-relaxed
  [&_blockquote]:my-2 [&_blockquote]:border-l-2 [&_blockquote]:border-gray-950/8 [&_blockquote]:pl-3 [&_blockquote]:py-1.5 [&_blockquote]:text-gray-500 [&_blockquote]:italic [&_blockquote]:dark:border-white/10 [&_blockquote]:dark:text-gray-400
  [&_code]:rounded [&_code]:bg-gray-100 [&_code]:px-1 [&_code]:py-px [&_code]:font-mono [&_code]:text-xs [&_code]:font-medium [&_code]:text-gray-800 [&_code]:dark:bg-gray-800 [&_code]:dark:text-gray-200
  [&_pre]:my-2 [&_pre]:overflow-x-auto [&_pre]:rounded-lg [&_pre]:bg-gray-950 [&_pre]:dark:bg-gray-800
  [&_pre>code]:block [&_pre>code]:px-3 [&_pre>code]:py-2 [&_pre>code]:text-xs/5
  [&_pre_code]:bg-transparent [&_pre_code]:p-0 [&_pre_code]:text-gray-900 [&_pre_code]:dark:text-gray-100
  [&_img]:my-3 [&_img]:rounded-lg [&_img]:w-full
  [&_hr]:my-4 [&_hr]:border-0 [&_hr]:border-t [&_hr]:border-gray-950/8 [&_hr]:dark:border-white/10
  motion-reduce:[&_a]:transition-none
">
  <p>Compact content for cards, comments, and notifications.</p>
  <p>Second paragraph with an <a href="#">inline link</a> and <code>inline code</code>.</p>
</div>
```

**设计要点：**
- `text-sm` + `max-w-none` —— 字号降一档，不留白限制（容器控制宽度）
- 标题层级压缩：h1 → `text-lg`，h2 → `text-base`，h3 → `text-sm`
- 所有 `my-` 间距减半：`my-3` → `my-1.5`，`my-4` → `my-2`
- 不用 `dark:` 版本的颜色类——继承父容器的暗色文字（`dark:text-gray-400`）
- 用于 Card 内嵌 Prose 内容、评论列表、通知详情

---

### 3. Inline Prose（行内排版元素）

不是完整容器，而是可以混入任何组件的**行内元素样式片段**。用于只渲染部分元素的场景（如：单个段落、列表、代码块）。调用者按需组合，不依赖 Prose 包装器。

```html
<!-- 仅段落样式 -->
<p class="text-base leading-relaxed text-gray-700 dark:text-gray-300">
  This is a standalone paragraph with <strong class="font-semibold text-gray-900 dark:text-gray-100">bold text</strong>,
  <em class="italic">italic text</em>, and an
  <a href="#" class="font-medium text-gray-900 underline underline-offset-2
    decoration-gray-950/20 transition-colors duration-150 hover:text-gray-600
    focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900
    dark:text-gray-100 dark:decoration-white/20 dark:hover:text-gray-300 dark:focus-visible:outline-white
    motion-reduce:transition-none">
    inline link
  </a>.
</p>

<!-- 仅列表样式 -->
<ul class="my-3 list-disc space-y-1 pl-6 text-base text-gray-700 dark:text-gray-300">
  <li class="my-0.5 leading-relaxed">First item</li>
  <li class="my-0.5 leading-relaxed">Second item</li>
  <li class="my-0.5 leading-relaxed">Third item</li>
</ul>

<!-- 仅代码块样式 -->
<pre class="my-4 overflow-x-auto rounded-lg bg-gray-950 dark:bg-gray-800">
  <code class="block px-4 py-3 text-sm/6 font-mono text-gray-100">
    const message = "Hello, world!"
    console.log(message)
  </code>
</pre>

<!-- 行内代码 -->
<code class="rounded-md bg-gray-100 px-1.5 py-0.5 font-mono text-sm font-medium
  text-gray-800 dark:bg-gray-800 dark:text-gray-200">
  renderProse()
</code>
```

**设计要点：**
- 不提供 `.prose` 包装器——调用者按需组合元素
- 每个元素可独立使用，不依赖父容器
- 适用于需要精确控制 Prose 渲染输出的场景（如自定义富文本编辑器预览）

---

## 元素总览

| 元素 | 字号 | 字重 | 颜色 (Light) | 颜色 (Dark) | 特殊样式 |
|------|------|------|-------------|------------|---------|
| h1 | `text-3xl` (30px) | `font-semibold` (600) | `gray-900` | `gray-100` | `tracking-tight` |
| h2 | `text-xl` (20px) | `font-semibold` (600) | `gray-900` | `gray-100` | `tracking-tight` |
| h3 | `text-lg` (18px) | `font-semibold` (600) | `gray-900` | `gray-100` | — |
| h4 | `text-base` (16px) | `font-semibold` (600) | `gray-900` | `gray-100` | — |
| p | `text-base` (16px) | `font-normal` (400) | `gray-700` | `gray-300` | `leading-relaxed` |
| a | 继承 | `font-medium` (500) | `gray-900` | `gray-100` | `underline` + `decoration-gray-950/20` |
| strong | 继承 | `font-semibold` (600) | `gray-900` | `gray-100` | — |
| em | 继承 | `font-normal` (400) | 继承 | 继承 | `italic` |
| del | 继承 | 继承 | `gray-400` | `gray-500` | `line-through` |
| ul / ol | `text-base` (16px) | 继承 | `gray-700` | `gray-300` | `list-disc` / `list-decimal` + `pl-6` |
| li | 继承 | 继承 | 继承 | 继承 | `leading-relaxed` |
| blockquote | `text-base` (16px) | `font-normal` (400) | `gray-600` | `gray-400` | 左侧 2px border + 灰底 + `italic` |
| code (inline) | `text-sm` (14px) | `font-medium` (500) | `gray-800` | `gray-200` | `bg-gray-100` + `rounded-md` + `font-mono` |
| pre > code | `text-sm` (14px) | `font-normal` (400) | `gray-100` | `gray-100` | `bg-gray-950` (Light) / `bg-gray-800` (Dark) |
| hr | — | — | `gray-950/8` | `white/10` | `border-t` |
| img | — | — | — | — | `rounded-xl` + `w-full` |
| figcaption | `text-sm` (14px) | 继承 | `gray-500` | `gray-400` | `text-center` |
| table | `text-sm` (14px) | — | — | — | 斑马纹 + header 灰底 |
| th | `text-xs` (12px) | `font-semibold` (600) | `gray-500` | `gray-400` | `uppercase` + `tracking-wider` |
| td | `text-sm` (14px) | 继承 | `gray-700` | `gray-300` | — |

---

## 代码块配色方案

代码块使用深色背景方案（不随 Light/Dark 反转），因为用户对"代码=深色背景"已有强烈心智模型。

| 模式 | 背景 | 文字 | 说明 |
|------|------|------|------|
| Light | `bg-gray-950` (#030712) | `text-gray-100` | 接近纯黑的代码背景——高对比度 |
| Dark | `bg-gray-800` (#1f2937) | `text-gray-100` | 略浅于纯黑——避免与 dark 页面背景 (#111827) 同化 |

> **为什么不用 gray-50 浅色代码块？** Linear、Notion、GitHub 在 Light 模式下均使用深色代码背景。浅色代码块（`bg-gray-50`）在白色页面中层次感不足，深色块形成自然的内容节奏断点。

---

## 链接颜色方案

链接使用 `gray-900`（品牌色占位），与 Button Primary、Checkbox Checked 一致。

| 状态 | 文字颜色 (Light) | 下划线颜色 (Light) | 文字颜色 (Dark) | 下划线颜色 (Dark) |
|------|-----------------|-------------------|----------------|-------------------|
| Default | `text-gray-900` | `decoration-gray-950/20` | `text-gray-100` | `decoration-white/20` |
| Hover | `text-gray-600` | 继承 | `text-gray-300` | 继承 |

链接是 Prose 中**唯一的交互元素**。其 hover 态降低文字对比度（非升高），与 Button hover 加深背景形成互补——文本链接通过"微微褪色"来反馈 hover。

---

## 尺寸

| Size | 字号 | 最大宽度 | 元素间距 | 用途 |
|------|------|---------|---------|------|
| **Base** (默认) | `text-base` (16px) | `max-w-3xl` (768px) | 标准 (my-3 ~ my-8) | 文章、文档、长文本 |
| **Compact** | `text-sm` (14px) | `max-w-none` | 减半 (my-1.5 ~ my-4) | 评论、通知、卡片摘要 |

---

## Design Tokens

| Token | Light | Dark | Tailwind | 说明 |
|-------|-------|------|----------|------|
| 最大宽度 | 768px | 768px | `max-w-3xl` | 最佳阅读宽度 (≈70ch) |
| 正文字号 | 16px / 1.625 | 16px / 1.625 | `text-base leading-relaxed` | 长文本舒适阅读 |
| 正文颜色 | `gray-700` | `gray-300` | — | 不纯黑——减少视觉疲劳 |
| 标题颜色 | `gray-900` | `gray-100` | — | 最高层级文字 |
| h1 字号 | 30px / 36px | 30px / 36px | `text-3xl` | 页面级标题 |
| h2 字号 | 20px / 28px | 20px / 28px | `text-xl` | Section 标题 |
| h3 字号 | 18px / 28px | 18px / 28px | `text-lg` | 子 Section 标题 |
| h4 字号 | 16px / 24px | 16px / 24px | `text-base` | 最小标题 |
| 标题字重 | 600 | 600 | `font-semibold` | 统一字重 |
| 标题字距 | `-0.01em` | `-0.01em` | `tracking-tight` | h1/h2 紧凑字距 |
| 链接颜色 | `gray-900` | `gray-100` | — | 品牌色占位 |
| 链接下划线 | `gray-950/20` | `white/20` | `decoration` + 透明度 | 柔和 affordance |
| 链接 hover | `gray-600` | `gray-300` | — | 微微褪色反馈 |
| 行内代码背景 | `gray-100` | `gray-800` | — | 灰底区分正文 |
| 行内代码文字 | `gray-800` | `gray-200` | — | 高对比度 |
| 行内代码圆角 | 6px | 6px | `rounded-md` | 略小于交互元素 (8px) |
| 代码块背景 | `gray-950` | `gray-800` | — | 深色背景方案 |
| 代码块文字 | `gray-100` | `gray-100` | — | 浅色文字 |
| 代码块圆角 | 8px | 8px | `rounded-lg` | 与交互元素一致 |
| 引用块背景 | `gray-50/50` | `white/[2.5%]` | — | 轻微灰底 |
| 引用块 border | `gray-950/8` | `white/10` | `border-l-2` | 透明度描边 |
| 引用块文字 | `gray-600` | `gray-400` | — | 略低于正文 |
| 表格 header 背景 | `gray-50` | `white/[2.5%]` | — | 轻灰底 |
| 表格斑马纹 | `gray-50/30` | `white/[1.25%]` | `nth-child(even)` | 极淡——可感知不喧哗 |
| 表格描边 | `gray-950/8` | `white/10` | `border-b` | 与 Card insetting 一致 |
| 表格圆角 | 8px | 8px | `rounded-lg` | 与交互元素一致 |
| 图片圆角 | 12px | 12px | `rounded-xl` | 与 Card 容器一致 |
| 分隔线 | `gray-950/8` | `white/10` | `border-t` | 与 Card 内分隔线一致 |
| 列表缩进 | 24px | 24px | `pl-6` | 标准列表缩进 |
| 链接过渡 | 150ms | 150ms | `transition-colors duration-150` | 全局统一 |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| 语义 HTML | 使用原生 `<h1>`-`<h6>`, `<p>`, `<ul>`, `<ol>`, `<blockquote>`, `<table>` — 不自定义语义 |
| 颜色对比度 | `gray-700` : `white` = 6.54:1 (WCAG AA)；`gray-900` : `white` = 16.75:1 (WCAG AAA) |
| 链接可识别 | 下划线 + 颜色双重 affordance——不依赖颜色单独传达信息 (WCAG 1.4.1) |
| 键盘导航 | 链接原生支持 Tab 访问，`focus-visible` 继承全局 outline 样式 |
| 代码块可读性 | 深色背景 + 浅色文字 = ≥ 12:1 对比度 |
| 表格可扫描性 | 斑马纹 + header 灰底——辅助横向追踪数据行 |
| 图片 alt | 要求所有图片提供描述性 `alt` 属性 |
| 减少动画 | 链接过渡响应 `motion-reduce:transition-none` |
| 阅读宽度 | `max-w-3xl` (768px) 确保行长不超过 80 字符——认知障碍友好 |

---

## 复用指南

### 何时使用 Prose

| 场景 | 变体 | 说明 |
|------|------|------|
| 文章 / 博客正文 | Base | 完整 Typography 样式 |
| 文档 / 帮助中心 | Base | 需要代码块和表格支持 |
| 产品公告 / Changelog | Base | 富文本内容发布 |
| 评论内容 | Compact | 空间受限，字号缩小 |
| 通知详情 | Compact | 卡片内嵌内容 |
| Card.Body 区域 | Compact | Card 的内容区使用 Compact Prose |
| 自定义渲染 | Inline | 按需组合单个元素样式 |
| 表单说明文字 | 行内 `<p>` + `<a>` | 独立段落 + 链接 |

### 何时不用 Prose

| 场景 | 替代方案 | 原因 |
|------|---------|------|
| UI 标签 / 按钮文字 | `text-sm font-medium` | 不是长文本内容 |
| 代码编辑器 | CodeMirror / Monaco | 语法高亮需求超出此组件范围 |
| 富文本编辑器内容 | 直接使用 Prose 组件 | 所见即所得编辑器的预览区使用 Prose |
| 纯文本（无格式） | `<p class="text-base text-gray-700">` | 不需要 Prose 容器的完整样式 |
| 表单 Label / Placeholder | Input label 样式 | 表单元素有自己的 Typography 规范 |

### 组合规则

```
✅ Card + Compact Prose     → Card 内嵌富文本内容（公告、评论）
✅ Modal.Body + Prose       → Modal 中的文档/说明内容
✅ Base Prose 独占页面      → 文章/文档页面
✅ Inline 元素混入自定义组件 → 精确控制渲染输出
❌ Prose 内嵌套 Card        → 语义冲突——Prose 是内容展示，Card 是容器
❌ Prose 内嵌套 Button      → 链接用 <a>；如需按钮，放在 Prose 容器外部
```

---

## 与旧版的变更

| 变更 | 旧方案 | 新方案 | 依据 |
|------|--------|--------|------|
| 插件依赖 | `@tailwindcss/typography` | 零依赖，`[&_element]` 显式声明 | 完全控制每个元素的样式，避免插件默认值覆盖 |
| 代码块配色 | Light 模式浅灰底 | Light 模式深色底 (`bg-gray-950`) | Notion / Linear / GitHub 共识——代码=深色背景 |
| 链接样式 | 默认浏览器蓝 + 下划线 | `gray-900` + 透明度下划线 | 与品牌色一致 (gray-900 占位) |
| 引用块 | 仅左侧 border | border + 微灰背景 | 增强引用块的视觉区分度 |
| 表格 | 无样式 | 斑马纹 + header 灰底 + 圆角 | 长表格可读性 |
| 图片圆角 | `rounded-lg` (8px) | `rounded-xl` (12px) | 与 Card 容器圆角一致——内容与容器和谐 |
| 标题字距 | 默认 | `tracking-tight` (h1/h2) | Stat Card 已验证的紧凑字距风格 |
| Compact 变体 | 无 | 独创 | 填补卡片/评论内嵌 Prose 的空白 |

---

> 参考: [Spacing](../../design-tokens/spacing.md) · [Colors](../../design-tokens/colors.md) · [Elevation](../../design-tokens/elevation.md) · [Card](../card.md) · [Button](../button.md)
