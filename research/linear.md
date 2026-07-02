# Linear 官网设计分析

> 分析日期：2026-07-01
> 分析对象：linear.app（官方网站及产品界面）
> 目的：提炼可复用的设计规律，而非复制

---

## 一、页面布局

### 整体结构

Linear 官网采用**单页纵向滚动 + 分区叙述**结构，从上到下依次为：

```
Hero（主视觉）
  └─ 导航栏（fixed，透明/毛玻璃）
  └─ 大标题 + 副标题 + CTA 按钮
  └─ 产品截图（主体）

Client Logos（信任背书）
  └─ 一排 logo 滚动

USP Sections（核心卖点，3-4 个区块）
  └─ 左文右图 / 左图右文交替
  └─ 每个区块聚焦一个功能

Interactive Demo（产品交互展示）
  └─ 键盘快捷键演示
  └─ Command Menu（⌘K）模拟

Feature Blocks（功能网格）
  └─ 2-3 列 Grid 展示功能卡片

CTA（底部转化区）

Footer
```

### 布局规律

| 特征 | 做法 | 原因 |
|---|---|---|
| **单栏纵向流** | 内容从上到下，左到右的自然阅读顺序 | 降低认知负担，不打断阅读节奏 |
| **无锯齿布局** | 不使用左右交替的 zig-zag 布局 | 保持"线性"（Linear 名字的隐喻） |
| **内容居中约束** | `max-w-[1200px]` + `mx-auto` + `px-6` | 大屏幕内容不散开，视觉焦点集中 |
| **信息密度递进** | Hero 信息最少 → 往下逐渐增加细节 | 先吸引，再说服 |
| **每屏一个主题** | 每个区块只说一件事，大量留白 | 单主题聚焦 === 信息传达效率最高 |

### 产品内布局（App Shell）

产品界面采用**倒 L 型布局**：

```
┌──────────┬──────────────────────────┐
│          │  Top Bar（顶栏）          │
│ Sidebar  ├──────────────────────────┤
│（侧边栏） │                          │
│          │  Content Area            │
│  w-64    │  flex-1                  │
│          │                          │
└──────────┴──────────────────────────┘
```

- Sidebar: 固定宽度 `260px`（w-64），深色背景
- Top Bar: 横跨右侧全宽，毛玻璃效果
- Content: `flex-1`，可切换列表/看板/时间线/分屏视图

**为什么这样设计？**
- 侧边栏 + 顶栏形成稳定的"L 型框架"，用户在任何页面都有锚点
- 侧边栏比顶栏略暗，引导视线聚焦到内容区
- 这是桌面端后台系统最高效的布局模式，Linear 将其打磨到了极致

---

## 二、Grid 系统

### 页面级 Grid

```
Content Wrapper:  max-w-[1200px] mx-auto px-6
Feature Grid:     grid grid-cols-2 或 grid-cols-3
Gap:              gap-8 ～ gap-12（区块内）
Section Spacing:  py-24 ～ py-32（区块间）
```

### App Shell Grid

```
整体:    grid grid-cols-[260px_1fr]
Sidebar: 固定 260px，不参与弹性伸缩
Main:    剩余空间全部给内容区
```

### Grid 规律

| 特征 | Linear 做法 |
|---|---|
| **列数** | 2 列（大 feature）、3 列（小 feature 卡片） |
| **间距** | 8px 基础网格，间距为 8 的倍数 |
| **对齐** | 垂直和水平双重对齐，labels/icons/buttons 全部对齐 |
| **内容宽度** | 始终约束在 `max-w-[1200px]` 内，不会无限拉伸 |
| **响应式** | 移动端侧边栏缩进屏幕外（`-translate-x-full`），汉堡菜单触发 |

### 为什么感觉规整？

Linear 的设计团队花了大量时间做**像素级对齐**——每个 label、icon、button 在垂直和水平方向都精确对齐。这不是一个你能一眼看到的东西，但你会"感觉到"。

---

## 三、Typography

### 字体家族

| 用途 | 字体 | 说明 |
|---|---|---|
| **Headings（标题）** | Inter Display | 更大的表现力，负 letter-spacing |
| **Body（正文）** | Inter | 标准无衬线，高可读性 |
| **Code（代码）** | Linear Mono（等宽字体） | 自定义，用于技术内容 |
| **Fallback** | -apple-system, system-ui | 系统默认字体栈兜底 |

### 字号体系

| 层级 | 字号 | 字重 | 用途 |
|---|---|---|---|
| `heading-1` / Display | 60px–80px | 700 | Hero 大标题 |
| `heading-2` | 36px–48px | 600–700 | 区块标题 |
| `heading-3` | 24px–30px | 600 | 卡片标题 |
| `body-large` | 17px–18px | 400 | 副标题、导语 |
| `body` | 15px–16px | 400 | 正文 |
| `body-small` | 14px | 400 | 辅助文本 |
| `caption` | 13px | 400 | 说明文字 |
| `label` | 9px–11px | 400–500 | 标签、section header |

### Typography 规律

| 规则 | 做法 | 为什么 |
|---|---|---|
| **单一字体族** | 只用 Inter（+ Inter Display 变体） | 减少视觉噪音 |
| **字重克制** | 只使用 4 种字重（400/500/600/700） | 少即是多 |
| **不改 letter-spacing** | 除非必要，绝不调整字间距 | Inter 本身已经优化好 |
| **`text-balance`** | 标题使用 `text-wrap: balance` | 避免孤行 |
| **`text-pretty`** | 正文使用 `text-wrap: pretty` | 更舒适的换行 |
| **`tabular-nums`** | 数字使用等宽数字 | 表格/数据对齐 |
| **标题负 tracking** | Display 级别标题使用 `-0.03em ~ -0.05em` | 大字需要更紧凑的字间距 |

### 为什么舒服？

1. **只用一个字体族**——没有字体混搭带来的摩擦感
2. **层级清晰**——大就是大，小就是小，没有暧昧的中间尺寸
3. **对比度高但不刺眼**——`#E2E4E3` 的标题 vs `#5C5C5C` 的正文，拉开足够的层级差
4. **行高合理**——标题 `1.1-1.2`，正文 `1.5-1.6`，阅读节奏舒适

---

## 四、配色

### 核心理念：极度克制的单色系

Linear 的配色是"黑白的艺术"——不是纯黑白，而是非常微妙的暖灰和蓝灰。

### Dark Mode（默认）

| Token | Hex | 用途 |
|---|---|---|
| **Page Background** | `#080A0A` | 页面底色（不是纯黑 #000） |
| **Surface-1** | `#0F1011` | 卡片、轻微抬升的面 |
| **Surface-2** | `#141516` | Hover 状态、二级抬升 |
| **Surface-3** | `#18191A` | Dropdown、Popover 最高层级 |
| **Text Primary** | `#E2E4E3` | 标题、主要文字 |
| **Text Secondary** | `#5C5C5C` | 次要文字 |
| **Text Tertiary** | `#444749` | 辅助文字 |
| **Border-1** | `#23252A` | 最细边框 |
| **Border-2** | `#34343A` | 中等边框 |
| **Border-3** | `#3E3E44` | 强调边框 |
| **Accent** | `#5E6AD2` | **唯一的彩色，仅用于：品牌标志、聚焦环、每个区块的一个主 CTA** |

### 颜色数量

| 类别 | 数量 |
|---|---|
| 中性色（灰阶） | ~10 级 |
| **彩色** | **1 个**（紫色 #5E6AD2） |
| 语义色 | 极克制地使用（success 绿 / error 红仅在必要时出现） |

### LCH 色彩空间（技术亮点）

Linear 不是用传统的 HSL/HEX 来定义颜色的。他们把整个主题系统重建在 **LCH 色彩空间**上：

```
Dark Theme:
  base:     [12, 2, 270]    → 深蓝灰底色
  accent:   [55, 80, 300]   → 紫色
  contrast: 33              → 视觉分离度
```

**LCH vs HSL 的区别：**
- LCH 是**感知均匀**的——同样的 Lightness 值，红色和蓝色在人眼中看起来"一样亮"
- 传统的 HSL 做不到这一点（同样的 L 值，黄色看起来比蓝色亮很多）
- Linear 用 LCH 自动生成了 98 个语义颜色变量，但只需 3 个输入参数

这意味着：
- Light mode / Dark mode 的颜色计算是数学推导的，不需要人工逐一调色
- 任何用户自定义主题都可以从 3 个变量自动生成整套配色
- 高对比度无障碍主题可以自动产生

### 为什么看起来高级？

1. **只有一个彩色**——极致的色彩纪律，不滥用颜色来吸引注意力
2. **不用纯黑 `#000`**——`#080A0A` 带有微弱的蓝色底调，比纯黑更柔和
3. **层次靠明度差而非颜色差**——4 个 Surface 层级之间仅差 2-3 个明度点，但你感觉得到
4. **没有渐变卡片、没有彩色阴影**——信任表面抬升和细边框来传达层次

---

## 五、Button

### 按钮体系

| Variant | 背景 | 文字 | 边框 | 使用场景 |
|---|---|---|---|---|
| **Ghost（默认）** | transparent | `#5C5C5C` | none | 工具栏、侧边栏、导航 |
| **Secondary** | `#0F1011`（Surface-1） | `#E2E4E3` | `1px #23252A` | 次要操作 |
| **Primary** | `#5E6AD2`（Accent） | white | none | 每个区块的唯一主 CTA |

### 交互状态

| 状态 | Primary | Secondary | Ghost |
|---|---|---|---|
| **Default** | accent 背景 + 白字 | surface 背景 + border | transparent |
| **Hover** | 亮度 +10% | 背景变为 `#141516` | 背景变为 `#0F1011` |
| **Focus** | `2px` accent outline + `2px` offset | 同左 | 同左 |
| **Press** | `scale(0.97)`，~150ms | 同左 | 同左 |
| **Disabled** | `opacity: 0.5` + `cursor: not-allowed` | 同左 | 同左 |

### 按钮设计规律

| 特征 | 做法 |
|---|---|
| **圆角** | `6px`（与卡片圆角一致） |
| **内边距** | 水平 16px, 垂直 8px |
| **字号** | 14px（与 body-small 一致） |
| **字重** | 500（Medium） |
| **最小尺寸** | 32px 高度（触控友好） |
| **图标** | Lucide icons, 16px–18px，与文字基线对齐 |

### 值得学习的点

1. **Ghost 是默认**——不是每个操作都需要视觉强调，大部分按钮用 ghost 即可
2. **Primary 极度克制**——每个区块只有一个 accent 按钮，颜色本身就是信息层级
3. **Pressed 有反馈**——微小的缩放让你感到"按下去"了，这是可感知的品质感
4. **Focus ring 从不移除**——无障碍不是附加功能，是默认行为

---

## 六、Card

### 卡片体系

Linear 的卡片不使用阴影，而是用**表面抬升 + 细边框**来传达层次：

| 属性 | 值 |
|---|---|
| **背景** | `#0F1011`（Surface-1） |
| **边框** | `1px solid #23252A` |
| **圆角** | `6px` 或 `8px` |
| **内边距** | 16px–24px |
| **阴影** | **无**——不使用 drop-shadow |

### 卡片交互

| 状态 | 表现 |
|---|---|
| **Default** | Surface-1 背景 + hairline border |
| **Hover** | 背景抬升至 Surface-2（`#141516`），边框稍亮 |
| **Active** | 背景抬升至 Surface-2 + accent 左边框（列表选中态） |
| **点击整卡** | 整张卡片可点击（不仅仅是标题或按钮） |

### 卡片设计规律

1. **不用阴影**——信任颜色深度来建立层次。阴影是"告诉"你这里有层次，表面抬升是"让你感觉到"这里有层次
2. **border 是最细的**——`1px` 边框，颜色 `#23252A`（几乎不可见但不完全不可见）
3. **内部的图是主角**——卡片框架尽可能低调，让产品截图/内容成为视觉焦点
4. **信息密度低**——一张卡片通常只有：图标 + 标题 + 一行描述 + 一个操作

---

## 七、Sidebar

### 结构

```
┌─────────────────┐
│  Workspace      │  ← 工作区名称 + Logo
│  ⌘K            │  ← 命令面板快捷键提示
├─────────────────┤
│  Search         │  ← 全局搜索
│  Inbox     3    │  ← 带未读计数
│  My Issues      │
├─────────────────┤
│  ─ PROJECTS ─   │  ← Section Header（全大写 + 宽字间距）
│  Project A      │
│  Project B  5   │  ← 带数字 badge
│  Project C      │
├─────────────────┤
│  ─ TEAMS ─      │
│  Team Alpha     │
│  Team Beta      │
├─────────────────┤
│                 │
│  (spacer)       │  ← flex-1 把下方内容推到底部
│                 │
├─────────────────┤
│  Settings       │
│  Help           │
│  User Avatar    │  ← 底部用户区
└─────────────────┘
```

### Sidebar 设计规律

| 特征 | 做法 | 为什么 |
|---|---|---|
| **宽度** | 固定 `260px`（w-64） | 不大不小，刚好容纳 icon + label + badge |
| **背景** | 比内容区略暗 | 视觉上让侧边栏"退后"，内容区"向前" |
| **Section Header** | `text-xs uppercase tracking-widest text-slate-500` | 极小的全大写标题，不抢注意力但提供结构 |
| **Nav Item** | icon + label + optional badge | 一行内完成所有信息传递 |
| **Active 状态** | 更亮的背景 + primary text | 清楚表明"你在这里" |
| **Hover 状态** | 背景变亮一级 | 即时反馈，无动画延迟 |
| **Badge** | 小圆角背景 + 数字/圆点 | 不喧宾夺主 |
| **图标** | 16px–18px Lucide icons，统一重绘 | 每个 icon 重新设计以保证视觉一致性 |
| **分隔线** | `border-b border-[#23252A]` | 最细的 border，几乎不察觉但提供结构 |

### 值得学习的点

1. **Section Header 的全大写 + tracking-widest**——极小的字但极高的字母间距，形成独特的节奏感
2. **左侧不抢戏**——侧边栏就是导航工具，不需要设计亮点，稳定低调即可
3. **⌘K 的存在**——把命令面板的快捷方式直接放在最显眼的位置，教育用户使用键盘

---

## 八、Header

### 官网 Header

| 特征 | 做法 |
|---|---|
| **定位** | `position: fixed; top: 0`，始终可见 |
| **背景** | 初始透明，滚动后变为毛玻璃（`bg-white/80 backdrop-blur-[20px]`） |
| **高度** | ~64px |
| **内容** | Logo + 导航链接 + CTA 按钮 |
| **导航项** | 极简：Product / Method / Customers / Pricing / Blog |
| **边框** | 滚动后出现 `border-b` 细线分隔 |

### 产品内 Header（Top Bar）

| 特征 | 做法 |
|---|---|
| **定位** | 固定，右对齐（侧边栏右侧） |
| **背景** | 毛玻璃效果：`bg-white/80 backdrop-blur-[20px]` |
| **内容** | 面包屑 / View 切换（List/Board/Timeline）/ 筛选器 / 搜索 |
| **高度** | ~48px–52px |

### Header 设计规律

1. **少即是多**——官网导航只有 5 个链接，不做 dropdown menu 嵌套
2. **毛玻璃是唯一的"炫技"**——`backdrop-blur` 给导航带来轻微的深度感，但不过度
3. **不需要的时候透明**——初始状态透明导航让 Hero 区图片不受干扰
4. **产品内 Header 极度功能化**——不做装饰，只放视图切换和操作工具

---

## 九、Animation

### 动画哲学

Linear 的动画规则可以用一句话概括：**能不用就不用，用了就做到 60fps。**

| 规则 | 具体做法 |
|---|---|
| **只动画 `transform` 和 `opacity`** | 绝不动画 `width`/`height`/`top`/`left`/`margin`/`padding` |
| **200ms 上限** | 任何交互反馈不超过 200ms |
| **Easing** | 进入用 `ease-out`，离开用 `ease-in` |
| **不模糊大表面** | 不对大面积表面使用 `blur()` 或 `backdrop-filter` 动画 |
| **动画时才设 `will-change`** | 动画结束后移除，不常驻 |
| **尊重 `prefers-reduced-motion`** | 系统开启了"减少动效"就禁用动画 |

### 微交互清单

| 场景 | 动画 | 时长 | Easing |
|---|---|---|---|
| **按钮按下** | `scale(1) → scale(0.97) → scale(1)` | 150ms | ease-out |
| **卡片入场** | `opacity: 0 + translateY(8px) → opacity: 1 + translateY(0)` | 200ms | ease-out |
| **卡片 stagger** | 每个卡片延迟 50-80ms 依次入场 | 200ms/个 | ease-out |
| **Hover 反馈** | 背景颜色瞬时切换（无过渡动画） | 0ms | — |
| **Sidebar 切换** | 平移 + 透明度 | 200ms | ease-out |
| **Modal 打开** | `opacity: 0 + scale(0.95) → opacity: 1 + scale(1)` | 150ms | ease-out |
| **Toast 出现** | `translateY(8px) + opacity: 0 → translateY(0) + opacity: 1` | 200ms | ease-out |
| **Dropdown 展开** | `opacity: 0 + scale(0.95) → opacity: 1 + scale(1)` | 150ms | ease-out |
| **Loading** | Skeleton shimmer（骨架屏扫描光），不用 spinner | 持续 | — |
| **页面切换** | 无页面级动画（SaaS 工具不需要） | — | — |

### 为什么动画感觉舒服？

1. **快**——200ms 上限意味着你从不等动画。它不是"表演"，是"反馈"
2. **不打扰**——动画只用 opacity 和 transform，这些是 GPU 属性。没有重排，没有卡顿
3. **克制**——SaaS 工具不是电影，不需要华丽的转场。动画只在需要传达"发生了什么"时才用
4. **骨架屏 > Spinner**——Skeleton 给用户"内容正在填充"的感觉，Spinner 只给"等待"的感觉

---

## 十、为什么看起来高级

这是本次分析的核心问题。Linear 的"高级感"来自多个层面的叠加：

### 10.1 颜色纪律

**整个产品只有一种彩色。** 

当一个产品只有一个 accent color 时，这个颜色的每一次出现都有意义。它不是在"装饰"，而是在"指示"——告诉用户这里是最重要的操作。大多数产品的配色是"调色板驱动"的，Linear 的配色是"克制驱动"的。

### 10.2 表面抬升代替阴影

阴影是廉价的。表面抬升是精密的。

Linear 不使用 `box-shadow` 来区分层次。4 个 Surface 层级之间只差 2-3 个明度值 (`#080A0A → #0F1011 → #141516 → #18191A`)，差距小到你几乎看不到，但你能感觉到。这是一种"不喧哗"的深度表达。

### 10.3 像素级对齐

Karri Saarinen（Linear 创始人/设计师）亲自在 Figma 里逐像素调整每个 label、icon、button 的垂直和水平对齐。这不是 AI 能自动做到的——这是人的判断力和强迫症。

### 10.4 LCH 色彩空间

没有几个产品会用数学上更精确的色彩空间来管理主题。Linear 投入这个工程成本，换来的是：light/dark mode 自动完美切换、高对比度无障碍主题自动生成、用户自定义主题只需 3 个参数。

### 10.5 不取悦所有人

Linear 不做 A/B test 驱动设计。创始人直接画 Figma，6 周从概念到上线。这不是"傲慢"——这是对品味的自信。当一个产品的设计是 committee-driven 的，它最终会趋向平庸。Linear 的设计是 vision-driven 的，所以有个性。

### 10.6 信息密度递进

Hero 信息极少 → 往下逐渐增加细节。从未让用户感觉"太多"。每一屏只说一件事。

### 10.7 不做多余的事

- 不用阴影 → 用表面抬升
- 不用多个彩色 → 用 1 个
- 不用多种字体 → 用 1 个
- 不用长动画 → 200ms 上限
- 不装饰 → 每个像素都有功能

**"完美的境界不是没有什么可以添加，而是没有什么可以去掉。"** —— Linear 活成了这句话。

### 10.8 可感知的工程投入

自定义 LCH 主题引擎、手写 Liquid Glass 效果（带真实 GPU 光照计算）、每一个 icon 重新绘制、骨架屏、60fps 的动画纪律……这些都是用户不一定知道但一定能感受到的投入。高级感来自"有人在乎这些细节"。

---

## 十一、可纳入 Design System 的设计资产

### 可直接采纳的原则

| 原则 | 适用场景 |
|---|---|
| **单 accent color 纪律** | 所有产品类型 |
| **表面抬升代替阴影** | 后台管理系统（尤其适合暗色模式） |
| **8px 基础网格** | 全局 |
| **单一字体族** | 全局 |
| **200ms 动画上限** | 全局 |
| **只用 transform + opacity 做动画** | 全局 |
| **每个区块一个 CTA** | Landing Page |
| **Ghost 为默认按钮** | 后台管理系统 |
| **无阴影卡片** | 后台管理系统 |

### 建议新增的 Design Token

```
颜色系统:
  - Surface Ladder: page / surface-1 / surface-2 / surface-3（暗色模式）
  - Hairline Border Scale: border-1 / border-2 / border-3
  - Single Accent Color（只定义一个主色，不定义辅助色）

间距系统:
  - 基于 8px 网格
  - Section Spacing: py-24 / py-32

字体系统:
  - 单字体族（Inter）
  - 字重限制在 4 种以内
  - 不改 letter-spacing（除非 Display 级别）

圆角:
  - 统一 6px / 8px（不要 4 种以上的圆角值）
```

### 建议新增的组件规范

- **Hairline Border**：`1px solid` 颜色为 `#23252A`（暗色）的边框模式
- **Surface Card**：无阴影、靠背景色抬升的卡片
- **Skeleton Loader**：骨架屏加载模式（优于 Spinner）
- **Ghost Button**：默认按钮风格
- **Staggered List**：列表项的延迟入场动画模式

### 建议更新的 Checklist

在 `checklists/ui-review.md` 中增加：
- [ ] 颜色种类是否超过必要？（检查彩色数量，能否减少？）
- [ ] 阴影是否必要？（能否用表面抬升代替？）
- [ ] 动画是否超过 200ms？
- [ ] 是否只动画了 transform 和 opacity？

---

## 参考来源

- Linear Blog: [A Design Reset (Part I)](https://linear.app/blog/a-design-reset)
- Linear Blog: [How We Redesigned the Linear UI (Part II)](https://linear.app/now/how-we-redesigned-the-linear-ui)
- Linear Blog: [A Linear Spin on Liquid Glass](https://linear.app/now/linear-liquid-glass)
- DJ Petersen: [The Three-Variable Theme System](https://www.thedjpetersen.com/thoughts/linear-theme/)
- YC Startup Library: [Brand Design Tips From Linear Founder Karri Saarinen](https://www.ycombinator.com/library/Mk-brand-design-tips-from-linear-founder-karri-saarinen)
- DEV.to: [I Cloned Linear's Sidebar in 50 Lines of HTML](https://dev.to/dev48v/i-cloned-linears-sidebar-in-50-lines-of-html-one-file-zero-npm-40ej)
