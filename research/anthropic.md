# Anthropic 官网设计分析

> 分析日期：2026-07-01
> 网址：https://www.anthropic.com
> 技术栈：Webflow + Lottie 动画 + 自定义 CSS Grid System

---

## 一、页面布局

### 1.1 整体结构

Anthropic 首页采用**克制、机构化的单一页面流**。信息密度高于 OpenAI 但远低于 Notion，页面节奏平稳、权威感强。

```
┌──────────────────────────────────────┐
│          Header（Sticky, 68px）       │  ← Lottie 动画 Logo + 横向导航
├──────────────────────────────────────┤
│            HERO                       │
│  "AI research and products            │  ← 词逐显现动画（animate-word）
│   that put safety at the frontier"     │     57.73px Anthropic Sans Bold
│                                       │
│  Mission statement paragraph           │  ← 24px Anthropic Serif
├──────────────────────────────────────┤
│  ┌──────────────────────────────────┐ │
│  │  Announcing Sonnet 5             │ │  ← 深色重点卡片（全宽突出）
│  │  "Our most agentic Sonnet yet"   │ │     pill 按钮 "Read the story"
│  │                    [Read story]  │ │
│  └──────────────────────────────────┘ │
├──────────────────────────────────────┤
│  Latest Releases                      │
│  ┌──────────┐┌──────────┐┌────────┐  │
│  │Glasswing ││ Opus 4.8 ││Institute│  │  ← 3 列发布卡片
│  │Jun 2     ││ May 28   ││Mar 11  │  │     日期 + 分类标签 + 标题
│  │[Read →]  ││[Read →]  ││[Read →]│  │
│  └──────────┘└──────────┘└────────┘  │
├──────────────────────────────────────┤
│  At Anthropic, we build AI to         │  ← H2: 64.69px Anthropic Serif
│  serve humanity's long-term           │
│  well-being.                          │
│                                       │
│  ┌──────────┐┌──────────┐┌────────┐  │
│  │Core Views││RSP       ││Academy │  │  ← 5 项特色文章网格
│  │Safety    ││Alignment ││Education│  │     分类标签 + 标题
│  │          ││          ││        │  │
│  │          ││          ││        │  │
│  ├──────────┼┼──────────┼┼────────┤  │
│  │Econ Index││Constitut.││        │  │
│  │Econ Res. ││Announce. ││        │  │
│  └──────────┘└──────────┘└────────┘  │
├──────────────────────────────────────┤
│  Footer（深色背景 #141413）            │
│  4 列 Mega Footer + Social Links     │
│  Products | Models | Solutions | ...  │
└──────────────────────────────────────┘
```

### 1.2 布局特征

- **单页叙事**：不像 Notion 的大段落交替，更接近传统机构网站的单页结构
- **Hero 极简**：只有一句话 + 一句话 Mission，没有图片、没有 Demo 视频
- **内容归类清晰**：Hero → 重点公告 → 发布列表 → 思想领导力文章
- **信息层次克制**：每个区块承载恰好一个目的，不堆砌信息
- **无 Sidebar**：纯粹的单栏内容流，全宽利用 12 列 Grid
- **Footer 极其丰富**：作为主导航补充，4 列 × 多行的完整站点地图

---

## 二、Grid System

### 2.1 核心架构

Anthropic 拥有三个 AI 公司中最**精密的自定义 CSS Grid 系统**。

使用双层 Grid 结构：

```
外层：Breakout Grid（全宽背景 → 内容区 → 全宽边缘）
内层：12 列 Fluid Grid
```

### 2.2 Breakout Grid（全宽布局）

```css
--grid-breakout:
  [full-start]  minmax(0, 1fr)
  [content-start]
  repeat(var(--site--column-count), minmax(0, var(--column-width--1)))
  [content-end]
  minmax(0, 1fr)  [full-end];
```

这是 Andy Bell 的 `full-bleed` 布局的精妙变体，让某些子元素可以突破内容区延伸到全宽。

### 2.3 12 列 Fluid Grid

```css
--grid-main: repeat(var(--site--column-count), minmax(0, 1fr));
--grid-1 ~ --grid-12: repeat(N, minmax(0, 1fr));

/* 列宽计算系统 */
--site--max-width: min(var(--site--width), 100vw);
--site--margin: clamp(2rem, 1.08rem + 3.92vw, 5rem);
--container--main: calc(var(--site--max-width) - var(--site--margin) * 2);
--column-width--1: calc(
  (var(--container--main) - var(--site--gutter-total))
  / var(--site--column-count)
);
--column-width--2: calc(var(--column-width--plus-gutter) * 2 - var(--site--gutter));
/* ... 一直到 --column-width--12 */
```

### 2.4 列偏移系统

独有设计：不仅定义宽度，还定义**列偏移量**（margin），实现精确的跨列定位：

```css
--column-margin--1: calc(var(--column-width--plus-gutter) * 1);
--column-margin--2: calc(var(--column-width--plus-gutter) * 2);
/* ... 一直到 12 */
```

这意味着可以直接用 `margin-left: var(--column-margin--3)` 来偏移 3 列。

### 2.5 容器层次

```css
--container--full:  calc(100% - 4rem);    /* 全宽容器 */
--container--main:  calc(...);             /* 主内容容器 */
--container--small: calc(...);             /* 窄容器（比 main 少 4 列） */
```

### 2.6 与 OpenAI / Notion 对比

| 维度 | Anthropic | OpenAI | Notion |
|------|-----------|--------|--------|
| Grid 框架 | 自定义 CSS Grid | Tailwind (flex) | CSS Grid + Flex |
| 列数 | 12 | 12 (Tailwind) | 多变 |
| Breakout | ✅ 完整实现 | ❌ | ✅ 简化版 |
| 列偏移计算 | ✅ CSS 变量 | ❌ | ❌ |
| 维护方式 | Webflow + 自定义代码 | Tailwind 工具类 | CSS Modules |

---

## 三、Typography

### 3.1 字体系统

| Token | Font Stack | 用途 |
|-------|-----------|------|
| **Anthropic Sans** | `"Anthropic Sans", Arial, sans-serif` | 标题 (H1, H3)、导航、按钮、标签 |
| **Anthropic Serif** | `"Anthropic Serif", Georgia, sans-serif` | 正文、H2 标题 |

两套专属字体（类似 OpenAI 定制 OpenAI Sans），但 Anthropic 混用了 Sans + Serif 的层次结构，这在 AI 公司中独一无二。

### 3.2 Typography Scale（完整 Fluid）

所有字号使用 `clamp()` 实现流畅缩放：

```css
/* Display Scale */
--font-size--display-xxl: clamp(3rem, 2.39rem + 2.61vw, 5rem);     /* 48px → 80px */
--font-size--display-xl:  clamp(2.5rem, 2.04rem + 1.96vw, 4rem);    /* 40px → 64px */
--font-size--display-l:   clamp(2rem, 1.69rem + 1.31vw, 3rem);      /* 32px → 48px */
--font-size--display-m:   clamp(1.75rem, 1.67rem + 0.33vw, 2rem);   /* 28px → 32px */
--font-size--display-s:   clamp(1.25rem, 1.17rem + 0.33vw, 1.5rem); /* 20px → 24px */
--font-size--display-xs:  clamp(1.125rem, 1.09rem + 0.16vw, 1.25rem);/* 18px → 20px */

/* Paragraph Scale */
--font-size--paragraph-l: clamp(1.375rem, 1.34rem + 0.16vw, 1.5rem); /* 22px → 24px */
--font-size--paragraph-m: clamp(1.125rem, 1.09rem + 0.16vw, 1.25rem);/* 18px → 20px */
--font-size--paragraph-s: clamp(1rem, 0.96rem + 0.16vw, 1.125rem);   /* 16px → 18px */

/* Detail / Caption */
--font-size--detail-xs:   clamp(0.6875rem, 0.67rem + 0.08vw, 0.75rem);/* 11px → 12px */

/* Monospace */
--font-size--monospace:   clamp(0.875rem, 0.53rem + 1.47vw, 2rem);
```

### 3.3 实际页面中测得的 Typography

| 元素 | Font | Size | Weight | Line Height | Color |
|------|------|------|--------|-------------|-------|
| H1 Hero | Anthropic Sans | 57.73px | 700 | 63.5px (1.1) | `#141413` |
| H2 Section | Anthropic Serif | 64.69px | 400 | 71.15px (1.1) | `#141413` |
| H3 Card | Anthropic Sans | 24px | 600 | 31.2px (1.3) | `#141413` |
| Body | Anthropic Serif | 20px | 400 | — | `#141413` |
| Hero P | Anthropic Serif | 24px | 400 | 33.6px (1.4) | `#141413` |
| Nav Links | Anthropic Sans | 16px | 400 | — | — |

### 3.4 Typography 设计亮点

1. **H1 Sans + H2 Serif 的反直觉组合**：通常标题层叠是 Serif H1 + Sans H2，Anthropic 反过来用——Sans 作为 H1（现代、清晰），Serif 作为 H2（人文、温暖），形成独特的节奏
2. **H2 比 H1 字号更大但更轻**：H1 = Sans Bold 57.73px，H2 = Serif Regular 64.69px——这创造了"响亮开篇 → 从容展开"的阅读节奏
3. **Two-Typeface System**：Sans 用于 UI/数据/功能，Serif 用于叙事/情感/品牌
4. **Fluid Everything**：没有硬编码字号，全部 `clamp()` —— 这在三个 AI 公司中独一无二
5. **`clamp()` 公式解析**：Anthropic 的 `clamp()` 中使用的系数反推可得设计基准为 1440px 视口，并在 375px 移动端有独立基准

### 3.5 Text Transform Tokens

```css
--_typography---text-transform--none: none;
--_typography---text-transform--uppercase: uppercase;
--_typography---text-transform--lowercase: lowercase;
--_typography---text-transform--captialize: capitalize;  /* 注意：源文件拼写为 "captialize" */
```

---

## 四、Color System

### 4.1 完整调色板

Anthropic 使用**暖调大地色系**，在所有 AI 公司中独树一帜。

| Token | 值 | 用途 |
|-------|-----|------|
| **Primary (Terracotta)** | `#C6613F` | 品牌暖橙，强调色 |
| **Secondary** | `#D97757` | 较浅的 Terracotta，hover 状态 |
| **Accent** | `#141413` | 近黑色，CTA 按钮、Footer 背景、正文文字 |
| **Background** | `#F0EEE6` | Ivory Medium，整页背景 |
| **Text Primary** | `#141413` | 正文、标题 |
| **Text Faded** | `color(srgb 0.078 0.078 0.075 / 0.6)` | 淡化文字 |
| **Link / Secondary Btn** | `#D6D3BE` | 次按钮、链接色 |
| **Footer Text** | `#FAF9F5` | Footer 浅色文字（深底反白） |
| **Selection** | `rgba(204, 120, 92, 0.5)` | 文字选中高亮（半透明 terracotta） |

### 4.2 色彩架构特点

- **无多层级透明度系统**：不像 OpenAI 的 `primary-100/60/44/12/4` 五级透明度，Anthropic 使用离散的具名颜色
- **以材质/材质感命名**：`ivory`（象牙）、`slate`（石板）、`cloud`（云）——这种命名暗示物理世界质感
- **暖调底色**：`#F0EEE6` 是不纯的白，带有微弱的暖黄底调，比纯白 (`#FFF`) 更有温度和机构感
- **Terracotta 作为品牌锚点**：`#C6613F` 是 Anthropic 唯一的"彩色"，其他所有颜色都是中性色。这是一种"单色调 + 单一品牌色"的极简策略
- **使用 OKLCH 色彩空间**：淡化文字使用 `color(srgb ...)` 语法，表明设计团队对现代 CSS 色彩规范有深入了解

### 4.3 文本选中色

```css
::selection {
  background: rgba(204, 120, 92, 0.5);  /* 半透明 Terracotta */
}
```

这与 Notion 的蓝色选中和 OpenAI 的默认浏览器选中形成差异——Anthropic 将品牌色渗透到浏览器原生行为层面。

### 4.4 色彩系统对比

| 维度 | Anthropic | OpenAI | Notion |
|------|-----------|--------|--------|
| 底色 | Ivory 暖白 | 纯白 `#FFF` | 深灰 → 浅灰交替 |
| 强调色 | 1 个 (Terracotta) | 0 个（黑白世界） | 1 个 (Notion Blue) |
| 文字色 | 近黑 `#141413` | 通过透明度控制 | 9 级灰度 |
| 色温 | 暖 | 冷 | 中 |
| 品牌色渗透 | 选中色、链接 | 几乎不出现 | 按钮、链接、强调 |
| 暗色模式 | ❌ | ❌ | ✅ 页面内交替 |

---

## 五、Button

### 5.1 按钮类型

#### Primary CTA — "Try Claude"

```
┌──────────────┐
│  Try Claude  │────  ← 右侧切平
└──────────────┘

bg:       #141413 (近黑)
color:    #FAF9F5 (暖白)
radius:   8px 0 0 8px (左侧圆角，右侧切平)
padding:  8px 16px
font:     16px Anthropic Sans
```

**不对称圆角是 Anthropic 按钮的签名特征**——左侧 8px 圆角，右侧 0px 切平。在整个 AI 行业中独一无二。

这种形状暗示：左边的圆角代表"开始"（柔和过渡），右边的平切代表"继续前行"（直接、果断）。

#### Secondary — "Read the story"

```
┌──────────────────┐
│  Read the story  │
└──────────────────┘

bg:       transparent / 浅底衬托
color:    #FAF9F5 (暖白，在深色卡片上)
radius:   24px (全圆 pill)
font:     20px Anthropic Serif
```

次级按钮使用 pill 形状（16px → 24px 圆角），与 Primary 的不对称形成对比。

#### "Read announcement" 链接

背景透明，以文字 + 箭头图标形式呈现。分类标签 + 链接的轻量化处理。

### 5.2 Button 系统特征

| 维度 | Anthropic | OpenAI | Notion |
|------|-----------|--------|--------|
| 主按钮形状 | 不对称圆角 (8px 0 0 8px) | 全圆 pill (`rounded-full`) | 标准 8px |
| 主按钮颜色 | 近黑 `#141413` | 近黑透明度变化 | 蓝 + 黑 |
| 次按钮形状 | Pill (24px) | Pill 描边 | 8px 描边 |
| 按钮 padding | 8px 16px (紧凑) | 较大 | 中等 |
| 独特签名 | 不对称 | Pill everywhere | 无特殊形状 |

### 5.3 设计语义

Anthropic 按钮设计传递的潜台词：
- **不对称 = 不随大流**。世界上几乎所有按钮都是对称的，Anthropic 的切角是视觉上"思考不同"的声明
- **8px 是签名数字**：Primary 的切角侧保留 8px 圆角（左侧两角都是 8px），这是整个设计系统的基础单位
- **极简到几乎没有装饰**：无阴影、无边框、无渐变——只有颜色和形状

---

## 六、Card

### 6.1 卡片类型

#### 类型一：重点公告卡片（Hero Card）

```
┌────────────────────────────────────────┐
│                                        │
│  Announcing Sonnet 5                   │  ← 深色背景
│  Our most agentic Sonnet yet, with     │
│  top-tier intelligence for coding...   │
│                                        │
│                       [Read the story] │  ← Pill 按钮
│  Continue reading                      │  ← 辅助文字链接
└────────────────────────────────────────┘
```

- 全宽深色卡片，作为 Hero 下方的视觉锚点
- 背景：深色（推测为 `#141413` 或深色 variant）
- 文字反白，pill 按钮

#### 类型二：发布列表卡片（Release Cards）

```
┌──────────────────────────────────────────────┐
│  ┌─────────────────────┐                     │
│  │    Project Image    │                     │
│  └─────────────────────┘                     │
│                                              │
│  Expanding Project Glasswing                  │  ← H3: 24px Anthropic Sans 600
│  We're extending Project Glasswing to        │  ← paragraph
│  approximately 150 new organizations...       │
│                                              │
│  Date: June 2, 2026                         │  ← 分类标签
│  Category: Announcements                     │
│                                              │
│  [Read announcement →]                       │  ← 链接按钮
└──────────────────────────────────────────────┘
```

- 3 列 Grid 布局
- 大图 + 标题 + 描述 + 元数据（日期 + 分类）+ 链接
- 无阴影、无边框——通过留白和间距完成视觉分隔
- 日期 / 分类使用 `<dl>` 语义标签

#### 类型三：特色文章卡片（Featured Article Cards）

```
┌──────────────────────┐
│                      │
│  Core views on        │  ← H3 标题
│  AI safety            │
│                      │
│  Announcements        │  ← 分类标签
│  [→]                  │  ← 链接（仅有箭头图标）
└──────────────────────┘
```

- 5 列网格
- 极简：标题 + 分类标签 + 隐形链接覆盖
- 无图、无描述、无装饰——纯信息卡片
- 整卡为可点击区域

### 6.2 Card 系统特征

| 特征 | Anthropic | OpenAI | Notion |
|------|-----------|--------|--------|
| 阴影 | 无 | 无 | 无 |
| 边框 | 无 | 无 | 无 |
| 背景色变化 | 深色重点卡 | 透明度渐变 | 无 |
| 圆角 | None / 系统默认 | 不同卡不同圆角 | 8px |
| 图片优先 | 是（发布卡） | 是（所有卡） | 无图片卡片 |
| 悬停效果 | 链接颜色变化 | Scale + 遮罩 | 无 |

---

## 七、Header

### 7.1 结构

```
┌──────────────────────────────────────────────────────────┐
│ [Anthropic Logo]  Research  Policy  [Commitments ▾]      │
│   (Lottie动画)                        [Learn ▾]  News    │
│                                            [Try Claude]  │
├──────────────────────────────────────────────────────────┤
```

### 7.2 导航要素

| 元素 | 类型 | 说明 |
|------|------|------|
| Logo | Lottie 动画 SVG | 143×16px，含入场动画，品牌化细节 |
| Research | 直接链接 | `/research` |
| Policy | 直接链接 | `/policy` |
| Commitments | 下拉菜单（`<button>`） | 含展开箭头图标 |
| Learn | 下拉菜单（`<button>`） | 含展开箭头图标 |
| News | 直接链接 | `/news` |
| Try Claude | CTA 按钮 | 近黑背景 → `claude.ai` |

### 7.3 技术细节

```css
--nav--height: 4.25rem;           /* 68px（桌面端） */
--nav--height: 4.375rem;          /* 70px（移动端） */
--nav--banner-height: 2.75rem;    /* 44px 促销横幅 */
--nav--icon-thickness: var(--border-width--main);
--nav--dropdown-duration: 200ms;  /* 下拉动画时长 */
--nav--menu-open-duration: 400ms; /* 移动菜单展开时长 */
```

### 7.4 Navigation 特征

- **无边框 Navbar**：Header 背景与页面底色相同 (`#F0EEE6`)，没有底部边框——通过颜色一致性实现 Header 到内容的无缝过渡
- **Sticky 定位**：滚屏时固定在顶部
- **Dropdown 动画**：使用 CSS Grid `0fr → 1fr` 技巧实现平滑展开，配合 `opacity` 过渡和 `visibility` 控制可访问性
- **移动端适配**：使用 `@container (min-width: 56em)` 容器查询切换 Desktop/Mobile 导航
- **Skip Links**：页面顶部有两个 skip links（"Skip to main content" + "Skip to footer"），可访问性完善
- **Lottie Logo 动画**：页面加载时 Logo SVG 执行 Lottie 动画，这是非常精细的品牌细节投资
- **Dropdown 使用 `<button>`**：Commitments 和 Learn 使用 `<button>` 而非 `<a>`，语义正确

---

## 八、Sidebar

**Anthropic 首页无 Sidebar。**

全部内容采用单栏布局，依靠 12 列 Grid 进行内部空间分配。

这与 OpenAI 和 Notion 一致——三家 AI 公司首页都摒弃了传统 Sidebar 模式，采用全宽内容流。这种选择反映了：
- 首页叙事性 > 工具性
- 视觉焦点集中在核心信息
- 移动端响应式更简单

Navigation 通过 Header 和 Footer 两个端点完成，中间不需要持续可见的侧边导航。

---

## 九、Animation

### 9.1 动画系统全景

| 动画类型 | 实现 | 触发时机 |
|----------|------|----------|
| Logo 入场 | Lottie SVG | 页面加载 |
| H1 词逐显现 | `animate-word` class + transform | 页面加载 / 滚动进入 |
| 导航下拉 | CSS `grid-template-rows: 0fr → 1fr` | Hover / Click |
| 滚动触发 | Webflow `[data-w-id]` | 滚动至元素 |
| Marquee Logo 轮播 | CSS `@keyframes marquee` | 持续循环（其他页面） |

### 9.2 词逐显现动画（Word-by-Word Reveal）

H1 的每个词被包裹在独立的 `<span class="animate-word">` 中：

```html
<span class="animate-word" style="transition-delay: 108.942ms; 
      opacity: 1; transform: translateY(0px);">AI</span>
<span class="animate-space"> </span>
<span class="animate-word" style="...">research</span>
```

每个词的 `transition-delay` 按序递增（约 100ms 间隔），从 `translateY(Xpx)` → `translateY(0)` 过渡。

这是一种**克制的动画**——不像 Notion 的自动播放视频，也不像 OpenAI 的大幅滚动淡入，而是一个词一个词地、沉稳地显现。与 Anthropic "深思熟虑"的品牌形象高度一致。

### 9.3 Logo Marquee（其他页面）

```css
.logo_marquee_logo_component {
  animation: marquee 48s linear infinite;
}

/* Hover 暂停 */
.logo_marquee:hover .logo_marquee_logo_component {
  animation-play-state: paused;
}

/* prefers-reduced-motion 支持 */
@media (prefers-reduced-motion) {
  .logo_marquee_logo_component {
    animation-play-state: paused;
  }
}
```

48 秒的慢速滚动 + hover 暂停 + 无障碍媒体查询——完整覆盖了动画最佳实践。

### 9.4 导航下拉动画

使用 CSS Grid `0fr → 1fr` 技巧而非 `max-height` hack：

```css
.nav_dropdown_component > .w-dropdown-list {
  display: grid;
  grid-template-rows: 0fr;
  transition: opacity var(--nav--menu-open-duration) 
              cubic-bezier(.77, 0, .175, 1);
  visibility: hidden;
  opacity: 0;
}

.nav_dropdown_component > .w-dropdown-list.w--open {
  visibility: visible;
  opacity: 1;
}
```

使用 `cubic-bezier(.77, 0, .175, 1)` 缓动曲线——类似 easeInOutQuart，起止柔和，中段快速。这是经过精细调校的缓动。

### 9.5 Webflow 滚动动画

大量使用 `data-w-id` 属性标记滚动触发动画元素。Webflow 的 Interactions 系统提供：
- 元素淡入
- 位移入场
- 视差效果
- 滚动触发的时间线动画

### 9.6 动画哲学

| 维度 | Anthropic | OpenAI | Notion |
|------|-----------|--------|--------|
| 策略 | 词逐显现 + 微交互 | 悬停放大 + 毛玻璃 | 视频自动播放 |
| 速度 | 慢、从容 | 快、干脆 | 中 |
| 角色 | 叙事节奏 | 技术美感 | 产品 Demo |
| 复杂度 | 中 | 低 | 高 |
| 无障碍 | ✅ prefers-reduced-motion | ✅ | ✅ |

---

## 十、为什么看起来高级

### 10.1 色彩：暖调机构感

Anthropic 使用 `#F0EEE6`（Ivory Medium）作为底色——不是纯白，而是带有微暖底调的象牙色。这让整个页面自带暖意，与 OpenAI 的冷白和 Notion 的深灰区分开来。

Terracotta (`#C6613F`) 作为唯一的品牌色出现频率极低——仅在选中文字和微小细节中出现。这种"把品牌色藏起来"的策略在其他 AI 公司中不存在。

### 10.2 字体：Sans + Serif 的对话感

H1 用 Sans（现代、果断），H2 用 Serif（人文、温暖）。两种字体的交替产生**对话感**——仿佛Sans在陈述事实，Serif在讲述人文。这在技术公司中极为罕见（绝大多数只用 Sans）。

### 10.3 不对称圆角：独一无二的视觉签名

`8px 0 0 8px` 的按钮圆角在整个行业中找不到第二例。这不是为了"好看"——这是 Anthropic 在说"我们和所有人都不一样"。不对称中蕴含着安全性、前沿性的品牌主张。

### 10.4 Grid 系统：不可见的精密

12 列 Grid + Breakout 布局 + 列偏移计算 + Fluid `clamp()` 所有尺寸——这套系统的工程精密度远超 OpenAI 的 Tailwind 和 Notion 的 CSS Modules。

用户看不到 Grid，但感受到的是：每个元素都"恰好"在它应该在的位置。

### 10.5 动画克制：不炫技，但精确

词逐显现动画（~100ms/词）、Lottie Logo、40ms 级调校的缓动曲线——Anthropic 在动画上的投资是"让人感受不到动画的存在"。这与 Anthropic "安全、可靠、深思熟虑"的品牌完全一致。

### 10.6 信息密度：恰到好处

比 OpenAI 多（OpenAI 只有搜索框），比 Notion 少（Notion 信息量极大）。Anthropic 的页面在"展示足够多的内容让机构看起来可信"和"保持简约让品牌看起来高端"之间取得了平衡。

### 10.7 文字即 Hero

没有产品 Demo 视频（Notion），没有大型图片（OpenAI），Anthropic 的 Hero 只有文字。这是对自己使命的极度自信——"我们不需要秀产品图，我们的一句话就足够。"

### 10.8 可访问性从细节流露

- 两个 Skip Links（到 main content + 到 footer）
- `prefers-reduced-motion` 媒体查询
- 语义 HTML：`<nav>`、`<main>`、`<article>`、`<banner>`、`<dl>`
- Screen reader only 文本（`.u-sr-only`）
- Hover 暂停动画

这些细节说明可访问性不是后期添加的，而是设计系统的基础层。

---

## 十一、可复用的设计经验（Design System 建议）

### 高优先级 ⭐⭐⭐

1. **不对称圆角按钮**
   - 适用于：需要品牌差异化的 CTA 按钮
   - 建议加入：`ui-system/components/button.md`
   - 值得新增一个 `shape: asymmetric` variant

2. **Fluid Typography Scale (`clamp()`)**
   - Anthropic 的 `clamp()` 系统是所有分析过的网站中最完整的
   - 建议将 Fluid Typography 作为 Design Token 加入
   - 6 级 Display + 3 级 Paragraph + Detail + Mono = 11 级完整 Scale

3. **CSS Grid Breakout 布局**
   - `[full-start] minmax(0, 1fr) [content-start] ... [content-end] minmax(0, 1fr) [full-end]`
   - 可创建 `ui-system/layouts/grid-breakout.md` 模板

### 中优先级 ⭐⭐

4. **Two-Typeface System**（Sans H1 + Serif H2）
   - 适合需要同时传达"专业"和"人文"的品牌
   - 建议加入 Design Principles

5. **CSS Grid 下拉动画**（`0fr → 1fr` 技巧）
   - 比 `max-height` hack 更优雅
   - 建议加入 Animation 规范

6. **Semantic HTML + Skip Links**
   - 将可访问性要求加入 Checklist

### 低优先级 ⭐

7. **Lottie Logo 动画**
   - SVG-based，轻量
   - 适合 Logo 有复杂形状变化的场景

8. **Text Selection Color**
   - 品牌色渗透到浏览器原生行为
   - 实现成本极低（一行 CSS），效果显著

---

## 十二、三家公司对比总结

| 维度 | Anthropic | OpenAI | Notion |
|------|-----------|--------|--------|
| **设计策略** | 机构克制 | 极简主义 | 叙事驱动 |
| **配色** | Ivory + Terracotta | 黑白 + 透明度 | 深浅交替 + 蓝 |
| **字体** | Sans + Serif 混用 | 纯 Sans (OpenAI Sans) | 纯 Sans (NotionInter) |
| **Grid** | 自定义 12 列 + Breakout | Tailwind 12 列 | CSS Grid 多变 |
| **信息密度** | 中等 | 极低 | 中高 |
| **Hero** | 文字 + 词逐动画 | 搜索框 | 产品 Demo 视频 |
| **按钮签名** | 不对称圆角 | 全圆 Pill | 标准 8px |
| **动画策略** | 词显现 + Lottie | 悬停缩放 + 毛玻璃 | 视频 + 滚动统计 |
| **品牌关键词** | 安全、深思、机构 | 冷静、技术、精英 | 活力、产品、协作 |
| **可访问性** | ⭐⭐⭐ (Skip links, prefers-reduced-motion, 语义HTML) | ⭐⭐ | ⭐⭐ |

---

## 十三、总结

Anthropic 的设计是三个 AI 公司中**最具工程深度的**：

- OpenAI 赢在**极端克制**（你敢只放一个搜索框吗？）
- Notion 赢在**叙事节奏**（产品即广告，深-浅-深-浅的章节推进）
- Anthropic 赢在**系统精密**（12 列 Breakout Grid、Fluid 全部、自定义双字体系统、不对称按钮签名）

Anthropic 不需要炫技——它的设计在"不可见的地方"做到了极致（Grid 计算、clamp 公式、动画缓动曲线调校到 40ms 级），这是一种**工程师式的设计思维**：把底层做到无可挑剔，表面保持克制。

最终效果是**一个看起来"没什么设计"、但细节经得起放大的网站**——而这恰恰是最难的。
