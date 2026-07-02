# Typography

Design System 字体与排版规范。所有组件必须引用此文件中的字号层级、字重、行高，不得自行定义 Typography 样式。

> **关联 Token**: [Colors](./colors.md)（文字色引用） · [Spacing](./spacing.md)（间距与排版节奏）
>
> **关联组件**: [Prose](../components/content/prose.md)（长文本排版——复用此 Type Scale 的所有层级）

---

## 一、设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 字体族 | 系统字体栈（不引入 Web Font） | Linear / Stripe / Vercel 均使用系统字体——零加载时间，跨平台最优渲染 |
| UI 字号 | `text-sm` (14px) | 按钮/输入框/Badge/Toast 等交互组件统一 14px——信息密度与可读性最佳平衡 |
| 正文字号 | `text-base` (16px) | 长文本阅读舒适度优先——W3C 可访问性指南推荐 ≥16px |
| 标题字重 | `font-semibold` (600) | 比 `font-bold` (700) 更现代——Linear / Notion 均用 600 |
| 行高 | Tailwind 默认（浏览器优化值） | 不自定义 leading——Tailwind 的行高经过跨浏览器测试 |
| 标题 tracking | `tracking-tight` | 大字号默认字距偏松，微收紧提升紧凑感 |
| 等宽字体 | `ui-monospace, SFMono-Regular, monospace` | 跨平台最优等宽栈——macOS SF Mono / Windows Cascadia Code |
| 字重数量 | 4 级 (400/500/600/700) | 足够覆盖所有场景，避免字重过多造成视觉噪音 |

---

## 二、Font Family（字体族）

### 系统字体栈

```
font-sans: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI",
           Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif

font-mono: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas,
           "Liberation Mono", "Courier New", monospace
```

| Token | Tailwind | 字体栈 | 用途 |
|-------|----------|--------|------|
| `font-sans` | `font-sans` | 系统 sans-serif 栈 | **所有 UI 元素和正文**（默认，无需显式声明） |
| `font-mono` | `font-mono` | 系统 monospace 栈 | 代码块、行内代码、数据表格数字列 |

### 为什么不引入 Web Font

```
❌ Inter / SF Pro / Manrope → 额外网络请求，FOUT/FOIT，中文字体回退不可控
✅ 系统字体栈             → 零加载时间，跨平台最优渲染，中英文自动适配
```

顶级产品共识：Linear 用 SF Pro（macOS）/ Segoe UI（Windows）、Stripe 用系统栈、Notion 用系统栈。不引入 Web Font 是最务实的工程决策。

---

## 三、Type Scale（字号层级）

基于 Tailwind 默认 Type Scale，共 9 级。覆盖从 Badge caption 到 Hero 标题的所有场景。

| Level | Tailwind | 字号 | 行高 | 字重 | Tracking | 用途 |
|-------|----------|------|------|------|----------|------|
| **xs** | `text-xs` | 12px | 16px (1.33) | `font-medium` | `tracking-normal` | Badge、Caption、Table Header、辅助标签 |
| **sm** | `text-sm` | 14px | 20px (1.43) | `font-normal` / `font-medium` | `tracking-normal` | **UI 正文**——按钮、输入框、下拉菜单、Toast、Card 描述 |
| **base** | `text-base` | 16px | 24px (1.5) | `font-normal` | `tracking-normal` | **长文本正文**——文章、文档、评论、Modal Body |
| **lg** | `text-lg` | 18px | 28px (1.56) | `font-medium` / `font-semibold` | `tracking-normal` | 强调段落、Modal 标题、大按钮 |
| **xl** | `text-xl` | 20px | 28px (1.4) | `font-semibold` | `tracking-tight` | 小标题、Card 标题（小） |
| **2xl** | `text-2xl` | 24px | 32px (1.33) | `font-semibold` | `tracking-tight` | **Card 标题**（标准）、Sheet 标题 |
| **3xl** | `text-3xl` | 30px | 36px (1.2) | `font-semibold` | `tracking-tight` | Section 标题、页面标题（二级） |
| **4xl** | `text-4xl` | 36px | 40px (1.11) | `font-semibold` | `tracking-tight` | 页面标题（一级） |
| **5xl** | `text-5xl` | 48px | 1 (1.0) | `font-semibold` | `tracking-tight` | Hero 标题、Landing Page 主标题 |

### Type Scale 使用原则

```
✅ UI 组件默认 text-sm (14px)     → 按钮、输入框、Badge、Select、Toast、Table Cell
✅ 长文本默认 text-base (16px)    → 文章、文档、Modal Body、Prose
✅ 页面标题不超过 4xl (36px)      → 管理后台类产品；Landing Page 可用 5xl
✅ 标题层级 ≤ 3 级                → 页面内 h1/h2/h3 足够，4 级以上极少需要
✅ heading tracking 统一 tight    → 从 xl 起收紧字距，抵消大字号天然松散感
```

---

## 四、Font Weight（字重）

仅四档，覆盖所有场景。

| Weight | Tailwind | 数值 | 用途 | 适用元素 |
|--------|----------|------|------|---------|
| **normal** | `font-normal` | 400 | 正文、描述、辅助信息 | 文章段落、Card 描述、Input placeholder、Toast body |
| **medium** | `font-medium` | 500 | 强调文字、UI 标签 | Badge、Button (Ghost/Secondary)、Input label、Toggle label、Table Cell |
| **semibold** | `font-semibold` | 600 | **标题**、主按钮 | Card 标题、Modal 标题、Button Primary、Prose h1-h4 |
| **bold** | `font-bold` | 700 | 大标题（极少使用） | Hero 标题（可选）、数据指标强调 |

### 字重使用原则

```
✅ 标题统一 font-semibold (600)   → 比 bold 更现代，Linear/Notion 共识
✅ UI 标签统一 font-medium (500)  → Badge/Button/Input label 一致
✅ 正文统一 font-normal (400)     → 长文本阅读最舒适
❌ 混用 semibold 和 bold          → 视觉噪音，用户感知不到 600 vs 700 差异
❌ 使用 font-light (300)          → 对比度风险，且系统中没有此需求
```

---

## 五、Line Height（行高）

不自定义 `leading-*`。使用 Tailwind 默认行高——这些值是浏览器厂商多年优化的结果，无需覆盖。

| 场景 | Tailwind 默认 | 说明 |
|------|-------------|------|
| UI 组件 (`text-sm`) | `leading-5` (20px) | 14px 字号的舒适行高——按钮、输入框单行场景天然匹配 |
| 正文 (`text-base`) | `leading-6` (24px) | 1.5 倍行高——W3C 推荐长文本行高 ≥1.5 |
| 标题 (`text-xl`+) | 自动收紧 | 大字号行高按比例递减——标题通常单行，不需要大行高 |

### 特殊情况

| 场景 | 方案 | 说明 |
|------|------|------|
| Prose 正文段落 | `leading-relaxed` (1.625) | 长文本需要稍宽松的行高提升可读性 |
| Hero 标题 | `leading-none` (1.0) | 48px+ 标题紧密排列更有冲击力 |
| 多行 Badge | 保持默认 | Badge 通常单行，不预设多行场景 |

---

## 六、Letter Spacing（字间距）

| Token | Tailwind | 值 | 用途 |
|-------|----------|-----|------|
| `tracking-tight` | `tracking-tight` | -0.025em | 标题 (≥text-xl)——收紧大字号天然松散字距 |
| `tracking-normal` | `tracking-normal` | 0 | UI 组件 + 正文——默认即可（无需显式声明） |
| `tracking-wider` | `tracking-wider` | 0.05em | Table Header、Badge 大写——扩大字距提升可读性 |

### 使用原则

```
✅ 标题 (xl-5xl) 统一 tracking-tight  → 抵消大字号天然松散感
✅ Table Header 统一 tracking-wider   → 配合 uppercase，提升小字号可辨性
✅ UI 组件 + 正文 → 无需声明         → tracking-normal 是 Tailwind 默认
❌ tracking-wide (0.025em)            → 与 wider (0.05em) 视觉差异极小，不引入多余选项
```

---

## 七、Text Color Hierarchy（文字色层级）

文字色严格从 [Colors](./colors.md) 的中性色阶中选取，不引入新颜色。

| 层级 | Light | Dark | 用途 | 对比度 (Light) |
|------|-------|------|------|---------------|
| **Primary** | `text-gray-900` | `dark:text-gray-100` | 标题、主文字 | 16.7:1 (AAA) |
| **Body** | `text-gray-700` | `dark:text-gray-300` | 正文、UI 标签、按钮文字 | 7.1:1 (AAA) |
| **Secondary** | `text-gray-500` | `dark:text-gray-400` | 辅助文字、Placeholder、Caption | 4.5:1 (AA) |
| **Disabled** | `text-gray-400` | `dark:text-gray-500` | 禁用态文字 | 3.2:1 (不达标——但 disabled 豁免) |
| **On Brand** | `text-white` | `dark:text-white` | Brand 背景上的文字（Primary Button、Toggle ON、Checkbox Checked） | 6.5:1 (AA) |
| **Link** | `text-indigo-600` | `dark:text-indigo-400` | 链接文字（Prose 内） | 5.5:1 (AA) |
| **Error** | `text-red-600` | `dark:text-red-400` | 错误消息 | 5.3:1 (AA) |

### 文字色使用原则

```
✅ 主文字 gray-900  → 所有标题、重要的 UI 标签
✅ 正文 gray-700    → 段落、描述、按钮文字（Primary 除外）
✅ 辅助 gray-500    → placeholder、caption、timestamp、次要元数据
✅ 链接 indigo-600  → Prose 中的链接（与品牌色一致）
❌ 纯黑 #000        → 对比度过高，视觉疲劳
❌ gray-600         → 与 gray-500/gray-700 过度区分，不引入中间层级
```

---

## 八、组件 Typography 映射

每个组件的字号/字重选择，与 Type Scale 零偏差。

| 组件 | 元素 | 字号 | 字重 | 文字色 |
|------|------|------|------|--------|
| **Button Primary** | Label | `text-sm` | `font-semibold` | `text-white` (On Brand) |
| **Button Secondary** | Label | `text-sm` | `font-medium` | `text-gray-700` (Body) |
| **Button Ghost** | Label | `text-sm` | `font-medium` | `text-gray-700` (Body) |
| **Button Danger** | Label | `text-sm` | `font-semibold` | `text-white` (On Brand) |
| **Badge** | Label | `text-xs` | `font-medium` | 语义色映射 |
| **Input** | Text | `text-sm` | `font-normal` | `text-gray-700` (Body) |
| **Input** | Label | `text-sm` | `font-medium` | `text-gray-900` (Primary) |
| **Input** | Error | `text-xs` | `font-normal` | `text-red-600` (Error) |
| **Select** | Text | `text-sm` | `font-normal` | `text-gray-700` (Body) |
| **Textarea** | Text | `text-sm` | `font-normal` | `text-gray-700` (Body) |
| **Toggle** | Label | `text-sm` | `font-medium` | `text-gray-700` (Body) |
| **Checkbox** | Label | `text-sm` | `font-normal` / `font-medium` | `text-gray-700` (Body) |
| **Checkbox** | Description | `text-sm` | `font-normal` | `text-gray-500` (Secondary) |
| **Checkbox** | Legend | `text-sm` | `font-medium` | `text-gray-900` (Primary) |
| **Card** | Title | `text-2xl` | `font-semibold` + `tracking-tight` | `text-gray-900` (Primary) |
| **Card** | Description | `text-sm` | `font-normal` | `text-gray-500` (Secondary) |
| **Card** | Stat Value | `text-2xl` | `font-semibold` + `tracking-tight` | `text-gray-900` (Primary) |
| **Modal** | Title | `text-lg` | `font-semibold` | `text-gray-900` (Primary) |
| **Modal** | Body | `text-sm` | `font-normal` | `text-gray-700` (Body) |
| **Toast** | Title | `text-sm` | `font-medium` | `text-gray-900` (Primary) |
| **Toast** | Description | `text-sm` | `font-normal` | `text-gray-500` (Secondary) |
| **Table** | Header | `text-xs` | `font-medium` + `uppercase` + `tracking-wider` | `text-gray-500` (Secondary) |
| **Table** | Cell | `text-sm` | `font-normal` | `text-gray-700` (Body) |
| **Table** | Status (Badge) | `text-xs` | `font-medium` | 语义色映射 |
| **Prose** | h1 | `text-3xl` | `font-semibold` + `tracking-tight` | `text-gray-900` (Primary) |
| **Prose** | h2 | `text-xl` | `font-semibold` + `tracking-tight` | `text-gray-900` (Primary) |
| **Prose** | h3 | `text-lg` | `font-semibold` | `text-gray-900` (Primary) |
| **Prose** | h4 | `text-base` | `font-semibold` | `text-gray-900` (Primary) |
| **Prose** | p | `text-base` | `font-normal` + `leading-relaxed` | `text-gray-700` (Body) |
| **Prose** | code | `text-sm` | `font-medium` + `font-mono` | `text-gray-800` (介于 Primary/Body) |

---

## 九、可访问性

| 要求 | 实现 |
|------|------|
| 最小字号 | `text-xs` (12px) 是最小字号——低于此将违反 WCAG 可读性要求 |
| 正文对比度 | `text-gray-700` (#374151) : `bg-white` (#FFF) = 7.1:1 (WCAG AAA) ✅ |
| 辅助文字对比度 | `text-gray-500` (#6B7280) : `bg-white` (#FFF) = 4.5:1 (WCAG AA) ✅ |
| 品牌文字对比度 | `text-indigo-600` (#4F46E5) : `bg-white` (#FFF) = 5.5:1 (WCAG AA) ✅ |
| 仅依赖颜色传达信息 | 禁止——始终配合文字标签（如 Badge 颜色 + 文字标签） |
| 字体缩放 | 使用相对单位（rem），支持浏览器字体大小设置 |
| 标题层级 | 使用语义化 h1-h6，而非仅视觉样式 |

---

## 十、复用指南

### 新增组件时的 Typography 选择

```
控件标签 → text-sm font-medium text-gray-900
控件正文 → text-sm font-normal text-gray-700
控件辅助 → text-xs font-normal text-gray-500
容器标题 → text-2xl font-semibold tracking-tight text-gray-900
内容标题 → text-3xl font-semibold tracking-tight text-gray-900
内容正文 → text-base font-normal text-gray-700
```

### 禁止事项

```
❌ 使用 text-[15px] 等任意值             → 必须从 Type Scale 选取
❌ 混用 font-semibold 和 font-bold       → 标题统一 600
❌ 使用 font-light / font-extralight     → 对比度风险
❌ 自行定义 leading-[23px]               → 使用 Tailwind 默认
❌ 覆盖 font-family                      → 全局统一系统字体栈
❌ 使用纯黑 (#000) 或纯白 (#FFF) 文字     → 从文字色层级选取
```

---

> 参考: [Colors](./colors.md) · [Spacing](./spacing.md) · [Prose](../components/content/prose.md) · [Tailwind CSS Font Size](https://tailwindcss.com/docs/font-size) · [WCAG 1.4.3 Contrast (Minimum)](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html)
