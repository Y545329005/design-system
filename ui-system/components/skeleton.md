# Skeleton

Skeleton 骨架屏组件。在内容加载过程中展示占位 UI，减少用户感知的等待时间。适用于列表、卡片、详情页等数据加载场景。

> **Design Tokens**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Motion](../design-tokens/motion.md)
>
> **关联组件**: [Card](./card.md) · [Table](./table.md) · [Avatar](./avatar.md)
>
> **依赖**: 无——纯 CSS 动画

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 形状 | `rounded-lg` (8px) | 与全局交互元素圆角一致 |
| 背景色 | `bg-gray-200 dark:bg-gray-700` | 浅灰——与加载后的内容形成明确对比 |
| 动画 | `animate-pulse` | Tailwind 内置 pulse 动画——渐隐渐现 |
| 文字模拟 | 不同宽度的矩形块 | 模拟标题（70%宽）、正文（full）、短文本（40%宽） |
| 圆头像 | `rounded-full` | 与 Avatar 组件形状一致 |
| Reduced motion | `motion-reduce:animate-none` | 尊重用户偏好 |
| 颜色方案 | 单一灰色 | 不模拟实际内容的颜色——避免 "flash of color" |

---

## 变体

### 1. Text — 文本骨架

```html
<!-- Single line -->
<div class="h-4 bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>

<!-- Title + Description -->
<div class="space-y-2.5">
  <div class="h-5 w-[70%] bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
  <div class="h-4 bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
  <div class="h-4 w-[85%] bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
</div>

<!-- Multi-line paragraph -->
<div class="space-y-2.5">
  <div class="h-4 bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
  <div class="h-4 bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
  <div class="h-4 bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
  <div class="h-4 w-[60%] bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
</div>
```

**设计要点：**
- 标题行 `h-5` (20px)——比正文稍大
- 正文行 `h-4` (16px)——与 `text-sm` 行高匹配
- 最后一行 `w-[60%]`——模拟段落末尾的不完整行
- 标题行 `w-[70%]`——标题通常不占满宽度

---

### 2. Circle — 圆形骨架（头像占位）

```html
<!-- Avatar MD (40px) -->
<div class="size-10 rounded-full bg-gray-200 animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>

<!-- Avatar SM (32px) -->
<div class="size-8 rounded-full bg-gray-200 animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>

<!-- Avatar LG (56px) -->
<div class="size-14 rounded-full bg-gray-200 animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>

<!-- Icon (24px) -->
<div class="size-6 rounded-lg bg-gray-200 animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
```

---

### 3. Card — 卡片骨架

模拟 Card 组件加载状态。

```html
<!-- Card Skeleton -->
<div class="rounded-xl bg-white p-6 inset-ring inset-ring-gray-950/8 dark:bg-gray-900 dark:inset-ring-white/10">
  <!-- Card image placeholder -->
  <div class="h-48 bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
  <!-- Card content -->
  <div class="mt-5 space-y-3">
    <div class="h-5 w-[60%] bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
    <div class="h-4 bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
    <div class="h-4 w-[75%] bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
  </div>
  <!-- Card footer -->
  <div class="mt-5 flex items-center gap-3">
    <div class="size-10 rounded-full bg-gray-200 animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
    <div class="flex-1 space-y-1.5">
      <div class="h-4 w-[40%] bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
      <div class="h-3 w-[30%] bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
    </div>
  </div>
</div>
```

---

### 4. List Item — 列表项骨架

模拟列表/表格行加载状态。

```html
<!-- List Item Skeleton -->
<div class="flex items-center gap-4 py-3">
  <!-- Avatar -->
  <div class="size-10 rounded-full bg-gray-200 animate-pulse motion-reduce:animate-none dark:bg-gray-700 shrink-0"></div>
  <!-- Content -->
  <div class="flex-1 space-y-1.5">
    <div class="h-4 w-[45%] bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
    <div class="h-3 w-[60%] bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
  </div>
  <!-- Action -->
  <div class="h-8 w-20 bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700 shrink-0"></div>
</div>
```

---

### 5. Table Row — 表格行骨架

```html
<!-- Table Row Skeleton -->
<tr class="animate-pulse motion-reduce:animate-none">
  <td class="py-3 px-4"><div class="size-4 bg-gray-200 rounded dark:bg-gray-700"></div></td>
  <td class="py-3 px-4"><div class="h-4 w-[70%] bg-gray-200 rounded-lg dark:bg-gray-700"></div></td>
  <td class="py-3 px-4"><div class="h-4 w-[50%] bg-gray-200 rounded-lg dark:bg-gray-700"></div></td>
  <td class="py-3 px-4"><div class="h-5 w-16 bg-gray-200 rounded-lg dark:bg-gray-700"></div></td>
  <td class="py-3 px-4"><div class="h-8 w-20 bg-gray-200 rounded-lg dark:bg-gray-700"></div></td>
</tr>
```

**设计要点：**
- `animate-pulse` 放在 `<tr>` 上一—整行动画同步
- 子元素不加 `animate-pulse`——避免逐元素动画不同步
- Checkbox 列使用 `size-4` 方块——模拟 Checkbox 形状
- Badge 列使用 `h-5 w-16`——模拟 Badge 尺寸

---

### 6. Full Page — 整页骨架

Dashboard 或详情页的完整加载骨架。

```html
<!-- Full Page Skeleton -->
<div class="space-y-6">
  <!-- Page Header -->
  <div class="flex items-center justify-between">
    <div class="space-y-2">
      <div class="h-7 w-48 bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
      <div class="h-4 w-72 bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
    </div>
    <div class="flex items-center gap-3">
      <div class="h-10 w-28 bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
      <div class="h-10 w-32 bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
    </div>
  </div>

  <!-- Stat Cards -->
  <div class="grid grid-cols-4 gap-4">
    <div class="h-28 bg-gray-200 rounded-xl animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
    <div class="h-28 bg-gray-200 rounded-xl animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
    <div class="h-28 bg-gray-200 rounded-xl animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
    <div class="h-28 bg-gray-200 rounded-xl animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
  </div>

  <!-- Content Area -->
  <div class="grid grid-cols-3 gap-4">
    <div class="col-span-2 h-80 bg-gray-200 rounded-xl animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
    <div class="h-80 bg-gray-200 rounded-xl animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
  </div>
</div>
```

---

## 带内容的过渡模式

数据加载完成后，将 Skeleton 整体替换为真实内容：

```html
<!-- Loading → Loaded Pattern -->
<div id="content-container">
  <!-- Skeleton (hidden when loaded) -->
  <div id="skeleton" class="space-y-3">
    <div class="h-5 w-[70%] bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
    <div class="h-4 bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
    <div class="h-4 w-[85%] bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
  </div>
  <!-- Real Content (hidden while loading) -->
  <div id="content" hidden>
    <h2 class="text-lg font-semibold text-gray-900">Title</h2>
    <p class="text-gray-700">Content loaded.</p>
  </div>
</div>

<script>
  // On data ready:
  document.getElementById('skeleton').hidden = true
  document.getElementById('content').hidden = false
</script>
```

---

## Design Tokens

| Token | Tailwind | 值 | 说明 |
|-------|----------|-----|------|
| 背景色 | `bg-gray-200` | #E5E7EB | Light 骨架色 |
| 暗色背景 | `bg-gray-700` | #374151 | Dark 骨架色 |
| 文字高度（标题） | `h-5` | 20px | 模拟 text-base 行高 |
| 文字高度（正文） | `h-4` | 16px | 模拟 text-sm 行高 |
| 文字高度（辅助） | `h-3` | 12px | 模拟 text-xs 行高 |
| 圆角 | `rounded-lg` | 8px | 矩形骨架 |
| 头像圆角 | `rounded-full` | 50% | 圆形骨架 |
| 动画 | `animate-pulse` | 2s ease-in-out ∞ | Tailwind 内置 |
| Reduced motion | `motion-reduce:animate-none` | — | |
| 最后一行宽度 | `w-[60%]` — `w-[85%]` | — | 模拟不完整行 |
| 标题宽度 | `w-[60%]` — `w-[70%]` | — | 标题不占满 |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| 加载状态 | `aria-busy="true"` 在容器上——告知屏幕阅读器内容正在加载 |
| 无意义元素 | 骨架 `<div>` 应为空或 `aria-hidden="true"` |
| Reduced motion | `motion-reduce:animate-none`——禁用 pulse 动画 |
| 加载完成 | `aria-busy="false"` 或移除——屏幕阅读器得知内容就绪 |

---

## 复用指南

### 何时使用

- 数据从 API 加载期间
- 图片加载占位
- 列表/表格初始加载
- 页面首次渲染

### 何时不用

| 场景 | 替代方案 |
|------|---------|
| 操作结果反馈（< 1s） | 不需要骨架——直接显示结果 |
| 错误态 | [Empty State](./empty-state.md) Error 变体 |
| 空态 | [Empty State](./empty-state.md) |
| 图片加载 | 低质量占位图（LQIP）或 BlurHash |

### 最佳实践

```
✅ Skeleton 形状匹配真实内容布局（避免加载后布局跳动）
✅ 整页统一使用 Skeleton（而不是部分加载部分空白）
✅ 加载完成后平滑过渡
❌ Skeleton 不模拟颜色——仅用灰色
❌ Skeleton 不包含交互元素（按钮、链接）
❌ 不使用多个独立 pulse——统一放在父容器
```

---

> 参考: [Tailwind CSS animate-pulse](https://tailwindcss.com/docs/animation#pulse) · [Material Skeleton](https://m3.material.io/components/skeleton)
