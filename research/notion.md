# Notion 官网设计分析

> 分析日期：2026-07-01
> 网址：https://www.notion.so → https://www.notion.com
> 技术栈：Next.js + CSS Modules + 自定义 Design Tokens

---

## 一、页面布局

### 1.1 整体结构

Notion 首页采用**垂直分段的叙事流**，每一段推进一个核心卖点。

```
┌─────────────────────────────────────┐
│            Header (Sticky)          │
├─────────────────────────────────────┤
│         HERO                        │
│  ┌──────┐  ┌──────┐  ┌──────┐      │  ← 三列重叠图片堆叠
│  │ img1 │  │ img2 │  │ img3 │      │
│  └──────┘  └──────┘  └──────┘      │
│                                     │
│  "Meet the night shift."            │  ← H1 (6rem 超大)
│  Subtitle + 2 CTAs                  │
│  Pause button (视频控制)              │
├─────────────────────────────────────┤
│  Trusted by 98% of Forbes Cloud 100 │  ← 客户 logo 滚动
│  OpenAI / Figma / Ramp / Cursor ... │
├─────────────────────────────────────┤
│  SECTION 1: "Keep work moving 24/7" │
│  ┌── Tabs ──┐ ┌──────────────────┐  │
│  │ Q&A      │ │                  │  │  ← Tabs + 视频/图片
│  │ Task     │ │   Visual Demo    │  │
│  │ Report   │ │                  │  │
│  │ Custom   │ └──────────────────┘  │
│  └──────────┘                       │
│  ─ 5 use case 链接卡片 ─             │
├─────────────────────────────────────┤
│  SECTION 2: "Ask your on-demand     │
│             assistants."            │
│  ┌──────┐ ┌──────┐ ┌──────┐        │  ← 3 列特性卡片
│  │Agent │ │Search│ │Notes │        │
│  └──────┘ └──────┘ └──────┘        │
├─────────────────────────────────────┤
│  SECTION 3: "Bring all your work    │
│             together."              │
│  ┌──────┐ ┌──────┐ ┌──────┐        │  ← 3 列产品卡片
│  │ Docs │ │ Wiki │ │ Proj │        │
│  └──────┘ └──────┘ └──────┘        │
├─────────────────────────────────────┤
│  Forbes Quote:                      │
│  "Your AI everything app."          │
├─────────────────────────────────────┤
│  "Trusted by teams that ship."      │
│  OpenAI 大引用 + 视频                │  ← 不对称布局
│  6 条客户引用 (2-col grid)           │
├─────────────────────────────────────┤
│  数据条幅 (marquee 无限滚动)          │  ← 100M+ users, G2 #1...
├─────────────────────────────────────┤
│  CTA: "Try for free."               │
│  ┌──────┐ ┌──────┐ ┌──────┐        │  ← 3 个下载/注册卡片
│  │Notion│ │ Mail │ │ Cal  │        │
│  └──────┘ └──────┘ └──────┘        │
├─────────────────────────────────────┤
│            Footer (5 列链接)         │
└─────────────────────────────────────┘
```

### 1.2 布局特点

| 特点 | 说明 |
|------|------|
| **叙事驱动** | 每个 section 一句 headline，层层推进价值主张 |
| **黑白交替** | 深色 Hero → 浅色 Section → 深色 → 浅色...形成视觉节奏 |
| **三列高频** | 3-col grid 是默认的卡片布局模式 |
| **信息密度中** | 介于 OpenAI（极低）与 SaaS 官网（极高）之间 |
| **无缝滚动 Marquee** | 客户 logo 和数据统计使用无限滚动条幅 |
| **Tabs 内嵌** | Section 内使用 Tabs 切换内容变体，不用导航到新页面 |

---

## 二、Grid 系统

### 2.1 Notion 不使用传统 12-col Grid

Notion 采用**语义化布局组件**而非通用 grid 系统：

```
Hero:    三列重叠图片 + 居中文本（absolute/flex）
Sections: CSS Grid / Flexbox 的自定义组合
Cards:   flex-row / grid-cols-3
Footer:  5 列链接网格
```

### 2.2 关键布局模式

| Section | 布局方式 | 说明 |
|---------|---------|------|
| Hero | 3 列绝对定位重叠 + 居中 flex | 图片堆叠形成深度感 |
| Agents Tabs | `flex-row` 侧边 tabs + 右侧 content | 类似产品 UI 的布局 |
| Feature Cards | 3-col 等高卡片 | 每个卡片包含图标 + 标题 + 箭头 |
| Customer Quotes | 不对称：左 1 大引用 + 右 6 条小引用 | 视觉权重分级 |
| Stats Marquee | `flex-row` + 无限滚动动画 | 两组相同内容首尾衔接 |
| CTA | 3-col grid，每列一个产品下载卡 | Notion / Mail / Calendar |

### 2.3 Container 与间距

- **无传统 container**：不使用单一 `max-width`，每个 section 独立控制宽度
- **Section 内边距**：响应式 `px`，内容区保持相对紧凑
- **卡片间距**：`gap-16` (1rem/16px) 为主要间距

---

## 三、Typography

### 3.1 字体系统

| 属性 | 值 |
|------|-----|
| **主字体** | NotionInter（Inter 的定制变体） |
| **字体栈** | `NotionInter, Inter, -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, "Apple Color Emoji", Arial, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol"` |
| **等宽字体** | `iA Writer Mono, Nitti, Menlo, Courier, monospace` |
| **衬线字体** | `Lyon Text, Georgia, ...`（用于特定文章页） |

### 3.2 字号层级（Design Tokens）

```css
/* Hero 标题 — 超大 */
--typography-sans-1100-semibold: 600 6rem/6.25rem
    letter-spacing: -0.2875rem   /* 负字间距，紧凑有力 */

/* Section 标题 */
--typography-article-title-subtle: 700 2rem/2.5rem

/* 正文 */
--typography-global-body: 400 1rem/1.5rem

/* 等宽正文（代码风格） */
--typography-mono-400-regular: 400 1.375rem/1.75rem

/* 导航/菜单标题 */
--typography-interaction-menu-list-heading: 500 0.75rem/1rem
```

### 3.3 排版特点

| 特点 | 说明 |
|------|------|
| **Typography Token 语义化** | Token 包含 `font-weight` + `font-size` + `line-height`，一行定义完整样式 |
| **Hero 极大字号** | 6rem (96px) 的 H1，带负 letter-spacing，形成强烈品牌印象 |
| **等宽字体用于代码** | iA Writer Mono 作为 monospace，产品与营销统一 |
| **行高紧凑** | 6rem 字号配 6.25rem 行高（≈1.04），极紧凑 |
| **字重两极** | 标题用 600/700，正文用 400，中间无渐变 |
| **Letter-Spacing 微调** | Hero 标题 `-0.2875rem`（约 -4.6px），消除大字号的视觉松散 |

---

## 四、Color 色彩系统

### 4.1 核心配色

```css
/* 中性色 */
--color-white:    #ffffff
--color-black:    #000000
--color-gray-100: #f9f9f8    /* 浅背景 */
--color-gray-200: #f6f5f4
--color-gray-300: #dfdcd9    /* 边框/分割线 */
--color-gray-400: #a39e98
--color-gray-500: #78736f    /* 次要文本 */
--color-gray-600: #615d59
--color-gray-700: #494744
--color-gray-800: #31302e
--color-gray-900: #191918    /* 深色背景（非纯黑！） */

/* 品牌蓝 */
--color-blue-100: #f2f9ff
--color-blue-200: #e6f3fe    /* Secondary 按钮背景 */
--color-blue-300: #93cdfe
--color-blue-400: #62aef0
--color-blue-500: #097fe8
--color-blue-600: #0075de    /* Primary 按钮背景 */
--color-blue-700: #005bab    /* Hover/Active 态 */

/* Alpha 透明黑 */
--color-alpha-black-100: #0000000d   /* 4%  — 极淡背景 */
--color-alpha-black-200: #0000001a   /* 10% — hover 态 */
--color-alpha-black-900: #000000f2   /* 95% — 主文本 */

/* 辅助色（用于图标/插图） */
--color-orange-500: #ff6d00
--color-orange-600: #dd5b00
--color-purple-300: #d6b6f6
--color-pink-500:   #ff64c8
--color-teal-400:   #2a9d99
```

### 4.2 页面背景策略

| 区域 | 背景 | 文本 |
|------|------|------|
| Hero | `#191918` (gray-900) | 白色文本 |
| Light sections | `#ffffff` | `rgba(0,0,0,0.95)` |
| Footer | 深色 | 白色文本 |

**关键设计决策**：深色背景不是纯黑 `#000`，而是 `#191918` — 带微暖色调的 charcoal。

### 4.3 色彩设计特点

1. **双模式 Section**：深色/浅色交替，形成视觉节奏
2. **品牌蓝唯一 CTA 色**：蓝色仅用于按钮和链接，不用于装饰
3. **灰色系统完善**：9 级灰阶覆盖所有中性需求
4. **辅助色克制使用**：橙/紫/粉/青仅用于图标填充色 (`--graphic-fill-color`)
5. **Alpha 黑用于叠加**：`alpha-black-100/200/900` 在亮色背景上构建层级

---

## 五、Button 按钮系统

### 5.1 按钮类型

#### Primary Button（实心蓝）
```css
background: #0075de          /* blue-600 */
color: #ffffff
border-radius: 8px           /* NOT fully rounded */
hover: #005bab                /* blue-700 */
active: #005bab
shadow: none                  /* 无阴影，扁平 */
```

#### Secondary Button（浅蓝底）
```css
background: #e6f3fe          /* blue-200 */
color: #005bab                /* blue-700 */
border-radius: 8px
shadow: none
```

#### Tertiary / Text Button（文本按钮）
```css
background: transparent
color: rgba(0,0,0,0.95)      /* alpha-black-900 */
/* 用于 "Log in" 等次要操作 */
```

#### Ghost Icon Button（图标按钮）
```css
/* Tab 切换、轮播控制等 */
background: transparent
border-radius: 624.9375rem    /* --border-radius-round → 完全圆形 */
```

### 5.2 按钮设计特点

| 特点 | 说明 |
|------|------|
| **8px 圆角** | 与 OpenAI 的 pill 形状不同，Notion 使用 `8px` 标准圆角 |
| **蓝色唯一 CTA 色** | 品牌蓝色独占按钮，防止视觉竞争 |
| **无阴影** | 扁平设计，完全依靠颜色区分 |
| **Secondary 独特** | 浅蓝底 + 深蓝字，而非传统的描边样式 |
| **Hover 状态简单** | 仅背景色加深，无 transform/过渡效果 |

---

## 六、Card 卡片系统

### 6.1 卡片类型

#### Feature Card（特性卡片）
```
┌─────────────────────┐
│  ┌───┐              │
│  │ ● │  ← 彩色图标   │  ← 圆形底 + 图标
│  └───┘              │
│                     │
│  Product Label      │  ← 小标签（如 "Custom Agents"）
│  Title (H2)         │
│  →                  │  ← 箭头指示可点击
└─────────────────────┘
```

#### Customer Quote Card（引用卡片）
```
┌──────────────────────────┐
│  "Quote text..."         │  ← 引用内容为主体
│                          │
│  ── Company Name         │  ← 来源标识
│  Read the full story →   │  ← 链接
└──────────────────────────┘
```

#### Compact Card（紧凑卡片）
```
┌──────────────────────────────┐
│  ● Icon  Title →            │  ← 单行横向排列
└──────────────────────────────┘
```

#### Product Download Card（下载卡片）
```
┌──────────────────┐
│  App Icon        │
│  Title           │
│  Description     │
│  [Download CTA]  │
└──────────────────┘
```

### 6.2 卡片设计特点

| 特点 | 说明 |
|------|------|
| **无卡片容器** | 没有 border、没有 shadow、没有独立背景块 |
| **图标先行** | 每个功能卡片顶部有一个彩色图标（圆形底） |
| **箭头 = 可点击** | 所有卡片统一使用 `→` 箭头表示可交互 |
| **无 Hover 动画** | 不缩放、不移位，仅链接颜色变化 |
| **语义化 class** | `cardCompact`, `cardCompactTitle`, `cardCompactAnchor` |
| **图标色彩编码** | 产品图标使用不同颜色（蓝 `#097fe8`、橙 `#ffb110`）区分类别 |

---

## 七、Sidebar 侧边栏

Notion 官网 **没有侧边栏**。

### 替代方案

- **Header 下拉菜单**：Product / AI / Solutions / Resources 均为下拉菜单 (button + chevron)
- **产品内才有侧边栏**：Notion 产品本身的 sidebar 是标志性设计，但官网不继承
- **Section 间导航**：不提供页内导航，用户自然滚动

---

## 八、Header 导航头

### 8.1 Header 结构

```
┌──────────────────────────────────────────────────────┐
│  [N]  Product ▾  AI ▾  Solutions ▾  Resources ▾    │
│       Developers  Enterprise  Pricing  Request demo  │
│                              [Get Notion free] [Log in]│
└──────────────────────────────────────────────────────┘
```

- **Logo**: Notion "N" 图标 (SVG, 33×34px)
- **导航项**: 7 个主导航链接 + 2 个 CTA 按钮
- **下拉菜单**: Product / AI / Solutions / Resources 四个按钮带 chevron
- **CTA 区分**: "Get Notion free" 为 Primary 蓝色按钮 / "Log in" 为 Tertiary 文本

### 8.2 Header 特点

| 特点 | 说明 |
|------|------|
| **语言切换横幅** | 顶部 banner 提供语言切换（检测到非英文时显示） |
| **导航项较多** | 7 个导航项 + 2 CTA，信息架构丰富 |
| **按钮语义分层** | Primary (蓝色实心) / Tertiary (文本) 两个 CTA 层级 |
| **无搜索** | Header 不含搜索，产品内搜索是独立功能 |
| **Sticky** | 滚动时固定在顶部 |

---

## 九、Animation 动效系统

### 9.1 Hero 动画

Notion Hero 的核心动效是一段**产品界面自动演示视频**：

- 三列产品界面截图重叠排列
- 自动播放的界面操作录屏
- "Pause" 按钮允许用户暂停
- 这是一个正在实时操作的产品 demo，不是静态图片

### 9.2 Stats Marquee（无限滚动）

```
[100M users] [#1 knowledge base] [#1 AI search] [#1 AI writing] [62% Fortune 100] ...
→ 两组相同内容首尾衔接，CSS animation 或 JS 驱动的无缝滚动
→ 等速、线性、无限循环
```

### 9.3 其他动效

| 元素 | 动效 | 说明 |
|------|------|------|
| Tabs 切换 | 内容区域切换 | Q&A → Task → Report 切换，可能带淡入淡出 |
| Carousel 箭头 | 点击切换 slide | "Next slide" / "Previous slide" |
| 下拉菜单 | 展开/收起 | Header 下拉菜单的进出动画 |
| 链接 hover | 颜色变化 | 无 transform，极简 |

### 9.4 动效设计特点

| 特点 | 说明 |
|------|------|
| **产品 Demo 优先** | 不是装饰动画，而是产品功能演示 |
| **Marquee 增加社会证明感** | 无限滚动让数据显得无穷无尽 |
| **无滚动触发动画** | 不依赖 Intersection Observer 的视差/淡入 |
| **无 Hover 缩放** | 与 OpenAI 不同，Notion 不做图片 scale |
| **功能性 > 装饰性** | 动效服务于传达信息，不单独存在 |

---

## 十、为什么看起来高级 —— 核心原因分析

### 10.1 产品即营销

> "最好的 Notion 广告就是 Notion 本身。"

- Hero 区域直接展示产品界面（自动播放的 demo 视频）
- 排版/Card/布局风格与 Notion 产品内部一致
- 用户看到的官网，就是他们将在产品中获得的体验

### 10.2 叙事节奏 —— 深浅交替

```
深色 Hero
  ↓
浅色 Section (Agents)
  ↓
浅色 Section (Assistants)
  ↓
浅色 Section (Docs/Wiki/Projects)
  ↓
深色 Quote (Forbes)
  ↓
浅色 Section (Testimonials)
  ↓
深色 Section (Stats Marquee)
  ↓
浅色 CTA
  ↓
深色 Footer
```

这个明暗交替创造了自然的视觉呼吸感。

### 10.3 字体系统的极致打磨

- **定制字体 NotionInter**：基于 Inter 的定制版本，品牌辨识度
- **负 letter-spacing**：6rem 的超大标题如果不收紧字间距会显得松散
- **Typography Token 一行定义全部**：`600 6rem/6.25rem` 包含 weight/size/line-height

### 10.4 图标色彩编码

每个产品区域的图标有独立的填充色：

| 图标 | 颜色 | 含义 |
|------|------|------|
| Mailbox | `#097fe8` (蓝) | 反馈分类 |
| Rock | `#ffb110` (黄) | 工单处理 |
| Shield | 安全响应 | |

这种色彩编码使同类元素在视觉上形成关联。

### 10.5 关键词前置的 Copywriting

Notion 的标题文案极度精炼：

- "Meet the night shift." — 不是 "Introducing Notion Agents"
- "Keep work moving 24/7." — 不是 "Automation Features"
- "Ask your on-demand assistants." — 不是 "AI Capabilities"
- "Bring all your work together." — 不是 "All-in-one Workspace"
- "Try for free." — 不是 "Start your journey"

每句都在说用户获得的**结果**，而非产品**功能**。

### 10.6 社会证明的层次

```
Level 1: "Trusted by 98% of the Forbes Cloud 100" + logo 墙
Level 2: Forbes 媒体引用 "Your AI everything app."
Level 3: 客户详细引用（OpenAI, Toyota, Figma, Vercel...）
Level 4: 数据统计 marquee（100M+ users, G2 #1...）
```

四层社会证明层层递进。

### 10.7 "不完美"的设计

| 元素 | 效果 |
|------|------|
| `#191918` 而非 `#000` | 深色背景更温暖，更易长时间阅读 |
| 8px 圆角而非全圆角 | 保持专业感，不过分友好 |
| 无卡片阴影/border | 极简到极致，内容本身即是分隔 |
| 负 letter-spacing | 让超大标题看起来更紧凑、更有力量 |

---

## 十一、可复用的设计经验

### 适合引入 Design System 的要素

| 要素 | 优先级 | 建议 |
|------|--------|------|
| Typography Token 一行定义 | ⭐⭐⭐ | `[weight] [size]/[line-height] [family]` 格式 |
| 深浅交替 Section 节奏 | ⭐⭐⭐ | Template 级的视觉节奏模式 |
| 图标色彩编码 | ⭐⭐ | 为图标类组件建立 `--graphic-fill-color` token |
| Alpha 透明度叠加层 | ⭐⭐ | 与 OpenAI 的透明度系统类同，可统一 |
| 8px 圆角标准 | ⭐⭐ | 偏专业感的圆角选择 |
| 负 letter-spacing 大标题 | ⭐ | 大字号排版技巧 |
| Marquee 无限滚动 | ⭐ | 可作为社会证明的标准组件 |

### 与 OpenAI 的对比

| 维度 | OpenAI | Notion |
|------|--------|--------|
| 设计哲学 | 极简克制 | 叙事驱动 |
| 信息密度 | 极低 | 中等 |
| 色彩 | 黑白 + 透明度 | 深浅交替 + 品牌蓝 |
| 按钮圆角 | Pill (全圆) | 8px (微圆) |
| 卡片交互 | Hover scale | 箭头 + 颜色变化 |
| 首页策略 | 搜索框即产品 | Demo 视频展示产品 |
| 字体 | 定制 OpenAI Sans | 定制 NotionInter |
| 动效 | 极克制 | 功能性（marquee/demo） |

---

## 十二、总结

Notion 官网的"高级感"可以归纳为：

**产品即广告 × 叙事节奏 × Typography 极致打磨 × 结果导向文案 × 多层社会证明**

与 OpenAI 的"少即是多"不同，Notion 走的是"用产品证明产品"的路线——把产品界面变成最好的营销素材，把功能描述变成用户故事，把技术指标变成社会证明。
