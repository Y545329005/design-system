# Motion

Design System 动效规范。定义全局过渡时长、缓动函数、动画模式。所有组件的交互反馈必须引用此文件，确保全局交互手感一致。

> **关联 Token**: [Colors](./colors.md)（过渡目标色） · [Elevation](./elevation.md)（hover 层级变化）
>
> **关联组件**: 所有交互组件均引用此规范——Button、Card、Input、Toggle、Toast、Modal

---

## 一、设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 默认时长 | 150ms | Linear / Stripe 的共识——即时反馈感，不快不慢 |
| 过渡属性 | `transition-colors`（非 `all`） | 精确指定过渡属性，避免 layout 抖动 |
| 缓动曲线 | `ease`（浏览器默认） | 颜色过渡不需要自定义贝塞尔——`ease` 足够平滑 |
| 退出时长 | 200ms | 退出比进入慢——用户的注意力已不在元素上，稍慢的退出更自然 |
| 按下反馈 | `active:scale-[0.97]` (Button) / `active:scale-[0.99]` (Card) | Linear 的微缩放范本——品质感来自可感知的物理反馈 |
| GPU 合成 | 仅过渡 `transform` + `opacity`（较大动画） | 避免触发重排——Toast 进入/退出、Modal 遮罩 |
| Reduced Motion | `motion-reduce:transition-none` | 尊重用户系统偏好——所有组件全覆盖 |
| 无 spring 动画 | 不引入 JS 动画库 | Tailwind CSS-only——保持零依赖 |

---

## 二、Duration Tokens（过渡时长）

全局仅三档时长。任何组件不得使用 100ms / 250ms / 500ms 等临时值。

| Token | Tailwind | 时长 | 感知 | 用途 |
|-------|----------|------|------|------|
| **instant** | `duration-150` | 150ms | 即时响应——不快不慢 | **默认**——Hover 颜色变化、Focus ring、Badge 关闭按钮 |
| **smooth** | `duration-200` | 200ms | 平滑退出——比进入慢 | Toast 淡出、Modal 关闭、Dropdown 收起 |
| **slow** | `duration-300` | 300ms | 可感知的过渡——大面积变化 | 大区域展开/收起、Sheet 滑入/滑出（极少使用） |

### 时长使用原则

```
✅ Hover/Focus 反馈  → duration-150 (90% 的场景)
✅ 退出/消失动画      → duration-200 (用户注意力已转移，稍慢更自然)
✅ 大区域过渡         → duration-300 (仅 Sheet/Drawer 等大面积元素)
❌ duration-100       → 太短，感知不到过渡
❌ duration-500       → 太长，阻碍操作流畅感
❌ duration-75        → 闪烁感
```

### 为什么不是 100ms 或 200ms

```
100ms → 感知为"瞬间变化"，过渡失去意义
150ms → 刚好可感知，不拖沓——Linear/Stripe 的默认选择
200ms → 已可感知"动画存在"——用于退出（用户不等待）
300ms → 明确的动画——仅大面积变化
```

---

## 三、Easing Curves（缓动函数）

不自定义 cubic-bezier。使用浏览器原生缓动——跨浏览器一致性最优。

| Token | CSS | Tailwind | 用途 |
|-------|-----|----------|------|
| **ease** | `cubic-bezier(0.25, 0.1, 0.25, 1)` | 默认（无需声明） | **默认**——颜色/阴影/ring 过渡 |
| **ease-out** | `cubic-bezier(0, 0, 0.2, 1)` | `ease-out` | 进入动画——快速启动，平滑结束 |
| **ease-in** | `cubic-bezier(0.4, 0, 1, 1)` | `ease-in` | 退出动画——平滑启动，快速结束（极少使用） |
| **ease-in-out** | `cubic-bezier(0.4, 0, 0.2, 1)` | `ease-in-out` | 对称动画——Modal 遮罩淡入淡出 |

### 缓动使用原则

```
✅ transition-colors  → 默认 ease（无需声明）
✅ 进入动画 (Enter)    → ease-out（快速出现，平滑抵达）
✅ 退出动画 (Exit)     → ease-in（平滑开始，快速消失）
✅ 对称动画            → ease-in-out（Modal overlay 淡入淡出）
❌ 自定义 cubic-bezier → 无必要——浏览器默认曲线经过广泛测试
```

---

## 四、Transition Property Scoping（过渡属性精确化）

**禁止使用 `transition-all`**。必须精确指定过渡属性。

| Token | Tailwind | 过渡属性 | 用途 |
|-------|----------|---------|------|
| `motion-colors` | `transition-colors` | `color`, `background-color`, `border-color`, `outline-color`, `text-decoration-color`, `fill`, `stroke` | **默认**——Hover/Focus/Active 颜色反馈 |
| `motion-opacity` | `transition-opacity` | `opacity` | 显示/隐藏（Toast 淡出、Modal 遮罩） |
| `motion-transform` | `transition-transform` | `transform` (translate, scale, rotate) | 位移/缩放（Toggle 滑块、Button 按下） |
| `motion-shadow` | `transition-shadow` | `box-shadow` | ring 过渡（极少——通常用 `transition-colors` 覆盖） |

### 为什么禁止 `transition-all`

```html
<!-- ❌ 禁止 -->
<button class="transition-all duration-150 hover:bg-gray-100">
  <!-- 布局变化时会触发不期望的 width/height 过渡 → 抖动 -->

<!-- ✅ 正确 -->
<button class="transition-colors duration-150 hover:bg-gray-100">
  <!-- 仅过渡颜色——布局不受影响 -->
```

### 组合使用

```html
<!-- 同时过渡颜色 + 透明度 (Toast 淡出) -->
<div class="transition-colors transition-opacity duration-200 ease-out opacity-0">
  <!-- Toast fading out -->
</div>

<!-- 颜色 + 位移 (Toggle 滑块) -->
<span class="transition-colors transition-transform duration-150
  translate-x-0 peer-checked:translate-x-[22px]">
  <!-- Toggle thumb -->
</span>
```

---

## 五、Animation Patterns（动画模式）

系统中有四种标准动画模式。新增交互时，从以下选择。

### 1. Hover Response（Hover 反馈）— 最常用

```html
<!-- Pattern -->
<element class="transition-colors duration-150
  hover:{property-change}
  motion-reduce:transition-none">
```

| 组件 | 触发 | 过渡属性 | 示例 |
|------|------|---------|------|
| Button | Hover | `bg` + `text` | `hover:bg-gray-100` |
| Card (Interactive) | Hover | `bg` + `inset-ring` | `hover:bg-gray-50/50 hover:inset-ring-gray-950/20` |
| Input/Select/Textarea | Focus | `inset-ring` + `ring` | `focus:inset-ring-gray-950/20 focus:ring-2` |
| Badge Dismiss | Hover | `bg` + `text` | `hover:bg-gray-200 hover:text-gray-600` |
| Table Row | Hover | `bg` | `hover:bg-gray-50/50` |
| Sidebar Item | Hover | `bg` | `hover:bg-gray-50` |
| Navbar Link | Hover | `text` | `hover:text-gray-900` |

**所有 Hover Response 统一使用 `transition-colors duration-150`**。

---

### 2. Press Feedback（按下反馈）

```html
<!-- Button Press → 微缩放 0.97 -->
<button class="transition-colors duration-150
  active:scale-[0.97]">

<!-- Card Press → 微缩放 0.99（容器较大，缩放更微妙） -->
<div class="transition-colors duration-150
  active:scale-[0.99]">
```

| 元素 | Scale | 依据 |
|------|-------|------|
| Button | `active:scale-[0.97]` | 小元素需要更明显的反馈——3% 缩放可感知但不夸张 |
| Card (Interactive) | `active:scale-[0.99]` | 大容器微缩放——1% 即可传达"被按下"，太多会抖动 |
| Icon Button | `active:scale-[0.97]` | 与 Button 一致 |
| Badge Dismiss | 无 scale | 太小（20px），缩放无意义 |

---

### 3. Enter / Exit（进入/退出动画）

#### Toast

```
进: translateY(-8px) + opacity 0 → translateY(0) + opacity 1 (150ms ease-out)
出: opacity 1 → opacity 0 (200ms ease-out)，然后 remove()
```

```javascript
// Toast Enter — 通过初始 CSS 类实现
// 容器挂载时: -translate-y-2 opacity-0
// 下一帧: translate-y-0 opacity-100 (触发过渡)

// Toast Exit
toast.style.transition = 'opacity 200ms ease-out'
toast.style.opacity = '0'
setTimeout(() => toast.remove(), 200)
```

#### Modal Overlay

```
进: opacity 0 → opacity 1 (150ms ease-in-out)
出: opacity 1 → opacity 0 (200ms ease-in-out)
```

```html
<!-- Overlay -->
<div class="fixed inset-0 bg-gray-950/50 backdrop-blur-sm
  transition-opacity duration-150 ease-in-out
  motion-reduce:transition-none">
```

#### Dropdown / Popover（未来）

```
进: opacity 0 + scale(0.95) → opacity 1 + scale(1) (150ms ease-out)
出: opacity 1 + scale(1) → opacity 0 + scale(0.95) (150ms ease-in)
```

---

### 4. Toggle / Switch（开关位移动画）

唯一同时使用 `transition-colors` + `transition-transform` 的模式。

```html
<!-- Toggle Thumb -->
<span class="
  transition-colors transition-transform duration-150
  translate-x-0 peer-checked:translate-x-[22px]
  motion-reduce:transition-none
"></span>
```

> Toggle 不直接使用 `transition-all`——精确指定 `colors` + `transform` 避免不期望的 width/height 过渡。

---

## 六、Reduced Motion（减少动画）

**所有交互元素必须添加 `motion-reduce:transition-none`**。这是操作系统级的用户偏好——必须无条件尊重。

| 组件 | 覆盖方式 |
|------|---------|
| Button | `motion-reduce:transition-none` |
| Card | `motion-reduce:transition-none` |
| Input/Select/Textarea | `motion-reduce:transition-none` |
| Toggle | `motion-reduce:transition-none` |
| Checkbox | `motion-reduce:transition-none` |
| Badge Dismiss | `motion-reduce:transition-none` |
| Modal Overlay | `motion-reduce:transition-none` |
| Toast | `motion-reduce:transition-none` |
| Table Row | `motion-reduce:transition-none` |
| Prose Link | `motion-reduce:[&_a]:transition-none` |
| Sidebar/Navbar | `motion-reduce:transition-none` |

### 覆盖策略

```html
<!-- 标准模式 -->
<element class="transition-colors duration-150
  motion-reduce:transition-none">

<!-- 有 scale 时同时覆盖 transform -->
<element class="transition-colors duration-150
  active:scale-[0.97]
  motion-reduce:transition-none motion-reduce:active:scale-100">
```

---

## 七、GPU Compositing（GPU 合成）

仅过渡 `transform` + `opacity` 的动画由浏览器自动 GPU 合成——不触发重排。

| 模式 | 过渡属性 | GPU 合成 | 说明 |
|------|---------|---------|------|
| Hover 颜色 | `color`, `background-color` | ❌ (但无重排) | 颜色过渡不触发 Layout，仅触发 Paint——开销极小 |
| 按下缩放 | `transform: scale()` | ✅ | 自动 GPU 合成 |
| Toggle 位移 | `transform: translateX()` | ✅ | 自动 GPU 合成 |
| Toast 淡出 | `opacity` | ✅ | 自动 GPU 合成 |
| Modal 遮罩 | `opacity` | ✅ | 自动 GPU 合成 |

### 原则

```
✅ 大动画 (Toast/Modal/Dropdown) → 仅过渡 opacity + transform（GPU 合成，不重排）
✅ 小反馈 (Hover/Button)        → 过渡颜色 + transform（颜色需重绘，但范围极小）
❌ 过渡 width/height/margin      → 触发重排——禁止
❌ 过渡 left/top                 → 触发重排——使用 translate 代替
```

---

## 八、Design Tokens 汇总

| Token | Tailwind | CSS | 用途 |
|-------|----------|-----|------|
| `motion-duration-default` | `duration-150` | `150ms` | Hover/Focus 即时反馈 |
| `motion-duration-exit` | `duration-200` | `200ms` | 退出/消失动画 |
| `motion-duration-large` | `duration-300` | `300ms` | 大区域动画 |
| `motion-ease-default` | (默认) | `ease` | 颜色过渡 |
| `motion-ease-enter` | `ease-out` | `cubic-bezier(0, 0, 0.2, 1)` | 进入动画 |
| `motion-ease-exit` | `ease-in` | `cubic-bezier(0.4, 0, 1, 1)` | 退出动画 |
| `motion-ease-symmetric` | `ease-in-out` | `cubic-bezier(0.4, 0, 0.2, 1)` | Modal 遮罩 |
| `motion-property-colors` | `transition-colors` | — | Hover 颜色反馈 |
| `motion-property-opacity` | `transition-opacity` | — | 显示/隐藏 |
| `motion-property-transform` | `transition-transform` | — | 位移/缩放 |
| `motion-press-button` | `active:scale-[0.97]` | — | 按钮按下 |
| `motion-press-card` | `active:scale-[0.99]` | — | 卡片按下 |
| `motion-reduce` | `motion-reduce:transition-none` | `@media (prefers-reduced-motion: reduce)` | Reduced motion |

---

## 九、组件 Motion 映射

| 组件 | 交互 | Duration | Property | Easing | 备注 |
|------|------|----------|----------|--------|------|
| **Button** | Hover | 150ms | `transition-colors` | 默认 | |
| **Button** | Press | — | `scale-[0.97]` | — | |
| **Card (Interactive)** | Hover | 150ms | `transition-colors` | 默认 | bg + inset-ring |
| **Card (Interactive)** | Press | — | `scale-[0.99]` | — | |
| **Input/Select/Textarea** | Focus | 150ms | `transition-colors` | 默认 | inset-ring + ring |
| **Toggle** | Thumb slide | 150ms | `transition-colors` + `transition-transform` | 默认 | `translate-x-[22px]` |
| **Checkbox** | Check | 150ms | `transition-colors` | 默认 | bg + inset-ring |
| **Badge Dismiss** | Hover | 150ms | `transition-colors` | 默认 | 关闭按钮 |
| **Toast** | Enter | 150ms | `transform` + `opacity` | `ease-out` | translateY + opacity |
| **Toast** | Exit | 200ms | `opacity` | `ease-out` | fade out |
| **Modal Overlay** | Enter/Exit | 150ms | `opacity` | `ease-in-out` | |
| **Table Row** | Hover | 150ms | `transition-colors` | 默认 | bg |
| **Sidebar Item** | Hover | 150ms | `transition-colors` | 默认 | bg |
| **Prose Link** | Hover | 150ms | `transition-colors` | 默认 | text color |

---

## 十、复用指南

### 新增组件时的 Motion 选择

```
交互反馈 (Hover/Focus)  → transition-colors duration-150
按下反馈                → active:scale-[0.97] (小元素) / active:scale-[0.99] (大容器)
进入动画                → transition-transform transition-opacity duration-150 ease-out
退出动画                → transition-opacity duration-200 ease-out
位移动画 (Toggle)       → transition-transform duration-150
无障碍                  → motion-reduce:transition-none (必须)
```

### 禁止事项

```
❌ transition-all            → 精确指定过渡属性
❌ duration-100 / duration-500 → 从三档标准时长选取
❌ 自定义 cubic-bezier       → 使用浏览器默认缓动
❌ 过渡 width/height/margin  → 使用 transform 替代
❌ 缺少 motion-reduce        → 所有交互元素必须有
❌ JS 动画库 (framer-motion) → Tailwind CSS-only——零依赖
❌ spring 动画               → 系统保持简单，不引入物理引擎
```

---

> 参考: [Linear Design System — Motion](https://linear.app/docs) · [Stripe Motion Principles](https://stripe.com/docs) · [Tailwind CSS Transition](https://tailwindcss.com/docs/transition-property) · [prefers-reduced-motion (MDN)](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-reduced-motion)
