# Tooltip

Tooltip 是悬浮提示组件，用于补充简短说明。适用于图标按钮标签、截断文本完整内容、辅助信息提示等场景。

> **Design Tokens**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Elevation](../design-tokens/elevation.md) · [Motion](../design-tokens/motion.md)
>
> **关联组件**: [Button](./button.md) · [Badge](./badge.md)
>
> **依赖**: JS 控制显示/隐藏 + 定位计算

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 背景色 | `bg-gray-900` light / `bg-gray-700` dark | 高对比度——Tooltip 是临时信息，不需要融入背景 |
| 文字色 | `text-white` | 深色背景上的最高可读性 |
| 字号 | `text-xs` (12px) | 辅助信息不抢注意力 |
| 圆角 | `rounded-lg` (8px) | 全局交互元素圆角统一 |
| Padding | `px-2.5 py-1.5` | 紧凑但不拥挤 |
| 最大宽度 | `max-w-xs` (320px) | 防止 Tooltip 过宽——过长文本应截断 |
| 三角箭头 | 4px（CSS border trick） | 经典实现——纯 CSS、无额外元素 |
| 延迟显示 | 300ms（建议） | 避免鼠标划过时频繁闪烁 |
| 动效 | opacity 150ms ease-out | 淡入淡出——与全局标准一致 |
| 位置 | 上/下/左/右 4 方向 | 优先上方——与鼠标移动方向一致 |

---

## 变体

### 1. Top — 上方（默认）

最常用的 Tooltip 方向。三角箭头在下方，指向触发元素。

```html
<!-- Trigger + Tooltip (Top) -->
<div class="relative inline-flex">
  <button type="button" aria-describedby="tooltip-1"
    class="inline-flex items-center justify-center rounded-lg p-2.5 text-gray-700 transition-colors duration-150 hover:bg-gray-950/[2.5%] hover:text-gray-900 motion-reduce:transition-none">
    <svg class="size-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M12 15a3 3 0 100-6 3 3 0 000 6z"/><path stroke-linecap="round" stroke-linejoin="round" d="M19.4 15a1.65 1.65 0 00.33 1.82l.06.06a2 2 0 010 2.83 2 2 0 01-2.83 0l-.06-.06a1.65 1.65 0 00-1.82-.33 1.65 1.65 0 00-1 1.51V21a2 2 0 01-4 0v-.09A1.65 1.65 0 009 19.4a1.65 1.65 0 00-1.82.33l-.06.06a2 2 0 01-2.83-2.83l.06-.06A1.65 1.65 0 004.68 15a1.65 1.65 0 00-1.51-1H3a2 2 0 010-4h.09A1.65 1.65 0 004.6 9a1.65 1.65 0 00-.33-1.82l-.06-.06a2 2 0 012.83-2.83l.06.06A1.65 1.65 0 009 4.68a1.65 1.65 0 001-1.51V3a2 2 0 014 0v.09a1.65 1.65 0 001 1.51 1.65 1.65 0 001.82-.33l.06-.06a2 2 0 012.83 2.83l-.06.06A1.65 1.65 0 0019.4 9a1.65 1.65 0 001.51 1H21a2 2 0 010 4h-.09a1.65 1.65 0 00-1.51 1z"/></svg>
  </button>
  <div id="tooltip-1" role="tooltip" hidden
    class="absolute bottom-full left-1/2 -translate-x-1/2 mb-2 px-2.5 py-1.5 text-xs font-medium text-white bg-gray-900 rounded-lg shadow-sm whitespace-nowrap max-w-xs dark:bg-gray-700">
    Settings
    <!-- Arrow (bottom) -->
    <div class="absolute top-full left-1/2 -translate-x-1/2 -mt-px border-4 border-transparent border-t-gray-900 dark:border-t-gray-700" aria-hidden="true"></div>
  </div>
</div>
```

---

### 2. Bottom — 下方

```html
<div class="relative inline-flex">
  <button type="button" aria-describedby="tooltip-2"
    class="inline-flex items-center justify-center rounded-lg p-2.5 text-gray-700 transition-colors duration-150 hover:bg-gray-950/[2.5%] hover:text-gray-900 motion-reduce:transition-none">
    <svg class="size-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M12 15a3 3 0 100-6 3 3 0 000 6z"/><path stroke-linecap="round" stroke-linejoin="round" d="M19.4 15a1.65 1.65 0 00.33 1.82l.06.06a2 2 0 010 2.83 2 2 0 01-2.83 0l-.06-.06a1.65 1.65 0 00-1.82-.33 1.65 1.65 0 00-1 1.51V21a2 2 0 01-4 0v-.09A1.65 1.65 0 009 19.4a1.65 1.65 0 00-1.82.33l-.06.06a2 2 0 01-2.83-2.83l.06-.06A1.65 1.65 0 004.68 15a1.65 1.65 0 00-1.51-1H3a2 2 0 010-4h.09A1.65 1.65 0 004.6 9a1.65 1.65 0 00-.33-1.82l-.06-.06a2 2 0 012.83-2.83l.06.06A1.65 1.65 0 009 4.68a1.65 1.65 0 001-1.51V3a2 2 0 014 0v.09a1.65 1.65 0 001 1.51 1.65 1.65 0 001.82-.33l.06-.06a2 2 0 012.83 2.83l-.06.06A1.65 1.65 0 0019.4 9a1.65 1.65 0 001.51 1H21a2 2 0 010 4h-.09a1.65 1.65 0 00-1.51 1z"/></svg>
  </button>
  <div id="tooltip-2" role="tooltip" hidden
    class="absolute top-full left-1/2 -translate-x-1/2 mt-2 px-2.5 py-1.5 text-xs font-medium text-white bg-gray-900 rounded-lg shadow-sm whitespace-nowrap max-w-xs dark:bg-gray-700">
    Settings
    <div class="absolute bottom-full left-1/2 -translate-x-1/2 -mb-px border-4 border-transparent border-b-gray-900 dark:border-b-gray-700" aria-hidden="true"></div>
  </div>
</div>
```

---

### 3. Left — 左侧

```html
<div class="relative inline-flex">
  <span aria-describedby="tooltip-3" tabindex="0"
    class="text-gray-900 underline decoration-dotted underline-offset-4 cursor-help dark:text-white">
    GDP
  </span>
  <div id="tooltip-3" role="tooltip" hidden
    class="absolute right-full top-1/2 -translate-y-1/2 mr-2 px-2.5 py-1.5 text-xs font-medium text-white bg-gray-900 rounded-lg shadow-sm whitespace-nowrap max-w-xs dark:bg-gray-700">
    Gross Domestic Product
    <div class="absolute left-full top-1/2 -translate-y-1/2 -ml-px border-4 border-transparent border-l-gray-900 dark:border-l-gray-700" aria-hidden="true"></div>
  </div>
</div>
```

---

### 4. Right — 右侧

```html
<div class="relative inline-flex">
  <span aria-describedby="tooltip-4" tabindex="0"
    class="text-gray-900 underline decoration-dotted underline-offset-4 cursor-help dark:text-white">
    CSS
  </span>
  <div id="tooltip-4" role="tooltip" hidden
    class="absolute left-full top-1/2 -translate-y-1/2 ml-2 px-2.5 py-1.5 text-xs font-medium text-white bg-gray-900 rounded-lg shadow-sm whitespace-nowrap max-w-xs dark:bg-gray-700">
    Cascading Style Sheets
    <div class="absolute right-full top-1/2 -translate-y-1/2 -mr-px border-4 border-transparent border-r-gray-900 dark:border-r-gray-700" aria-hidden="true"></div>
  </div>
</div>
```

**设计要点（所有方向）：**
- `aria-describedby="tooltip-id"`——关联触发器与 Tooltip
- `role="tooltip"`——语义元素
- `whitespace-nowrap max-w-xs`——单行优先，超长文本截断
- 三角箭头：`border-4 border-transparent border-{direction}-gray-900`——纯 CSS border trick
- 暗色模式三角箭头需单独覆盖：`dark:border-{direction}-gray-700`

---

## JS 交互逻辑

```javascript
function setupTooltip(containerSelector) {
  const containers = document.querySelectorAll(containerSelector)

  containers.forEach(container => {
    const trigger = container.querySelector('[aria-describedby]')
    const tooltip = container.querySelector('[role="tooltip"]')
    if (!trigger || !tooltip) return

    let timeout

    function show() {
      clearTimeout(timeout)
      timeout = setTimeout(() => {
        tooltip.hidden = false
      }, 300) // 300ms delay
    }

    function hide() {
      clearTimeout(timeout)
      tooltip.hidden = true
    }

    trigger.addEventListener('mouseenter', show)
    trigger.addEventListener('mouseleave', hide)
    trigger.addEventListener('focus', () => { tooltip.hidden = false })
    trigger.addEventListener('blur', () => { tooltip.hidden = true })

    // Hide on Escape
    document.addEventListener('keydown', (e) => {
      if (e.key === 'Escape') hide()
    })
  })
}
```

---

## Design Tokens

| Token | Tailwind | 值 | 说明 |
|-------|----------|-----|------|
| 背景色 | `bg-gray-900` | #111827 | 最高对比度深色背景 |
| 暗色背景 | `bg-gray-700`（dark） | #374151 | |
| 文字色 | `text-white` | #FFF | |
| 字号 | `text-xs` | 12px | |
| 圆角 | `rounded-lg` | 8px | |
| Padding | `px-2.5 py-1.5` | 10px 6px | |
| 最大宽度 | `max-w-xs` | 320px | |
| 箭头尺寸 | `border-4` | 4px × 4 | border trick 三角形 |
| 箭头间距 | `mb-2` / `mt-2` / `mr-2` / `ml-2` | 8px | Tooltip 与触发器的距离 |
| 延迟 | `setTimeout(300)` | 300ms | 避免闪烁 |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| 语义元素 | `role="tooltip"` |
| 关联触发器 | `aria-describedby="tooltip-id"` |
| 隐藏状态 | `hidden` 属性（非 aria-hidden）——从 DOM 顺序中移除 |
| 键盘触发 | `focus` / `blur` 显示/隐藏 |
| Escape 关闭 | 按 Escape 隐藏 Tooltip |
| 悬停延迟 | 300ms——避免快速划过时闪烁 |

---

## 复用指南

### 何时使用

- 图标按钮标签（无文字时的补充说明）
- 截断文本完整内容
- 缩写/术语解释
- 辅助信息（不阻塞主流程）

### 何时不用

| 场景 | 替代方案 |
|------|---------|
| 重要信息（必须看到） | 直接展示文字或使用 Badge |
| 交互操作 | 使用 Dropdown Menu |
| 长文本（> 一句话） | Popover 或 Modal |
| 表单错误提示 | Input Error 状态——错误信息内联展示 |
| 移动端 | Tooltip 在触屏上无法 hover——使用内联文字或 Toggle |

---

> 参考: [WAI-ARIA Tooltip Pattern](https://www.w3.org/WAI/ARIA/apg/patterns/tooltip/) · [Linear Tooltip](https://linear.app)
