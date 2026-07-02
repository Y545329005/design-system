# Modal

Modal 是弹窗组件，用于在不离开当前页面的前提下完成聚焦任务——确认操作、填写表单、展示详情。内部按钮引用 [Button](./button.md)，表单控件引用 [Input](./input.md)。

> **Design Tokens**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Elevation](../design-tokens/elevation.md)
>
> **关联组件**: [Button](./button.md)（Cancel/Confirm）· [Input](./input.md)（Form Modal）· [Card](./card.md)（容器层次参考）
>
> **依赖**: 无额外依赖——使用 JavaScript 控制显示/隐藏

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 层次 | Level 3 — `inset-ring 30%` + 背景遮罩 | 最高层级——Modal 在所有内容之上 |
| 遮罩 | `bg-gray-950/50` + `backdrop-blur-sm` | 半透明黑色 + 轻微模糊——聚焦 Modal 内容 |
| Border | 无独立 border——仅 `inset-ring` + 遮罩衬托 | 白色 Modal 浮于暗遮罩上——自然层次感 |
| 圆角 | `rounded-xl` (12px) | 与 Card 容器一致 |
| 阴影 | 无 `box-shadow` | 遮罩 + `inset-ring` 已提供充足深度 |
| 宽度 | `max-w-md` ~ `max-w-2xl` 四档 | 根据内容密度自适应 |
| 位置 | 居中 `flex items-center justify-center` | 视觉焦点在屏幕中心 |
| 动画 | 遮罩淡入 + Modal 缩放淡入 200ms | 原则五——≤200ms，仅反馈不表演 |
| 关闭 | 遮罩点击 / Escape 键 / 关闭按钮 | 多重关闭路径——不困住用户 |
| 按钮 | 引用 [Button](./button.md) | Cancel = Ghost，Confirm = Primary |

---

## Elevation 模型

```
Page (gray-50)
 └── Overlay (gray-950/50 + backdrop-blur-sm)     ← 暗遮罩降低页面层次
      └── Modal (white + inset-ring 30%)           ← 最高层级，浮于遮罩之上
```

Modal 是系统中层次最高的元素。使用 30% inset-ring（而非 Card 的 8%）——ring 更重，传达"这是最重要的当前元素"。

---

## 变体

### 1. Base Modal — 基础弹窗

最常用的弹窗。Header + Body + Footer 三段式结构。

```html
<!-- Modal Overlay -->
<div
  class="fixed inset-0 z-40 flex items-center justify-center bg-gray-950/50 backdrop-blur-sm p-4"
  role="dialog"
  aria-modal="true"
  aria-labelledby="modal-title"
>
  <!-- Modal Panel -->
  <div
    class="w-full max-w-md rounded-xl bg-white
      inset-ring inset-ring-gray-950/30
      dark:bg-gray-900 dark:inset-ring-white/30"
  >
    <!-- Header -->
    <div class="flex items-center justify-between border-b border-gray-950/5 px-6 py-4 dark:border-white/5">
      <h2 id="modal-title" class="text-base font-semibold text-gray-900 dark:text-gray-100">
        Modal Title
      </h2>
      <!-- Close Button -->
      <button type="button"
        class="rounded-lg p-1.5 text-gray-400 transition-colors duration-150 hover:bg-gray-100 hover:text-gray-600 dark:text-gray-500 dark:hover:bg-gray-800 dark:hover:text-gray-300 motion-reduce:transition-none"
        aria-label="Close dialog"
      >
        <svg class="size-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
          <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
        </svg>
      </button>
    </div>

    <!-- Body -->
    <div class="px-6 py-4">
      <p class="text-sm text-gray-600 dark:text-gray-400">
        Modal body content goes here. This is where you describe the action or show information.
      </p>
    </div>

    <!-- Footer -->
    <div class="flex items-center justify-end gap-3 border-t border-gray-950/5 px-6 py-4 dark:border-white/5">
      <button type="button"
        class="rounded-lg px-4 py-2 text-sm font-medium text-gray-700 transition-colors duration-150 hover:bg-gray-100 hover:text-gray-900 dark:text-gray-400 dark:hover:bg-gray-800 dark:hover:text-gray-100 motion-reduce:transition-none"
      >
        Cancel
      </button>
      <button type="button"
        class="inline-flex items-center justify-center rounded-lg bg-indigo-600 px-4 py-2 text-sm font-semibold text-white transition-colors duration-150 hover:bg-indigo-700 active:scale-[0.97] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 disabled:cursor-not-allowed disabled:opacity-50 dark:bg-indigo-500 dark:hover:bg-indigo-400 dark:focus-visible:outline-indigo-400 motion-reduce:transition-none"
      >
        Confirm
      </button>
    </div>
  </div>
</div>
```

**设计要点：**
- Overlay: `z-40`——高于 Sidebar (z-30) 和 Navbar (z-30)，低于 Toast (z-50)
- `aria-modal="true"` + `role="dialog"`——完整的屏幕阅读器支持
- `aria-labelledby="modal-title"`——将标题关联到 dialog
- Header/Body/Footer 三段式——与 Card with Section 模式一致
- 分隔线使用 `border-gray-950/5`——最轻的透明度分隔
- Footer 按钮：Cancel (Ghost) + Confirm (Primary)——引用 Button 组件

---

### 2. Confirm Modal — 确认弹窗

专门用于需要用户确认的破坏性操作。简化为 Body + Footer，无 Header 标题栏。

```html
<!-- Confirm Modal Overlay -->
<div
  class="fixed inset-0 z-40 flex items-center justify-center bg-gray-950/50 backdrop-blur-sm p-4"
  role="alertdialog"
  aria-modal="true"
  aria-labelledby="confirm-title"
  aria-describedby="confirm-desc"
>
  <!-- Confirm Modal Panel -->
  <div
    class="w-full max-w-sm rounded-xl bg-white
      inset-ring inset-ring-gray-950/30
      dark:bg-gray-900 dark:inset-ring-white/30"
  >
    <div class="p-6">
      <!-- Icon -->
      <div class="mx-auto flex size-12 items-center justify-center rounded-full bg-red-100 dark:bg-red-900/30">
        <svg class="size-6 text-red-600 dark:text-red-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
          <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126zM12 15.75h.007v.008H12v-.008z" />
        </svg>
      </div>

      <!-- Content -->
      <div class="mt-4 text-center">
        <h2 id="confirm-title" class="text-base font-semibold text-gray-900 dark:text-gray-100">
          Delete project
        </h2>
        <p id="confirm-desc" class="mt-2 text-sm text-gray-600 dark:text-gray-400">
          Are you sure you want to delete this project? All data will be permanently removed. This action cannot be undone.
        </p>
      </div>
    </div>

    <!-- Footer -->
    <div class="flex items-center justify-end gap-3 border-t border-gray-950/5 px-6 py-4 dark:border-white/5">
      <button type="button"
        class="rounded-lg px-4 py-2 text-sm font-medium text-gray-700 transition-colors duration-150 hover:bg-gray-100 hover:text-gray-900 dark:text-gray-400 dark:hover:bg-gray-800 dark:hover:text-gray-100 motion-reduce:transition-none"
      >
        Cancel
      </button>
      <button type="button"
        class="inline-flex items-center justify-center rounded-lg bg-red-600 px-4 py-2 text-sm font-semibold text-white transition-colors duration-150 hover:bg-red-700 active:scale-[0.97] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-red-600 disabled:cursor-not-allowed disabled:opacity-50 dark:bg-red-500 dark:hover:bg-red-400 dark:focus-visible:outline-red-400 motion-reduce:transition-none"
      >
        Delete
      </button>
    </div>
  </div>
</div>
```

**设计要点：**
- `role="alertdialog"`——Confirm 是紧急/破坏性操作的专用角色
- `aria-describedby="confirm-desc"`——描述文本关联到 dialog
- 图标 `rounded-full` 红色圆形——破坏性操作的情感暗示
- 确认按钮使用 [Button](./button.md) Danger 变体——完整的红色实心按钮
- 无关闭 × 按钮——Confirm 需要明确的 Cancel/Confirm 选择，而非简单关闭
- 宽度 `max-w-sm`——比 Base Modal 窄，聚焦单一决策

**Confirm 文案规范：**
- 标题使用 `Verb + Noun`："Delete project"、"Remove member"、"Archive workspace"
- 描述说明后果 + 不可逆性："This action cannot be undone."
- 确认按钮文案与标题一致：标题 "Delete project" → 按钮 "Delete"

---

### 3. Form Modal — 表单弹窗

在 Modal 中嵌入表单控件。Body 内部引用 [Input](./input.md)、[Select](./select.md)、[Textarea](./textarea.md)。

```html
<!-- Form Modal Overlay -->
<div
  class="fixed inset-0 z-40 flex items-center justify-center bg-gray-950/50 backdrop-blur-sm p-4"
  role="dialog"
  aria-modal="true"
  aria-labelledby="form-modal-title"
>
  <!-- Form Modal Panel -->
  <div
    class="w-full max-w-lg rounded-xl bg-white
      inset-ring inset-ring-gray-950/30
      dark:bg-gray-900 dark:inset-ring-white/30"
  >
    <!-- Header -->
    <div class="flex items-center justify-between border-b border-gray-950/5 px-6 py-4 dark:border-white/5">
      <h2 id="form-modal-title" class="text-base font-semibold text-gray-900 dark:text-gray-100">
        Create project
      </h2>
      <button type="button"
        class="rounded-lg p-1.5 text-gray-400 transition-colors duration-150 hover:bg-gray-100 hover:text-gray-600 dark:text-gray-500 dark:hover:bg-gray-800 dark:hover:text-gray-300 motion-reduce:transition-none"
        aria-label="Close dialog"
      >
        <svg class="size-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
          <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
        </svg>
      </button>
    </div>

    <!-- Body (Form Fields) -->
    <div class="space-y-5 px-6 py-5">
      <!-- Project Name -->
      <div class="flex flex-col gap-1.5">
        <label for="project-name" class="text-sm font-medium text-gray-900 dark:text-gray-100">
          Project name
        </label>
        <input
          type="text"
          id="project-name"
          placeholder="Enter project name"
          class="w-full rounded-lg bg-white px-3 py-2 text-sm/6 text-gray-900
            inset-ring inset-ring-gray-950/8
            placeholder:text-gray-400
            transition-colors duration-150
            focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none
            dark:bg-gray-900 dark:text-gray-100 dark:placeholder:text-gray-500
            dark:inset-ring-white/10
            dark:focus:inset-ring-white/20 dark:focus:ring-white/10
            motion-reduce:transition-none"
        />
      </div>

      <!-- Description -->
      <div class="flex flex-col gap-1.5">
        <label for="project-desc" class="text-sm font-medium text-gray-900 dark:text-gray-100">
          Description
        </label>
        <textarea
          id="project-desc"
          rows="3"
          placeholder="Brief description of the project"
          class="w-full rounded-lg bg-white px-3 py-2 text-sm/6 text-gray-900
            inset-ring inset-ring-gray-950/8
            placeholder:text-gray-400
            transition-colors duration-150
            focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none
            dark:bg-gray-900 dark:text-gray-100 dark:placeholder:text-gray-500
            dark:inset-ring-white/10
            dark:focus:inset-ring-white/20 dark:focus:ring-white/10
            motion-reduce:transition-none"
        ></textarea>
      </div>

      <!-- Visibility (Select) -->
      <div class="flex flex-col gap-1.5">
        <label for="visibility" class="text-sm font-medium text-gray-900 dark:text-gray-100">
          Visibility
        </label>
        <div class="relative">
          <select
            id="visibility"
            class="w-full appearance-none rounded-lg bg-white px-3 py-2 pr-10 text-sm/6 text-gray-900
              inset-ring inset-ring-gray-950/8
              transition-colors duration-150
              focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none
              dark:bg-gray-900 dark:text-gray-100
              dark:inset-ring-white/10
              dark:focus:inset-ring-white/20 dark:focus:ring-white/10
              motion-reduce:transition-none"
          >
            <option>Private</option>
            <option>Team</option>
            <option>Public</option>
          </select>
          <svg class="pointer-events-none absolute right-3 top-1/2 size-4 -translate-y-1/2 text-gray-400 dark:text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
          </svg>
        </div>
      </div>
    </div>

    <!-- Footer -->
    <div class="flex items-center justify-end gap-3 border-t border-gray-950/5 px-6 py-4 dark:border-white/5">
      <button type="button"
        class="rounded-lg px-4 py-2 text-sm font-medium text-gray-700 transition-colors duration-150 hover:bg-gray-100 hover:text-gray-900 dark:text-gray-400 dark:hover:bg-gray-800 dark:hover:text-gray-100 motion-reduce:transition-none"
      >
        Cancel
      </button>
      <button type="button"
        class="inline-flex items-center justify-center rounded-lg bg-indigo-600 px-4 py-2 text-sm font-semibold text-white transition-colors duration-150 hover:bg-indigo-700 active:scale-[0.97] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 disabled:cursor-not-allowed disabled:opacity-50 dark:bg-indigo-500 dark:hover:bg-indigo-400 dark:focus-visible:outline-indigo-400 motion-reduce:transition-none"
      >
        Create
      </button>
    </div>
  </div>
</div>
```

**设计要点：**
- 宽度 `max-w-lg` (512px)——表单需要更宽空间，比 Base Modal (448px) 宽一档
- 表单字段复用完整的 [Input](./input.md) / [Select](./select.md) / [Textarea](./textarea.md) 样式——不自行定义
- Body `space-y-5` (20px) 垂直间距——比标准表单 `gap-4` 多一档，Modal 内留白更宽松
- Footer 确认按钮文案使用创建动作："Create"、"Save"、"Send"——而非通用 "Confirm"
- 输入框在 Modal 内自动获得焦点——提升表单填写效率

---

### 4. Close Button Only — 仅关闭按钮弹窗

无 Footer 操作按钮——仅用于信息展示或纯阅读内容。

```html
<!-- Info Modal Overlay -->
<div
  class="fixed inset-0 z-40 flex items-center justify-center bg-gray-950/50 backdrop-blur-sm p-4"
  role="dialog"
  aria-modal="true"
  aria-labelledby="info-title"
>
  <div
    class="w-full max-w-md rounded-xl bg-white
      inset-ring inset-ring-gray-950/30
      dark:bg-gray-900 dark:inset-ring-white/30"
  >
    <!-- Header -->
    <div class="flex items-center justify-between border-b border-gray-950/5 px-6 py-4 dark:border-white/5">
      <h2 id="info-title" class="text-base font-semibold text-gray-900 dark:text-gray-100">
        What's new
      </h2>
      <button type="button"
        class="rounded-lg p-1.5 text-gray-400 transition-colors duration-150 hover:bg-gray-100 hover:text-gray-600 dark:text-gray-500 dark:hover:bg-gray-800 dark:hover:text-gray-300 motion-reduce:transition-none"
        aria-label="Close dialog"
      >
        <svg class="size-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
          <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
        </svg>
      </button>
    </div>

    <!-- Body (Prose Content) -->
    <div class="px-6 py-5">
      <div class="prose prose-sm max-w-none dark:prose-invert">
        <h3>Dark mode</h3>
        <p>You can now switch between light and dark mode from the navbar. Your preference is saved locally.</p>
        <h3>Improved search</h3>
        <p>Search now supports fuzzy matching and keyboard shortcuts (⌘K).</p>
      </div>
    </div>
  </div>
</div>
```

**设计要点：**
- 无 Footer——纯信息展示不需要操作按钮
- 仅通过 × 关闭按钮和遮罩点击关闭
- 如果内容较长，Body 可设置 `max-h-[60vh] overflow-y-auto`
- 内容区域可以使用 Prose 排版样式（见 [Content/Prose](./content/prose.md)）

---

## 尺寸

四种宽度覆盖所有场景：

| Size | Tailwind | 宽度 | 使用场景 |
|------|----------|------|---------|
| **sm** | `max-w-sm` | 384px | Confirm、简短提示 |
| **md** | `max-w-md` | 448px | 标准 Dialog、信息展示 |
| **lg** | `max-w-lg` | 512px | 表单、设置 |
| **xl** | `max-w-xl` | 576px | 复杂表单、多步骤 |
| **2xl** | `max-w-2xl` | 672px | 大表单、预览、详情 |

```html
<!-- sm: Confirm Modal -->
<div class="w-full max-w-sm rounded-xl bg-white ...">

<!-- md: Base Modal (default) -->
<div class="w-full max-w-md rounded-xl bg-white ...">

<!-- lg: Form Modal -->
<div class="w-full max-w-lg rounded-xl bg-white ...">

<!-- xl: Complex Form -->
<div class="w-full max-w-xl rounded-xl bg-white ...">
```

Modal 高度不设 `max-h`（除了长内容场景），让内容自然决定高度。内容过长时使用 `max-h-[80vh] overflow-y-auto`。

---

## 滚动长内容

当 Modal 内容超过视口 80% 时，Body 区域独立滚动，Header 和 Footer 保持固定。

```html
<div class="flex max-h-[80vh] flex-col">
  <!-- Header (fixed) -->
  <div class="shrink-0 border-b border-gray-950/5 px-6 py-4 dark:border-white/5">
    <h2 class="text-base font-semibold text-gray-900 dark:text-gray-100">Long Content</h2>
  </div>

  <!-- Body (scrollable) -->
  <div class="flex-1 overflow-y-auto px-6 py-5">
    <!-- Long content here -->
  </div>

  <!-- Footer (fixed) -->
  <div class="shrink-0 border-t border-gray-950/5 px-6 py-4 dark:border-white/5">
    <!-- Buttons -->
  </div>
</div>
```

---

## JavaScript 实现

```javascript
// ── Modal Manager ──────────────────────────────────────────

function openModal(modalId) {
  const modal = document.getElementById(modalId);
  if (!modal) return;

  modal.classList.remove('hidden');
  // Prevent body scroll
  document.body.style.overflow = 'hidden';

  // Focus trap: focus first focusable element
  const firstFocusable = modal.querySelector(
    'button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])'
  );
  if (firstFocusable) firstFocusable.focus();

  // Close on Escape
  modal.addEventListener('keydown', handleEscape);
}

function closeModal(modalId) {
  const modal = document.getElementById(modalId);
  if (!modal) return;

  modal.classList.add('hidden');
  document.body.style.overflow = '';
  modal.removeEventListener('keydown', handleEscape);

  // Return focus to trigger element
  if (modal._triggerElement) modal._triggerElement.focus();
}

function handleEscape(e) {
  if (e.key === 'Escape') {
    const modal = e.currentTarget;
    closeModal(modal.id);
  }
}

// Close on overlay click
document.addEventListener('click', (e) => {
  if (e.target.hasAttribute('data-modal-overlay')) {
    closeModal(e.target.closest('[role="dialog"]').id);
  }
});
```

**HTML 中的 Modal 模板：**

```html
<!-- Hidden by default -->
<div
  id="confirm-delete-modal"
  class="hidden fixed inset-0 z-40 flex items-center justify-center bg-gray-950/50 backdrop-blur-sm p-4"
  role="alertdialog"
  aria-modal="true"
  aria-labelledby="delete-title"
  aria-describedby="delete-desc"
  data-modal-overlay
>
  <!-- Modal content (hidden when not active) -->
</div>

<!-- Trigger -->
<button type="button"
  onclick="openModal('confirm-delete-modal'); this.closest('[role=\\'dialog\\']')? null : document.getElementById('confirm-delete-modal')._triggerElement = this;"
>
  Delete project
</button>
```

---

## 状态总览

| 状态 | 表现 |
|------|------|
| **Hidden** | `hidden`——完全不渲染在可访问性树中 |
| **Opening** | 遮罩淡入 + Modal 缩放淡入 200ms |
| **Open** | 遮罩 `bg-gray-950/50 backdrop-blur-sm` + Modal `inset-ring 30%` |
| **Closing** | 遮罩淡出 + Modal 缩放淡出 150ms |
| **Body Scroll** | 打开时禁止页面滚动 (`overflow: hidden`) |
| **Focus Trap** | Tab 在 Modal 内循环，不会逃逸到页面 |
| **Loading** | 确认按钮切换为 Loading 态（spinner + 进行时文案） |

---

## Design Tokens

| Token | Tailwind | 值 | 说明 |
|-------|----------|-----|------|
| 遮罩背景 | `bg-gray-950/50` | 50% 黑 | 降低页面层次 |
| 遮罩模糊 | `backdrop-blur-sm` | 轻微模糊 | 聚焦 Modal |
| Modal 背景 | `bg-white` | `#fff` | 最高层表面 |
| Modal 描边 | `inset-ring-gray-950/30` | 30% 黑 | 最重的 ring——最高层级 |
| Modal 描边 Dark | `inset-ring-white/30` | 30% 白 | 暗色反转 |
| 圆角 | `rounded-xl` | 12px | 与 Card 一致 |
| Header 分隔 | `border-gray-950/5` | 5% 黑 | 轻分隔线 |
| Body 内边距 | `px-6 py-4` 或 `py-5` | 24px | 标准内容区 |
| Header/Footer 内边距 | `px-6 py-4` | 24px 16px | 栏区域 |
| 按钮间距 | `gap-3` | 12px | Cancel 与 Confirm |
| 关闭按钮 | `p-1.5` | 6px | 24×24px 触控区域 |
| z-index | `z-40` | — | 低于 Toast (z-50) |
| 宽度 sm | `max-w-sm` | 384px | Confirm |
| 宽度 md | `max-w-md` | 448px | 标准 |
| 宽度 lg | `max-w-lg` | 512px | 表单 |
| 宽度 xl | `max-w-xl` | 576px | 复杂表单 |
| 最大高度 | `max-h-[80vh]` | 80vh | 长内容滚动 |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| 语义角色 | `role="dialog"` 或 `role="alertdialog"`（Confirm） |
| Modal 标记 | `aria-modal="true"`——屏幕阅读器忽略页面其余内容 |
| 标题关联 | `aria-labelledby="modal-title"` 关联标题元素 |
| 描述关联 | `aria-describedby="modal-desc"` 关联描述元素 |
| 焦点管理 | 打开时聚焦第一个可聚焦元素；关闭后返回触发元素 |
| 焦点陷阱 | Tab/Shift+Tab 在 Modal 内循环 |
| Escape 关闭 | `keydown` 监听 Escape 键 |
| 遮罩关闭 | 点击遮罩区域关闭（需确保遮罩可点击且不在 Modal 内） |
| 禁止背景滚动 | `document.body.style.overflow = 'hidden'` |
| 关闭按钮 | `<button aria-label="Close dialog">` |
| 可见焦点 | 所有交互元素使用 `focus-visible:outline-2` |
| Loading 态 | 确认按钮使用 `cursor-wait` + spinner + 进行时文案 |
| 减少动画 | `motion-reduce:transition-none` |

---

## 复用指南

### 何时使用

| 场景 | 变体 | 说明 |
|------|------|------|
| 需要确认的破坏性操作 | Confirm | 删除、移除、不可逆操作 |
| 创建/编辑表单 | Form Modal | 不离开当前页面的输入 |
| 信息展示/公告 | Close Button Only | 纯阅读，无操作 |
| 通用对话框 | Base | 三段式标准结构 |

### 何时不用

| 场景 | 替代方案 |
|------|---------|
| 简单的是/否选择 | 浏览器原生 `confirm()` 或内联确认 |
| 少量表单字段（1-2 个） | Inline 展开 / Popover |
| 全页表单（多步骤） | 独立页面或 Wizard |
| 非阻塞通知 | [Toast](./toast.md) |
| 下拉菜单/选项 | Dropdown / Popover |
| 侧边栏详情 | Sheet / Drawer（侧边滑出） |

### 组合规则

```
✅ Cancel (Ghost) + Confirm (Primary) → gap-3，Confirm 在右
✅ Confirm Danger (Danger Primary) + Cancel (Ghost) →Cancel 在左
✅ Form Modal 表单控件 → 完整引用 Input / Select / Textarea
✅ 单个按钮时居中 → 或右对齐（与 Footer 按钮组一致）
❌ 两个 Primary 按钮并排 → 违反色彩纪律
❌ Modal 内再弹 Modal → 层次混乱，用多步骤替代
❌ Modal 内 Footer 省略 Cancel → 用户必须有"不做操作"的路径
```

---

> 参考: [Button](./button.md) · [Input](./input.md) · [Card](./card.md) · [Elevation](../design-tokens/elevation.md) · [Colors](../design-tokens/colors.md)
