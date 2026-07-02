# Colors

Design System 色彩规范。所有组件必须引用此文件中的颜色，不得使用临时颜色。

---

## 一、Neutral Palette（中性色）

以 `gray` 系列为骨架，构建从最深到最浅的完整灰阶。

| Token | Tailwind Class | 色值 (Hex) | 色值 (OKLCH) | 用途 |
|-------|---------------|-----------|-------------|------|
| neutral-50 | `gray-50` | `#f9fafb` | `oklch(98.5% 0 264)` | 极浅表面色 |
| neutral-100 | `gray-100` | `#f3f4f6` | `oklch(96.7% 0.003 264)` | 浅底色 |
| neutral-200 | `gray-200` | `#e5e7eb` | `oklch(92.8% 0.006 264)` | 边框 / 分割线 |
| neutral-300 | `gray-300` | `#d1d5db` | `oklch(87.2% 0.01 264)` | 较强边框 |
| neutral-400 | `gray-400` | `#9ca3af` | `oklch(70.7% 0.022 264)` | 禁用文字 |
| neutral-500 | `gray-500` | `#6b7280` | `oklch(55.1% 0.027 264)` | 辅助文字 |
| neutral-600 | `gray-600` | `#4b5563` | `oklch(44.6% 0.03 264)` | 次要文字 |
| neutral-700 | `gray-700` | `#374151` | `oklch(37.3% 0.034 264)` | 正文（浅色背景） |
| neutral-800 | `gray-800` | `#1f2937` | `oklch(27.8% 0.033 264)` | 标题 |
| neutral-900 | `gray-900` | `#111827` | `oklch(21% 0 264)` | 主文字 / 标题 |
| neutral-950 | `gray-950` | `#030712` | `oklch(13% 0 264)` | 最深色 |

### 中性色使用原则

- **主文字**: `gray-900` — 与纯黑 `#000` 相比更柔和，适合大面积阅读
- **正文**: `gray-700` — 在白色背景上有充足对比度（WCAG AA）
- **辅助文字**: `gray-500` — 提示、placeholder、caption
- **边框**: `gray-200` 或透明度方案（见下文）
- **表面色**: `gray-50` — 与纯白页面背景形成微妙层次

---

## 二、Transparency Scale（透明度层次）

在浅色背景为主的 UI 中，**优先用透明度构建层次，而非引入新颜色**。

| Token | Tailwind Class | 透明度 | 用途 |
|-------|---------------|--------|------|
| transparent-2.5 | `bg-gray-950/[2.5%]` | 2.5% | 卡片背景（几乎不可见） |
| transparent-5 | `bg-gray-950/5` / `border-black/5` | 5% | 分割线、轻微 hover 背景 |
| transparent-8 | `inset-ring-gray-950/8` | 8% | inset-ring 描边 |
| transparent-10 | `bg-gray-950/10` | 10% | 较强 hover / 选中态 |
| transparent-20 | `bg-gray-950/20` | 20% | 明显的叠加层 |
| transparent-50 | `bg-gray-950/50` | 50% | disabled 状态 / overlay |

### 透明度 vs 固定颜色

```
推荐: border-black/5    → 自适应背景，暗色模式下自动变亮
避免: border-gray-200   → 暗色模式下需单独覆盖
```

透明度方案的优势：
1. 在浅色背景上自动呈现灰色
2. 在暗色模式下自动反转（无需 `dark:` 覆盖）
3. 更少的 CSS 变量，更少的维护成本

---

## 三、Semantic Colors（语义色）

用于传达状态信息：成功、警告、错误、信息。**仅用于状态传达，不用于装饰。**

| Token | 语义 | 背景 (Light) | 文字 (Light) | 边框 (Light) |
|-------|------|-------------|-------------|-------------|
| success | 成功 / 已完成 | `bg-green-50` | `text-green-700` | `border-green-300` |
| warning | 警告 / 待处理 | `bg-amber-50` | `text-amber-700` | `border-amber-300` |
| error | 错误 / 失败 | `bg-red-50` | `text-red-700` | `border-red-300` |
| info | 信息 / 提示 | `bg-blue-50` | `text-blue-700` | `border-blue-300` |

### 暗色模式语义色

| Token | 背景 (Dark) | 文字 (Dark) |
|-------|------------|------------|
| success | `bg-green-900/30` | `text-green-400` |
| warning | `bg-amber-900/30` | `text-amber-400` |
| error | `bg-red-900/30` | `text-red-400` |
| info | `bg-blue-900/30` | `text-blue-400` |

暗色模式下语义色略降饱和度，以减少暗背景上的视觉疲劳。

---

## 四、Brand Accent（品牌强调色）— Indigo

品牌色选定为 **Indigo**。这是系统唯一的交互强调色——仅用于 CTA、链接、选中态。

### 品牌色阶

从 Indigo 50–950 中选取 8 档用于品牌系统：

| 色阶 | 色值 (Hex) | 明度 | 用途 |
|------|-----------|------|------|
| indigo-50 | `#EEF2FF` | 97.3% | 最浅背景（选中行、hover 行） |
| indigo-100 | `#E0E7FF` | 93.1% | 浅背景（Badge、Tag、高亮） |
| indigo-200 | `#C7D2FE` | 85.5% | Hover 背景（暗色模式用） |
| indigo-300 | `#A5B4FC` | 76.9% | 边框 / 分割线 |
| indigo-400 | `#818CF8` | 64.3% | 辅助图标、暗色模式品牌色 |
| indigo-500 | `#6366F1` | 50.2% | 品牌基准色（交互元素默认） |
| indigo-600 | `#4F46E5` | 38.2% | 主色 — 主按钮 / 链接（默认态） |
| indigo-700 | `#4338CA` | 29.0% | Hover / Active |
| indigo-800 | `#3730A3` | 22.4% | 文字按钮 hover 背景 |
| indigo-900 | `#312E81` | 16.4% | 最深品牌背景 |

### 品牌语义 Token

组件不直接引用色阶，而是引用以下语义 Token。统一修改 Token 的 Light/Dark 映射即可全局换色。

| Token | Light | Dark | Tailwind 示例 | 用途 |
|-------|-------|------|-------------|------|
| `brand` | `indigo-600` | `indigo-500` | `bg-indigo-600 dark:bg-indigo-500` | 品牌基准色（主按钮背景、链接） |
| `brand-hover` | `indigo-700` | `indigo-400` | `hover:bg-indigo-700 dark:hover:bg-indigo-400` | hover 交互态 |
| `brand-active` | `indigo-800` | `indigo-300` | `active:bg-indigo-800` | active/press 态 |
| `brand-subtle` | `indigo-50` | `indigo-950` | `bg-indigo-50 dark:bg-indigo-950` | 最浅背景（选中行、hover 行） |
| `brand-light` | `indigo-100` | `indigo-900/30` | `bg-indigo-100 dark:bg-indigo-900/30` | 浅背景（Badge、Tag、高亮） |
| `brand-outline` | `indigo-300` | `indigo-700` | `border-indigo-300 dark:border-indigo-700` | 边框 / 描边 |
| `brand-text` | `indigo-600` | `indigo-400` | `text-indigo-600 dark:text-indigo-400` | 品牌色文字（链接、强调文本） |
| `brand-on-solid` | `white` | `white` | `text-white dark:text-white` | 实心品牌按钮上的文字/图标 |
| `brand-ring` | `indigo-600/25` | `indigo-400/25` | `ring-indigo-600/25 dark:ring-indigo-400/25` | Focus ring 色（25% 透明度） |

### 各组件 Token 使用映射

| 组件 / 元素 | 使用 Token | 说明 |
|------------|-----------|------|
| **Button Primary** 背景 | `brand` → `brand-hover` | 主按钮唯一使用品牌实心色 |
| **Button Primary** 文字 | `brand-on-solid` | white |
| **Button Primary** Focus | `brand-ring` | 25% 透明度品牌 ring |
| **Button Outline** 边框 | `brand-outline` | indigo-300 |
| **Button Outline** 文字 | `brand-text` | indigo-600 |
| **Button Ghost** Hover | `brand-subtle` | indigo-50 微妙底色 |
| **Link** 文字 | `brand-text` → `brand-hover` | 链接默认 + hover |
| **Badge Accent** | `brand-light` 背景 + `brand-text` 文字 | 品牌色标签 |
| **Toggle ON** | `brand` 背景 | 开关激活态 |
| **Checkbox Checked** | `brand` 背景 | 选中态 = 最高视觉权重 |
| **Radio Checked** | `brand` 边框 + 填充 | 选中态 |
| **Card Selected** | `brand-outline` 边框 + `brand-subtle` 背景 | 卡片选中态 |
| **Table Row Selected** | `brand-subtle` 背景 | 选中行高亮 |
| **Sidebar Active** | `brand-subtle` 背景 + `brand-text` 文字 | 当前导航项 |
| **Input/Select/Textarea Focus** | **不使用品牌色** — 保持灰阶 | 避免 brand 与 error(red) 竞争注意力 |

### 表单控件 Focus 决策

表单控件（Input / Select / Textarea）的 Focus ring **不使用品牌色**，保持现有 Elevation 体系的灰阶方案。原因：

1. 与语义色 Error（red-500）保持清晰区别——避免品牌色与红色在表单中竞争注意力
2. Linear / Stripe 均用灰阶聚焦——品牌色仅用于引导用户行动的 CTA 元素
3. 颜色纪律：品牌色的每一次出现都应传达"这里可以交互/已选中"，而非所有聚焦状态

### 品牌色使用原则

1. **唯一强调色** — 整个系统仅此一种交互色，不引入第二种强调色
2. **语义色仅用于状态** — 不用品牌色表示成功/警告/错误
3. **不用于装饰** — 品牌色不出现在纯装饰元素上
4. **暗色模式略降饱和度** — Dark 模式使用 indigo-500（而非 600），避免暗背景上的视觉疲劳
5. **对比度达标** — `indigo-600` (#4F46E5) : `white` (#FFF) = 6.54:1 (WCAG AA) ✅

---

## 五、Dark Mode Palette（暗色模式）

全局暗色模式使用 `dark:` 变体。

| 角色 | Light | Dark |
|------|-------|------|
| 页面背景 | `bg-white` | `dark:bg-gray-950` |
| 表面色 | `bg-gray-50` | `dark:bg-gray-900` |
| 主文字 | `text-gray-900` | `dark:text-gray-100` |
| 正文 | `text-gray-700` | `dark:text-gray-300` |
| 辅助文字 | `text-gray-500` | `dark:text-gray-400` |
| 边框 | `border-gray-200` | `dark:border-gray-800` |
| Primary 按钮 | `bg-indigo-600` | `dark:bg-indigo-500` |
| Primary 按钮文字 | `text-white` | `dark:text-white` |

---

## 六、色彩设计原则

1. **优先透明度** — 能用 `black/5` 就不用 `gray-200`
2. **品牌色仅一处** — 系统中最多使用一个品牌强调色
3. **语义色仅用于状态** — 不用绿色表示"确认按钮"，用 Primary
4. **灰度为主** — 95% 的 UI 应使用中性色 + 透明度
5. **对比度达标** — 所有文字与背景对比度 ≥ 4.5:1（WCAG AA）

---

> 参考: [Tailwind CSS Colors](https://tailwindcss.com/docs/colors) · [OKLCH Color Picker](https://oklch.com/)
