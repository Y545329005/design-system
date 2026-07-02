# Tabs

Tab 切换组件，用于在同一层级的内容区域之间导航。适用于 Dashboard 分区、Settings 分组、Landing Page 功能展示等场景。

> **Design Tokens**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Motion](../design-tokens/motion.md)
>
> **关联组件**: [Button](./button.md) · [Segmented Control](./segmented-control.md)
>
> **依赖**: 无额外依赖

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 激活态指示器 | 底部 underline (2px) | Linear 风格——简洁且清晰，不依赖颜色传达 |
| 圆角 | `rounded-lg` (8px) | 全局统一——Pill 变体容器使用此圆角 |
| 字体 | `text-sm font-medium` | 与 Button 字号一致——Tab 是导航元素，不是标题 |
| 间距 | `gap-0` + 独立 padding | 各 Tab 之间无间距——依靠 padding 和指示器区分 |
| 激活色 | `text-gray-900` + Indigo 指示器 | 品牌色仅用于指示器——文字保持中性，暗色模式友好 |
| 非激活色 | `text-gray-500` | 辅助信息色——不抢激活态注意力 |
| Hover | `hover:text-gray-700` | 轻微加深——暗示可交互 |
| 动效 | `transition-colors duration-150` | 全局标准——颜色过渡 150ms |
| 暗色模式 | 指示器 `dark:bg-indigo-400`，文字 `dark:text-gray-400` / `dark:text-white` | 暗背景上提高对比度 |

---

## 变体

### 1. Underline — 底线指示器（推荐默认）

最常用的 Tab 变体。底部 2px 指示器标记激活项。

```html
<!-- Underline Tabs -->
<nav class="flex border-b border-gray-950/5 dark:border-white/5" role="tablist" aria-label="Content sections">
  <button role="tab" aria-selected="true" aria-controls="panel-overview"
    class="relative px-4 py-2.5 text-sm font-medium text-gray-900 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-white dark:hover:text-gray-300">
    Overview
    <span class="absolute inset-x-0 -bottom-px h-0.5 bg-indigo-600 dark:bg-indigo-400" aria-hidden="true"></span>
  </button>
  <button role="tab" aria-selected="false" aria-controls="panel-analytics"
    class="relative px-4 py-2.5 text-sm font-medium text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-300">
    Analytics
  </button>
  <button role="tab" aria-selected="false" aria-controls="panel-settings"
    class="relative px-4 py-2.5 text-sm font-medium text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-300">
    Settings
  </button>
  <button role="tab" aria-selected="false" aria-controls="panel-billing" disabled
    class="relative px-4 py-2.5 text-sm font-medium text-gray-400 cursor-not-allowed dark:text-gray-600">
    Billing
  </button>
</nav>

<!-- Corresponding Tab Panels -->
<div id="panel-overview" role="tabpanel" aria-labelledby="tab-overview" class="pt-4">
  <!-- Overview content -->
</div>
```

**设计要点：**
- `role="tablist"` + `role="tab"` + `role="tabpanel"`——完整 ARIA 语义，屏幕阅读器友好
- 指示器使用 `absolute inset-x-0 -bottom-px h-0.5`——跨越 border-bottom，视觉精准
- 非激活 Tab 无指示器 `<span>`——通过 JS 条件渲染，而非 CSS 隐藏
- `aria-selected="true"` 仅在一项上——明确当前选中项
- `disabled` Tab 使用 `cursor-not-allowed` + `text-gray-400`——无 hover 效果

---

### 2. Pill — 胶囊切换

激活项有背景色的胶囊形切换器。适用：视图模式切换（Grid/List）、时间范围选择（Day/Week/Month）。

```html
<!-- Pill Tabs -->
<nav class="inline-flex rounded-lg bg-gray-950/[2.5%] p-1 dark:bg-white/[2.5%]" role="tablist" aria-label="View options">
  <button role="tab" aria-selected="true"
    class="rounded-md px-3 py-1.5 text-sm font-medium text-gray-900 bg-white inset-ring inset-ring-gray-950/8 transition-colors duration-150 motion-reduce:transition-none dark:bg-gray-700 dark:text-white dark:inset-ring-white/10">
    Day
  </button>
  <button role="tab" aria-selected="false"
    class="rounded-md px-3 py-1.5 text-sm font-medium text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-300">
    Week
  </button>
  <button role="tab" aria-selected="false"
    class="rounded-md px-3 py-1.5 text-sm font-medium text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-300">
    Month
  </button>
</nav>
```

**设计要点：**
- 容器 `bg-gray-950/[2.5%] p-1`——微妙的 2.5% 透明背景作底板
- 激活项 `bg-white + inset-ring`——白色卡片浮在底板上的效果
- 暗色模式 `bg-gray-700` 替代 white——保持一致层次感
- `rounded-md`（6px）用于内部胶囊——容器 `rounded-lg`（8px），层次分明
- `gap-0` 不设间距——各胶囊紧邻，视觉连贯

---

### 3. Block — 等宽填充

每个 Tab 等宽，填满容器。适用：移动端全宽切换、主要功能区（如 Login/Register）。

```html
<!-- Block Tabs — Full Width -->
<nav class="flex rounded-lg bg-gray-950/[2.5%] p-1 dark:bg-white/[2.5%]" role="tablist" aria-label="Auth mode">
  <button role="tab" aria-selected="true"
    class="flex-1 rounded-md px-4 py-2 text-sm font-medium text-gray-900 bg-white inset-ring inset-ring-gray-950/8 transition-colors duration-150 motion-reduce:transition-none dark:bg-gray-700 dark:text-white dark:inset-ring-white/10">
    Sign In
  </button>
  <button role="tab" aria-selected="false"
    class="flex-1 rounded-md px-4 py-2 text-sm font-medium text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-300">
    Register
  </button>
</nav>
```

**设计要点：**
- `flex-1` 使每个 Tab 等宽——填满容器
- Py 从 `1.5` 增至 `2`——更大点击区域，适合移动端
- 其余逻辑与 Pill 变体一致

---

### 4. Underline + Icon — 带图标

在 Underline 变体基础上增加行内图标。

```html
<!-- Underline + Icon -->
<nav class="flex border-b border-gray-950/5 dark:border-white/5" role="tablist" aria-label="Content sections">
  <button role="tab" aria-selected="true"
    class="relative inline-flex items-center gap-1.5 px-4 py-2.5 text-sm font-medium text-gray-900 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-white dark:hover:text-gray-300">
    <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6A2.25 2.25 0 016 3.75h2.25A2.25 2.25 0 0110.5 6v2.25a2.25 2.25 0 01-2.25 2.25H6a2.25 2.25 0 01-2.25-2.25V6zM3.75 15.75A2.25 2.25 0 016 13.5h2.25a2.25 2.25 0 012.25 2.25V18a2.25 2.25 0 01-2.25 2.25H6A2.25 2.25 0 013.75 18v-2.25zM13.5 6a2.25 2.25 0 012.25-2.25H18A2.25 2.25 0 0120.25 6v2.25A2.25 2.25 0 0118 10.5h-2.25a2.25 2.25 0 01-2.25-2.25V6zM13.5 15.75a2.25 2.25 0 012.25-2.25H18a2.25 2.25 0 012.25 2.25V18A2.25 2.25 0 0118 20.25h-2.25A2.25 2.25 0 0113.5 18v-2.25z"/></svg>
    Dashboard
    <span class="absolute inset-x-0 -bottom-px h-0.5 bg-indigo-600 dark:bg-indigo-400" aria-hidden="true"></span>
  </button>
  <button role="tab" aria-selected="false"
    class="relative inline-flex items-center gap-1.5 px-4 py-2.5 text-sm font-medium text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-300">
    <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M3 13.125C3 12.504 3.504 12 4.125 12h2.25c.621 0 1.125.504 1.125 1.125v6.75C7.5 20.496 6.996 21 6.375 21h-2.25A1.125 1.125 0 013 19.875v-6.75zM9.75 8.625c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125v11.25c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 01-1.125-1.125V8.625zM16.5 4.125c0-.621.504-1.125 1.125-1.125h2.25C20.496 3 21 3.504 21 4.125v15.75c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 01-1.125-1.125V4.125z"/></svg>
    Analytics
  </button>
  <button role="tab" aria-selected="false"
    class="relative inline-flex items-center gap-1.5 px-4 py-2.5 text-sm font-medium text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-300">
    <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M9.594 3.94c.09-.542.56-.94 1.11-.94h2.593c.55 0 1.02.398 1.11.94l.213 1.281c.063.374.313.686.645.87.074.04.147.083.22.127.324.196.72.257 1.075.124l1.217-.456a1.125 1.125 0 011.37.49l1.296 2.247a1.125 1.125 0 01-.26 1.431l-1.003.827c-.293.24-.438.613-.431.992a6.759 6.759 0 010 .255c-.007.378.138.75.43.99l1.005.828c.424.35.534.954.26 1.43l-1.298 2.247a1.125 1.125 0 01-1.369.491l-1.217-.456c-.355-.133-.75-.072-1.076.124a6.57 6.57 0 01-.22.128c-.331.183-.581.495-.644.869l-.213 1.28c-.09.543-.56.941-1.11.941h-2.594c-.55 0-1.02-.398-1.11-.94l-.213-1.281c-.062-.374-.312-.686-.644-.87a6.52 6.52 0 01-.22-.127c-.325-.196-.72-.257-1.076-.124l-1.217.456a1.125 1.125 0 01-1.369-.49l-1.297-2.247a1.125 1.125 0 01.26-1.431l1.004-.827c.292-.24.437-.613.43-.992a6.932 6.932 0 010-.255c.007-.378-.138-.75-.43-.99l-1.004-.828a1.125 1.125 0 01-.26-1.43l1.297-2.247a1.125 1.125 0 011.37-.491l1.216.456c.356.133.751.072 1.076-.124.072-.044.146-.087.22-.128.332-.183.582-.495.644-.869l.214-1.281z"/><path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/></svg>
    Settings
  </button>
</nav>
```

**设计要点：**
- `gap-1.5` (6px) 图标与文字间距——比 Badge 的 `gap-1` 稍大，适合导航级元素
- `size-4` (16px) 图标——与 `text-sm` 文字行高匹配
- 图标 `aria-hidden="true"`——装饰性，Tab label 已传达语义

---

## 使用场景矩阵

| 场景 | 推荐变体 | 说明 |
|------|---------|------|
| Dashboard 分区切换 | Underline | 经典、不占额外空间 |
| Settings 分组 | Underline | 清晰的内容层级感 |
| 视图切换（Grid/List） | Pill | 紧凑、切换感明确 |
| 时间范围（Day/Week/Month） | Pill | 同类选项的互斥切换 |
| 移动端主导航 | Block | 等宽、大触控区域 |
| Login/Register 切换 | Block | 两个等权选项 |
| 带分类图标 | Underline + Icon | 需要图标辅助识别时 |

---

## Design Tokens

| Token | Tailwind | 值 | 说明 |
|-------|----------|-----|------|
| 容器下划线 | `border-b border-gray-950/5` | 1px 5% 黑 | Underline 变体底部线 |
| 激活指示器高度 | `h-0.5` | 2px | Indigo 指示线 |
| 激活指示器位置 | `-bottom-px` | -1px | 覆盖边框线 |
| Tab padding | `px-4 py-2.5` | 16px 10px | 舒适点击区域 |
| Pill padding | `px-3 py-1.5` | 12px 6px | 紧凑模式 |
| Pill 底板 | `bg-gray-950/[2.5%]` | 2.5% 黑 | 胶囊容器背景 |
| 字号 | `text-sm` | 14px | 导航级字号 |
| 字重 | `font-medium` | 500 | 半粗 |
| 图标尺寸 | `size-4` | 16px | |
| 图标间距 | `gap-1.5` | 6px | 图标与文字 |
| 过渡 | `transition-colors duration-150` | 150ms | Hover/Focus 颜色 |
| Reduced motion | `motion-reduce:transition-none` | — | |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| 语义元素 | `role="tablist"` — `role="tab"` — `role="tabpanel"` 完整 ARIA 结构 |
| 选中状态 | `aria-selected="true/false"` — 屏幕阅读器可识别 |
| 面板关联 | `aria-controls="panel-id"` + Panel `aria-labelledby="tab-id"` — 双向关联 |
| 键盘导航 | Tab 键进入组件，左右箭头在组内切换（需 JS 实现） |
| 焦点管理 | 激活 Tab 获得 `focus-visible` 样式 |
| 颜色传达 | 激活态同时使用「文字加粗」+「指示器」+「aria-selected」——不止依赖颜色 |
| 减少动画 | `motion-reduce:transition-none` |

---

## 复用指南

### 何时使用

- 同一层级的内容区域切换（≤6 个标签）
- 视图模式切换（如 Grid/List）
- Dashboard 分区、Settings 分组

### 何时不用

| 场景 | 替代方案 |
|------|---------|
| 页面级导航（多层级） | [Sidebar](./sidebar.md) 或 [Navbar](./navbar.md) |
| 步骤流程（Step 1 → 2 → 3） | Stepper（未来组件） |
| 选项数量 > 6 | [Select](./select.md) 或 Search |
| 纯过滤/排序（不切换内容区） | [Segmented Control](./segmented-control.md) |
| 移动端底部导航 | Bottom Navigation（未来组件） |

### 组合规则

```
✅ Tab 数量 ≤ 6         → Tabs 组件
✅ Tab 数量 > 6          → Select 或搜索
✅ Tab label 使用名词     → "Overview", "Analytics", "Settings"
❌ Tab label 使用动词     → 使用 Button Group
❌ Tab 嵌套              → 避免——考虑 Sidebar + 内容区布局
❌ 同时使用多种 Tab 变体  → 一个页面只使用一种 Tab 风格
```

---

> 参考: [Linear Tabs](https://linear.app) · [Tailwind Catalysis Tabs](https://tailwindui.com/components/application-ui/navigation/tabs) · [WAI-ARIA Tabs Pattern](https://www.w3.org/WAI/ARIA/apg/patterns/tabs/)
