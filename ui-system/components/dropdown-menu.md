# Dropdown Menu

下拉菜单组件。触发后在一个浮层面板中展示操作列表。适用于导航菜单、上下文操作、用户菜单等场景。

> **Design Tokens**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Elevation](../design-tokens/elevation.md) · [Motion](../design-tokens/motion.md)
>
> **关联组件**: [Button](./button.md) · [Modal](./modal.md)
>
> **依赖**: JS 控制显示/隐藏 + 点击外部关闭

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 面板宽度 | `w-56` (224px) | 足够容纳中文菜单项（最长约 8 个字） |
| 面板圆角 | `rounded-xl` (12px) | 容器级圆角——与 Card/Modal 一致 |
| 菜单项圆角 | `rounded-lg` (8px) | 交互元素圆角——与 Button 一致 |
| 描边 | `inset-ring inset-ring-gray-950/8` | 全局 inset-ring 体系 |
| 阴影/层次 | `shadow-lg` | 浮层需要明确的层次——唯一使用 shadow 的场景之一 |
| 字体 | `text-sm` | 菜单项字号——与 Button sm 一致 |
| 间距 | `p-1` (4px) | 菜单项之间不设 gap——padding 在容器上，菜单项各自 padding |
| 动效 | Enter: `opacity + scale(0.95)` 150ms ease-out<br>Exit: `opacity` 200ms ease-out | 标准浮层动画 |
| 项目高度 | `py-2` (8px) | 44px 总高度——满足 WCAG 2.5.5 目标尺寸 |

---

## 变体

### 1. Base — 基础下拉菜单

最常用的操作菜单。

```html
<!-- Dropdown Trigger -->
<button type="button" onclick="toggleDropdown('menu-1')" aria-expanded="false" aria-haspopup="true"
  class="inline-flex items-center gap-2 rounded-lg px-4 py-2.5 text-sm font-semibold text-gray-900 inset-ring inset-ring-gray-950/8 transition-colors duration-150 hover:bg-gray-950/[2.5%] active:scale-[0.97] motion-reduce:transition-none">
  Actions
  <svg class="size-4 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5"/></svg>
</button>

<!-- Dropdown Panel -->
<div id="menu-1" role="menu" aria-orientation="vertical" hidden
  class="absolute left-0 top-full z-30 mt-2 w-56 rounded-xl bg-white p-1 inset-ring inset-ring-gray-950/8 shadow-lg dark:bg-gray-800 dark:inset-ring-white/10">
  <button role="menuitem"
    class="flex w-full items-center gap-2 rounded-lg px-3 py-2 text-sm text-gray-700 transition-colors duration-150 hover:bg-gray-950/[2.5%] hover:text-gray-900 motion-reduce:transition-none dark:text-gray-300 dark:hover:bg-white/[2.5%] dark:hover:text-white">
    <svg class="size-4 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0115.75 21H5.25A2.25 2.25 0 013 18.75V8.25A2.25 2.25 0 015.25 6H10"/></svg>
    Edit
  </button>
  <button role="menuitem"
    class="flex w-full items-center gap-2 rounded-lg px-3 py-2 text-sm text-gray-700 transition-colors duration-150 hover:bg-gray-950/[2.5%] hover:text-gray-900 motion-reduce:transition-none dark:text-gray-300 dark:hover:bg-white/[2.5%] dark:hover:text-white">
    <svg class="size-4 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M15.75 17.25v3.375c0 .621-.504 1.125-1.125 1.125h-9.75a1.125 1.125 0 01-1.125-1.125V3.375c0-.621.504-1.125 1.125-1.125h6.75c.621 0 1.125.504 1.125 1.125v3.375M12 5.25h4.5L21 9.75v.375M9 15l3-3m0 0l3 3m-3-3v9"/></svg>
    Duplicate
  </button>

  <!-- Divider -->
  <div class="my-1 h-px bg-gray-950/5 dark:bg-white/5" role="separator" aria-orientation="horizontal"></div>

  <button role="menuitem"
    class="flex w-full items-center gap-2 rounded-lg px-3 py-2 text-sm text-gray-700 transition-colors duration-150 hover:bg-gray-950/[2.5%] hover:text-gray-900 motion-reduce:transition-none dark:text-gray-300 dark:hover:bg-white/[2.5%] dark:hover:text-white">
    <svg class="size-4 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M7.217 10.907a2.25 2.25 0 100 2.186m0-2.186c.18.324.283.696.283 1.093s-.103.77-.283 1.093m0-2.186l9.566-5.314m-9.566 7.5l9.566 5.314m0 0a2.25 2.25 0 103.935 2.186 2.25 2.25 0 00-3.935-2.186zm0-12.814a2.25 2.25 0 103.933-2.185 2.25 2.25 0 00-3.933 2.185z"/></svg>
    Share
  </button>
  <button role="menuitem"
    class="flex w-full items-center justify-between rounded-lg px-3 py-2 text-sm text-gray-700 transition-colors duration-150 hover:bg-gray-950/[2.5%] hover:text-gray-900 motion-reduce:transition-none dark:text-gray-300 dark:hover:bg-white/[2.5%] dark:hover:text-white">
    <span class="flex items-center gap-2">
      <svg class="size-4 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M12 9v6m3-3H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
      New Project
    </span>
    <kbd class="text-xs text-gray-400 dark:text-gray-500">⌘N</kbd>
  </button>

  <div class="my-1 h-px bg-gray-950/5 dark:bg-white/5" role="separator" aria-orientation="horizontal"></div>

  <!-- Danger Action -->
  <button role="menuitem"
    class="flex w-full items-center gap-2 rounded-lg px-3 py-2 text-sm text-red-600 transition-colors duration-150 hover:bg-red-50 hover:text-red-700 motion-reduce:transition-none dark:text-red-400 dark:hover:bg-red-900/30 dark:hover:text-red-300">
    <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0"/></svg>
    Delete
  </button>
</div>
```

**设计要点：**
- `role="menu"` + `role="menuitem"`——完整 ARIA 语义
- `aria-expanded="false"` 在 trigger 上——屏幕阅读器得知菜单状态
- 分隔线使用 `bg-gray-950/5` 透明度——与全局分割线一致
- `w-full` 按钮——菜单项填满面板宽度
- Danger 操作独立分组——用 divider 与普通操作隔离
- 快捷键 `kbd` 右对齐——视觉平衡

---

### 2. User Menu — 用户菜单

带用户信息头部的下拉菜单。

```html
<!-- User Menu Panel -->
<div role="menu" aria-orientation="vertical" hidden
  class="absolute right-0 top-full z-30 mt-2 w-56 rounded-xl bg-white p-1 inset-ring inset-ring-gray-950/8 shadow-lg dark:bg-gray-800 dark:inset-ring-white/10">
  <!-- User Info Header -->
  <div class="px-3 py-2.5">
    <p class="text-sm font-medium text-gray-900 dark:text-white">Yang Qing</p>
    <p class="text-xs text-gray-500 dark:text-gray-400">yangqing@example.com</p>
  </div>

  <div class="my-1 h-px bg-gray-950/5 dark:bg-white/5" role="separator" aria-orientation="horizontal"></div>

  <button role="menuitem"
    class="flex w-full items-center gap-2 rounded-lg px-3 py-2 text-sm text-gray-700 transition-colors duration-150 hover:bg-gray-950/[2.5%] hover:text-gray-900 motion-reduce:transition-none dark:text-gray-300 dark:hover:bg-white/[2.5%] dark:hover:text-white">
    <svg class="size-4 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z"/></svg>
    Profile
  </button>
  <button role="menuitem"
    class="flex w-full items-center gap-2 rounded-lg px-3 py-2 text-sm text-gray-700 transition-colors duration-150 hover:bg-gray-950/[2.5%] hover:text-gray-900 motion-reduce:transition-none dark:text-gray-300 dark:hover:bg-white/[2.5%] dark:hover:text-white">
    <svg class="size-4 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M9.594 3.94c.09-.542.56-.94 1.11-.94h2.593c.55 0 1.02.398 1.11.94l.213 1.281c.063.374.313.686.645.87.074.04.147.083.22.127.324.196.72.257 1.075.124l1.217-.456a1.125 1.125 0 011.37.49l1.296 2.247a1.125 1.125 0 01-.26 1.431l-1.003.827c-.293.24-.438.613-.431.992a6.759 6.759 0 010 .255c-.007.378.138.75.43.99l1.005.828c.424.35.534.954.26 1.43l-1.298 2.247a1.125 1.125 0 01-1.369.491l-1.217-.456c-.355-.133-.75-.072-1.076.124a6.57 6.57 0 01-.22.128c-.331.183-.581.495-.644.869l-.213 1.28c-.09.543-.56.941-1.11.941h-2.594c-.55 0-1.02-.398-1.11-.94l-.213-1.281c-.062-.374-.312-.686-.644-.87a6.52 6.52 0 01-.22-.127c-.325-.196-.72-.257-1.076-.124l-1.217.456a1.125 1.125 0 01-1.369-.49l-1.297-2.247a1.125 1.125 0 01.26-1.431l1.004-.827c.292-.24.437-.613.43-.992a6.932 6.932 0 010-.255c.007-.378-.138-.75-.43-.99l-1.004-.828a1.125 1.125 0 01-.26-1.43l1.297-2.247a1.125 1.125 0 011.37-.491l1.216.456c.356.133.751.072 1.076-.124.072-.044.146-.087.22-.128.332-.183.582-.495.644-.869l.214-1.281z"/><path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/></svg>
    Settings
  </button>

  <div class="my-1 h-px bg-gray-950/5 dark:bg-white/5" role="separator" aria-orientation="horizontal"></div>

  <button role="menuitem"
    class="flex w-full items-center gap-2 rounded-lg px-3 py-2 text-sm text-gray-700 transition-colors duration-150 hover:bg-gray-950/[2.5%] hover:text-gray-900 motion-reduce:transition-none dark:text-gray-300 dark:hover:bg-white/[2.5%] dark:hover:text-white">
    <svg class="size-4 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0013.5 3h-6a2.25 2.25 0 00-2.25 2.25v13.5A2.25 2.25 0 007.5 21h6a2.25 2.25 0 002.25-2.25V15m3 0l3-3m0 0l-3-3m3 3H9"/></svg>
    Sign out
  </button>
</div>
```

**设计要点：**
- 用户信息区 `px-3 py-2.5`——比菜单项稍大的 padding，视觉区分
- Avatar 可放在用户信息左侧（使用 Avatar 组件）
- Sign out 放在最后，用 divider 隔离

---

### 3. Context Menu — 右键菜单

与 Base 结构相同，触发方式不同——通过 `contextmenu` 事件在光标位置显示。

```html
<!-- Context Menu — identical structure, positioned at cursor -->
<div role="menu" aria-orientation="vertical" hidden
  class="fixed z-30 w-56 rounded-xl bg-white p-1 inset-ring inset-ring-gray-950/8 shadow-lg dark:bg-gray-800 dark:inset-ring-white/10"
  style="left: var(--menu-x); top: var(--menu-y);">
  <!-- same menuitem structure as Base -->
</div>
```

**设计要点：**
- 使用 `position: fixed` 而非 `absolute`——相对视口定位
- 通过 `--menu-x` / `--menu-y` CSS 变量动态设置位置
- `contextmenu` 事件中调用 `event.preventDefault()` 阻止浏览器默认菜单

---

## JS 交互逻辑（必须实现）

```javascript
function setupDropdown(triggerSelector, menuSelector) {
  const trigger = document.querySelector(triggerSelector)
  const menu = document.querySelector(menuSelector)
  if (!trigger || !menu) return

  let isOpen = false

  function open() {
    isOpen = true
    menu.hidden = false
    trigger.setAttribute('aria-expanded', 'true')
    // Focus first menuitem
    const firstItem = menu.querySelector('[role="menuitem"]')
    if (firstItem) setTimeout(() => firstItem.focus(), 50)
  }

  function close() {
    isOpen = false
    menu.hidden = true
    trigger.setAttribute('aria-expanded', 'false')
    trigger.focus()
  }

  trigger.addEventListener('click', (e) => {
    e.stopPropagation()
    isOpen ? close() : open()
  })

  // Close on outside click
  document.addEventListener('click', (e) => {
    if (isOpen && !menu.contains(e.target) && !trigger.contains(e.target)) {
      close()
    }
  })

  // Close on Escape
  document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape' && isOpen) {
      close()
    }
  })

  // Keyboard navigation within menu
  menu.addEventListener('keydown', (e) => {
    const items = [...menu.querySelectorAll('[role="menuitem"]:not([disabled])')]
    const idx = items.indexOf(document.activeElement)

    if (e.key === 'ArrowDown') {
      e.preventDefault()
      const next = (idx + 1) % items.length
      items[next].focus()
    } else if (e.key === 'ArrowUp') {
      e.preventDefault()
      const prev = (idx - 1 + items.length) % items.length
      items[prev].focus()
    } else if (e.key === 'Home') {
      e.preventDefault()
      items[0].focus()
    } else if (e.key === 'End') {
      e.preventDefault()
      items[items.length - 1].focus()
    }
  })
}
```

---

## Design Tokens

| Token | Tailwind | 值 | 说明 |
|-------|----------|-----|------|
| 面板宽度 | `w-56` | 224px | 标准菜单宽度 |
| 面板圆角 | `rounded-xl` | 12px | 容器级 |
| 项目圆角 | `rounded-lg` | 8px | 交互元素级 |
| 面板 padding | `p-1` | 4px | 内边距 |
| 项目 padding | `px-3 py-2` | 12px 8px | ~44px 总高度 |
| 字体 | `text-sm` | 14px | |
| 文字色 | `text-gray-700` | #374151 | |
| Hover 背景 | `bg-gray-950/[2.5%]` | 2.5% 黑 | |
| 图标尺寸 | `size-4` | 16px | |
| 图标间距 | `gap-2` | 8px | |
| 分隔线 | `h-px bg-gray-950/5` | 1px 5% 黑 | |
| 快捷键盘 | `text-xs text-gray-400` | 12px | |
| 过渡 | `transition-colors duration-150` | 150ms | |
| 阴影 | `shadow-lg` | — | 浮层层次 |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| 语义元素 | `role="menu"` + `role="menuitem"` + `role="separator"` |
| 触发器 | `aria-expanded="true/false"` + `aria-haspopup="true"` |
| 键盘导航 | ↑↓ 在项目间移动，Home/End 跳首尾，Escape 关闭，Enter 激活 |
| 焦点管理 | 打开时移入菜单，关闭时回到触发器 |
| 外部点击 | 点击外部区域关闭菜单 |
| 分隔线 | `role="separator"` |
| 减少动画 | `motion-reduce:transition-none` |

---

## 复用指南

### 何时使用

- 操作列表（Edit / Copy / Delete / Share）
- 用户菜单（Profile / Settings / Sign out）
- 排序/过滤选项
- 右键上下文菜单

### 何时不用

| 场景 | 替代方案 |
|------|---------|
| 导航链接（多层级） | [Sidebar](./sidebar.md) |
| 表单选择（单选/多选） | [Select](./select.md) |
| 确认操作 | [Modal](./modal.md) |
| 少量选项（≤3） | 直接使用 Button 排列 |
| 大量选项（>10） | Select 或 Command Palette |

---

> 参考: [Tailwind Catalysis Dropdowns](https://tailwindui.com/components/application-ui/elements/dropdowns) · [WAI-ARIA Menu Pattern](https://www.w3.org/WAI/ARIA/apg/patterns/menu-button/)
