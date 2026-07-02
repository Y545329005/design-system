# Textarea

Textarea 是多行文本输入组件，用于长文本输入场景（描述、评论、消息等）。完全复用 [Input](./input.md) 的 `inset-ring` 描边体系与状态样式，确保所有表单元素视觉统一。

> **Design Tokens**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Elevation](../design-tokens/elevation.md)
>
> **相关组件**: [Input](./input.md)（共享 border / focus / error / disabled 状态）· [Button](./button.md)（提交按钮）
>
> **依赖**: 无额外插件依赖（使用 `inset-ring` 替代 `@tailwindcss/forms` 的 border 方案）

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 描边 | `inset-ring` 透明度方案 | 与 Input 完全一致——Level 1 (Raised)，focus 升至 Level 2 |
| 圆角 | `rounded-lg` (8px) | 统一交互元素圆角 |
| Focus | inset-ring 加深 + 外部 ring | 双层焦点反馈，与 Input 保持一致 |
| 暗色模式 | 透明度自动反转 | `white/10` / `white/20` |
| 行高 | `text-sm/6` (14px/24px) | 多行文本需要舒适的行高 |

---

## 变体

### 1. Base Textarea（基础文本域）

最常用的多行输入。与 Input 共享完整的 `inset-ring` 描边 + focus ring 样式。

```html
<!-- Base Textarea -->
<div class="flex flex-col gap-1.5">
  <label for="bio" class="text-sm font-medium text-gray-900 dark:text-gray-100">
    Bio
  </label>
  <textarea
    id="bio"
    rows="4"
    placeholder="Tell us about yourself..."
    class="w-full rounded-lg bg-white px-3 py-2 text-sm/6 text-gray-900
      inset-ring inset-ring-gray-950/8
      placeholder:text-gray-400
      transition-colors duration-150
      focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none
      disabled:cursor-not-allowed disabled:opacity-50 disabled:bg-gray-50
      dark:bg-gray-900 dark:text-gray-100
      dark:inset-ring-white/10
      dark:placeholder:text-gray-500
      dark:focus:inset-ring-white/20 dark:focus:ring-white/10
      dark:disabled:bg-gray-800
      motion-reduce:transition-none"
  ></textarea>
</div>
```

---

### 2. With Character Count（带字数统计）

在文本域下方显示当前字符数 / 上限。超出上限时计数器变红。

```html
<!-- With Character Count — 正常状态 -->
<div class="flex flex-col gap-1.5">
  <div class="flex items-center justify-between">
    <label for="message" class="text-sm font-medium text-gray-900 dark:text-gray-100">
      Message
    </label>
    <span id="message-count" class="text-xs text-gray-400 dark:text-gray-500">
      0 / 280
    </span>
  </div>
  <textarea
    id="message"
    rows="3"
    maxlength="280"
    placeholder="Type your message..."
    class="w-full rounded-lg bg-white px-3 py-2 text-sm/6 text-gray-900
      inset-ring inset-ring-gray-950/8
      placeholder:text-gray-400
      transition-colors duration-150
      focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none
      dark:bg-gray-900 dark:text-gray-100
      dark:inset-ring-white/10
      dark:placeholder:text-gray-500
      dark:focus:inset-ring-white/20 dark:focus:ring-white/10
      motion-reduce:transition-none"
    aria-describedby="message-count"
    oninput="document.getElementById('message-count').textContent = this.value.length + ' / 280'"
  ></textarea>
</div>

<!-- Character Count — 接近上限 (≥ 90%) -->
<div class="flex flex-col gap-1.5">
  <div class="flex items-center justify-between">
    <label for="message-warn" class="text-sm font-medium text-gray-900 dark:text-gray-100">
      Message
    </label>
    <span id="message-warn-count" class="text-xs font-medium text-amber-600 dark:text-amber-400">
      265 / 280
    </span>
  </div>
  <textarea
    id="message-warn"
    rows="3"
    maxlength="280"
    class="w-full rounded-lg bg-white px-3 py-2 text-sm/6 text-gray-900
      inset-ring inset-ring-amber-400
      placeholder:text-gray-400
      transition-colors duration-150
      focus:inset-ring-amber-500 focus:ring-2 focus:ring-amber-500/10 focus:outline-none
      dark:bg-gray-900 dark:text-gray-100
      dark:inset-ring-amber-400/50
      dark:focus:inset-ring-amber-400 dark:focus:ring-amber-400/20
      motion-reduce:transition-none"
    aria-describedby="message-warn-count"
  ></textarea>
</div>
```

**设计要点：**
- 字数统计使用 `aria-describedby` 关联，屏幕阅读器可访问
- `< 90%` 上限 → `text-gray-400`（正常）
- `≥ 90%` 上限 → `text-amber-600` + `inset-ring-amber-400`（警告，复用语义色体系）
- `oninput` 事件实时更新计数器

---

### 3. Auto-resize（自适应高度）

纯 CSS 方案（无需 JS 库），文本域高度随内容自动增长。使用 CSS Grid 将 textarea 和镜像 span 叠在同一层。

```html
<!-- Auto-resize Textarea -->
<div class="flex flex-col gap-1.5">
  <label for="auto-resize" class="text-sm font-medium text-gray-900 dark:text-gray-100">
    Comment
  </label>
  <div class="grid">
    <!-- 镜像元素（不可见，撑开高度） -->
    <span
      class="invisible col-start-1 row-start-1 whitespace-pre-wrap px-3 py-2 text-sm/6"
      aria-hidden="true"
    ></span>
    <!-- 实际 textarea -->
    <textarea
      id="auto-resize"
      rows="1"
      placeholder="Write a comment..."
      class="col-start-1 row-start-1 w-full resize-none overflow-hidden rounded-lg
        bg-white px-3 py-2 text-sm/6 text-gray-900
        inset-ring inset-ring-gray-950/8
        placeholder:text-gray-400
        transition-colors duration-150
        focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none
        dark:bg-gray-900 dark:text-gray-100
        dark:inset-ring-white/10
        dark:placeholder:text-gray-500
        dark:focus:inset-ring-white/20 dark:focus:ring-white/10
        motion-reduce:transition-none"
      oninput="this.parentNode.querySelector('span').textContent = this.value + ' '"
    ></textarea>
  </div>
</div>
```

> **原理**: `display: grid` 将 textarea 和镜像 span 叠在同一层（`col-start-1 row-start-1`）。span 设为 `invisible`（占位但不可见），内容通过 `oninput` 同步。textarea 的 `resize-none overflow-hidden` 防止手动拉伸，由 span 自动撑高。行尾加空格 `' '` 防止单行截断。

---

### 4. Error State（错误状态）

复用 [Input](./input.md) 的错误模式：红色 `inset-ring` + `aria-invalid` + 错误消息。

```html
<!-- Error State -->
<div class="flex flex-col gap-1.5">
  <label for="description-error" class="text-sm font-medium text-gray-900 dark:text-gray-100">
    Description
  </label>
  <textarea
    id="description-error"
    rows="3"
    placeholder="Enter a description..."
    class="w-full rounded-lg bg-white px-3 py-2 text-sm/6 text-gray-900
      inset-ring inset-ring-red-500
      placeholder:text-gray-400
      transition-colors duration-150
      focus:inset-ring-red-600 focus:ring-2 focus:ring-red-500/10 focus:outline-none
      dark:bg-gray-900 dark:text-gray-100
      dark:inset-ring-red-400/50
      dark:focus:inset-ring-red-400 dark:focus:ring-red-400/20
      motion-reduce:transition-none"
    aria-invalid="true"
    aria-describedby="description-error-message"
  ></textarea>
  <p id="description-error-message" class="text-xs text-red-600 dark:text-red-400" role="alert">
    Description must be at least 10 characters.
  </p>
</div>
```

---

### 5. Disabled State（禁用态）

```html
<!-- Disabled State -->
<div class="flex flex-col gap-1.5">
  <label for="disabled-area" class="text-sm font-medium text-gray-400 dark:text-gray-500">
    Archived notes
  </label>
  <textarea
    id="disabled-area"
    rows="3"
    disabled
    class="w-full rounded-lg bg-gray-50 px-3 py-2 text-sm/6 text-gray-500
      inset-ring inset-ring-gray-950/5
      disabled:cursor-not-allowed disabled:opacity-50
      dark:bg-gray-800 dark:text-gray-500
      dark:inset-ring-white/5
      motion-reduce:transition-none"
  >This content is archived and cannot be edited.</textarea>
</div>
```

---

## 状态总览

| 状态 | 描边 (Light) | 描边 (Dark) | 其他 |
|------|-------------|------------|------|
| Default | `inset-ring-gray-950/8` | `inset-ring-white/10` | `bg-white` / `dark:bg-gray-900` |
| Focus | `inset-ring-gray-950/20` + `ring-2 ring-gray-950/10` | `inset-ring-white/20` + `ring-2 ring-white/10` | 描边加深 + 外部微光环 |
| Error | `inset-ring-red-500` | `inset-ring-red-400/50` | `aria-invalid="true"` + 错误消息 |
| Error Focus | `inset-ring-red-600` + `ring-red-500/10` | `inset-ring-red-400` + `ring-red-400/20` | — |
| Warning (≥90%) | `inset-ring-amber-400` | `inset-ring-amber-400/50` | 字数接近上限 |
| Filled | 无额外样式 | 无额外样式 | 有内容时的视觉反馈可选 |
| Disabled | `inset-ring-gray-950/5` | `inset-ring-white/5` | `opacity-50` + `bg-gray-50` + `cursor-not-allowed` |

> Textarea 的状态样式与 [Input](./input.md) 完全一致，确保表单内 `<input>` 和 `<textarea>` 混合使用无视觉差异。

### 层次模型

```
Level 0- (Disabled) → bg-gray-50 + inset-ring 5% + opacity-50  不可交互
Level 1  (Default)  → bg-white   + inset-ring 8%                标准文本域
Level 2  (Focus)    → bg-white   + inset-ring 20% + ring 2px    聚焦交互
Level E  (Error)    → bg-white   + inset-ring-red-500           语义覆盖
Level W  (Warning)  → bg-white   + inset-ring-amber-400         字数告警
```

---

## Design Tokens

| Token | Light | Dark | Tailwind | 说明 |
|-------|-------|------|----------|------|
| 圆角 | 8px | 8px | `rounded-lg` | 与 Input 一致 |
| Padding | 8px 12px | 8px 12px | `px-3 py-2` | 标准内边距 |
| 字号 | 14px / 24px | 14px / 24px | `text-sm/6` | 与 Input 一致 |
| 最小行数 | 3-4 | 3-4 | `rows="3"` / `rows="4"` | 默认可见行数 |
| Label 字号 | 14px | 14px | `text-sm font-medium` | 标签样式 |
| Label gap | 6px | 6px | `gap-1.5` | Label 与 Textarea 间距 |
| Counter 字号 | 12px | 12px | `text-xs` | 字数统计 |
| Counter 颜色 | `gray-400` | `gray-500` | — | 默认计数器颜色 |
| Counter 警告色 | `amber-600` | `amber-400` | — | 接近上限 (≥ 90%) |
| 背景 | `white` | `gray-900` | — | 可编辑区域 |
| 描边 默认 | `gray-950/8` | `white/10` | `inset-ring` + 透明度 | Level 1 |
| 描边 Focus | `gray-950/20` | `white/20` | `focus:inset-ring` + 透明度 | Level 2 |
| Focus 光环 | `gray-950/10` | `white/10` | `focus:ring-2` | 外部 2px 微光 |
| Error 描边 | `red-500` | `red-400/50` | `inset-ring-red-500` | 错误边框 |
| Warning 描边 | `amber-400` | `amber-400/50` | `inset-ring-amber-400` | 字数告警 |
| Error 文字 | `red-600` | `red-400` | `text-red-600` | 错误消息 |
| Disabled 描边 | `gray-950/5` | `white/5` | `inset-ring` 5% | 最轻描边 |
| Disabled 背景 | `gray-50` | `gray-800` | `disabled:bg-gray-50` | 禁用底色 |
| Disabled 透明度 | 50% | 50% | `disabled:opacity-50` | 整体降低 |
| 过渡 | 150ms | 150ms | `transition-colors duration-150` | 仅颜色过渡 |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| Label 关联 | `<label for="id">` + `<textarea id="id">` 必须配对 |
| 错误状态 | `aria-invalid="true"` + `aria-describedby` |
| 错误消息 | `role="alert"` 确保屏幕阅读器播报 |
| 字数统计 | `aria-describedby` 关联计数器元素 |
| 禁用态 | `disabled` 属性 + `disabled:cursor-not-allowed` |
| Auto-resize | 镜像 span 使用 `aria-hidden="true"` 对辅助技术隐藏 |
| Placeholder | 不作为 label 替代品 —— 必须配对 `<label>` |
| Focus 可见 | `focus:ring-2` + `focus:inset-ring` 加深 —— 双重焦点指示 |
| 减少动画 | `motion-reduce:transition-none` |

---

## 复用指南

**何时使用 Textarea:**
- 多行文本输入（> 50 字符预期）→ Base Textarea
- 有限长度的用户输入 → With Character Count
- 内容长度不确定（评论、反馈）→ Auto-resize
- 表单验证失败 → Error State

**何时不用 Textarea:**
- 短文本（单行）→ 使用 [Input](./input.md)
- 富文本编辑 → 使用 Rich Text Editor（后续补充）
- 代码输入 → 使用 Code Editor / Monaco（后续补充）
- 固定选项输入 → 使用 [Select](./select.md)

**组合规则:**
- Textarea 与 Input 在同一表单中混用时，样式 100% 一致
- Error State 的 `inset-ring-red-500` + `focus:inset-ring-red-600` + `focus:ring-red-500/10` 模式与 Input/Select 一致
- Warning State 使用 amber 系列（语义色体系），与 Badge/Toast 的 Warning 色彩一致
- 提交按钮复用 [Button](./button.md) Solid Primary
- 字数统计颜色切换：`< 90%` → `text-gray-400`，`≥ 90%` → `text-amber-600` + `inset-ring-amber-400`

---

## 与旧版的主要变更

| 变更 | 旧值 | 新值 | 依据 |
|------|------|------|------|
| 描边方式 | `border-gray-300` + forms 插件 | `inset-ring-gray-950/8` | Elevation 体系；与 Input 同步 |
| 描边颜色 | 固定色 `gray-300` | 透明度 `gray-950/8` | Colors 透明度优先原则 |
| Focus 描边 | `border-gray-900` | `inset-ring-gray-950/20` | Elevation Level 1 → Level 2 |
| Focus 光环 | `ring-2 ring-gray-900/10` | `ring-2 ring-gray-950/10` | 统一透明度单位 |
| 暗色描边 | `dark:border-gray-600` | `dark:inset-ring-white/10` | 透明度自动反转 |
| 暗色 Focus | `dark:focus:border-gray-400` | `dark:focus:inset-ring-white/20` | 透明度自动反转 |
| 暗色 Focus 光环 | `dark:focus:ring-gray-400/20` | `dark:focus:ring-white/10` | 统一透明度方案 |
| Error 描边 | `border-red-500` | `inset-ring-red-500` | 统一描边方式 |
| Error Focus | `focus:ring-red-500/10` | `focus:inset-ring-red-600` + `focus:ring-red-500/10` | 双层焦点反馈 |
| Warning 描边 | `border-amber-400` | `inset-ring-amber-400` | 统一描边方式 |
| 动效尊重 | 无 | `motion-reduce:transition-none` | 可访问性 |
| 颜色过渡 | 无 | `transition-colors duration-150` | 全局统一定义 |
| 插件依赖 | 依赖 `@tailwindcss/forms` | 无额外依赖 | inset-ring 原生支持 |

---

> 参考: [Input](./input.md) · [Elevation](../design-tokens/elevation.md) · [Colors](../design-tokens/colors.md) · [HyperUI Textareas](https://hyperui.dev/components/application/textareas) · [MDN `<textarea>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea)
