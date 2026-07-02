# Vercel 官网设计分析

> 分析日期：2026-07-01
> 分析对象：vercel.com（官方网站及 Geist Design System）
> 目的：提炼可复用的设计规律，而非复制

---

## 一、页面布局

### 整体结构

Vercel 官网采用**单页纵向滚动 + 品牌区块**结构，从上到下依次为：

```
Header（固定导航）
  └─ Logo + 导航链接 + CTA 按钮
  └─ position: fixed, 毛玻璃背景

Hero（主视觉）
  └─ 蓝图网格背景（Grid Lines）
  └─ SVG 三角形 + CSS 渐变光晕
  └─ 大标题 + GLSL Shader（渐进增强）
  └─ 像素化图标动画

Client Logos（信任背书）
  └─ Marquee 无限滚动 logo 条

Feature Sections（产品区块，3-4 个）
  └─ 左右分栏：产品截图 + 功能文案
  └─ 每个区块聚焦一个使用场景

Code Demo（代码展示区）
  └─ 代码块 + 语法高亮
  └─ 实时部署演示

CTA（底部）

Footer
```

### 布局规律

| 特征 | 做法 | 原因 |
|---|---|---|
| **蓝图网格贯穿始终** | 所有页面使用统一的 grid lines 背景 | 建立"系统性/工程感"的品牌联想 |
| **内容居中约束** | `max-width: 1200px` + `mx-auto` + `px-(--geist-page-margin)` | 大屏不散，视觉焦点集中 |
| **每屏一个主题** | 一次只说一件事，大量留白环绕 | 聚焦 = 信息传达效率 |
| **内容宽度** | 1080px 处分为三个 360px 列 | 每列恰好容纳 14-16px 文字的可读行长 |
| **Crosshairs（十字标记）** | 网格交叉处放置十字准星标记 | 灵感来自传统印刷的裁切标记，建立精密度 |
| **信息密度递进** | Hero 极少信息 → 往下细节逐步增加 | 先吸引，再说服 |

### 产品内布局（App Shell）

Vercel 控制台采用**侧边栏 + 顶栏**布局：

```
┌──────────┬──────────────────────────┐
│          │  Top Bar（顶栏）          │
│ Sidebar  ├──────────────────────────┤
│          │                          │
│  w-[260px]│  Content Area            │
│          │  flex-1                  │
└──────────┴──────────────────────────┘
```

---

## 二、Grid 系统

### 蓝图网格（Blueprint Grid）—— Vercel 标志性设计

Vercel 的 Grid 不是 CSS layout grid，而是**可见的装饰性网格线**——这是 Vercel 美学的最核心元素。

| 属性 | 值 |
|---|---|
| **线宽** | 1px |
| **间距** | 16px 或 24px |
| **透明度** | 10-20%（几乎不可见，但能感觉到） |
| **颜色（Light）** | `rgba(0, 0, 0, 0.05)` |
| **颜色（Dark）** | `rgba(255, 255, 255, 0.05)` |

### CSS 实现

```css
/* 线条网格 */
.grid-background {
  background-image:
    linear-gradient(rgba(0, 0, 0, 0.05) 1px, transparent 1px),
    linear-gradient(90deg, rgba(0, 0, 0, 0.05) 1px, transparent 1px);
  background-size: 24px 24px;
}

/* 点阵 */
.dot-grid {
  background-image: radial-gradient(circle, rgba(0, 0, 0, 0.1) 1px, transparent 1px);
  background-size: 16px 16px;
}
```

### Grid 组件（技术实现）

Vercel 团队自建了 Grid React 组件，使用 `display: contents` 技巧：

- `Grid.System` — 页面根级网格系统
- `Grid` — 带 rows/columns 的网格
- `Grid.Cell` — 网格单元，支持 `auto` 行/列
- `Grid.Cross` — 十字准星标记，放在任意行列交叉处

关键技巧：用 `display: contents` 让 guide cells 不干扰实际 children 的布局，同时自动绘制完整网格线。

### 页面级布局 Grid

```
Content Wrapper:   max-width: 1200px, mx-auto
Column Guide:      1080px → 3 列 × 360px
Gap:               基于 8px 网格的倍数
Section Spacing:   大区块间距
```

### 为什么感觉规整？

1. **网格在背景中贯穿始终**——即使你不看它，它也提供了潜意识的秩序感
2. **Crosshairs 提供锚点**——十字标记暗示"这是被精确度量的"
3. **三列系统匹配行长**——360px 恰好是 14-16px 字体的最佳阅读宽度
4. **一切都在格子里**——React 组件级别的网格抽象让任何页面都能快速套用

---

## 三、Typography

### 字体家族

| 用途 | 字体 | 说明 |
|---|---|---|
| **正文/UI** | Geist Sans | Vercel 专属无衬线，瑞士风格 |
| **Code** | Geist Mono | Vercel 专属等宽字体 |
| **Fallback** | system-ui, -apple-system | 系统兜底 |

### 字号体系（Geist Typography Classes）

#### Headings

| Class | 字号 | 用途 |
|---|---|---|
| `text-heading-72` | 72px | Marketing Hero |
| `text-heading-64` | 64px | — |
| `text-heading-56` | 56px | — |
| `text-heading-48` | 48px | — |
| `text-heading-40` | 40px | — |
| `text-heading-32` | 32px | Marketing 副标题、Dashboard 标题 |
| `text-heading-24` | 24px | — |
| `text-heading-20` | 20px | — |
| `text-heading-16` | 16px | — |
| `text-heading-14` | 14px | — |

#### Labels（单行文本）

| Class | 字号 | 用途 |
|---|---|---|
| `text-label-20` | 20px | Marketing |
| `text-label-18` | 18px | — |
| `text-label-16` | 16px | 标题中区分内容 |
| `text-label-14` | 14px | **最常用**——菜单、UI 文本 |
| `text-label-14-mono` | 14px | 大号等宽标签 |
| `text-label-13` | 13px | 辅助行、数字（支持 Tabular Nums） |
| `text-label-13-mono` | 13px | 与 Label 14 配对的小号等宽 |
| `text-label-12` | 12px | 三级文本、全大写 |
| `text-label-12-mono` | 12px | — |

#### Copy（多行正文）

| Class | 字号 | 用途 |
|---|---|---|
| `text-copy-24` | 24px | Hero 区域 |
| `text-copy-20` | 20px | Hero 区域 |
| `text-copy-18` | 18px | Marketing, 大引用 |
| `text-copy-16` | 16px | Modal 等宽敞视图 |
| `text-copy-14` | 14px | **最常用正文** |
| `text-copy-13` | 13px | 辅助文本、紧凑视图 |
| `text-copy-13-mono` | 13px | 内联代码 |

#### Buttons

| Class | 字号 | 用途 |
|---|---|---|
| `text-button-16` | 16px | 最大按钮 |
| `text-button-14` | 14px | **默认按钮** |
| `text-button-12` | 12px | 输入框内的小按钮 |

### Typography 规律

| 规则 | 做法 | 为什么 |
|---|---|---|
| **单一字体族** | 仅用 Geist Sans + Geist Mono | 消除字体混搭摩擦 |
| **Label vs Copy 分离** | Label 单行（小行高）、Copy 多行（大行高） | 场景不同，需求不同 |
| **Subtle / Strong** | 通过 `<strong>` 嵌套继承样式 | 不增加 class 数量 |
| **等宽 = Geist Mono** | 代码和数据用专属等宽 | 为自己的字体量身定做 |
| **高对比度** | 10 级文本色（Color 9 = secondary, Color 10 = primary） | 清晰但不刺眼 |

---

## 四、配色

### 核心理念：黑白为主 + 极克制的色彩

Vercel 的配色极其克制。整个系统只有**黑白灰 + 少量语义色**，不使用多种彩色来装饰。

### Light Mode

| Token | 用途 |
|---|---|
| **Background 1** | 默认页面/元素背景（`#FAFAFA`） |
| **Background 2** | 次级背景（需要微妙区分时使用） |
| **Color 1** | 组件默认背景 |
| **Color 2** | Hover 背景 |
| **Color 3** | Active 背景 |
| **Color 4** | 默认边框 |
| **Color 5** | Hover 边框 |
| **Color 6** | Active 边框 |
| **Color 7** | 高对比度背景 |
| **Color 8** | Hover 高对比度背景 |
| **Color 9** | 次要文本/图标 |
| **Color 10** | 主要文本/图标 |

### 语义色

| 颜色 | 用途 |
|---|---|
| **Gray** | 中性背景/边框 |
| **Blue** | 链接、信息 |
| **Red** | 错误、删除 |
| **Amber** | 警告 |
| **Green** | 成功 |
| **Teal** | — |
| **Purple** | — |
| **Pink** | — |

### 颜色数量

| 类别 | 数量 |
|---|---|
| **中性色** | 10 级（Background × 2 + Color × 10） |
| **语义色** | 8 种（但同一页面不会全部使用） |
| **同一页面实际彩色** | 通常 ≤ 2 种 |

### P3 广色域

Geist 颜色在支持 P3 色域的浏览器和显示器上自动使用 P3 色彩，在不支持的设备上 fallback 到 sRGB。

### 为什么看起来高级？

1. **黑白为主，色彩只用于传达意义**——不是装饰，是信息
2. **10 级灰阶精确控制层次**——每个层级之间有明确的视觉分离
3. **P3 广色域**——在支持的屏幕上色彩更丰富，但在普通屏幕上也不出错
4. **语义色的使用极克制**——红色只用于错误，绿色只用于成功，从不滥用
5. **`#FAFAFA` 而不是纯白 `#FFF`**——微微暖的底色更柔和

---

## 五、Button

### 按钮体系

| Variant | 用途 |
|---|---|
| **Primary**（默认） | 主要操作——Deploy, Save, Create |
| **Secondary** | 辅助操作 |
| **Tertiary** | 三级操作 |
| **Error** | 破坏性操作——Delete, Remove |
| **Warning** | 警告操作 |

> 重要：Geist 的 Button `type` 只接受 `primary`、`secondary`、`tertiary`、`error`、`warning`。不提供 `success`、`ghost`、`violet` 等变体——保持克制。

### 尺寸

| Size | 用途 |
|---|---|
| **large** | 最大按钮 |
| **medium**（默认） | 标准按钮 |
| **small** | 紧凑场景 |

### 形状

| Shape | 用途 |
|---|---|
| **default** | 标准矩形 |
| **rounded** | 全圆角 + 阴影，用于 Marketing 页面 |
| **svgOnly** | 纯图标按钮（需配合 `aria-label`） |

### 交互状态

| 状态 | 表现 |
|---|---|
| **Default** | 背景色 + 文字 |
| **Hover** | 背景变亮/变暗 |
| **Active** | 背景进一步变化 |
| **Loading** | 显示 Spinner，保持可聚焦 |
| **Disabled** | 降低透明度 + `cursor: not-allowed` |

### 设计规律

| 特征 | 做法 |
|---|---|
| **圆角** | 与系统统一（`var(--geist-radius)`） |
| **字重** | Medium |
| **最小高度** | 触控友好 |
| **图标** | 支持 prefix / suffix |
| **Loading** | 用 `loading` prop 而非手动换 Spinner——保持按钮可聚焦 |

### ButtonLink

按钮外观的链接——用于导航而非操作。`ButtonLink` 与 `Button` 共享所有视觉 props。

### 命名规范

- 按钮文案使用 **Title Case**，描述将发生什么：`Deploy Project`、`Invite Member`、`Rotate Key`
- 避免裸动词（`Submit`）和通用确认词（`OK`、`Confirm`）
- 破坏性操作：`Verb + Noun` → `Delete Project`，Toast 反馈呼应：`Project deleted`

### 值得学习的点

1. **Primary 是默认**——不需要为每个按钮指定 variant
2. **没有 Ghost variant**——克制到连 Ghost 都不提供
3. **Loading 保持可聚焦**——无障碍不是事后补丁
4. **命名规范统一**——按钮文案和 Toast 反馈是配对的，形成闭环

---

## 六、Card

### 卡片体系

| 属性 | 值 |
|---|---|
| **背景** | Background 1（默认页面背景） |
| **边框** | 可选 `border`（Color 4） |
| **圆角** | `var(--geist-radius)` |
| **阴影** | **无**——不使用 box-shadow |

### 卡片变体

| Variant | 特征 |
|---|---|
| **Default** | 标准卡片 |
| **Hover** | 带 hover 效果 |
| **Border** | 带边框 |
| **Border Between** | 内部横向分隔线 |
| **Border Between Vertical** | 内部纵向分隔线 |
| **Secondary** | 次级背景卡片 |

### 设计规律

1. **不用阴影**——用边框和背景色差来区分层次
2. **可选边框**——大多数场景不需要边框，需要时才加
3. **极简**——卡片就是容器，不抢内容的风头
4. **Border Between**——非常实用的分隔模式，适合列表型卡片

---

## 七、Navigation / Header

### 官网 Header

| 特征 | 做法 |
|---|---|
| **定位** | `position: fixed; top: 0` |
| **背景** | 初始透明，滚动后毛玻璃 |
| **高度** | `var(--header-height)` |
| **内容** | Logo + 导航链接 + CTA 按钮 |
| **导航项** | 极简，只有核心链接 |
| **Skip Link** | 提供 "Skip to content" 无障碍跳转 |

### 产品内 Header（Top Bar）

| 特征 | 做法 |
|---|---|
| **定位** | 侧边栏右侧，固定 |
| **背景** | 毛玻璃 |
| **内容** | 面包屑 / View 切换 / 搜索 |
| **高度** | ~48px |

### 设计规律

1. **透明 → 毛玻璃切换**——初始透明让 Hero 不受干扰，滚动后提供可读性
2. **Skip Link 默认存在**——无障碍第一
3. **导航项极少**——不堆叠 dropdown menu，保持简单

---

## 八、Animation

### 动画哲学

Vercel 的动画哲学与 Linear 类似：**能不用就不用，用了就做到 60fps。**

| 规则 | 做法 |
|---|---|
| **只在 transform/opacity 上动画** | 不动画 width/height/top/left |
| **尊重 prefers-reduced-motion** | 用 `animation-play-state: paused` 而非 `animation: none` |
| **渐进增强** | Hero Shader 在低功耗设备上不加载 |
| **节奏感** | 高新颖度动画从不连续出现，中间穿插低新颖度微交互 |

### 微交互清单

| 场景 | 动画 | 时长 |
|---|---|---|
| **像素化图标** | Canvas 逐像素绘制，模拟老式显示器 | 快速（实际渲染极快） |
| **Orbit Rings** | CSS `offset-path: content-box` 环形运动 | 循环 |
| **光标闪烁** | CSS keyframes + `animation-play-state` | 循环 |
| **Grid 入场** | 区块淡入 | ~200ms |
| **Hero Shader** | GLSL Shader 淡入（页面加载完成后） | 渐进 |
| **Marquee Logo** | 无限滚动 | `var(--marquee-speed)` |

### 动画节奏（Visual Rhythm）

Vercel 设计师刻意控制页面的"新颖度密度"：

- 🟠 **高新颖度区**（图表 tooltip 长距离动画、像素化图标） —— 从不连续出现
- 🔵 **低新颖度区**（浮动光标、hover 缩放） —— 穿插在高新颖度之间提供"呼吸"

### 值得学习的点

1. **`animation-play-state: paused` 而非 `none`**——减少动效时动画不会突兀消失
2. **Shader 是渐进增强**——低功耗设备不加载，保持性能
3. **`offset-path: content-box`**——无需复杂 SVG path 就能做环形动画
4. **动画节奏设计**——高新颖度不能连续出现，需要"休止符"

---

## 九、为什么看起来高级

### 9.1 蓝图网格：潜意识秩序

Vercel 最独特的视觉资产是**背景中的蓝图网格线**。

- 透明度只有 10-20%，你"感觉"到它而不是"看到"它
- 它传递的信息是：精确、系统性、工程感
- 灵感来自瑞士设计的网格传统 + 工程蓝图
- 不是装饰，是品牌叙事的视觉化

### 9.2 色彩纪律

**整个系统建立在黑白灰之上。** 语义色只在需要传达特定含义时才出现。没有为了"好看"而添加的多余彩色。

### 9.3 字体是定制的

Geist Sans 和 Geist Mono 是 Vercel 委托 Basement 设计的专属字体。瑞士风格，专为屏幕优化。不是随便挑的开源字体——这是品牌投入的体现。

### 9.4 每一个细节都经过工程思考

- **Grid 组件**：用 `display: contents` 解决了网格线渲染的 CSS 难题
- **像素化图标**：从 Figma 导出 bitmap，用 Ruby 脚本转成矩阵，Canvas 逐像素渲染
- **Hero Shader**：GLSL Shader 渐进增强，低端设备自动跳过
- **代码块**：伪元素行号用 `content: counter(line) / ""` 对屏幕阅读器隐藏
- **Orbit Rings**：用 `offset-path: content-box` 做环形动画

### 9.5 不做多余的事

- 不用阴影 → 用网格和边框
- 不用多种彩色 → 黑白为主
- 不用多种字体 → 只用 Geist
- 不堆砌动画 → 精心控制节奏
- 不为了设计而设计 → 每个元素都有功能

### 9.6 可感知的工程投入

用户不一定知道 GLSL Shader 是什么、`display: contents` 是什么、像素矩阵怎么来的。但他们能感受到："这个网站不一般"。这种感受来自：
- 定制字体
- 可见的 Grid 系统
- 像素化图标的独特风格
- 60fps 的动画
- 每一个交互都经过精细调试

### 9.7 视觉节奏

高新颖度动画从不连续出现。每一个吸引眼球的动效之后，都有一个"安静"的区域让你呼吸。这不是偶然——设计师刻意规划了整个页面的"新颖度地图"。

---

## 十、可纳入 Design System 的设计资产

### 可直接采纳的原则

| 原则 | 适用场景 |
|---|---|
| **蓝图网格背景** | 开发者工具、SaaS、技术产品 Landing Page |
| **Label / Copy 分离** | 所有产品（单行用 Label，多行用 Copy） |
| **Subtle / Strong 嵌套继承** | Typography 系统（用 `<strong>` 而非额外 class） |
| **10 级灰阶 Color System** | 所有产品（Background × 2 + Color × 10） |
| **不给 Button 太多 variant** | 所有产品（≤ 5 种 variant） |
| **命名规范：Title Case + Verb + Noun** | 按钮和 Toast |
| **动画节奏规划** | Landing Page |
| **渐进增强（低端设备跳过）** | 高性能动画/Shader |

### 建议新增的 Design Token

```
颜色系统:
  - 10 级灰阶：Background 1-2 → Color 1-10
  - 语义色：仅 Blue / Red / Amber / Green
  - 不使用 10+ 种彩色

字体系统:
  - Label 系列（单行，小行高）
  - Copy 系列（多行，大行高）
  - Button 系列
  - Subtle / Strong 嵌套继承模式

Grid:
  - 蓝图网格背景：10-15% opacity, 16px/24px 间距
  - Cross 标记
  - 三列指导线（1080px → 3 × 360px）
```

### 建议新增的组件规范

- **Blueprint Grid Background**：装饰性网格背景（以 CSS background 而非 DOM 元素实现）
- **Crosshair Marker**：十字准星标记（Grid 交叉处）
- **Marquee**：无限滚动 logo/内容条
- **Code Block with Line Numbers**：伪元素行号 + 屏幕阅读器友好
- **Pixelated Icon**：Canvas 像素化图标渲染

---

## 参考来源

- Vercel 官网: https://vercel.com
- Geist Design System: https://vercel.com/geist
- Geist Colors: https://vercel.com/geist/colors
- Geist Typography: https://vercel.com/geist/typography
- Rauno Freiberg: [What will you ship?](https://rauno.me/craft/vercel)
- Setproduct: [Vercel aesthetic: a complete guide to Blueprint Grid design](https://www.setproduct.com/blog/complete-guide-to-blueprint-grid-design)
