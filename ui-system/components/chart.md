# Chart

数据可视化图表组件。提供统一的视觉语言——色彩、网格、排版、交互——确保所有图表与 Design System 一致，无论底层使用何种渲染技术。

> **Design Tokens**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Elevation](../design-tokens/elevation.md)
>
> **关联组件**: [Card](./card.md)（图表容器）· [Badge](./badge.md)（图例标签）· [Table](./table.md)（数据表格替代方案）
>
> **依赖**: 高级图表（雷达图、散点图等）建议使用 Chart.js 或 Recharts；基础图表（柱状图、迷你图、环形图）使用纯 CSS/SVG，零依赖。

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 图表容器 | 复用 Card 组件 | 原则"组件间引用而非重复"——图表嵌入 Card，不重新定义容器 |
| 系列色盘 | 8 色定性色盘（Qualitative） | 基于 Indigo 品牌色延伸，确保任意相邻两色可区分 |
| 网格线 | `stroke-gray-950/5` 浅色 / `stroke-white/5` 暗色 | 透明度方案——自适应背景，不抢数据注意力 |
| 坐标轴 | `stroke-gray-950/10` | 比网格线稍重，建立坐标参考系 |
| 悬停交互 | `transition-colors duration-150` | 与全局动效规范一致 |
| 数值标注 | `text-xs font-medium tabular-nums` | 等宽数字防止数值抖动；`text-xs` 不抢图表主体 |
| Tooltip | 复用 Card 的 `inset-ring` + 白色背景 | 与系统其余部分视觉一致 |
| 空状态 | 居中灰色占位 + 引导文字 | 参照 Table 空状态模式 |
| 加载态 | 骨架屏（Skeleton） | 参照 Card 加载态——灰色占位块 + shimmer |

---

## 一、系列色盘（Series Palette）

图表中多条数据线/柱的颜色序列。从品牌 Indigo 出发，在色相环上均匀分布，保证相邻系列视觉可辨。

### Light Mode

| 序号 | 色值 (Hex) | Tailwind | 用途 |
|------|-----------|----------|------|
| 1 | `#4F46E5` | `indigo-600` | 主系列——品牌色，最突出 |
| 2 | `#3B82F6` | `blue-500` | 第二系列 |
| 3 | `#10B981` | `emerald-500` | 第三系列 |
| 4 | `#F59E0B` | `amber-500` | 第四系列 |
| 5 | `#F43F5E` | `rose-500` | 第五系列 |
| 6 | `#8B5CF6` | `violet-500` | 第六系列 |
| 7 | `#06B6D4` | `cyan-500` | 第七系列 |
| 8 | `#F97316` | `orange-500` | 第八系列 |

### Dark Mode（略降饱和度）

| 序号 | 色值 (Hex) | Tailwind | 用途 |
|------|-----------|----------|------|
| 1 | `#818CF8` | `indigo-400` | 主系列——暗色模式品牌色 |
| 2 | `#60A5FA` | `blue-400` | 第二系列 |
| 3 | `#34D399` | `emerald-400` | 第三系列 |
| 4 | `#FBBF24` | `amber-400` | 第四系列 |
| 5 | `#FB7185` | `rose-400` | 第五系列 |
| 6 | `#A78BFA` | `violet-400` | 第六系列 |
| 7 | `#22D3EE` | `cyan-400` | 第七系列 |
| 8 | `#FB923C` | `orange-400` | 第八系列 |

### 单色渐变（Single-Series Gradient）

单系列面积图/柱状图使用品牌色渐变：

| Token | Light | Dark |
|-------|-------|------|
| 填充起始 | `indigo-600/30` | `indigo-400/25` |
| 填充结束 | `indigo-600/5` | `indigo-400/5` |
| 描边 | `indigo-600` | `indigo-400` |

---

## 二、结构元素

### 2.1 网格线 (Grid)

```svg
<!-- Light mode -->
<line x1="0" y1="0" x2="100%" y2="0" stroke="rgb(3 7 18 / 0.05)" stroke-width="1" />

<!-- Dark mode -->
<line x1="0" y1="0" x2="100%" y2="0" stroke="rgb(255 255 255 / 0.05)" stroke-width="1" />
```

| 属性 | Light | Dark |
|------|-------|------|
| 颜色 | `gray-950/5` | `white/5` |
| 线宽 | 1px | 1px |
| 样式 | solid | solid |
| Y 轴网格 | 4-6 条水平线 | 同左 |
| X 轴网格 | 无（柱状图除外） | 同左 |

### 2.2 坐标轴 (Axis)

```svg
<!-- X 轴线 -->
<line x1="0" y1="100%" x2="100%" y2="100%" stroke="rgb(3 7 18 / 0.10)" stroke-width="1" />
```

| 属性 | Light | Dark |
|------|-------|------|
| 轴线颜色 | `gray-950/10` | `white/10` |
| 轴线宽 | 1px | 1px |
| 刻度标签字号 | `text-xs` (12px) | 同左 |
| 刻度标签字重 | `font-normal` | 同左 |
| 刻度标签颜色 | `text-gray-500` | `text-gray-400` |
| 刻度标签字体 | `tabular-nums` | 同左 |

### 2.3 Tooltip

悬停时显示数据详情的浮层。复用 Card 的 Elevation 体系。

```html
<div
  class="rounded-lg bg-white px-3 py-2
    inset-ring inset-ring-gray-950/8
    text-xs text-gray-700
    shadow-lg
    dark:bg-gray-800 dark:inset-ring-white/10 dark:text-gray-200"
  role="tooltip"
>
  <div class="flex items-center gap-2">
    <span class="inline-block h-2 w-2 rounded-full bg-indigo-600 dark:bg-indigo-400"></span>
    <span class="font-medium text-gray-900 dark:text-gray-100">Jan 2026</span>
  </div>
  <div class="mt-1 font-semibold tabular-nums text-gray-900 dark:text-gray-100">
    12,345
  </div>
</div>
```

| 属性 | Light | Dark |
|------|-------|------|
| 背景 | `bg-white` | `bg-gray-800` |
| 描边 | `inset-ring-gray-950/8` | `inset-ring-white/10` |
| 阴影 | `shadow-lg` | `shadow-lg` |
| 圆角 | `rounded-lg` (8px) | 同左 |
| 内边距 | `px-3 py-2` | 同左 |
| 系列指示点 | 8×8px `rounded-full` | 同左 |
| 标签字号 | `text-xs` | 同左 |
| 数值字号 | `text-xs font-semibold tabular-nums` | 同左 |

### 2.4 图例 (Legend)

```html
<div class="flex flex-wrap items-center gap-4" role="list" aria-label="Chart legend">
  <div class="flex items-center gap-2" role="listitem">
    <span class="inline-block h-2.5 w-2.5 rounded-full bg-indigo-600 dark:bg-indigo-400" aria-hidden="true"></span>
    <span class="text-xs text-gray-600 dark:text-gray-400">Revenue</span>
  </div>
  <div class="flex items-center gap-2" role="listitem">
    <span class="inline-block h-2.5 w-2.5 rounded-full bg-emerald-500 dark:bg-emerald-400" aria-hidden="true"></span>
    <span class="text-xs text-gray-600 dark:text-gray-400">Cost</span>
  </div>
</div>
```

| 属性 | 值 |
|------|-----|
| 布局 | `flex flex-wrap items-center gap-4` |
| 指示点 | 10×10px `rounded-full`，颜色对应系列 |
| 标签字号 | `text-xs` (12px) |
| 标签颜色 | `text-gray-600` / `dark:text-gray-400` |
| 位置 | 图表下方或右上角 |

---

## 三、变体

### 1. Bar Chart — 柱状图（CSS 实现）

纯 CSS 柱状图——零依赖。适用：类别对比、排名、分组数据（≤12 个类别）。

```html
<!-- Bar Chart Container — 嵌入 Card 内 -->
<div class="w-full" role="img" aria-label="Monthly revenue: Jan $8.2k, Feb $10.5k, Mar $12.0k, Apr $9.8k, May $14.3k, Jun $16.1k">
  <!-- Y Axis Labels + Grid -->
  <div class="flex">
    <!-- Y Labels Column -->
    <div class="flex w-10 shrink-0 flex-col justify-between py-1 text-right">
      <span class="text-xs tabular-nums text-gray-500 dark:text-gray-400">20k</span>
      <span class="text-xs tabular-nums text-gray-500 dark:text-gray-400">15k</span>
      <span class="text-xs tabular-nums text-gray-500 dark:text-gray-400">10k</span>
      <span class="text-xs tabular-nums text-gray-500 dark:text-gray-400">5k</span>
      <span class="text-xs tabular-nums text-gray-500 dark:text-gray-400">0</span>
    </div>
    <!-- Bars Area -->
    <div class="flex flex-1 items-end gap-3 border-b border-gray-950/10 px-1 pb-6 dark:border-white/10" style="height: 200px;">
      <!-- Grid Lines (absolute positioned via background) -->
      <!-- Bar: Jan -->
      <div class="flex flex-1 flex-col items-center gap-1.5">
        <span class="text-xs font-medium tabular-nums text-gray-700 dark:text-gray-300">8.2k</span>
        <div class="w-full rounded-t-md bg-indigo-600 transition-colors duration-150 hover:bg-indigo-700 dark:bg-indigo-500 dark:hover:bg-indigo-400 motion-reduce:transition-none" style="height: 41%;" role="img" aria-label="January: $8,200"></div>
      </div>
      <!-- Bar: Feb -->
      <div class="flex flex-1 flex-col items-center gap-1.5">
        <span class="text-xs font-medium tabular-nums text-gray-700 dark:text-gray-300">10.5k</span>
        <div class="w-full rounded-t-md bg-indigo-600 transition-colors duration-150 hover:bg-indigo-700 dark:bg-indigo-500 dark:hover:bg-indigo-400 motion-reduce:transition-none" style="height: 52%;" role="img" aria-label="February: $10,500"></div>
      </div>
      <!-- Bar: Mar -->
      <div class="flex flex-1 flex-col items-center gap-1.5">
        <span class="text-xs font-medium tabular-nums text-gray-700 dark:text-gray-300">12.0k</span>
        <div class="w-full rounded-t-md bg-indigo-600 transition-colors duration-150 hover:bg-indigo-700 dark:bg-indigo-500 dark:hover:bg-indigo-400 motion-reduce:transition-none" style="height: 60%;" role="img" aria-label="March: $12,000"></div>
      </div>
      <!-- Bar: Apr -->
      <div class="flex flex-1 flex-col items-center gap-1.5">
        <span class="text-xs font-medium tabular-nums text-gray-700 dark:text-gray-300">9.8k</span>
        <div class="w-full rounded-t-md bg-indigo-600 transition-colors duration-150 hover:bg-indigo-700 dark:bg-indigo-500 dark:hover:bg-indigo-400 motion-reduce:transition-none" style="height: 49%;" role="img" aria-label="April: $9,800"></div>
      </div>
      <!-- Bar: May -->
      <div class="flex flex-1 flex-col items-center gap-1.5">
        <span class="text-xs font-medium tabular-nums text-gray-700 dark:text-gray-300">14.3k</span>
        <div class="w-full rounded-t-md bg-indigo-600 transition-colors duration-150 hover:bg-indigo-700 dark:bg-indigo-500 dark:hover:bg-indigo-400 motion-reduce:transition-none" style="height: 71%;" role="img" aria-label="May: $14,300"></div>
      </div>
      <!-- Bar: Jun -->
      <div class="flex flex-1 flex-col items-center gap-1.5">
        <span class="text-xs font-medium tabular-nums text-gray-700 dark:text-gray-300">16.1k</span>
        <div class="w-full rounded-t-md bg-indigo-600 transition-colors duration-150 hover:bg-indigo-700 dark:bg-indigo-500 dark:hover:bg-indigo-400 motion-reduce:transition-none" style="height: 80%;" role="img" aria-label="June: $16,100"></div>
      </div>
    </div>
  </div>
  <!-- X Axis Labels -->
  <div class="ml-10 flex gap-3 px-1 pt-2">
    <span class="flex-1 text-center text-xs text-gray-500 dark:text-gray-400">Jan</span>
    <span class="flex-1 text-center text-xs text-gray-500 dark:text-gray-400">Feb</span>
    <span class="flex-1 text-center text-xs text-gray-500 dark:text-gray-400">Mar</span>
    <span class="flex-1 text-center text-xs text-gray-500 dark:text-gray-400">Apr</span>
    <span class="flex-1 text-center text-xs text-gray-500 dark:text-gray-400">May</span>
    <span class="flex-1 text-center text-xs text-gray-500 dark:text-gray-400">Jun</span>
  </div>
</div>
```

**设计要点：**
- 柱体圆角仅顶部（`rounded-t-md`）——底部平直接触基线，符合物理直觉
- 柱间距 `gap-3`——既不拥挤也不分散
- 悬停加深颜色——与 Button hover 逻辑一致
- 数值标注在柱顶——即时读取，无需 tooltip
- `tabular-nums` 确保数字不抖动

### 分组柱状图（Grouped Bar）

多系列对比时使用。每个类别并排显示多根柱。

```html
<!-- Grouped Bar: Revenue vs Cost -->
<div class="w-full" role="img" aria-label="Revenue vs Cost by month">
  <div class="flex">
    <div class="flex w-10 shrink-0 flex-col justify-between py-1 text-right">
      <span class="text-xs tabular-nums text-gray-500 dark:text-gray-400">20k</span>
      <span class="text-xs tabular-nums text-gray-500 dark:text-gray-400">15k</span>
      <span class="text-xs tabular-nums text-gray-500 dark:text-gray-400">10k</span>
      <span class="text-xs tabular-nums text-gray-500 dark:text-gray-400">5k</span>
      <span class="text-xs tabular-nums text-gray-500 dark:text-gray-400">0</span>
    </div>
    <div class="flex flex-1 items-end gap-4 border-b border-gray-950/10 px-1 pb-6 dark:border-white/10" style="height: 200px;">
      <!-- Jan: Revenue $8.2k + Cost $6.0k -->
      <div class="flex flex-1 items-end justify-center gap-1">
        <div class="w-3 rounded-t-sm bg-indigo-600 transition-colors duration-150 hover:bg-indigo-700 dark:bg-indigo-500 dark:hover:bg-indigo-400 motion-reduce:transition-none" style="height: 41%;" aria-label="Jan Revenue: $8,200"></div>
        <div class="w-3 rounded-t-sm bg-emerald-500 transition-colors duration-150 hover:bg-emerald-600 dark:bg-emerald-400 dark:hover:bg-emerald-300 motion-reduce:transition-none" style="height: 30%;" aria-label="Jan Cost: $6,000"></div>
      </div>
      <!-- Feb: Revenue $10.5k + Cost $7.2k -->
      <div class="flex flex-1 items-end justify-center gap-1">
        <div class="w-3 rounded-t-sm bg-indigo-600 transition-colors duration-150 hover:bg-indigo-700 dark:bg-indigo-500 dark:hover:bg-indigo-400 motion-reduce:transition-none" style="height: 52%;" aria-label="Feb Revenue: $10,500"></div>
        <div class="w-3 rounded-t-sm bg-emerald-500 transition-colors duration-150 hover:bg-emerald-600 dark:bg-emerald-400 dark:hover:bg-emerald-300 motion-reduce:transition-none" style="height: 36%;" aria-label="Feb Cost: $7,200"></div>
      </div>
      <!-- Mar: Revenue $12.0k + Cost $8.1k -->
      <div class="flex flex-1 items-end justify-center gap-1">
        <div class="w-3 rounded-t-sm bg-indigo-600 transition-colors duration-150 hover:bg-indigo-700 dark:bg-indigo-500 dark:hover:bg-indigo-400 motion-reduce:transition-none" style="height: 60%;" aria-label="Mar Revenue: $12,000"></div>
        <div class="w-3 rounded-t-sm bg-emerald-500 transition-colors duration-150 hover:bg-emerald-600 dark:bg-emerald-400 dark:hover:bg-emerald-300 motion-reduce:transition-none" style="height: 40%;" aria-label="Mar Cost: $8,100"></div>
      </div>
      <!-- Apr: Revenue $9.8k + Cost $7.5k -->
      <div class="flex flex-1 items-end justify-center gap-1">
        <div class="w-3 rounded-t-sm bg-indigo-600 transition-colors duration-150 hover:bg-indigo-700 dark:bg-indigo-500 dark:hover:bg-indigo-400 motion-reduce:transition-none" style="height: 49%;" aria-label="Apr Revenue: $9,800"></div>
        <div class="w-3 rounded-t-sm bg-emerald-500 transition-colors duration-150 hover:bg-emerald-600 dark:bg-emerald-400 dark:hover:bg-emerald-300 motion-reduce:transition-none" style="height: 37%;" aria-label="Apr Cost: $7,500"></div>
      </div>
      <!-- May: Revenue $14.3k + Cost $9.2k -->
      <div class="flex flex-1 items-end justify-center gap-1">
        <div class="w-3 rounded-t-sm bg-indigo-600 transition-colors duration-150 hover:bg-indigo-700 dark:bg-indigo-500 dark:hover:bg-indigo-400 motion-reduce:transition-none" style="height: 71%;" aria-label="May Revenue: $14,300"></div>
        <div class="w-3 rounded-t-sm bg-emerald-500 transition-colors duration-150 hover:bg-emerald-600 dark:bg-emerald-400 dark:hover:bg-emerald-300 motion-reduce:transition-none" style="height: 46%;" aria-label="May Cost: $9,200"></div>
      </div>
      <!-- Jun: Revenue $16.1k + Cost $10.0k -->
      <div class="flex flex-1 items-end justify-center gap-1">
        <div class="w-3 rounded-t-sm bg-indigo-600 transition-colors duration-150 hover:bg-indigo-700 dark:bg-indigo-500 dark:hover:bg-indigo-400 motion-reduce:transition-none" style="height: 80%;" aria-label="Jun Revenue: $16,100"></div>
        <div class="w-3 rounded-t-sm bg-emerald-500 transition-colors duration-150 hover:bg-emerald-600 dark:bg-emerald-400 dark:hover:bg-emerald-300 motion-reduce:transition-none" style="height: 50%;" aria-label="Jun Cost: $10,000"></div>
      </div>
    </div>
  </div>
  <!-- X Axis Labels -->
  <div class="ml-10 flex gap-4 px-1 pt-2">
    <span class="flex-1 text-center text-xs text-gray-500 dark:text-gray-400">Jan</span>
    <span class="flex-1 text-center text-xs text-gray-500 dark:text-gray-400">Feb</span>
    <span class="flex-1 text-center text-xs text-gray-500 dark:text-gray-400">Mar</span>
    <span class="flex-1 text-center text-xs text-gray-500 dark:text-gray-400">Apr</span>
    <span class="flex-1 text-center text-xs text-gray-500 dark:text-gray-400">May</span>
    <span class="flex-1 text-center text-xs text-gray-500 dark:text-gray-400">Jun</span>
  </div>
  <!-- Legend -->
  <div class="ml-10 mt-3 flex items-center gap-4">
    <div class="flex items-center gap-1.5">
      <span class="inline-block h-2.5 w-2.5 rounded-full bg-indigo-600 dark:bg-indigo-400"></span>
      <span class="text-xs text-gray-600 dark:text-gray-400">Revenue</span>
    </div>
    <div class="flex items-center gap-1.5">
      <span class="inline-block h-2.5 w-2.5 rounded-full bg-emerald-500 dark:bg-emerald-400"></span>
      <span class="text-xs text-gray-600 dark:text-gray-400">Cost</span>
    </div>
  </div>
</div>
```

**设计要点：**
- 组内柱间距 `gap-1`（紧凑），组间距 `gap-4`（宽松）—— Gestalt 接近律
- 柱体更窄（`w-3` vs 单柱 `flex-1`），预留组内空间
- 柱体圆角 `rounded-t-sm`（更窄的柱用更小的圆角）

---

### 2. Donut Chart — 环形图（SVG 实现）

适用：占比分布（3-6 个类别）、进度展示。中心放置总计数值。

```html
<!-- Donut Chart: SVG stroke-dasharray 实现 -->
<div class="flex flex-col items-center gap-4 sm:flex-row sm:gap-8" role="img" aria-label="Traffic sources: Direct 40%, Organic 30%, Referral 20%, Social 10%">
  <!-- Ring -->
  <div class="relative h-40 w-40 shrink-0">
    <svg viewBox="0 0 100 100" class="h-full w-full -rotate-90">
      <!-- Background ring -->
      <circle cx="50" cy="50" r="38" fill="none" stroke="rgb(3 7 18 / 0.05)" stroke-width="12" class="dark:stroke-white/5" />
      <!-- Direct: 40% -->
      <circle cx="50" cy="50" r="38" fill="none" stroke="#4F46E5" stroke-width="12"
        stroke-dasharray="95.5 238.8" stroke-linecap="round" class="dark:stroke-[#818CF8]" />
      <!-- Organic: 30% -->
      <circle cx="50" cy="50" r="38" fill="none" stroke="#3B82F6" stroke-width="12"
        stroke-dasharray="71.6 238.8" stroke-dashoffset="-95.5" stroke-linecap="round" class="dark:stroke-[#60A5FA]" />
      <!-- Referral: 20% -->
      <circle cx="50" cy="50" r="38" fill="none" stroke="#10B981" stroke-width="12"
        stroke-dasharray="47.8 238.8" stroke-dashoffset="-167.1" stroke-linecap="round" class="dark:stroke-[#34D399]" />
      <!-- Social: 10% -->
      <circle cx="50" cy="50" r="38" fill="none" stroke="#F59E0B" stroke-width="12"
        stroke-dasharray="23.9 238.8" stroke-dashoffset="-214.9" stroke-linecap="round" class="dark:stroke-[#FBBF24]" />
    </svg>
    <!-- Center total -->
    <div class="absolute inset-0 flex flex-col items-center justify-center">
      <span class="text-2xl font-semibold tabular-nums text-gray-900 dark:text-gray-100">12.4k</span>
      <span class="text-xs text-gray-500 dark:text-gray-400">Visitors</span>
    </div>
  </div>
  <!-- Legend -->
  <div class="flex flex-col gap-2">
    <div class="flex items-center gap-2">
      <span class="inline-block h-2.5 w-2.5 rounded-full bg-indigo-600 dark:bg-indigo-400"></span>
      <span class="text-sm text-gray-700 dark:text-gray-300">Direct</span>
      <span class="ml-auto text-sm font-medium tabular-nums text-gray-900 dark:text-gray-100">40%</span>
    </div>
    <div class="flex items-center gap-2">
      <span class="inline-block h-2.5 w-2.5 rounded-full bg-blue-500 dark:bg-blue-400"></span>
      <span class="text-sm text-gray-700 dark:text-gray-300">Organic</span>
      <span class="ml-auto text-sm font-medium tabular-nums text-gray-900 dark:text-gray-100">30%</span>
    </div>
    <div class="flex items-center gap-2">
      <span class="inline-block h-2.5 w-2.5 rounded-full bg-emerald-500 dark:bg-emerald-400"></span>
      <span class="text-sm text-gray-700 dark:text-gray-300">Referral</span>
      <span class="ml-auto text-sm font-medium tabular-nums text-gray-900 dark:text-gray-100">20%</span>
    </div>
    <div class="flex items-center gap-2">
      <span class="inline-block h-2.5 w-2.5 rounded-full bg-amber-500 dark:bg-amber-400"></span>
      <span class="text-sm text-gray-700 dark:text-gray-300">Social</span>
      <span class="ml-auto text-sm font-medium tabular-nums text-gray-900 dark:text-gray-100">10%</span>
    </div>
  </div>
</div>
```

**设计要点：**
- `stroke-dasharray` 计算：周长 = 2π × 38 ≈ 238.8；每段 = 百分比 × 238.8
- `stroke-dashoffset` 为负累加值——每段从上一段结束位置开始
- `stroke-linecap: round`——圆头端点，与系统 `rounded-full` 语言一致
- 中心总计数值——`text-2xl font-semibold`，暗色模式亮度不变
- 背景环使用 `gray-950/5`——与网格线一致

### SVG 环形图段计算公式

```
周长 = 2 × π × r = 2 × 3.1416 × 38 ≈ 238.8

段 1（40%）: dasharray = "95.5 238.8"  offset = 0
段 2（30%）: dasharray = "71.6 238.8"  offset = -95.5
段 3（20%）: dasharray = "47.8 238.8"  offset = -167.1
段 4（10%）: dasharray = "23.9 238.8"  offset = -214.9
```

---

### 3. Sparkline — 迷你走势图（SVG 实现）

适用：表格单元格、卡片内嵌、Dashboard KPI 旁的趋势指示。不显示坐标轴，仅传达趋势方向。

```html
<!-- Sparkline: 7-day trend, positive -->
<svg width="80" height="24" viewBox="0 0 80 24" fill="none" class="shrink-0" role="img" aria-label="Trend: increasing, 12% up this week">
  <path
    d="M0 18 L13.3 15 L26.7 16 L40 10 L53.3 6 L66.7 4 L80 2"
    stroke="#4F46E5" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"
    class="dark:stroke-[#818CF8]"
  />
  <!-- End dot -->
  <circle cx="80" cy="2" r="2.5" fill="#4F46E5" class="dark:fill-[#818CF8]" />
</svg>
```

```html
<!-- Sparkline: negative trend -->
<svg width="80" height="24" viewBox="0 0 80 24" fill="none" class="shrink-0" role="img" aria-label="Trend: decreasing, 8% down this week">
  <path
    d="M0 4 L13.3 6 L26.7 8 L40 12 L53.3 16 L66.7 20 L80 22"
    stroke="#F43F5E" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"
    class="dark:stroke-[#FB7185]"
  />
  <circle cx="80" cy="22" r="2.5" fill="#F43F5E" class="dark:fill-[#FB7185]" />
</svg>
```

| 属性 | 正趋势 | 负趋势 |
|------|--------|--------|
| 描边色 | `indigo-600` / `indigo-400` | `rose-500` / `rose-400` |
| 线宽 | `1.5px` | `1.5px` |
| 端点 | `stroke-linecap: round` | 同左 |
| 终点圆点 | r=2.5, 同描边色 | r=2.5, 同描边色 |
| 尺寸 | 80×24px（表格内）或 120×32px（卡片内） | 同左 |

---

### 4. Area Chart — 面积图（CSS + SVG 渐变）

适用：时间序列展示量级变化。纯 SVG 实现。

```html
<!-- Area Chart: SVG with linearGradient -->
<div class="w-full" role="img" aria-label="Revenue trend: increasing from $8.2k to $16.1k over 6 months">
  <svg viewBox="0 0 400 160" class="h-40 w-full" preserveAspectRatio="none">
    <defs>
      <linearGradient id="areaGradient" x1="0" y1="0" x2="0" y2="1">
        <stop offset="0%" stop-color="#4F46E5" stop-opacity="0.30" class="dark:[stop-color:#818CF8] dark:[stop-opacity:0.25]" />
        <stop offset="100%" stop-color="#4F46E5" stop-opacity="0.05" class="dark:[stop-color:#818CF8] dark:[stop-opacity:0.05]" />
      </linearGradient>
    </defs>
    <!-- Grid lines (Y) -->
    <line x1="0" y1="32" x2="400" y2="32" stroke="rgb(3 7 18 / 0.05)" stroke-width="1" class="dark:stroke-white/5" />
    <line x1="0" y1="64" x2="400" y2="64" stroke="rgb(3 7 18 / 0.05)" stroke-width="1" class="dark:stroke-white/5" />
    <line x1="0" y1="96" x2="400" y2="96" stroke="rgb(3 7 18 / 0.05)" stroke-width="1" class="dark:stroke-white/5" />
    <line x1="0" y1="128" x2="400" y2="128" stroke="rgb(3 7 18 / 0.05)" stroke-width="1" class="dark:stroke-white/5" />
    <!-- Area fill -->
    <path d="M0 128 L80 112 L160 96 L240 104 L320 72 L400 48 L400 160 L0 160 Z"
      fill="url(#areaGradient)" />
    <!-- Line -->
    <path d="M0 128 L80 112 L160 96 L240 104 L320 72 L400 48"
      fill="none" stroke="#4F46E5" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
      class="dark:stroke-[#818CF8]" />
    <!-- Data points -->
    <circle cx="0" cy="128" r="3" fill="white" stroke="#4F46E5" stroke-width="2" class="dark:fill-gray-900 dark:stroke-[#818CF8]" />
    <circle cx="80" cy="112" r="3" fill="white" stroke="#4F46E5" stroke-width="2" class="dark:fill-gray-900 dark:stroke-[#818CF8]" />
    <circle cx="160" cy="96" r="3" fill="white" stroke="#4F46E5" stroke-width="2" class="dark:fill-gray-900 dark:stroke-[#818CF8]" />
    <circle cx="240" cy="104" r="3" fill="white" stroke="#4F46E5" stroke-width="2" class="dark:fill-gray-900 dark:stroke-[#818CF8]" />
    <circle cx="320" cy="72" r="3" fill="white" stroke="#4F46E5" stroke-width="2" class="dark:fill-gray-900 dark:stroke-[#818CF8]" />
    <circle cx="400" cy="48" r="3" fill="white" stroke="#4F46E5" stroke-width="2" class="dark:fill-gray-900 dark:stroke-[#818CF8]" />
  </svg>
  <!-- X Labels -->
  <div class="mt-2 flex justify-between px-1">
    <span class="text-xs text-gray-500 dark:text-gray-400">Jan</span>
    <span class="text-xs text-gray-500 dark:text-gray-400">Feb</span>
    <span class="text-xs text-gray-500 dark:text-gray-400">Mar</span>
    <span class="text-xs text-gray-500 dark:text-gray-400">Apr</span>
    <span class="text-xs text-gray-500 dark:text-gray-400">May</span>
    <span class="text-xs text-gray-500 dark:text-gray-400">Jun</span>
  </div>
</div>
```

**设计要点：**
- `preserveAspectRatio="none"`——面积图拉伸填满容器宽度
- 数据点白底描边——防止与网格线混淆
- 渐变从上到下透明度递减（30% → 5%）——模拟光照
- 暗色模式使用 `dark:[stop-color:...]`——Tailwind v4 任意属性选择器

---

## 四、图表容器（Chart Card）

所有图表嵌入 Card 组件。图表 Card = Card Blog 变体 + 图表内容替换图片。

```html
<div
  class="rounded-xl bg-white p-4 sm:p-6
    inset-ring inset-ring-gray-950/8
    transition-colors duration-150
    hover:bg-gray-50/50 hover:inset-ring-gray-950/20
    dark:bg-gray-900 dark:inset-ring-white/10
    dark:hover:bg-gray-800/50 dark:hover:inset-ring-white/20
    motion-reduce:transition-none"
>
  <!-- Card Header -->
  <div class="mb-4 flex items-start justify-between gap-4">
    <div>
      <h3 class="text-base font-semibold text-gray-900 dark:text-gray-100">Revenue Overview</h3>
      <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">Monthly revenue for H1 2026</p>
    </div>
    <!-- Time range selector (reuse Select component) -->
    <select
      class="rounded-lg border-gray-200 bg-white px-2.5 py-1.5 text-xs text-gray-700
        transition-colors duration-150
        focus:border-gray-900 focus:outline-none focus:ring-2 focus:ring-gray-900/10
        dark:border-gray-700 dark:bg-gray-800 dark:text-gray-300
        dark:focus:border-gray-300 dark:focus:ring-white/10
        motion-reduce:transition-none"
      aria-label="Select time range"
    >
      <option>Last 6 months</option>
      <option>Last 12 months</option>
      <option>Last 30 days</option>
    </select>
  </div>
  <!-- Chart goes here -->
</div>
```

**设计要点：**
- 复用 Card 全套 Elevation 样式——不重新定义容器
- 图表内 Select 使用紧凑版本（`px-2.5 py-1.5 text-xs`）——比独立 Select 更小
- 标题 + 描述在左上——参照 Card Blog 的元数据 + 标题布局
- 时间选择器右上——常见 Dashboard 图表交互模式

### 图表容器的响应式高度

| 断点 | 高度 | 用途 |
|------|------|------|
| Mobile (<640px) | `h-48` (192px) | 单手操作，柱状图可见趋势 |
| Tablet (≥640px) | `h-56` (224px) | 中等密度 |
| Desktop (≥1024px) | `h-64` (256px) | 充足空间展示细节 |

```html
<!-- Responsive chart wrapper -->
<div class="h-48 sm:h-56 lg:h-64">
  <!-- Chart SVG/CSS -->
</div>
```

---

## 五、状态

### 5.1 加载态（Loading Skeleton）

```html
<div class="rounded-xl bg-white p-4 sm:p-6 inset-ring inset-ring-gray-950/8 dark:bg-gray-900 dark:inset-ring-white/10" aria-busy="true" aria-label="Loading chart">
  <!-- Header skeleton -->
  <div class="mb-4 flex items-start justify-between">
    <div class="space-y-2">
      <div class="h-5 w-32 animate-pulse rounded bg-gray-100 dark:bg-gray-800"></div>
      <div class="h-4 w-48 animate-pulse rounded bg-gray-100 dark:bg-gray-800"></div>
    </div>
    <div class="h-8 w-28 animate-pulse rounded-lg bg-gray-100 dark:bg-gray-800"></div>
  </div>
  <!-- Chart area skeleton -->
  <div class="flex h-48 items-end gap-3 sm:h-56 lg:h-64">
    <div class="h-[65%] flex-1 animate-pulse rounded-t-md bg-gray-100 dark:bg-gray-800"></div>
    <div class="h-[80%] flex-1 animate-pulse rounded-t-md bg-gray-100 dark:bg-gray-800"></div>
    <div class="h-[45%] flex-1 animate-pulse rounded-t-md bg-gray-100 dark:bg-gray-800"></div>
    <div class="h-[90%] flex-1 animate-pulse rounded-t-md bg-gray-100 dark:bg-gray-800"></div>
    <div class="h-[55%] flex-1 animate-pulse rounded-t-md bg-gray-100 dark:bg-gray-800"></div>
    <div class="h-[70%] flex-1 animate-pulse rounded-t-md bg-gray-100 dark:bg-gray-800"></div>
  </div>
  <div class="mt-3 flex gap-3">
    <div class="h-3 flex-1 animate-pulse rounded bg-gray-100 dark:bg-gray-800"></div>
    <div class="h-3 flex-1 animate-pulse rounded bg-gray-100 dark:bg-gray-800"></div>
    <div class="h-3 flex-1 animate-pulse rounded bg-gray-100 dark:bg-gray-800"></div>
  </div>
</div>
```

| 属性 | Light | Dark |
|------|-------|------|
| 骨架色 | `bg-gray-100` | `bg-gray-800` |
| 动画 | `animate-pulse` | 同左 |
| 圆角 | `rounded` / `rounded-t-md` / `rounded-lg` | 同左 |
| 容器 | 复用 Card | 同左 |

### 5.2 空状态（Empty）

```html
<div class="flex h-48 flex-col items-center justify-center rounded-xl bg-white p-6 inset-ring inset-ring-gray-950/8 sm:h-56 lg:h-64 dark:bg-gray-900 dark:inset-ring-white/10" role="status">
  <svg class="mb-3 h-10 w-10 text-gray-300 dark:text-gray-600" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
    <path stroke-linecap="round" stroke-linejoin="round" d="M3 13.125C3 12.504 3.504 12 4.125 12h2.25c.621 0 1.125.504 1.125 1.125v6.75C7.5 20.496 6.996 21 6.375 21h-2.25A1.125 1.125 0 0 1 3 19.875v-6.75ZM9.75 8.625c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125v11.25c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 0 1-1.125-1.125V8.625ZM16.5 4.125c0-.621.504-1.125 1.125-1.125h2.25C20.496 3 21 3.504 21 4.125v15.75c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 0 1-1.125-1.125V4.125Z" />
  </svg>
  <p class="text-sm font-medium text-gray-500 dark:text-gray-400">No data available</p>
  <p class="mt-1 text-xs text-gray-400 dark:text-gray-500">Data will appear here once collected</p>
</div>
```

### 5.3 错误态（Error）

```html
<div class="flex h-48 flex-col items-center justify-center rounded-xl bg-white p-6 inset-ring inset-ring-red-300 sm:h-56 lg:h-64 dark:bg-gray-900 dark:inset-ring-red-800" role="alert">
  <svg class="mb-3 h-10 w-10 text-red-400 dark:text-red-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
    <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126ZM12 15.75h.007v.008H12v-.008Z" />
  </svg>
  <p class="text-sm font-medium text-gray-900 dark:text-gray-100">Failed to load chart</p>
  <p class="mt-1 text-xs text-gray-500 dark:text-gray-400">Check your connection and try again</p>
  <button
    type="button"
    class="mt-3 inline-flex items-center gap-1.5 rounded-lg px-3 py-1.5
      text-xs font-medium text-gray-700
      transition-colors duration-150
      hover:bg-gray-100
      focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900
      dark:text-gray-200 dark:hover:bg-gray-800 dark:focus-visible:outline-gray-300
      motion-reduce:transition-none"
  >
    <svg class="h-3.5 w-3.5" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
      <path stroke-linecap="round" stroke-linejoin="round" d="M16.023 9.348h4.992v-.001M2.985 19.644v-4.992m0 0h4.992m-4.992 0 3.181 3.183a8.25 8.25 0 0 0 13.803-3.7M4.031 9.865a8.25 8.25 0 0 1 13.803-3.7l3.181 3.182" />
    </svg>
    Retry
  </button>
</div>
```

**设计要点：**
- 错误态使用 `inset-ring-red-300`——语义色仅用于状态，与系统规范一致
- Retry 按钮使用 Ghost 样式——不引入额外视觉权重
- `role="alert"`——屏幕阅读器立即播报

---

## 六、元素总览

| 元素 | 字号 | 字重 | 颜色 (Light) | 颜色 (Dark) | 特殊样式 |
|------|------|------|-------------|------------|---------|
| 图表标题 | `text-base` | `font-semibold` | `text-gray-900` | `text-gray-100` | — |
| 图表描述 | `text-sm` | `font-normal` | `text-gray-500` | `text-gray-400` | — |
| 轴刻度标签 | `text-xs` | `font-normal` | `text-gray-500` | `text-gray-400` | `tabular-nums` |
| 轴标题 | `text-xs` | `font-medium` | `text-gray-600` | `text-gray-400` | — |
| 数据标注 | `text-xs` | `font-medium` | `text-gray-700` | `text-gray-300` | `tabular-nums` |
| 图例标签 | `text-xs` | `font-normal` | `text-gray-600` | `text-gray-400` | — |
| 图例指示点 | — | — | — | — | `h-2.5 w-2.5 rounded-full` |
| Tooltip 标题 | `text-xs` | `font-medium` | `text-gray-900` | `text-gray-100` | — |
| Tooltip 数值 | `text-xs` | `font-semibold` | `text-gray-900` | `text-gray-100` | `tabular-nums` |
| 网格线 | — | — | `gray-950/5` | `white/5` | `stroke-width: 1` |
| 坐标轴线 | — | — | `gray-950/10` | `white/10` | `stroke-width: 1` |
| Sparkline 正趋势 | — | — | `indigo-600` | `indigo-400` | `stroke-width: 1.5` |
| Sparkline 负趋势 | — | — | `rose-500` | `rose-400` | `stroke-width: 1.5` |
| 加载骨架 | — | — | `bg-gray-100` | `bg-gray-800` | `animate-pulse` |
| 空状态图标 | — | — | `text-gray-300` | `text-gray-600` | `h-10 w-10` |

---

## 七、Design Tokens

| Token | Light | Dark | Tailwind / SVG | 说明 |
|-------|-------|------|----------------|------|
| `chart-grid` | `#030712/5%` | `#ffffff/5%` | `stroke="rgb(3 7 18 / 0.05)"` / `class="dark:stroke-white/5"` | 网格线 |
| `chart-axis` | `#030712/10%` | `#ffffff/10%` | `stroke="rgb(3 7 18 / 0.10)"` / `class="dark:stroke-white/10"` | 坐标轴线 |
| `chart-label` | `gray-500` | `gray-400` | `text-gray-500 dark:text-gray-400` | 刻度/图例标签 |
| `chart-value` | `gray-700` | `gray-300` | `text-gray-700 dark:text-gray-300` | 数据标注数值 |
| `chart-series-1` | `#4F46E5` | `#818CF8` | `bg-indigo-600` / `dark:bg-indigo-400` | 主系列（品牌色） |
| `chart-series-2` | `#3B82F6` | `#60A5FA` | `bg-blue-500` / `dark:bg-blue-400` | 第二系列 |
| `chart-series-3` | `#10B981` | `#34D399` | `bg-emerald-500` / `dark:bg-emerald-400` | 第三系列 |
| `chart-series-4` | `#F59E0B` | `#FBBF24` | `bg-amber-500` / `dark:bg-amber-400` | 第四系列 |
| `chart-series-5` | `#F43F5E` | `#FB7185` | `bg-rose-500` / `dark:bg-rose-400` | 第五系列 |
| `chart-series-6` | `#8B5CF6` | `#A78BFA` | `bg-violet-500` / `dark:bg-violet-400` | 第六系列 |
| `chart-series-7` | `#06B6D4` | `#22D3EE` | `bg-cyan-500` / `dark:bg-cyan-400` | 第七系列 |
| `chart-series-8` | `#F97316` | `#FB923C` | `bg-orange-500` / `dark:bg-orange-400` | 第八系列 |
| `chart-gradient-start` | `indigo-600/30` | `indigo-400/25` | 渐变填充顶部 | 面积图渐变 |
| `chart-gradient-end` | `indigo-600/5` | `indigo-400/5` | 渐变填充底部 | 面积图渐变 |
| `chart-tooltip-bg` | `white` | `gray-800` | `bg-white dark:bg-gray-800` | Tooltip 背景 |
| `chart-tooltip-ring` | `gray-950/8` | `white/10` | `inset-ring-gray-950/8 dark:inset-ring-white/10` | Tooltip 描边 |
| `chart-skeleton` | `gray-100` | `gray-800` | `bg-gray-100 dark:bg-gray-800` | 加载骨架 |
| `chart-empty-icon` | `gray-300` | `gray-600` | `text-gray-300 dark:text-gray-600` | 空状态图标 |

---

## 八、Chart.js 集成指南

当需要高级图表类型（雷达图、散点图、气泡图）时，推荐使用 Chart.js。以下配置确保输出与 Design System 一致。

### 全局默认配置

```javascript
// chart.config.js — Chart.js 全局默认配置
Chart.defaults.font.family = "system-ui, -apple-system, sans-serif";
Chart.defaults.font.size = 12;
Chart.defaults.color = "#6b7280"; // gray-500
Chart.defaults.borderColor = "rgb(3 7 18 / 0.05)"; // chart-grid
Chart.defaults.plugins.tooltip.backgroundColor = "#ffffff";
Chart.defaults.plugins.tooltip.titleColor = "#111827";
Chart.defaults.plugins.tooltip.bodyColor = "#111827";
Chart.defaults.plugins.tooltip.borderColor = "rgb(3 7 18 / 0.08)";
Chart.defaults.plugins.tooltip.borderWidth = 1;
Chart.defaults.plugins.tooltip.cornerRadius = 8;
Chart.defaults.plugins.tooltip.padding = 12;
Chart.defaults.plugins.tooltip.titleFont = { weight: "500", size: 12 };
Chart.defaults.plugins.tooltip.bodyFont = { weight: "600", size: 12 };
Chart.defaults.plugins.legend.labels.usePointStyle = true;
Chart.defaults.plugins.legend.labels.pointStyleWidth = 10;
Chart.defaults.plugins.legend.labels.color = "#6b7280";
Chart.defaults.plugins.legend.labels.font = { size: 12 };
Chart.defaults.animation.duration = 150;
Chart.defaults.animation.easing = "easeInOut";
```

### 系列色盘配置

```javascript
const CHART_COLORS = {
  series1: "#4F46E5", // indigo-600
  series2: "#3B82F6", // blue-500
  series3: "#10B981", // emerald-500
  series4: "#F59E0B", // amber-500
  series5: "#F43F5E", // rose-500
  series6: "#8B5CF6", // violet-500
  series7: "#06B6D4", // cyan-500
  series8: "#F97316", // orange-500
};

const CHART_COLORS_DARK = {
  series1: "#818CF8", // indigo-400
  series2: "#60A5FA", // blue-400
  series3: "#34D399", // emerald-400
  series4: "#FBBF24", // amber-400
  series5: "#FB7185", // rose-400
  series6: "#A78BFA", // violet-400
  series7: "#22D3EE", // cyan-400
  series8: "#FB923C", // orange-400
};
```

### 响应暗色模式

```javascript
// 监听 Tailwind dark class 切换
const isDark = document.documentElement.classList.contains("dark");
const colors = isDark ? CHART_COLORS_DARK : CHART_COLORS;

// 更新 Chart.js 实例
chart.data.datasets[0].borderColor = colors.series1;
chart.data.datasets[0].backgroundColor = colors.series1 + "1A"; // 10% opacity
chart.options.scales.x.ticks.color = isDark ? "#9ca3af" : "#6b7280";
chart.options.scales.y.grid.color = isDark ? "rgb(255 255 255 / 0.05)" : "rgb(3 7 18 / 0.05)";
chart.update();
```

---

## 九、可访问性

| 要求 | 实现 |
|------|------|
| 图表替代文本 | `role="img" aria-label="描述图表内容"` 包含图表类型 + 关键趋势 + 数据范围 |
| 数据可访问 | 图表下方提供 `<table class="sr-only">` 隐藏数据表供屏幕阅读器读取 |
| 颜色对比度 | 所有系列色 vs 白色背景 ≥ 3:1（WCAG AA 非文本对比度）——Indigo-600 (6.54:1) ✅ |
| 不依赖颜色 | 图例使用形状（`rounded-full` 圆点）+ 标签文字，不只依赖颜色区分 |
| 键盘可导航 | 可交互图表（Chart.js Canvas）设置 `tabindex="0"` + 键盘事件处理 |
| 减少动画 | `motion-reduce:transition-none` 对所有 CSS 过渡；Chart.js 需检测 `prefers-reduced-motion` |
| Focus 可见 | Tooltip trigger / 可交互元素包含 `focus-visible:outline-2` |

### 隐藏数据表模式

```html
<!-- 屏幕阅读器可访问的数据表 -->
<table class="sr-only">
  <caption>Monthly revenue data, January to June 2026</caption>
  <thead>
    <tr><th>Month</th><th>Revenue</th></tr>
  </thead>
  <tbody>
    <tr><td>January</td><td>$8,200</td></tr>
    <tr><td>February</td><td>$10,500</td></tr>
    <tr><td>March</td><td>$12,000</td></tr>
    <tr><td>April</td><td>$9,800</td></tr>
    <tr><td>May</td><td>$14,300</td></tr>
    <tr><td>June</td><td>$16,100</td></tr>
  </tbody>
</table>
```

---

## 十、复用指南

### 何时使用 Chart

| 场景 | 变体 | 说明 |
|------|------|------|
| 类别对比（≤12 项） | Bar Chart | 柱状图——最直观的类别对比 |
| 多系列类别对比 | Grouped Bar | 并排柱——2-4 个系列的分类对比 |
| 时间序列趋势 | Area Chart | 面积图——传达量级随时间的变化 |
| 占比分布（3-6 项） | Donut Chart | 环形图——中心可放总计 |
| 表格内趋势指示 | Sparkline | 迷你走势——紧凑、无坐标轴 |
| 排名对比 | Horizontal Bar | 水平柱——标签文字较长时（需 SVG/CSS 任意实现） |

### 何时不用 Chart

| 场景 | 替代方案 | 原因 |
|------|---------|------|
| 精确数值读取 | [Table](./table.md) | 图表传达趋势/占比，不传达精确值 |
| 仅 1-2 个数值 | Stat Card（Card Stat 变体） | 数字 + Badge 趋势比图表更直接 |
| 超过 8 个系列 | 分面图表 或 多图表 | 系列色盘仅 8 色，超出的颜色无法区分 |
| 超过 12 个数据点 | 考虑 Table 或分页 | 柱状图过密失去可读性 |
| 层次/层级数据 | Tree map / 嵌套环形 | 不在本组件覆盖范围——需单独设计 |
| 相关性/分布 | Scatter plot（Chart.js） | CSS/SVG 散点图复杂度高——用 JS 库 |

### 组合规则

```
✅ 图表嵌入 Card  → 复用 Card 容器 + Elevation，图表内容自行渲染
✅ 图表 + 图例  → 图例在图表下方或右侧，不在上方
✅ 图表 + Select → 时间范围选择器放在 Card Header 右上
✅ 图表 + 隐藏数据表 → 每个图表附带 sr-only 数据表
❌ 图表内嵌表格  → 图表和表格是同级元素，不嵌套
❌ 自定义 Tooltip 颜色 → 必须使用 chart-tooltip-* Token
❌ 超过 8 种系列色 → 选择 Top 7 + "Other" 合并
```

---

## 十一、响应式行为

| 断点 | 图表高度 | 柱状图 | 环形图 | 图例位置 |
|------|---------|--------|--------|---------|
| < 640px | `h-48` | 柱体 4-6 根可见，横向滚动 | 环 + 图例上下排列 | 图表下方 |
| ≥ 640px | `h-56` | 全部柱体可见 | 环 + 图例左右排列 | 图表下方 |
| ≥ 1024px | `h-64` | 柱体间距增大 | 环 + 图例左右排列 | 图表右侧 |

---

> **参考链接**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Elevation](../design-tokens/elevation.md) · [Card](./card.md) · [Badge](./badge.md) · [Chart.js Documentation](https://www.chartjs.org/docs/latest/)
