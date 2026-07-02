# Toast

Toast 是浮动通知组件，用于在不中断用户操作的前提下传达反馈信息。所有语义色严格遵循 [语义色统一原则](../principles/semantic-color-unification.md)，与 [Badge](./badge.md) 共享相同的色彩映射。

> **Design Tokens**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Elevation](../design-tokens/elevation.md)
>
> **关联组件**: [Badge](./badge.md)（共享语义色彩映射）
>
> **依赖**: 无额外依赖——使用 JavaScript 动态创建 DOM 元素

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 位置 | 右上角固定 (`fixed right-4 top-16`) | 用户视线自然落点，不遮挡主内容 |
| 容器 | `pointer-events-none` + 子元素 `pointer-events-auto` | 容器不拦截点击，Toast 本身可交互（关闭按钮） |
| 描边 | `inset-ring` 语义色 | 与全局 inset-ring 体系一致 |
| 圆角 | `rounded-lg` (8px) | 与所有交互元素统一 |
| 语义色 | 4 色 (green/amber/red/blue) | 与 Badge 的 Success/Warning/Error/Info 完全一致 |
| 消失 | 5 秒自动消失 + 手动关闭 | 足够阅读但不打断工作流 |
| 动画 | `opacity` 淡入淡出 200ms | 仅透明度过渡，不引起 layout shift |
| 暗色模式 | 背景 `900/30` + 文字降饱和度 | 暗背景上避免荧光感 |

---

## 语义色映射

Toast 的 4 种语义色与 [Badge](./badge.md) 完全一致（零偏差）：

| 语义 | Light 描边 | Light 背景 | Light 图标/标题 | Dark 描边 | Dark 背景 | Dark 图标/标题 |
|------|-----------|-----------|---------------|----------|----------|-------------|
| Success | `inset-ring-green-300` | `bg-green-50` | `text-green-600` / `text-green-800` | `inset-ring-green-400/50` | `bg-green-900/30` | `text-green-400` / `text-green-100` |
| Error | `inset-ring-red-300` | `bg-red-50` | `text-red-600` / `text-red-800` | `inset-ring-red-400/50` | `bg-red-900/30` | `text-red-400` / `text-red-100` |
| Warning | `inset-ring-amber-300` | `bg-amber-50` | `text-amber-600` / `text-amber-800` | `inset-ring-amber-400/50` | `bg-amber-900/30` | `text-amber-400` / `text-amber-100` |
| Info | `inset-ring-blue-300` | `bg-blue-50` | `text-blue-600` / `text-blue-800` | `inset-ring-blue-400/50` | `bg-blue-900/30` | `text-blue-400` / `text-blue-100` |

---

## 变体

### 1. Success — 成功通知

传达操作成功完成。如保存、发布、创建。

```html
<div
  role="status"
  class="w-full max-w-sm rounded-lg bg-green-50 p-4
    inset-ring inset-ring-green-300
    dark:bg-green-900/30 dark:inset-ring-green-400/50"
>
  <div class="flex items-start gap-3">
    <!-- Check Circle Icon -->
    <svg class="size-5 shrink-0 text-green-600 dark:text-green-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
      <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
    </svg>
    <div class="flex-1 min-w-0">
      <p class="text-sm font-medium text-green-800 dark:text-green-100">
        Profile updated
      </p>
      <p class="mt-0.5 text-sm text-green-700 dark:text-green-200">
        Your profile has been saved successfully.
      </p>
    </div>
    <!-- Close Button -->
    <button type="button"
      class="shrink-0 rounded-lg p-1 text-green-600 transition-colors duration-150 hover:bg-green-200 dark:text-green-400 dark:hover:bg-green-800 motion-reduce:transition-none"
      aria-label="Dismiss"
    >
      <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
      </svg>
    </button>
  </div>
</div>
```

---

### 2. Error — 错误通知

传达操作失败。如保存失败、网络错误、权限不足。

```html
<div
  role="alert"
  class="w-full max-w-sm rounded-lg bg-red-50 p-4
    inset-ring inset-ring-red-300
    dark:bg-red-900/30 dark:inset-ring-red-400/50"
>
  <div class="flex items-start gap-3">
    <!-- X Circle Icon -->
    <svg class="size-5 shrink-0 text-red-600 dark:text-red-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
      <path stroke-linecap="round" stroke-linejoin="round" d="M9.75 9.75l4.5 4.5m0-4.5l-4.5 4.5M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
    </svg>
    <div class="flex-1 min-w-0">
      <p class="text-sm font-medium text-red-800 dark:text-red-100">
        Failed to save
      </p>
      <p class="mt-0.5 text-sm text-red-700 dark:text-red-200">
        A server error occurred. Please try again.
      </p>
    </div>
    <button type="button"
      class="shrink-0 rounded-lg p-1 text-red-600 transition-colors duration-150 hover:bg-red-200 dark:text-red-400 dark:hover:bg-red-800 motion-reduce:transition-none"
      aria-label="Dismiss"
    >
      <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
      </svg>
    </button>
  </div>
</div>
```

**设计要点：**
- Error Toast 使用 `role="alert"`（而非 `role="status"`）——屏幕阅读器立即播报
- 其他三种类型使用 `role="status"`——不打断当前操作

---

### 3. Warning — 警告通知

传达需要注意但不阻塞的信息。如即将过期、存储空间不足。

```html
<div
  role="status"
  class="w-full max-w-sm rounded-lg bg-amber-50 p-4
    inset-ring inset-ring-amber-300
    dark:bg-amber-900/30 dark:inset-ring-amber-400/50"
>
  <div class="flex items-start gap-3">
    <svg class="size-5 shrink-0 text-amber-600 dark:text-amber-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
      <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126zM12 15.75h.007v.008H12v-.008z" />
    </svg>
    <div class="flex-1 min-w-0">
      <p class="text-sm font-medium text-amber-800 dark:text-amber-100">
        Storage almost full
      </p>
      <p class="mt-0.5 text-sm text-amber-700 dark:text-amber-200">
        You've used 85% of your storage. Upgrade to avoid interruptions.
      </p>
    </div>
    <button type="button"
      class="shrink-0 rounded-lg p-1 text-amber-600 transition-colors duration-150 hover:bg-amber-200 dark:text-amber-400 dark:hover:bg-amber-800 motion-reduce:transition-none"
      aria-label="Dismiss"
    >
      <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
      </svg>
    </button>
  </div>
</div>
```

---

### 4. Info — 信息通知

传达中性信息。如新功能发布、系统维护通知。

```html
<div
  role="status"
  class="w-full max-w-sm rounded-lg bg-blue-50 p-4
    inset-ring inset-ring-blue-300
    dark:bg-blue-900/30 dark:inset-ring-blue-400/50"
>
  <div class="flex items-start gap-3">
    <svg class="size-5 shrink-0 text-blue-600 dark:text-blue-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
      <path stroke-linecap="round" stroke-linejoin="round" d="M11.25 11.25l.041-.02a.75.75 0 011.063.852l-.708 2.836a.75.75 0 001.063.853l.041-.021M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-9-3.75h.008v.008H12V8.25z" />
    </svg>
    <div class="flex-1 min-w-0">
      <p class="text-sm font-medium text-blue-800 dark:text-blue-100">
        New feature available
      </p>
      <p class="mt-0.5 text-sm text-blue-700 dark:text-blue-200">
        Dark mode is now supported across all pages.
      </p>
    </div>
    <button type="button"
      class="shrink-0 rounded-lg p-1 text-blue-600 transition-colors duration-150 hover:bg-blue-200 dark:text-blue-400 dark:hover:bg-blue-800 motion-reduce:transition-none"
      aria-label="Dismiss"
    >
      <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
      </svg>
    </button>
  </div>
</div>
```

---

### 5. With Action — 带操作按钮

Toast 内含一个 CTA 按钮，用于可即时操作的场景。

```html
<div
  role="status"
  class="w-full max-w-sm rounded-lg bg-white p-4
    inset-ring inset-ring-gray-950/8
    dark:bg-gray-900 dark:inset-ring-white/10"
>
  <div class="flex items-start gap-3">
    <svg class="size-5 shrink-0 text-gray-600 dark:text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
      <path stroke-linecap="round" stroke-linejoin="round" d="M21.75 6.75v10.5a2.25 2.25 0 01-2.25 2.25h-15a2.25 2.25 0 01-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25m19.5 0v.243a2.25 2.25 0 01-1.07 1.916l-7.5 4.615a2.25 2.25 0 01-2.36 0L3.32 8.91a2.25 2.25 0 01-1.07-1.916V6.75" />
    </svg>
    <div class="flex-1 min-w-0">
      <p class="text-sm font-medium text-gray-900 dark:text-gray-100">
        Invitation sent
      </p>
      <p class="mt-0.5 text-sm text-gray-600 dark:text-gray-400">
        Alex has been invited to the workspace.
      </p>
      <button type="button"
        class="mt-2 text-sm font-medium text-indigo-600 transition-colors duration-150 hover:text-indigo-700 dark:text-indigo-400 dark:hover:text-indigo-300 motion-reduce:transition-none"
      >
        Undo
      </button>
    </div>
    <button type="button"
      class="shrink-0 rounded-lg p-1 text-gray-400 transition-colors duration-150 hover:bg-gray-100 hover:text-gray-600 dark:text-gray-500 dark:hover:bg-gray-800 dark:hover:text-gray-300 motion-reduce:transition-none"
      aria-label="Dismiss"
    >
      <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
      </svg>
    </button>
  </div>
</div>
```

**设计要点：**
- Action Toast 使用中性色（`bg-white` + `inset-ring-gray-950/8`）——与语义色 Toast 区分
- 操作按钮使用品牌色文字链接（非实心按钮）——保持 Toast 的轻量感
- "Undo" 是典型的 Action 场景——低代价撤销，不打断用户

---

### 6. Standout — 高亮通知

使用品牌色背景，用于重要的系统级通知。

```html
<div
  role="status"
  class="w-full max-w-sm rounded-lg bg-indigo-600 p-4
    dark:bg-indigo-500"
>
  <div class="flex items-start gap-3">
    <svg class="size-5 shrink-0 text-indigo-200" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
      <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 13.5l10.5-11.25L12 10.5h8.25L9.75 21.75 12 13.5H3.75z" />
    </svg>
    <div class="flex-1 min-w-0">
      <p class="text-sm font-medium text-white">
        Welcome to Acme!
      </p>
      <p class="mt-0.5 text-sm text-indigo-100">
        Your workspace is ready. Start by creating your first project.
      </p>
      <button type="button"
        class="mt-2 text-sm font-medium text-white underline transition-colors duration-150 hover:text-indigo-100 motion-reduce:transition-none"
      >
        Create project
      </button>
    </div>
    <button type="button"
      class="shrink-0 rounded-lg p-1 text-indigo-200 transition-colors duration-150 hover:bg-indigo-500 hover:text-white dark:hover:bg-indigo-400 motion-reduce:transition-none"
      aria-label="Dismiss"
    >
      <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
      </svg>
    </button>
  </div>
</div>
```

**设计要点：**
- 实心品牌色背景——整个系统唯一全色背景的通知
- 仅用于高价值系统通知（欢迎、重要更新、里程碑）
- 不要滥用——每用户会话至多出现一到两次
- 暗色模式：`indigo-500` 背景，避免暗背景上 600 过亮

---

## JavaScript 实现

Toast 需要 JavaScript 来动态创建、显示和移除。以下是完整实现：

```javascript
// ── Toast Container ──────────────────────────────────────────
// HTML 中需要预置容器:
// <div id="toast-container"
//   class="pointer-events-none fixed right-4 top-16 z-50 flex flex-col gap-3 sm:right-6"
//   aria-live="polite"
//   aria-label="Notifications">
// </div>

const toastContainer = document.getElementById('toast-container');

function showToast({ type = 'info', title, message, action, duration = 5000 }) {
  // 语义色配置
  const colors = {
    success: {
      ring: 'inset-ring-green-300 dark:inset-ring-green-400/50',
      bg: 'bg-green-50 dark:bg-green-900/30',
      icon: 'text-green-600 dark:text-green-400',
      title: 'text-green-800 dark:text-green-100',
      text: 'text-green-700 dark:text-green-200',
      closeHover: 'hover:bg-green-200 dark:hover:bg-green-800'
    },
    error: {
      ring: 'inset-ring-red-300 dark:inset-ring-red-400/50',
      bg: 'bg-red-50 dark:bg-red-900/30',
      icon: 'text-red-600 dark:text-red-400',
      title: 'text-red-800 dark:text-red-100',
      text: 'text-red-700 dark:text-red-200',
      closeHover: 'hover:bg-red-200 dark:hover:bg-red-800'
    },
    warning: {
      ring: 'inset-ring-amber-300 dark:inset-ring-amber-400/50',
      bg: 'bg-amber-50 dark:bg-amber-900/30',
      icon: 'text-amber-600 dark:text-amber-400',
      title: 'text-amber-800 dark:text-amber-100',
      text: 'text-amber-700 dark:text-amber-200',
      closeHover: 'hover:bg-amber-200 dark:hover:bg-amber-800'
    },
    info: {
      ring: 'inset-ring-blue-300 dark:inset-ring-blue-400/50',
      bg: 'bg-blue-50 dark:bg-blue-900/30',
      icon: 'text-blue-600 dark:text-blue-400',
      title: 'text-blue-800 dark:text-blue-100',
      text: 'text-blue-700 dark:text-blue-200',
      closeHover: 'hover:bg-blue-200 dark:hover:bg-blue-800'
    }
  };

  const c = colors[type] || colors.info;

  // 创建 Toast 元素
  const toast = document.createElement('div');
  toast.setAttribute('role', type === 'error' ? 'alert' : 'status');
  toast.className =
    `pointer-events-auto w-full max-w-sm rounded-lg p-4 inset-ring ${c.ring} ${c.bg}`;

  // 图标 SVG（根据 type 选择）
  const iconPaths = {
    success: '<path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />',
    error: '<path stroke-linecap="round" stroke-linejoin="round" d="M9.75 9.75l4.5 4.5m0-4.5l-4.5 4.5M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />',
    warning: '<path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126zM12 15.75h.007v.008H12v-.008z" />',
    info: '<path stroke-linecap="round" stroke-linejoin="round" d="M11.25 11.25l.041-.02a.75.75 0 011.063.852l-.708 2.836a.75.75 0 001.063.853l.041-.021M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-9-3.75h.008v.008H12V8.25z" />'
  };

  const actionHTML = action ?
    `<button type="button" class="mt-2 text-sm font-medium text-indigo-600 transition-colors duration-150 hover:text-indigo-700 dark:text-indigo-400 dark:hover:text-indigo-300 motion-reduce:transition-none" onclick="${action.onClick}">${action.label}</button>` :
    '';

  toast.innerHTML = `
    <div class="flex items-start gap-3">
      <svg class="size-5 shrink-0 ${c.icon}" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
        ${iconPaths[type] || iconPaths.info}
      </svg>
      <div class="flex-1 min-w-0">
        <p class="text-sm font-medium ${c.title}">${title}</p>
        <p class="mt-0.5 text-sm ${c.text}">${message}</p>
        ${actionHTML}
      </div>
      <button type="button"
        class="shrink-0 rounded-lg p-1 ${c.icon} transition-colors duration-150 ${c.closeHover} motion-reduce:transition-none"
        aria-label="Dismiss">
        <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
          <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
        </svg>
      </button>
    </div>`;

  toastContainer.appendChild(toast);

  // 自动消失
  if (duration > 0) {
    setTimeout(() => {
      toast.style.opacity = '0';
      toast.style.transition = 'opacity 200ms ease-out';
      setTimeout(() => toast.remove(), 200);
    }, duration);
  }

  // 手动关闭
  toast.querySelector('button')?.addEventListener('click', () => {
    toast.style.opacity = '0';
    toast.style.transition = 'opacity 200ms ease-out';
    setTimeout(() => toast.remove(), 200);
  });
}
```

**使用示例：**

```javascript
// Success
showToast({ type: 'success', title: 'Profile updated', message: 'Your profile has been saved successfully.' });

// Error
showToast({ type: 'error', title: 'Failed to save', message: 'A server error occurred. Please try again.' });

// Warning
showToast({ type: 'warning', title: 'Storage almost full', message: "You've used 85% of your storage." });

// Info
showToast({ type: 'info', title: 'New feature', message: 'Dark mode is now supported across all pages.' });

// With Action
showToast({
  type: 'success',
  title: 'Invitation sent',
  message: 'Alex has been invited to the workspace.',
  action: { label: 'Undo', onClick: 'undoInvitation()' },
  duration: 8000  // 有操作按钮时延长展示时间
});

// Persistent（不自动消失）
showToast({ type: 'error', title: 'Connection lost', message: 'Please check your network.', duration: 0 });
```

**JS 实现要点：**
- 容器 `pointer-events-none` + Toast `pointer-events-auto`——容器不拦截点击，Toast 本身可交互
- `role="alert"`（Error）vs `role="status"`（其他）——Error 实时播报，其余不打断
- 淡出 200ms 后 `remove()`——避免 DOM 积累
- `duration: 0` 表示常驻——需用户手动关闭

---

## 容器布局

```html
<!-- Toast Container — 放在 </body> 前 -->
<div
  id="toast-container"
  class="pointer-events-none fixed right-4 top-16 z-50 flex flex-col gap-3 sm:right-6"
  aria-live="polite"
  aria-label="Notifications"
></div>
```

**设计要点：**
- `fixed right-4 top-16`——右上角，避开顶部 Navbar (h-14 + padding)
- `z-50`——高于 Modal 遮罩之下，确保始终可见
- `flex flex-col gap-3`——多个 Toast 垂直堆叠，12px 间距
- `aria-live="polite"`——屏幕阅读器在用户空闲时播报新通知

---

## 设计要点总结

| 要素 | 规范 |
|------|------|
| 最大宽度 | `max-w-sm` (384px) |
| 内边距 | `p-4` (16px) |
| 图标尺寸 | `size-5` (20px) |
| 图标间距 | `gap-3` (12px) |
| 关闭按钮 padding | `p-1` (4px) — 触控区域 24×24px |
| 关闭图标尺寸 | `size-4` (16px) |
| 标题字号 | `text-sm font-medium` (14px 500) |
| 描述字号 | `text-sm` (14px) |
| 标题/描述间距 | `mt-0.5` (2px) |
| 操作按钮间距 | `mt-2` (8px) |
| 容器位置 | `fixed right-4 top-16` |
| z-index | `z-50` |
| 消失动画 | `opacity 0` + `transition 200ms ease-out` |
| 默认停留时间 | 5000ms (5 秒) |
| 有操作按钮停留时间 | 8000ms (8 秒) |

---

## Design Tokens

| Token | Light | Dark | Tailwind | 说明 |
|-------|-------|------|----------|------|
| 最大宽度 | 384px | 384px | `max-w-sm` | Toast 宽度 |
| 内边距 | 16px | 16px | `p-4` | 内容区 |
| 圆角 | 8px | 8px | `rounded-lg` | 全局统一 |
| 图标尺寸 | 20px | 20px | `size-5` | 语义图标 |
| 图标间距 | 12px | 12px | `gap-3` | 图标与内容 |
| 关闭按钮触控 | 24×24px | 24×24px | `p-1` + `size-4` | 可访问性 |
| Success 背景 | `bg-green-50` | `bg-green-900/30` | — | 成功通知 |
| Error 背景 | `bg-red-50` | `bg-red-900/30` | — | 错误通知 |
| Warning 背景 | `bg-amber-50` | `bg-amber-900/30` | — | 警告通知 |
| Info 背景 | `bg-blue-50` | `bg-blue-900/30` | — | 信息通知 |
| Action 背景 | `bg-white` | `bg-gray-900` | — | 带操作的中性通知 |
| Standout 背景 | `bg-indigo-600` | `bg-indigo-500` | — | 品牌色高亮通知 |
| 过渡 (淡出) | 200ms | 200ms | `transition-opacity duration-200` | 消失动画 |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| 语义角色 | Error: `role="alert"`（立即播报）；其他: `role="status"`（空闲时播报） |
| 容器播报 | `aria-live="polite"` 确保屏幕阅读器感知新通知 |
| 容器标签 | `aria-label="Notifications"` 标识通知区域 |
| 关闭按钮 | `aria-label="Dismiss"` + `<button>` |
| 图标装饰 | `aria-hidden="true"`——图标纯装饰 |
| 键盘关闭 | 关闭按钮支持 Enter/Space |
| 动画 | 仅透明度过渡——不影响布局和阅读顺序 |
| 持久通知 | `duration: 0` 的 Toast 不会自动消失，需用户手动关闭 |

---

## 复用指南

### 何时使用

| 场景 | 变体 | 说明 |
|------|------|------|
| 操作成功 | Success | 保存、创建、删除、发布 |
| 操作失败 | Error | 网络错误、验证失败、服务器错误 |
| 需要注意 | Warning | 存储不足、即将过期、权限变更 |
| 中性信息 | Info | 新功能、维护通知、系统更新 |
| 可撤销操作 | With Action | 删除后恢复、发送后撤回 |
| 重要系统通知 | Standout | 欢迎、关键更新（谨慎使用） |

### 何时不用

| 场景 | 替代方案 |
|------|---------|
| 需要用户做选择的确认 | [Modal](./modal.md) Confirm |
| 页面级别的错误状态 | 内联 Error State（Alert） |
| 需要详细操作说明 | [Modal](./modal.md) 或独立页面 |
| 后台任务进度 | 进度条 / Loading 指示器 |
| 表单验证错误 | 内联 Error Message（`aria-describedby`） |

### 组合规则

```
✅ 多个 Toast 堆叠     → flex-col gap-3，最新的在底部
✅ Toast + Action       → Undo / View / Retry 等轻量操作
✅ Toast + 链接         → "Learn more" → 新标签页打开
❌ Toast 内放表单       → 太重——用 Modal
❌ 同时显示 >3 个 Toast → 合并为摘要通知
❌ Error Toast 静默     → Error 应使用 role="alert"
```

---

> 参考: [语义色统一](../principles/semantic-color-unification.md) · [Badge](./badge.md) · [Colors](../design-tokens/colors.md) · [Elevation](../design-tokens/elevation.md)
