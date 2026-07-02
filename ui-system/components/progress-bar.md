# Progress Bar

Progress Bar 进度条组件，用于展示任务完成的进度、加载状态或容量使用情况。

> **Design Tokens**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Motion](../design-tokens/motion.md)
>
> **关联组件**: [Skeleton](./skeleton.md) · [Badge](./badge.md)
>
> **依赖**: 无——纯 CSS + HTML

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 高度 | `h-2` (8px) | 不占太多垂直空间——行内混排友好 |
| 圆角 | `rounded-full`（进度条） | 进度条两端圆形——不会刺眼，进度条唯一可使用 `rounded-full` 的场景之一 |
| 容器圆角 | `rounded-full` | 匹配进度条形状 |
| 容器背景 | `bg-gray-200 dark:bg-gray-700` | 与 Skeleton 一致——灰色底板 |
| 填充色 | Indigo（默认）或语义色 | 品牌色为主，语义色用于容量/健康度 |
| 动效 | `transition-all duration-300 ease-in-out` + 微 pulse | 进度变化平滑，启动时有"活着的"感觉 |
| 标签字体 | `text-xs text-gray-500` | 辅助信息，不抢进度条注意力 |
| 最小宽度 | `w-[2%]` | 避免 0% 时进度条完全消失 |

---

## 变体

### 1. Base — 基础进度条

```html
<!-- Base Progress Bar (60%) -->
<div role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
  class="h-2 rounded-full bg-gray-200 dark:bg-gray-700">
  <div class="h-full rounded-full bg-indigo-600 transition-all duration-300 ease-in-out motion-reduce:transition-none" style="width: 60%"></div>
</div>

<!-- With Label -->
<div class="space-y-1.5">
  <div class="flex items-center justify-between text-xs text-gray-500 dark:text-gray-400">
    <span>Progress</span>
    <span>60%</span>
  </div>
  <div role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" aria-label="Progress"
    class="h-2 rounded-full bg-gray-200 dark:bg-gray-700">
    <div class="h-full rounded-full bg-indigo-600 transition-all duration-300 ease-in-out motion-reduce:transition-none" style="width: 60%"></div>
  </div>
</div>
```

---

### 2. Semantic Colors — 语义色进度条

```html
<!-- Success (100%) -->
<div class="h-2 rounded-full bg-gray-200 dark:bg-gray-700">
  <div class="h-full rounded-full bg-green-500 transition-all duration-300 ease-in-out motion-reduce:transition-none" style="width: 100%"></div>
</div>

<!-- Warning (75%) -->
<div class="h-2 rounded-full bg-gray-200 dark:bg-gray-700">
  <div class="h-full rounded-full bg-amber-500 transition-all duration-300 ease-in-out motion-reduce:transition-none" style="width: 75%"></div>
</div>

<!-- Error / Critical (92%) -->
<div class="h-2 rounded-full bg-gray-200 dark:bg-gray-700">
  <div class="h-full rounded-full bg-red-500 transition-all duration-300 ease-in-out motion-reduce:transition-none" style="width: 92%"></div>
</div>
```

**设计要点：**
- Green（0-100% 完成）——成功/完成态
- Amber（60-80%）——警告/接近上限
- Red（80-100%）——危险/即将满

---

### 3. Indeterminate — 不确定进度

用于等待时间未知的场景（如 API 请求中）。

```html
<!-- Indeterminate (looping animation) -->
<div role="progressbar" aria-label="Loading"
  class="h-2 rounded-full bg-gray-200 overflow-hidden dark:bg-gray-700">
  <div class="h-full w-1/2 rounded-full bg-indigo-600 animate-[indeterminate_1.5s_ease-in-out_infinite] motion-reduce:animate-none"></div>
</div>

<style>
@keyframes indeterminate {
  0%   { transform: translateX(-100%); }
  100% { transform: translateX(300%); }
}
</style>
```

**设计要点：**
- `overflow-hidden` 在容器上——裁剪溢出的滑块
- 滑块 `w-1/2`——滑块半宽，平移时始终部分可见
- Keyframe: `translateX(-100%)` → `translateX(300%)`——从左侧滑出到右侧消失
- `animate-[indeterminate_1.5s_ease-in-out_infinite]`——1.5 秒循环
- `motion-reduce:animate-none`——尊重用户偏好

---

### 4. Multi-segment — 多段进度条

用于展示多种状态的占比（如存储空间分配）。

```html
<!-- Multi-segment (Documents 45%, Images 30%, Videos 15%, Free 10%) -->
<div class="space-y-2">
  <div class="flex items-center gap-3">
    <div class="h-2 flex-1 rounded-full bg-gray-200 dark:bg-gray-700 overflow-hidden flex">
      <div class="h-full bg-indigo-500" style="width: 45%"></div>
      <div class="h-full bg-blue-500" style="width: 30%"></div>
      <div class="h-full bg-amber-500" style="width: 15%"></div>
    </div>
    <span class="text-xs text-gray-500 dark:text-gray-400 whitespace-nowrap">90% used</span>
  </div>
  <!-- Legend -->
  <div class="flex items-center gap-4 text-xs text-gray-500 dark:text-gray-400">
    <span class="inline-flex items-center gap-1.5">
      <span class="size-2 rounded-sm bg-indigo-500" aria-hidden="true"></span>
      Documents 45%
    </span>
    <span class="inline-flex items-center gap-1.5">
      <span class="size-2 rounded-sm bg-blue-500" aria-hidden="true"></span>
      Images 30%
    </span>
    <span class="inline-flex items-center gap-1.5">
      <span class="size-2 rounded-sm bg-amber-500" aria-hidden="true"></span>
      Videos 15%
    </span>
  </div>
</div>
```

**设计要点：**
- 容器 `flex`——各段横向排列
- 无 gap——各段紧密相邻
- 图例使用 `size-2 rounded-sm` 小方块——与进度条颜色一致
- 各段之间无分隔线——依赖颜色区分

---

### 5. Steps — 步骤进度条

```html
<!-- Steps Progress (Step 3 of 5) -->
<div class="space-y-2">
  <div class="flex items-center justify-between text-xs text-gray-500 dark:text-gray-400">
    <span>Step 3 of 5</span>
    <span>60%</span>
  </div>
  <div role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
    class="flex gap-1.5">
    <div class="h-2 flex-1 rounded-full bg-indigo-600"></div>
    <div class="h-2 flex-1 rounded-full bg-indigo-600"></div>
    <div class="h-2 flex-1 rounded-full bg-indigo-600"></div>
    <div class="h-2 flex-1 rounded-full bg-gray-200 dark:bg-gray-700"></div>
    <div class="h-2 flex-1 rounded-full bg-gray-200 dark:bg-gray-700"></div>
  </div>
</div>
```

**设计要点：**
- 每个步骤独立一个 `flex-1` 块——等宽
- `gap-1.5` (6px)——步骤之间的小间距
- 激活块 `bg-indigo-600`，未激活 `bg-gray-200`

---

### 6. With Icon — 带完成图标

```html
<!-- Upload complete (100%) -->
<div class="inline-flex items-center gap-3">
  <div role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"
    class="h-2 w-32 rounded-full bg-gray-200 dark:bg-gray-700">
    <div class="h-full rounded-full bg-green-500 transition-all duration-300 ease-in-out" style="width: 100%"></div>
  </div>
  <svg class="size-5 text-green-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
    <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5"/>
  </svg>
</div>

<!-- Uploading (45%) -->
<div class="inline-flex items-center gap-3">
  <div role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"
    class="h-2 w-32 rounded-full bg-gray-200 dark:bg-gray-700">
    <div class="h-full rounded-full bg-indigo-600 transition-all duration-300 ease-in-out motion-reduce:transition-none" style="width: 45%"></div>
  </div>
  <span class="text-xs text-gray-500 dark:text-gray-400">45%</span>
</div>
```

---

## JS 更新逻辑

```javascript
function updateProgress(element, current, total) {
  const pct = Math.round((current / total) * 100)
  const bar = element.querySelector('[role="progressbar"]')
  const fill = bar.querySelector('.h-full')
  const label = element.querySelector('.progress-label')

  bar.setAttribute('aria-valuenow', pct)
  fill.style.width = pct + '%'

  if (label) label.textContent = pct + '%'

  // Semantic color switch
  if (pct >= 100) {
    fill.classList.remove('bg-indigo-600', 'bg-amber-500', 'bg-red-500')
    fill.classList.add('bg-green-500')
  } else if (pct > 80) {
    fill.classList.remove('bg-indigo-600', 'bg-green-500', 'bg-amber-500')
    fill.classList.add('bg-red-500')
  } else if (pct > 60) {
    fill.classList.remove('bg-indigo-600', 'bg-green-500', 'bg-red-500')
    fill.classList.add('bg-amber-500')
  }
}
```

---

## Design Tokens

| Token | Tailwind | 值 | 说明 |
|-------|----------|-----|------|
| 高度 | `h-2` | 8px | 标准进度条高度 |
| 容器圆角 | `rounded-full` | — | 进度条特例——两端圆形 |
| 容器背景 | `bg-gray-200` | #E5E7EB | Light |
| 容器暗色背景 | `bg-gray-700` | #374151 | Dark |
| 默认填充色 | `bg-indigo-600` | #4F46E5 | |
| 成功色 | `bg-green-500` | #22C55E | |
| 警告色 | `bg-amber-500` | #F59E0B | |
| 错误色 | `bg-red-500` | #EF4444 | |
| 标签字号 | `text-xs` | 12px | |
| 过渡 | `transition-all duration-300 ease-in-out` | 300ms | 进度变化——较大变化用 300ms |
| 步骤间距 | `gap-1.5` | 6px | |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| 语义元素 | `role="progressbar"` |
| 当前值 | `aria-valuenow="60"` |
| 最小值 | `aria-valuemin="0"` |
| 最大值 | `aria-valuemax="100"` |
| 标签 | `aria-label="Progress"`（无可见标签时） |
| 不确定态 | 不设置 `aria-valuenow`——屏幕阅读器知悉为不确定 |
| Reduced motion | `motion-reduce:transition-none` / `motion-reduce:animate-none` |

---

## 复用指南

### 何时使用

- 文件上传/下载进度
- 多步骤表单进度指示
- 容量/存储使用率
- 任务完成度

### 何时不用

| 场景 | 替代方案 |
|------|---------|
| 页面加载 | [Skeleton](./skeleton.md) |
| 数量极少的步骤 (2-3) | Steps 变体或 Step Indicator |
| 时间进度（如倒计时） | 数字倒计时 |

---

> 参考: [WAI-ARIA Progressbar Pattern](https://www.w3.org/WAI/ARIA/apg/patterns/progressbar/)
