# Toggle

Toggle 是开关组件，用于布尔值切换（开/关、启用/禁用）。使用原生 `<input type="checkbox">` + `sr-only` + 自定义轨道/滑块模式，确保最佳可访问性。

> **Design Tokens**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md)
>
> **关联组件**: [Checkbox](./checkbox.md)（同级布尔输入控件）
>
> **依赖**: 无额外依赖——纯 CSS `peer` 技巧实现

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 实现方式 | 原生 checkbox + `sr-only` | 完整的键盘和屏幕阅读器支持，无需 JS |
| 激活色 | `bg-indigo-600` | 唯一品牌强调色，与 Button Primary 一致 |
| 非激活色 | `bg-gray-200` | 中性灰，明确传达"关闭"状态 |
| 滑块 | `rounded-full` 白色圆形 | 圆形滑块是 Toggle 的语义约定，属于合法 `rounded-full` 场景 |
| 轨道 | `rounded-full` 胶囊形 | 胶囊形 = "开关"的用户心智模型 |
| 过渡 | `transition-colors duration-150` + `transition-transform duration-150` | 全局 150ms，颜色和位移同时过渡 |
| 尺寸 | 轨道 `h-6 w-11` (24×44px) | 标准 iOS/macOS 尺寸，用户熟悉 |
| 暗色模式 | 品牌色降至 `indigo-500` | 暗背景上略降饱和度 |

---

## 变体

### 1. Base Toggle — 基础开关

最常用的独立开关。使用 `peer` + `sr-only` 模式——checkbox 隐藏在屏幕外，视觉由相邻 span 呈现。

```html
<!-- Base Toggle (ON) -->
<label class="relative inline-flex cursor-pointer items-center">
  <input type="checkbox" class="peer sr-only" checked />
  <span
    class="block h-6 w-11 rounded-full bg-indigo-600
      transition-colors duration-150
      peer-focus-visible:outline-2 peer-focus-visible:outline-offset-2 peer-focus-visible:outline-indigo-600
      dark:bg-indigo-500
      motion-reduce:transition-none"
    aria-hidden="true"
  ></span>
  <span
    class="absolute start-0.5 top-0.5 size-5 rounded-full bg-white
      transition-transform duration-150
      peer-checked:translate-x-[22px]
      dark:bg-gray-900
      motion-reduce:transition-none"
    aria-hidden="true"
  ></span>
</label>

<!-- Base Toggle (OFF) -->
<label class="relative inline-flex cursor-pointer items-center">
  <input type="checkbox" class="peer sr-only" />
  <span
    class="block h-6 w-11 rounded-full bg-gray-200
      transition-colors duration-150
      peer-checked:bg-indigo-600
      peer-focus-visible:outline-2 peer-focus-visible:outline-offset-2 peer-focus-visible:outline-indigo-600
      dark:bg-gray-700 dark:peer-checked:bg-indigo-500
      motion-reduce:transition-none"
    aria-hidden="true"
  ></span>
  <span
    class="absolute start-0.5 top-0.5 size-5 rounded-full bg-white shadow-sm
      transition-transform duration-150
      peer-checked:translate-x-[22px]
      dark:bg-gray-300 dark:peer-checked:bg-gray-900
      motion-reduce:transition-none"
    aria-hidden="true"
  ></span>
</label>
```

**设计要点：**
- `peer sr-only`——checkbox 对视觉用户隐藏，但仍可被屏幕阅读器和键盘访问
- `peer-checked:translate-x-[22px]`——滑块在 44px 轨道内移动 22px（44 - 20 - 2 = 22px padding）
- `peer-focus-visible:outline-2`——键盘导航时在轨道上显示焦点环
- `shadow-sm`（OFF 态滑块）——给白色滑块增加微弱立体感，ON 态滑块在深色背景上不需要阴影
- 暗色模式 OFF 态滑块 `dark:bg-gray-300`——在暗色轨道上需要更亮的白色滑块

---

### 2. With Label — 带文字标签

Toggle + 描述文字，用于设置页中的开关列表。

```html
<!-- Toggle with Label (ON) -->
<div class="flex items-center justify-between">
  <div>
    <p class="text-sm font-medium text-gray-900 dark:text-gray-100">
      Email notifications
    </p>
    <p class="text-xs text-gray-500 dark:text-gray-400">
      Receive weekly digests and updates
    </p>
  </div>
  <label class="relative inline-flex shrink-0 cursor-pointer items-center">
    <input type="checkbox" class="peer sr-only" checked />
    <span
      class="block h-6 w-11 rounded-full bg-indigo-600
        transition-colors duration-150
        peer-focus-visible:outline-2 peer-focus-visible:outline-offset-2 peer-focus-visible:outline-indigo-600
        dark:bg-indigo-500
        motion-reduce:transition-none"
      aria-hidden="true"
    ></span>
    <span
      class="absolute start-0.5 top-0.5 size-5 rounded-full bg-white
        transition-transform duration-150
        peer-checked:translate-x-[22px]
        dark:bg-gray-900
        motion-reduce:transition-none"
      aria-hidden="true"
    ></span>
  </label>
</div>

<!-- Toggle with Label (OFF) -->
<div class="flex items-center justify-between">
  <div>
    <p class="text-sm font-medium text-gray-900 dark:text-gray-100">
      Weekly digest
    </p>
    <p class="text-xs text-gray-500 dark:text-gray-400">
      A summary of the week's activity
    </p>
  </div>
  <label class="relative inline-flex shrink-0 cursor-pointer items-center">
    <input type="checkbox" class="peer sr-only" />
    <span
      class="block h-6 w-11 rounded-full bg-gray-200
        transition-colors duration-150
        peer-checked:bg-indigo-600
        peer-focus-visible:outline-2 peer-focus-visible:outline-offset-2 peer-focus-visible:outline-indigo-600
        dark:bg-gray-700 dark:peer-checked:bg-indigo-500
        motion-reduce:transition-none"
      aria-hidden="true"
    ></span>
    <span
      class="absolute start-0.5 top-0.5 size-5 rounded-full bg-white shadow-sm
        transition-transform duration-150
        peer-checked:translate-x-[22px]
        dark:bg-gray-300 dark:peer-checked:bg-gray-900
        motion-reduce:transition-none"
      aria-hidden="true"
    ></span>
  </label>
</div>
```

**设计要点：**
- `flex items-center justify-between`——标签文字在左，Toggle 在右，设置页标准布局
- `shrink-0`——防止 Toggle 被长文字压缩
- 双行文字结构：`font-medium` 主标题 + `text-xs text-gray-500` 辅助说明

### 垂直排列替代方案

当标签文字较长或空间紧凑时，也可使用垂直排列：

```html
<div class="flex flex-col gap-3">
  <div>
    <p class="text-sm font-medium text-gray-900 dark:text-gray-100">Email notifications</p>
    <p class="text-xs text-gray-500 dark:text-gray-400">Receive weekly digests and updates</p>
  </div>
  <label class="relative inline-flex cursor-pointer items-center">
    <input type="checkbox" class="peer sr-only" checked />
    <!-- Toggle track + thumb as above -->
  </label>
</div>
```

---

### 3. With Icon — 带状态图标

在滑块内或旁边显示图标，增强开/关状态的视觉传达。

```html
<!-- Toggle with Icon — sun/moon 模式 -->
<label class="relative inline-flex cursor-pointer items-center">
  <input type="checkbox" class="peer sr-only" />
  <!-- Sun icon (left, visible when OFF) -->
  <svg
    class="pointer-events-none absolute left-[3px] z-10 size-3.5 text-gray-400 transition-opacity duration-150 peer-checked:opacity-0"
    fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
    aria-hidden="true"
  >
    <path stroke-linecap="round" stroke-linejoin="round"
      d="M12 3v2.25m6.364.386l-1.591 1.591M21 12h-2.25m-.386 6.364l-1.591-1.591M12 18.75V21m-4.773-4.227l-1.591 1.591M5.25 12H3m4.227-4.773L5.636 5.636M15.75 12a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0z" />
  </svg>
  <!-- Moon icon (right, visible when ON) -->
  <svg
    class="pointer-events-none absolute right-[3px] z-10 size-3.5 text-white opacity-0 transition-opacity duration-150 peer-checked:opacity-100"
    fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
    aria-hidden="true"
  >
    <path stroke-linecap="round" stroke-linejoin="round"
      d="M21.752 15.002A9.718 9.718 0 0118 15.75c-5.385 0-9.75-4.365-9.75-9.75 0-1.33.266-2.597.748-3.752A9.753 9.753 0 003 11.25C3 16.635 7.365 21 12.75 21a9.753 9.753 0 009.002-5.998z" />
  </svg>
  <span
    class="block h-6 w-11 rounded-full bg-gray-200
      transition-colors duration-150
      peer-checked:bg-indigo-600
      peer-focus-visible:outline-2 peer-focus-visible:outline-offset-2 peer-focus-visible:outline-indigo-600
      dark:bg-gray-700 dark:peer-checked:bg-indigo-500
      motion-reduce:transition-none"
    aria-hidden="true"
  ></span>
  <span
    class="absolute start-0.5 top-0.5 size-5 rounded-full bg-white shadow-sm
      transition-transform duration-150
      peer-checked:translate-x-[22px]
      dark:bg-gray-300 dark:peer-checked:bg-gray-900
      motion-reduce:transition-none"
    aria-hidden="true"
  ></span>
</label>
```

**设计要点：**
- 图标 `size-3.5` (14px) 略小于滑块 `size-5` (20px)，在滑块内部居中
- `peer-checked:opacity-0` / `peer-checked:opacity-100`——状态切换时图标交叉淡入淡出
- `pointer-events-none`——图标不拦截点击，点击穿透到 checkbox
- 这是"带图标的 Toggle"，仅用于暗色模式切换等语义明确的场景，不要滥用

---

### 4. Color Variants — 彩色变体

Toggle 激活色默认使用品牌 Indigo。在特定语义场景下可使用语义色——但需谨慎。

```html
<!-- Danger Toggle — 用于破坏性操作的开关 (如 "Enable auto-delete") -->
<label class="relative inline-flex cursor-pointer items-center">
  <input type="checkbox" class="peer sr-only" checked />
  <span
    class="block h-6 w-11 rounded-full bg-red-600
      transition-colors duration-150
      peer-focus-visible:outline-2 peer-focus-visible:outline-offset-2 peer-focus-visible:outline-red-600
      dark:bg-red-500
      motion-reduce:transition-none"
    aria-hidden="true"
  ></span>
  <span
    class="absolute start-0.5 top-0.5 size-5 rounded-full bg-white
      transition-transform duration-150
      peer-checked:translate-x-[22px]
      dark:bg-gray-900
      motion-reduce:transition-none"
    aria-hidden="true"
  ></span>
</label>

<!-- Success Toggle — 用于启用保护性功能 (如 "Enable 2FA") -->
<label class="relative inline-flex cursor-pointer items-center">
  <input type="checkbox" class="peer sr-only" checked />
  <span
    class="block h-6 w-11 rounded-full bg-green-600
      transition-colors duration-150
      peer-focus-visible:outline-2 peer-focus-visible:outline-offset-2 peer-focus-visible:outline-green-600
      dark:bg-green-500
      motion-reduce:transition-none"
    aria-hidden="true"
  ></span>
  <span
    class="absolute start-0.5 top-0.5 size-5 rounded-full bg-white
      transition-transform duration-150
      peer-checked:translate-x-[22px]
      dark:bg-gray-900
      motion-reduce:transition-none"
    aria-hidden="true"
  ></span>
</label>
```

**设计要点：**
- **97% 的场景使用品牌 Indigo**——Color Variant 是例外，不是规则
- Danger Toggle：仅用于开关一个危险的自动化行为（如 "自动删除已读消息"）——ON = 危险行为已启用
- Success Toggle：仅用于开关一个安全性增强功能（如 "启用双因素认证"）——ON = 更安全
- 不使用 Warning (amber) 和 Info (blue) 变体——它们不适合传达开/关语义

---

### 5. Disabled — 禁用态

Toggle 的不可交互状态。ON 和 OFF 各有禁用样式。

```html
<!-- Disabled (ON) -->
<label class="relative inline-flex cursor-not-allowed items-center opacity-50">
  <input type="checkbox" class="peer sr-only" checked disabled />
  <span
    class="block h-6 w-11 rounded-full bg-indigo-600
      dark:bg-indigo-500
      motion-reduce:transition-none"
    aria-hidden="true"
  ></span>
  <span
    class="absolute start-0.5 top-0.5 size-5 rounded-full bg-white
      translate-x-[22px]
      dark:bg-gray-900"
    aria-hidden="true"
  ></span>
</label>

<!-- Disabled (OFF) -->
<label class="relative inline-flex cursor-not-allowed items-center opacity-50">
  <input type="checkbox" class="peer sr-only" disabled />
  <span
    class="block h-6 w-11 rounded-full bg-gray-200
      dark:bg-gray-700"
    aria-hidden="true"
  ></span>
  <span
    class="absolute start-0.5 top-0.5 size-5 rounded-full bg-white shadow-sm
      dark:bg-gray-300"
    aria-hidden="true"
  ></span>
</label>
```

**设计要点：**
- `opacity-50`——与 Button / Input / Select 禁用态保持一致
- `cursor-not-allowed`——hover 时明确传达不可交互
- 移除所有过渡——禁用态不需要动画
- `disabled` 属性——阻止键盘聚焦和点击

---

## 尺寸

三种尺寸覆盖不同密度需求：

| Size | 轨道 (w×h) | 滑块尺寸 | 滑块位移 | 使用场景 |
|------|-----------|---------|---------|---------|
| **sm** | `w-8 h-5` (32×20px) | `size-4` (16px) | `translate-x-3` (12px) | 表格行内、紧凑列表 |
| **md** (默认) | `w-11 h-6` (44×24px) | `size-5` (20px) | `translate-x-[22px]` | 设置页、标准表单 |
| **lg** | `w-14 h-7` (56×28px) | `size-6` (24px) | `translate-x-7` (28px) | 突出设置、Hero CTA |

```html
<!-- sm -->
<label class="relative inline-flex cursor-pointer items-center">
  <input type="checkbox" class="peer sr-only" checked />
  <span class="block h-5 w-8 rounded-full bg-indigo-600 transition-colors duration-150 peer-focus-visible:outline-2 peer-focus-visible:outline-offset-2 peer-focus-visible:outline-indigo-600 dark:bg-indigo-500 motion-reduce:transition-none" aria-hidden="true"></span>
  <span class="absolute start-0.5 top-0.5 size-4 rounded-full bg-white transition-transform duration-150 peer-checked:translate-x-3 dark:bg-gray-900 motion-reduce:transition-none" aria-hidden="true"></span>
</label>

<!-- md (default) -->
<label class="relative inline-flex cursor-pointer items-center">
  <input type="checkbox" class="peer sr-only" checked />
  <span class="block h-6 w-11 rounded-full bg-indigo-600 ..." aria-hidden="true"></span>
  <span class="absolute start-0.5 top-0.5 size-5 rounded-full bg-white transition-transform duration-150 peer-checked:translate-x-[22px] ..." aria-hidden="true"></span>
</label>

<!-- lg -->
<label class="relative inline-flex cursor-pointer items-center">
  <input type="checkbox" class="peer sr-only" checked />
  <span class="block h-7 w-14 rounded-full bg-indigo-600 transition-colors duration-150 peer-focus-visible:outline-2 peer-focus-visible:outline-offset-2 peer-focus-visible:outline-indigo-600 dark:bg-indigo-500 motion-reduce:transition-none" aria-hidden="true"></span>
  <span class="absolute start-1 top-1 size-5 rounded-full bg-white transition-transform duration-150 peer-checked:translate-x-7 dark:bg-gray-900 motion-reduce:transition-none" aria-hidden="true"></span>
</label>
```

---

## 状态总览

| 状态 | 轨道 (ON) | 轨道 (OFF) | 滑块 | 光标 |
|------|----------|-----------|------|------|
| Default ON | `bg-indigo-600` | — | `start-0.5` + `translate-x-[22px]` | `cursor-pointer` |
| Default OFF | — | `bg-gray-200` | `start-0.5` | `cursor-pointer` |
| Focus | `outline-2 outline-offset-2 outline-indigo-600` | 同左 | — | `cursor-pointer` |
| Disabled ON | `opacity-50` | — | 保持位置 | `cursor-not-allowed` |
| Disabled OFF | — | `opacity-50` | 保持位置 | `cursor-not-allowed` |
| Dark ON | `dark:bg-indigo-500` | — | `dark:bg-gray-900` | — |
| Dark OFF | — | `dark:bg-gray-700` | `dark:bg-gray-300` | — |

---

## Design Tokens

| Token | Tailwind | 值 | 说明 |
|-------|----------|-----|------|
| 轨道宽度 md | `w-11` | 44px | 标准尺寸 |
| 轨道高度 md | `h-6` | 24px | 标准尺寸 |
| 滑块尺寸 md | `size-5` | 20px | 标准尺寸 |
| 滑块位移 md | `translate-x-[22px]` | 22px | 标准尺寸 |
| 轨道圆角 | `rounded-full` | 9999px | 胶囊形 |
| 滑块圆角 | `rounded-full` | 9999px | 圆形 |
| 激活色 | `bg-indigo-600` | — | 品牌色 |
| 激活色 Dark | `dark:bg-indigo-500` | — | 降饱和度 |
| 非激活色 | `bg-gray-200` | — | 中性灰 |
| 非激活色 Dark | `dark:bg-gray-700` | — | 暗色反转 |
| 滑块色 | `bg-white` | — | 白色滑块 |
| 滑块色 Dark (ON) | `dark:bg-gray-900` | — | 暗色滑块 |
| 滑块色 Dark (OFF) | `dark:bg-gray-300` | — | 亮滑块在暗轨道上 |
| Focus ring | `outline-2 outline-offset-2` | 2px + 2px | 品牌色 |
| 禁用透明度 | `opacity-50` | 50% | 与全局禁用态一致 |
| 标签字号 | `text-sm font-medium` | 14px 500 | 主标签 |
| 描述字号 | `text-xs` | 12px | 辅助说明 |
| 过渡 (颜色) | `transition-colors duration-150` | 150ms | 轨道颜色 |
| 过渡 (位移) | `transition-transform duration-150` | 150ms | 滑块移动 |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| 键盘操作 | 原生 checkbox 支持 Space 切换 |
| 可见焦点 | `peer-focus-visible:outline-2 outline-offset-2` |
| 屏幕阅读器 | checkbox 保持可访问（`sr-only` 仅视觉隐藏） |
| 角色 | `<input type="checkbox">` 原生 role="checkbox" |
| 状态 | 原生 `checked` / `disabled` 属性——屏幕阅读器自动解析 |
| 禁用态 | `disabled` 属性 + `cursor-not-allowed` |
| 标签关联 | `<label>` 包裹整个 Toggle——点击任意区域均可切换 |
| 减少动画 | `motion-reduce:transition-none` |

---

## 复用指南

### 何时使用

| 场景 | 变体 | 说明 |
|------|------|------|
| 设置页开关列表 | With Label | 水平排列，标签在左 |
| 即时生效的布尔切换 | Base | 无标签，独立使用 |
| 暗色模式切换 | With Icon | Sun/Moon 图标 |
| 危险行为开关 | Color (Red) | 强调风险 |
| 安全功能开关 | Color (Green) | 强调保护 |
| 权限控制（不可修改） | Disabled | 只读展示 |

### 何时不用

| 场景 | 替代方案 |
|------|---------|
| 多选列表 | [Checkbox](./checkbox.md) |
| 单选 | Radio Group |
| 需要确认后生效 | [Button](./button.md) Toggle 模式（或受控 Toggle + 保存按钮） |
| 三态切换 (ON/OFF/Partial) | Checkbox indeterminate |
| 移动端设置（可选替代外观） | 原生 `<select>` 或 Segmented Control |

### 组合规则

```
✅ Toggle 即时生效       → 无保存按钮，切换即保存
✅ Toggle 批量设置       → With Label 垂直排列 + 分组标题
✅ Toggle 需要确认       → 配合保存按钮，非即时生效
❌ Toggle + Label 并排   → 不在同一行内同时放置两个 Toggle
❌ 混用多种尺寸          → 同一页面内统一使用一种尺寸
```

---

## 与 Checkbox 的区别

| 特性 | Toggle | Checkbox |
|------|--------|----------|
| 语义 | 即时生效的开关（类比电器开关） | 需要提交的选择（类比表单勾选） |
| 交互预期 | 切换后立即生效 | 选中后等待提交 |
| 视觉 | 轨道+滑块，强调状态 | 方框+勾选，强调选择 |
| 适用场景 | 设置页、功能开关 | 多选列表、协议同意 |

---

> 参考: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Checkbox](./checkbox.md) · [Semantic Color Unification](../principles/semantic-color-unification.md)
