# Spacing

Design System 间距、圆角、响应式断点规范。Typography 与 Motion 已独立为专属 Token 文件。

---

## 一、Base Grid（基础网格）

所有间距以 **4px** 为基本单位。

```
1 unit = 4px = 0.25rem
```

| 间距名 | Tailwind | 值 | 用途 |
|--------|----------|-----|------|
| xs | `gap-1` / `p-1` | 4px | 极小间距：图标与文字之间 |
| sm | `gap-2` / `p-2` | 8px | 紧凑内边距：badge、小按钮 |
| md | `gap-3` / `p-3` | 12px | 标准内边距：输入框、按钮 |
| lg | `gap-4` / `p-4` | 16px | 宽松内边距：卡片 |
| xl | `gap-6` / `p-6` | 24px | 大间距：卡片内边距 (大屏) |
| 2xl | `gap-8` / `p-8` | 32px | 区块内边距 |
| 3xl | `gap-12` | 48px | Section 间距 |
| 4xl | `gap-16` | 64px | 大 Section 间距 |

### 完整 Spacing Scale

```
0    → 0px
0.5  → 2px    (极少使用)
1    → 4px    (图标间距)
1.5  → 6px    (标签间距)
2    → 8px    (紧凑 padding)
2.5  → 10px   (badge padding)
3    → 12px   (标准 padding)
3.5  → 14px
4    → 16px   (卡片 padding)
5    → 20px
6    → 24px   (组件间距)
7    → 28px
8    → 32px   (区块 padding)
9    → 36px
10   → 40px   (大 padding)
11   → 44px
12   → 48px   (Section 间距)
14   → 56px
16   → 64px
20   → 80px
24   → 96px
28   → 112px
32   → 128px
36   → 144px
40   → 160px
```

### 间距使用原则

- **组件内部**: `p-1` ~ `p-6` (4px ~ 24px)
- **组件之间**: `gap-4` ~ `gap-8` (16px ~ 32px)
- **Section 之间**: `gap-12` ~ `gap-24` (48px ~ 96px)
- **页面边距**: `px-4` (mobile) → `px-8` (desktop)

---

## 二、Border Radius（圆角）

| Token | Tailwind | 值 | 用途 |
|-------|----------|-----|------|
| none | `rounded-none` | 0 | 表格、数据区域 |
| sm | `rounded-sm` | 2px | 极少使用 |
| md | `rounded-md` | 6px | 小卡片、复选框 |
| lg | `rounded-lg` | 8px | 输入框、下拉菜单 |
| xl | `rounded-xl` | 12px | 卡片、Modal |
| 2xl | `rounded-2xl` | 16px | 大卡片 |
| 3xl | `rounded-3xl` | 24px | Hero 卡片 |
| full | `rounded-full` | 9999px | 胶囊按钮、Badge、头像 |

### 圆角使用原则

| 元素类型 | 圆角 | 说明 |
|---------|------|------|
| 交互元素（按钮、输入框、Badge） | `rounded-lg` (8px) | 统一 8px，与 8px 基础网格对齐 |
| 容器（卡片、Modal） | `rounded-xl` (12px) | 外层容器略大圆角，内紧外松 |
| 头像 | `rounded-full` | 圆形是头像的语义约定 |
| 图片 | 与所在容器保持一致 | 通常 `rounded-xl`（卡片内）或 `rounded-lg`（缩略图） |
| 表格 / 数据区域 | `rounded-none` (0) | 无圆角 |

**不再推荐 `rounded-full` 用于交互元素**。全胶囊按钮在顶级产品中几乎绝迹（Linear/Stripe/Notion/Vercel 均使用 4-8px 圆角），8px 在专业感与友好感之间取得最佳平衡。

- 同一页面内**容器圆角保持一致**（不要混用 `rounded-xl` 和 `rounded-2xl`）
- 同一页面内**交互元素圆角保持一致**（统一 `rounded-lg`）
- 内外关系：内部元素圆角 ≤ 外部容器圆角（如 Card `rounded-xl` 内 Button `rounded-lg`）

---

## 三、Typography（排版）

> 完整的字体族、字号层级、字重、行高、字间距、文字色层级规范，请参见 **[Typography Token](./typography.md)**。
>
> spacing.md 仅保留间距/圆角/响应式断点。Typography 已独立为专属 Token 文件。

---

## 四、Responsive Breakpoints（响应式断点）

| Token | Tailwind | 宽度 | 适配设备 |
|-------|----------|------|---------|
| sm | `sm:` | ≥ 640px | 大屏手机 |
| md | `md:` | ≥ 768px | 平板 |
| lg | `lg:` | ≥ 1024px | 小屏笔记本 |
| xl | `xl:` | ≥ 1280px | 桌面显示器 |
| 2xl | `2xl:` | ≥ 1536px | 大屏显示器 |

### 响应式原则

- **Mobile First**: 默认样式为移动端，`sm:` / `lg:` 逐步增强
- **卡片**: `p-4 sm:p-6 lg:p-8` 渐进式内边距
- **Grid**: 移动端单列 → `sm:grid-cols-2` → `lg:grid-cols-3`
- **隐藏/显示**: 使用 `hidden sm:block` 等响应式显隐
- **不针对特定设备**: 使用断点而非设备检测

---

## 五、Motion（动效）

> 完整的过渡时长、缓动函数、动画模式、GPU 合成、reduced-motion 规范，请参见 **[Motion Token](./motion.md)**。
>
> spacing.md 不再直接定义动效规范。

---

> 参考: [Tailwind CSS Spacing](https://tailwindcss.com/docs/padding) · [Tailwind CSS Border Radius](https://tailwindcss.com/docs/border-radius) · [Tailwind CSS Font Size](https://tailwindcss.com/docs/font-size)
