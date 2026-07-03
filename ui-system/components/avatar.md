# Avatar

Avatar 头像组件，用于用户标识展示。支持图片头像、文字头像（Initials）、在线状态指示器和头像堆叠（AvatarGroup）。

> **Design Tokens**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md)
>
> **关联组件**: [Badge](./badge.md) · [Dropdown Menu](./dropdown-menu.md)
>
> **依赖**: 图片加载失败降级为文字头像（JS fallback）

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 形状 | `rounded-full`（圆形） | 头像唯一使用 `rounded-full` 的场景——人物头像的行业惯例 |
| 尺寸 | 5 档：xs/sm/md/lg/xl | 覆盖从表格行到 Profile 页的所有场景 |
| 文字头像背景 | Indigo 品牌色 | 与品牌色一致——使用 `bg-indigo-600` |
| 文字头像文字 | `text-white font-medium` | 白色文字，品牌色背景上高对比度 |
| 状态指示器 | 绿色/灰色圆点 | Success 语义色——在线/离线 |
| 头像堆叠 | `-ml-2` 负间距 | 重叠 8px——常见的头像堆叠模式 |
| 描边 | `inset-ring inset-ring-white dark:inset-ring-gray-900` | 白色描边（2px）与背景分离——头像堆叠时清晰可辨 |
| Fallback | 图片加载失败显示 Initials | 渐进增强——JS 检测 `onerror` |

---

## 变体

### 1. Image Avatar — 图片头像

```html
<!-- MD (40px) -->
<img src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=80&h=80&fit=crop&crop=face"
  alt="Raymond Yang"
  class="size-10 rounded-full object-cover inset-ring inset-ring-white dark:inset-ring-gray-900">

<!-- SM (32px) -->
<img src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=64&h=64&fit=crop&crop=face"
  alt="Raymond Yang"
  class="size-8 rounded-full object-cover inset-ring inset-ring-white dark:inset-ring-gray-900">

<!-- XS (24px) -->
<img src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=48&h=48&fit=crop&crop=face"
  alt="Raymond Yang"
  class="size-6 rounded-full object-cover inset-ring inset-ring-white dark:inset-ring-gray-900">

<!-- LG (56px) -->
<img src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=112&h=112&fit=crop&crop=face"
  alt="Raymond Yang"
  class="size-14 rounded-full object-cover inset-ring inset-ring-white dark:inset-ring-gray-900">

<!-- XL (80px) -->
<img src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=160&h=160&fit=crop&crop=face"
  alt="Raymond Yang"
  class="size-20 rounded-full object-cover inset-ring inset-ring-white dark:inset-ring-gray-900">
```

---

### 2. Initials Avatar — 文字头像

图片不可用时降级为文字头像。使用姓名首字母。

```html
<!-- MD (40px) -->
<span class="inline-flex items-center justify-center size-10 rounded-full bg-indigo-600 text-sm font-medium text-white inset-ring inset-ring-white dark:inset-ring-gray-900"
  aria-label="Raymond Yang">
  YQ
</span>

<!-- SM (32px) -->
<span class="inline-flex items-center justify-center size-8 rounded-full bg-indigo-600 text-xs font-medium text-white inset-ring inset-ring-white dark:inset-ring-gray-900"
  aria-label="Raymond Yang">
  YQ
</span>

<!-- XS (24px) — initials too small on XS, use single letter -->
<span class="inline-flex items-center justify-center size-6 rounded-full bg-indigo-600 text-[10px] font-medium text-white inset-ring inset-ring-white dark:inset-ring-gray-900"
  aria-label="Raymond Yang">
  Y
</span>

<!-- LG (56px) -->
<span class="inline-flex items-center justify-center size-14 rounded-full bg-indigo-600 text-lg font-medium text-white inset-ring inset-ring-white dark:inset-ring-gray-900"
  aria-label="Raymond Yang">
  YQ
</span>

<!-- XL (80px) -->
<span class="inline-flex items-center justify-center size-20 rounded-full bg-indigo-600 text-xl font-medium text-white inset-ring inset-ring-white dark:inset-ring-gray-900"
  aria-label="Raymond Yang">
  YQ
</span>
```

**设计要点：**
- 使用 `<span>` 而非 `<div>`——行内元素，与文字混排
- `aria-label` 包含全名——屏幕阅读器可读
- Initials 取 First Name + Last Name 首字母大写
- 中文名取姓氏首字母（如 "王小明" → "W"）
- XS 尺寸 (24px) 仅显示单字母——两个字母放不下

---

### 3. With Status — 带在线状态

```html
<!-- Online — Avatar MD + Status -->
<div class="relative inline-flex">
  <img src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=80&h=80&fit=crop&crop=face"
    alt="Raymond Yang"
    class="size-10 rounded-full object-cover inset-ring inset-ring-white dark:inset-ring-gray-900">
  <span class="absolute bottom-0 right-0 size-3 rounded-full bg-green-500 inset-ring inset-ring-2 inset-ring-white dark:inset-ring-gray-900" aria-label="Online"></span>
</div>

<!-- Offline — Avatar MD + Status -->
<div class="relative inline-flex">
  <img src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=80&h=80&fit=crop&crop=face"
    alt="Li Wei"
    class="size-10 rounded-full object-cover inset-ring inset-ring-white dark:inset-ring-gray-900">
  <span class="absolute bottom-0 right-0 size-3 rounded-full bg-gray-400 inset-ring inset-ring-2 inset-ring-white dark:inset-ring-gray-900" aria-label="Offline"></span>
</div>

<!-- Busy — Avatar MD + Status -->
<div class="relative inline-flex">
  <img src="https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=80&h=80&fit=crop&crop=face"
    alt="Zhang Min"
    class="size-10 rounded-full object-cover inset-ring inset-ring-white dark:inset-ring-gray-900">
  <span class="absolute bottom-0 right-0 size-3 rounded-full bg-red-500 inset-ring inset-ring-2 inset-ring-white dark:inset-ring-gray-900" aria-label="Do not disturb"></span>
</div>
```

**设计要点：**
- 容器 `relative inline-flex`——包含状态指示器的定位上下文
- 状态指示器 `absolute bottom-0 right-0`——右下角
- 指示器 `size-3` (12px)——所有 size Avatar 统一
- `inset-ring-2 inset-ring-white`——白色边框包裹指示器，与头像分离

---

### 4. Avatar Group — 头像堆叠

```html
<!-- Avatar Group (Stack) -->
<div class="flex items-center -space-x-2" aria-label="Team members: Raymond Yang, Li Wei, Zhang Min, +3 more">
  <img src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=80&h=80&fit=crop&crop=face"
    alt="Raymond Yang"
    class="relative size-10 rounded-full object-cover inset-ring inset-ring-2 inset-ring-white dark:inset-ring-gray-900">
  <img src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=80&h=80&fit=crop&crop=face"
    alt="Li Wei"
    class="relative size-10 rounded-full object-cover inset-ring inset-ring-2 inset-ring-white dark:inset-ring-gray-900">
  <img src="https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=80&h=80&fit=crop&crop=face"
    alt="Zhang Min"
    class="relative size-10 rounded-full object-cover inset-ring inset-ring-2 inset-ring-white dark:inset-ring-gray-900">
  <!-- +N overflow -->
  <span class="relative inline-flex items-center justify-center size-10 rounded-full bg-gray-100 text-xs font-medium text-gray-600 inset-ring inset-ring-2 inset-ring-white dark:bg-gray-800 dark:text-gray-400 dark:inset-ring-gray-900">
    +3
  </span>
</div>

<!-- Avatar Group (SM) -->
<div class="flex items-center -space-x-1.5" aria-label="5 team members">
  <img src="..." alt="A" class="relative size-8 rounded-full object-cover inset-ring inset-ring-2 inset-ring-white dark:inset-ring-gray-900">
  <img src="..." alt="B" class="relative size-8 rounded-full object-cover inset-ring inset-ring-2 inset-ring-white dark:inset-ring-gray-900">
  <span class="relative inline-flex items-center justify-center size-8 rounded-full bg-gray-100 text-[10px] font-medium text-gray-600 inset-ring inset-ring-2 inset-ring-white dark:bg-gray-800 dark:text-gray-400 dark:inset-ring-gray-900">
    +8
  </span>
</div>
```

**设计要点：**
- `-space-x-2` (8px 重叠)——容器上设置负间距，每个头像重叠 8px
- `inset-ring-2 inset-ring-white`——2px 白色描边，头像之间清晰分离
- `relative` 在每个头像上——确保 z-index 正常叠加（不指定 z-index，DOM 顺序自动堆叠）
- `+N` 溢出标记使用灰色背景——与品牌色头像区分

---

## 尺寸表

| Size | Tailwind | 像素 | 文字字号 | Initials | 使用场景 |
|------|----------|------|---------|---------|------|
| XS | `size-6` | 24px | `text-[10px]` | 1 字母 | 表格行、Badge 内 |
| SM | `size-8` | 32px | `text-xs` | 2 字母 | 列表、评论 |
| MD | `size-10` | 40px | `text-sm` | 2 字母 | 导航栏、Card Header |
| LG | `size-14` | 56px | `text-lg` | 2 字母 | Profile 侧边栏 |
| XL | `size-20` | 80px | `text-xl` | 2 字母 | Profile 主页 |

---

## Design Tokens

| Token | Tailwind | 值 | 说明 |
|-------|----------|-----|------|
| 形状 | `rounded-full` | 50% | Avatar 唯一使用的圆形场景 |
| 品牌背景（文字头像） | `bg-indigo-600` | #4F46E5 | |
| 文字色 | `text-white` | #FFF | |
| 描边 | `inset-ring inset-ring-white` | 1px white | 头像与背景分离 |
| 堆叠描边 | `inset-ring-2 inset-ring-white` | 2px white | 堆叠时稍粗描边 |
| 堆叠间距 | `-space-x-2` (MD) / `-space-x-1.5` (SM) | -8px / -6px | |
| 状态指示器尺寸 | `size-3` | 12px | 所有 Avatar 尺寸统一 |
| 状态在线色 | `bg-green-500` | #22C55E | |
| 状态离线色 | `bg-gray-400` | #9CA3AF | |
| 状态忙碌色 | `bg-red-500` | #EF4444 | |
| 溢出背景 | `bg-gray-100 dark:bg-gray-800` | — | +N 标记 |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| 图片 alt | `alt="Full Name"`——非空 alt，传达人物标识 |
| 文字头像 | `aria-label="Full Name"`——屏幕阅读器可读 |
| 状态指示器 | `aria-label="Online/Offline/Do not disturb"` |
| 头像组 | `aria-label="Team members: Name1, Name2, +N more"` 汇总所有成员 |

---

## 复用指南

### 何时使用

- 用户头像展示
- 团队成员列表
- 评论/消息的发送者标识
- 导航栏的用户菜单触发器

### 何时不用

| 场景 | 替代方案 |
|------|---------|
| 品牌 Logo | 使用 `<img>` 直接展示 |
| 图标按钮 | 使用 Icon Button |
| 项目/组织标识 | 使用 `rounded-lg` 方形图标——不是 Avatar |

---

> 参考: [Tailwind Catalysis Avatars](https://tailwindui.com/components/application-ui/elements/avatars)
