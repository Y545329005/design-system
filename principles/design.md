# 顶级产品设计共同规律

> 提炼自：Anthropic / Linear / Notion / Stripe / Tailwind CSS / Vercel
> 七款产品，六个维度，一套规律
> 最后更新：2026-07-01

---

## 总纲

这七款产品分属不同赛道——AI 研究、项目管理、知识工具、支付平台、CSS 框架、云平台——设计风格迥异，但底层规律高度一致。以下十条是它们**不约而同**的选择。

---

## 一、色彩纪律：最多一个强调色

**共同做法：** 整个产品的交互色彩只有一种。这种颜色仅用于 CTA、链接、选中态。它出现的每一次都传递同一个信号：**这里可以交互。**

| 产品 | 唯一交互色 | 其他彩色用途 |
|------|-----------|-------------|
| Linear | 紫 `#5E6AD2` | 无 |
| Stripe | 紫 `#533afd` | Ruby/Magenta 仅用于渐变装饰，绝不出现在按钮 |
| Anthropic | Terracotta `#C6613F` | 仅选中色、细微细节 |
| Notion | 蓝 `#0075de` | 图标填充色（不使用于交互） |
| Tailwind | 黑 `#000` | Section Label 仅装饰，不用于交互 |
| Vercel | 语义色按需出现 | 红色仅错误，绿色仅成功 |

**规律：** 颜色不是越多越好。一个强调色 = 100% 的信号纯度。多个彩色 = 噪音。顶级产品的配色不是"调色板驱动"的，而是**"信号驱动"**的——每种颜色的出现都要回答一个问题："它在传达什么信息？"

**设计原则：**
- 选一个主强调色，把它用在所有交互元素上
- 语义色（红/绿/黄）只在必要时出现——错误、成功、警告
- 装饰性彩色可以存在，但绝不能出现在可交互元素上
- 当你犹豫要不要加一个新颜色——不加

---

## 二、不用纯黑，不用纯白

**共同做法：** 所有产品的"黑"和"白"都有微弱的色彩倾向。

| 产品 | "黑" | "白" |
|------|------|------|
| Linear | `#080A0A`（蓝底调） | — |
| Stripe | `#061b31`（海军蓝底调） | — |
| Anthropic | `#141413`（暖底调） | `#F0EEE6`（象牙暖白） |
| Notion | `#191918`（暖底调） | `#FFFFFF` |
| Tailwind | `lab(1.9 0.28 -5.49)` | — |
| Vercel | — | `#FAFAFA`（微暖） |

**规律：** 纯黑 `#000` 在自然界中不存在，在白底黑字的 UI 中显得刺眼。纯白 `#FFF` 同样缺乏温度。顶级产品通过给"黑白"注入微弱的色彩倾向（蓝底、暖底、灰底），创造出更舒适的长时间阅读体验。

**设计原则：**
- 正文颜色永远不设 `#000`，用 `#141413` 或 `#0a0a0a` 范围
- 背景色永远不设纯白 `#FFF`，用 `#FAFAFA` 或 `#F0EEE6` 范围
- 色彩倾向选择应与品牌定位一致：蓝色底调 = 技术/冷静，暖黄底调 = 人文/温暖

---

## 三、表面抬升替代阴影

**共同做法：** 大多数顶级产品已经放弃 `box-shadow` 作为层次区分的主要手段。

| 产品 | 卡片层次方案 | 阴影 |
|------|-------------|------|
| Linear | 4 级 Surface 明度差（仅 2-3 个明度点） | 无 |
| Anthropic | 留白 + 间距分隔 | 无 |
| Notion | 留白分隔，无卡片容器 | 无 |
| Tailwind | `inset-ring`（`box-shadow: inset 0 0 0 1px`） | 无外阴影 |
| Vercel | 边框 + 背景色差 | 无 |
| Stripe | 蓝调多层阴影（例外——但阴影是品牌色的延伸，且有负 spread 精确控制） | 有，但品牌化 |

**规律：** 阴影是"告诉"用户这里有层次，表面抬升是"让用户感觉到"这里有层次。前者廉价，后者高级。唯一的例外是 Stripe——但它的阴影不是灰色，而是品牌色的延伸（蓝色调 `rgba(50,50,93,0.25)` + 黑色近层），本质上也是品牌系统的一部分。

**设计原则：**
- 优先用背景色明度差（Surface Ladder）区分层次，不依赖阴影
- 如果必须用阴影，用品牌色的暗调而非中性灰
- 使用负 spread 值控制阴影的水平扩散，创造纯垂直抬升感
- Inset ring（`box-shadow: inset 0 0 0 1px`）是比 `border` 更干净的描边方案

---

## 四、单一字体族，有限字重

**共同做法：** 只用一种字体族（或 Sans + Mono 两套），字重不超过 4 种。

| 产品 | 字体 | 字重数量 |
|------|------|---------|
| Linear | Inter（+ Inter Display 变体） | 4 (400/500/600/700) |
| Stripe | Söhne（定制可变字体） | 2 (300/400) — 极端克制 |
| Anthropic | Anthropic Sans + Anthropic Serif（例外） | 少数几种 |
| Notion | NotionInter（Inter 定制） | 2-3 |
| Tailwind | Inter + IBM Plex Mono | 3-4 |
| Vercel | Geist Sans + Geist Mono | 少数几种 |

**规律：** 字体混搭产生摩擦感。单一字体族通过字号、字重、颜色的变化建立层级，比混搭多种字体更干净。Anthropic 是唯一的例外——它的 Sans + Serif 双字体系统服务于品牌叙事（Sans = 现代/功能，Serif = 人文/温暖）。

**设计原则：**
- 默认只用一种字体族（正文 + 代码可以分开）
- 字重限制在 4 种以内（如 400/500/600/700）
- 不要调整 letter-spacing（除非 Display 级别的大标题）
- 标题使用 `text-wrap: balance`，正文使用 `text-wrap: pretty`
- 数字使用 `tabular-nums` 保证对齐

---

## 五、动画克制：200ms 上限，仅反馈不表演

**共同做法：** 动画服务于功能反馈，不服务于装饰。

| 产品 | 动画时长 | 策略 |
|------|---------|------|
| Linear | ≤200ms | 仅 transform + opacity，60fps 纪律 |
| Stripe | 150-200ms | 统一 cubic-bezier，数据动画而非装饰动画 |
| Tailwind | 150ms 默认 | transition-colors 为主 |
| Vercel | ~200ms | 高新颖度动画从不连续出现，穿插"呼吸"区 |
| Anthropic | 较慢 | 词逐显现（~100ms/词），品牌化的慢节奏 |
| Notion | — | 功能性（marquee / demo 视频），无装饰动画 |

**规律：**
- 进入用 `ease-out`，离开用 `ease-in`
- 只动画 `transform` 和 `opacity`（GPU 属性，不触发重排）
- 动画是"反馈"不是"表演"——用户从不等待动画
- 支持 `prefers-reduced-motion`
- 骨架屏（Skeleton）优于转圈（Spinner）

**设计原则：**
- 交互反馈 ≤200ms
- 只使用 `transform` + `opacity` 做动画
- 不动画 `width`/`height`/`top`/`left`/`margin`/`padding`
- 动画前设置 `will-change`，动画结束后移除
- 长页面的高新颖度动画不要连续出现，中间穿插低新颖度区域

---

## 六、信息密度递进：先吸引，再说服

**共同做法：** Hero 信息极少 → 往下逐渐增加细节。每一屏只说一件事。

| 产品 | Hero 信息量 | 下方策略 |
|------|-----------|---------|
| Linear | 标题 + 副标题 + 1 个 CTA + 产品截图 | 3-4 个 USP 区块，每个聚焦一个功能 |
| Stripe | 标题 + 副标题 + 2 个 CTA | 功能区块 + 客户案例 + 代码 Demo |
| Anthropic | 一句话 + 一段 Mission + CTA | 重点公告 → 发布列表 → 文章网格 |
| Notion | 标题 + 副标题 + 产品 Demo 视频 | 特性卡片 → 客户引用 → 数据条幅 |
| Tailwind | 标题 + 代码示例 + CTA | Feature Demo → 代码编辑器 → 客户案例 |
| Vercel | 标题 + Shader 动画 + CTA | 功能区块 + 代码 Demo + 客户案例 |

**规律：** 页面是漏斗，不是仓库。Hero 的任务是让人停留，下方的任务是让人信服。每一屏只承载一个主题，不堆砌信息。

**设计原则：**
- Hero 只放：一句话 + 一句话解释 + 一个 CTA
- 每个 Section 只说一件事
- Section 间留白慷慨（96px+），给内容呼吸空间
- 信息密度随滚动深度递增：Hero(极少) → 核心功能(中) → 详情/数据(高)

---

## 七、无侧边栏的首页

**共同做法：** 七款产品的首页无一使用侧边栏。

全部采用**单栏纵向流**，依靠 Header（顶部导航）和 Footer（底部站点地图）两个端点完成导航。内容区全宽，不受侧边栏侵蚀。

**规律：** 首页是叙事页面，不是工具页面。侧边栏是"应用"的 UI 模式，不适用于"讲故事"的首页。单栏流降低认知负担，移动端响应式也更简单。

**设计原则：**
- 首页/落地页：无侧边栏，单栏纵向流
- App 内：侧边栏 + 内容区（倒 L 型），侧边栏固定宽度 240-260px
- 长滚动页面可用 Section Label 色彩编码替代侧边栏导航

---

## 八、8px 基础网格，自定义间距系统

**共同做法：** 间距基于 8px 网格，但小数值端更密集。

| 产品 | 基础网格 | 特点 |
|------|---------|------|
| Linear | 8px | 间距为 8 的倍数 |
| Stripe | 8px | 小数值端密集：1/2/4/6/8...（每 2px 一档） |
| Vercel | 8px | 三列指导线：1080px → 3 × 360px |
| Tailwind | 4px (0.25rem) | Tailwind spacing scale 基于 4px |
| Anthropic | — | 12 列 Fluid Grid + Breakout 布局 |

**规律：** 8px 是行业共识。但真正拉开差距的不是"用了 8px 网格"，而是**在 8px 网格上的精度控制**——Stripe 在 1-8px 范围每 2px 一档，因为金融 UI 对精度要求极高；Tailwind 用 4px 网格因为要覆盖更多场景。

**设计原则：**
- 全局使用 8px 基础网格
- 间距为 8 的倍数：4/8/12/16/24/32/48/64/96/128
- Section 间距：96px (desktop) / 64px (tablet) / 40px (mobile)
- 内容区约束在 `max-width: 1080-1200px` 内

---

## 九、定制字体或精心选择的开源字体

**共同做法：** 字体不是随便选的系统默认，而是品牌投入的体现。

| 产品 | 字体 | 投入层级 |
|------|------|---------|
| Stripe | Söhne（定制可变字体） + `ss01` 风格集 | 极重 |
| Anthropic | Anthropic Sans + Anthropic Serif（专属字体） | 极重 |
| Vercel | Geist Sans + Geist Mono（委托设计） | 极重 |
| Notion | NotionInter（基于 Inter 定制） | 重 |
| Linear | Inter Display + Inter | 中 |
| Tailwind | Inter（开源） + IBM Plex Mono | 中 |

**规律：** 顶级产品的字体投入与品牌投入成正比。Stripe 的 `ss01` 替代字形、Anthropic 的双字体系统、Vercel 的委托设计——这些不是"选个好看的字体"，而是**把排版当作品牌资产**。

**设计原则：**
- 品牌产品应使用定制/专属字体，起码是基于开源字体的定制版本
- 等宽字体也应专属（代码是品牌体验的一部分）
- 字体的 OpenType 特性（tabular-nums、stylistic sets）是排版 DNA，值得投入

---

## 十、可访问性从地基开始

**共同做法：** 可访问性不是后期补丁，而是设计系统的基础层。

| 产品 | 可访问性实践 |
|------|------------|
| Anthropic | Skip Links × 2、`prefers-reduced-motion`、语义 HTML、`.u-sr-only` |
| Linear | Focus ring 从不移除、键盘导航（⌘K）、`prefers-reduced-motion` |
| Stripe | CIELAB 感知均匀色彩系统（保证对比度达标）、语义 HTML |
| Vercel | Skip Link、`animation-play-state: paused`（而非 `none`）、渐进增强 |
| Tailwind | `prefers-reduced-motion`、暗色模式全支持、语义 HTML |

**规律：** 顶级产品的可访问性投入体现在三个层面：
1. **色彩系统**：用数学保证对比度（CIELAB / LCH），而非凭感觉
2. **动画尊重**：支持系统"减少动效"设置，且用 `paused` 而非 `none`
3. **语义 HTML**：`<nav>`、`<main>`、`<banner>`、`<dl>`、Skip Links

**设计原则：**
- 颜色系统应基于感知均匀色彩空间（OKLCH > CIELAB > HSL）
- 所有动画必须响应 `prefers-reduced-motion`
- Focus ring 是所有交互元素的默认行为，不可移除
- 使用语义 HTML，不依赖 `<div>` 做所有事
- 提供 Skip to content 链接

---

## 横向总览

| 规律 | Linear | Stripe | Anthropic | Notion | Tailwind | Vercel |
|------|--------|--------|-----------|--------|----------|--------|
| 单强调色 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| 不用纯黑 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| 表面抬升 > 阴影 | ✅ | ⚠️ 品牌化阴影 | ✅ | ✅ | ✅ | ✅ |
| 单字体族 | ✅ | ✅ | ⚠️ 双字体 | ✅ | ✅ | ✅ |
| 动画 ≤200ms | ✅ | ✅ | ⚠️ 较慢 | ✅ | ✅ | ✅ |
| 信息密度递进 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| 首页无侧边栏 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| 8px 网格 | ✅ | ✅ | ✅ | ⚠️ | ✅ | ✅ |
| 定制字体 | ⚠️ Inter | ✅ Söhne | ✅ 专属 | ✅ NotionInter | ⚠️ Inter | ✅ Geist |
| 可访问性地基 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |

✅ 严格遵守　⚠️ 有例外但原因明确

---

## 核心句

> **"完美不是没有什么可以添加，而是没有什么可以去掉。"**
>
> —— Antoine de Saint-Exupéry，被 Linear、Stripe、Vercel 的设计反复验证

这七款产品的高级感并非来自"做了什么"，而是来自"克制了什么"：
- 克制了颜色数量（只留一个）
- 克制了阴影（表面抬升代替）
- 克制了字体混搭（只有一个）
- 克制了动画（200ms，仅反馈）
- 克制了信息堆砌（每屏一个主题）

每一次克制都在说：**我们对自己传达的信息足够自信，不需要装饰来补充。**

---

## 与 Design System 的映射

这十条规律应映射到 Design System 的以下模块：

| 规律 | 应更新到的模块 |
|------|-------------|
| 色彩纪律 | Design Tokens → Colors |
| 不用纯黑纯白 | Design Tokens → Colors |
| 表面抬升替代阴影 | Design Tokens → Elevation / Components → Card |
| 单字体族有限字重 | Design Tokens → Typography |
| 动画克制 | Design Tokens → Motion |
| 信息密度递进 | Templates → Landing Page |
| 无侧边栏首页 | Templates → Page Layouts |
| 8px 基础网格 | Design Tokens → Spacing |
| 定制字体 | Design Tokens → Typography |
| 可访问性地基 | Checklist → a11y |
