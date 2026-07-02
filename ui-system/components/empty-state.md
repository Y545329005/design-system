# Empty State

空态占位组件。当列表、表格、图表、搜索结果等无数据时展示——提供清晰的视觉反馈 + 可选的操作引导，避免空白页面造成的用户困惑。

> **Design Tokens**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Typography](../design-tokens/typography.md) · [Motion](../design-tokens/motion.md)
>
> **关联组件**: [Button](./button.md)（CTA 按钮复用 Secondary / Primary） · [Table](./table.md)（表格空态内嵌） · [Chart](./chart.md)（图表空态内嵌）
>
> **依赖**: 无外部依赖

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 过渡 | `transition-colors duration-150` | 见 [Motion Token](../design-tokens/motion.md)——禁止 `transition-all`，禁止自定义时长 |
| 布局 | 垂直居中（flex-col + items-center） | 空态是中断信号——居中确保用户视线不游离 |
| 图标 | `text-gray-300`，48px (`size-12`) | 从 Colors 中性色阶选取，足够大但不压倒文案 |
| 标题 | `text-sm font-medium text-gray-900` | UI 正文标准——与 Button label / Input label 一致 |
| 描述 | `text-sm text-gray-500` | 辅助文字色——引导而非命令 |
| CTA 按钮 | 复用 Button Secondary / Primary | Compose-Don't-Duplicate——不重新定义按钮 |
| 最大宽度 | `max-w-xs` (320px) | 防止超宽容器内空态文案过于分散 |
| 垂直留白 | `py-12` ~ `py-24` | 随容器大小递增——保证空态有足够的呼吸空间 |
| 图标语义 | `aria-hidden="true"` | 纯装饰——图标不含信息，避免屏幕阅读器重复朗读 |

---

## 变体

### 1. Base（基础空态）

无操作引导，仅告知"暂无数据"。用于只读场景——如查看他人 Dashboard、历史记录为空。

```html
<!-- Empty State: Base -->
<div class="flex flex-col items-center justify-center py-16 text-center">
  <svg class="size-12 text-gray-300 dark:text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5" aria-hidden="true">
    <path stroke-linecap="round" stroke-linejoin="round" d="M20.25 7.5l-.625 10.632a2.25 2.25 0 01-2.247 2.118H6.622a2.25 2.25 0 01-2.247-2.118L3.75 7.5m6 4.125l2.25 2.25m0 0l2.25 2.25M12 13.875l2.25-2.25M12 13.875l-2.25 2.25M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125z" />
  </svg>
  <h3 class="mt-4 text-sm font-medium text-gray-900 dark:text-gray-100">No data</h3>
  <p class="mt-1 max-w-xs text-sm text-gray-500 dark:text-gray-400">There are no items to display yet.</p>
</div>
```

**设计要点：**
- 图标 48px (`size-12`)——足够大作为视觉锚点，不压倒文字
- `mt-4`（16px）分隔图标与标题——与 Card padding 一致
- `mt-1`（4px）紧凑连接标题与描述——视觉上是一个信息组
- `max-w-xs`（320px）限制描述宽度——单行不超过 20 个英文单词

---

### 2. With Action（带操作引导）

包含 CTA 按钮，引导用户创建第一条数据。用于可编辑场景——如空项目列表、空笔记列表。

```html
<!-- Empty State: With Action -->
<div class="flex flex-col items-center justify-center py-16 text-center">
  <svg class="size-12 text-gray-300 dark:text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5" aria-hidden="true">
    <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v6m3-3H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z" />
  </svg>
  <h3 class="mt-4 text-sm font-medium text-gray-900 dark:text-gray-100">No projects yet</h3>
  <p class="mt-1 max-w-xs text-sm text-gray-500 dark:text-gray-400">Create your first project to get started with tracking and collaboration.</p>
  <div class="mt-6">
    <button type="button" class="inline-flex items-center gap-2 rounded-lg bg-indigo-600 px-4 py-2 text-sm font-semibold text-white transition-colors duration-150 hover:bg-indigo-700 active:scale-[0.97] motion-reduce:transition-none motion-reduce:active:scale-100">
      <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
        <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
      </svg>
      New Project
    </button>
  </div>
</div>
```

**设计要点：**
- CTA 按钮与标题间距 `mt-6`（24px）——与 Section 内组件间距一致
- 按钮复用 Button Primary 全部样式（`rounded-lg` / `text-sm` / `font-semibold` / `active:scale-[0.97]`）
- 按钮内图标 `size-4`（16px）——与 Button 图标尺寸一致
- `motion-reduce` 覆盖到 `active:scale-100`——完整 reduced motion 支持

---

### 3. Inline（紧凑内嵌）

用于小区域空态——如图表卡片内、侧边栏列表、Dropdown 搜索结果为空。

```html
<!-- Empty State: Inline (compact) -->
<div class="flex flex-col items-center justify-center py-8 text-center">
  <svg class="size-8 text-gray-300 dark:text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5" aria-hidden="true">
    <path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z" />
  </svg>
  <p class="mt-3 text-sm text-gray-500 dark:text-gray-400">No results found</p>
</div>
```

**设计要点：**
- 图标 32px (`size-8`)——紧凑区域不需要 48px 图标
- `py-8`（32px）——比 Base 的一半，匹配小容器
- 无描述文字——紧凑场景下单行文字足够
- 省略 h3 标题——单行文字使用 `<p>`，语义更轻

---

### 4. Full Page（整页空态）

占据整个内容区域。用于首次使用——如新用户 Dashboard、空工作区。

```html
<!-- Empty State: Full Page -->
<div class="flex min-h-[400px] flex-col items-center justify-center px-4 text-center">
  <div class="mx-auto flex size-16 items-center justify-center rounded-full bg-gray-100 dark:bg-gray-800">
    <svg class="size-8 text-gray-400 dark:text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5" aria-hidden="true">
      <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6A2.25 2.25 0 016 3.75h2.25A2.25 2.25 0 0110.5 6v2.25a2.25 2.25 0 01-2.25 2.25H6a2.25 2.25 0 01-2.25-2.25V6zM3.75 15.75A2.25 2.25 0 016 13.5h2.25a2.25 2.25 0 012.25 2.25V18a2.25 2.25 0 01-2.25 2.25H6A2.25 2.25 0 013.75 18v-2.25zM13.5 6a2.25 2.25 0 012.25-2.25H18A2.25 2.25 0 0120.25 6v2.25A2.25 2.25 0 0118 10.5h-2.25a2.25 2.25 0 01-2.25-2.25V6zM13.5 15.75a2.25 2.25 0 012.25-2.25H18a2.25 2.25 0 012.25 2.25V18A2.25 2.25 0 0118 20.25h-2.25A2.25 2.25 0 0113.5 18v-2.25z" />
    </svg>
  </div>
  <h2 class="mt-6 text-base font-semibold text-gray-900 dark:text-gray-100">Welcome to your workspace</h2>
  <p class="mt-2 max-w-sm text-sm text-gray-500 dark:text-gray-400">You don't have any projects yet. Create one to start collaborating with your team.</p>
  <div class="mt-8 flex items-center gap-3">
    <button type="button" class="inline-flex items-center gap-2 rounded-lg bg-indigo-600 px-4 py-2 text-sm font-semibold text-white transition-colors duration-150 hover:bg-indigo-700 active:scale-[0.97] motion-reduce:transition-none motion-reduce:active:scale-100">
      <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
        <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
      </svg>
      Create Project
    </button>
    <button type="button" class="rounded-lg px-4 py-2 text-sm font-medium text-gray-700 transition-colors duration-150 hover:bg-gray-100 active:scale-[0.97] motion-reduce:transition-none motion-reduce:active:scale-100 dark:text-gray-300 dark:hover:bg-gray-800">
      Learn more →
    </button>
  </div>
</div>
```

**设计要点：**
- `min-h-[400px]` 保证整页视觉重量——不会在超高容器中显得单薄
- 图标容器 `rounded-full bg-gray-100`（64px）——品牌化的图标托盘，与 Base 的直接 SVG 区分
- 标题 `text-base font-semibold`——比 Base 标题大一级（16px vs 14px）
- 双按钮并排 `gap-3`（12px）——Primary CTA + Ghost 次要操作
- `max-w-sm`（384px）描述宽度——比 Base 的 `max-w-xs` 稍宽，适配更长的引导文案

---

## 图标语义

不同场景推荐不同图标，但保持同一设计原则。

| 场景 | 图标 | SVG Path | 语义 |
|------|------|---------|------|
| **通用无数据** | Inbox (收件箱) | `M20.25 7.5l-.625...` | 空容器——"还没有任何东西" |
| **搜索无结果** | Search (搜索) | `M21 21l-5.197...` | 搜索放大镜——"没找到匹配项" |
| **创建引导** | Plus Circle (加号圆) | `M12 9v6m3-3H9...` | 添加动作——"从这里开始创建" |
| **无消息/通知** | Bell (铃铛) | `M14.857 17.082...` | 通知——"暂无新消息" |
| **无文件/文档** | Document (文档) | `M19.5 14.25...` | 文档——"暂无文件" |
| **错误/加载失败** | Exclamation Triangle | `M12 9v3.75m-9.303...` | 警告——"加载失败，请重试" |
| **首次使用** | Grid (应用网格) | `M3.75 6A2.25...` | 仪表盘——"欢迎，从这里开始" |

---

## 尺寸

| Size | 图标 | 垂直 padding | 标题字号 | 适用场景 |
|------|------|-------------|---------|---------|
| **Inline** | `size-8` (32px) | `py-8` (32px) | `text-sm` / 无标题 | 图表卡片、Dropdown 空结果、侧边栏小列表 |
| **Base** | `size-12` (48px) | `py-16` (64px) | `text-sm font-medium` | Table 空态、Card 列表空态 |
| **Full Page** | `size-16` 容器 (64px 圆底) | `min-h-[400px]` | `text-base font-semibold` | 新用户 Dashboard、空工作区、Landing Page |

---

## Design Tokens

| Token | Light | Dark | Tailwind | 说明 |
|-------|-------|------|----------|------|
| 图标色 | `#D1D5DB` (gray-300) | `#4B5563` (gray-600) | `text-gray-300 dark:text-gray-600` | 次要视觉元素——不抢夺注意力 |
| 标题色 | `#111827` (gray-900) | `#F3F4F6` (gray-100) | `text-gray-900 dark:text-gray-100` | Primary——主信息 |
| 描述色 | `#6B7280` (gray-500) | `#9CA3AF` (gray-400) | `text-gray-500 dark:text-gray-400` | Secondary——辅助引导 |
| 图标托盘背景 | `#F3F4F6` (gray-100) | `#1F2937` (gray-800) | `bg-gray-100 dark:bg-gray-800` | Full Page 专用——图标容器底色 |
| 图标托盘尺寸 | 64px | 64px | `size-16` | Full Page 专用 |
| CTA 间距 | 24px | 24px | `mt-6` | 标题到按钮 |
| 按钮组间距 | 12px | 12px | `gap-3` | 双按钮并排 |
| 描述最大宽度 (Base) | 320px | 320px | `max-w-xs` | 防止超宽分散 |
| 描述最大宽度 (Full Page) | 384px | 384px | `max-w-sm` | 长引导文案需要更宽 |
| 过渡 | 150ms | 150ms | `transition-colors duration-150` | CTA 按钮交互 |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| 图标装饰性 | `aria-hidden="true"`——图标不含信息，避免重复朗读 |
| 语义标题 | 使用 `h2` / `h3` 而非 `div`——屏幕阅读器可导航 |
| 色彩对比度 | 标题 `gray-900` : 白底 = 16.7:1 (AAA) ✅ |
| 描述对比度 | `gray-500` : 白底 = 4.5:1 (AA) ✅ |
| 按钮标签 | 文字标签足够——不需要额外 `aria-label` |
| 减少动画 | 所有按钮含 `motion-reduce:transition-none motion-reduce:active:scale-100` |
| 键盘导航 | 按钮自动获得键盘焦点——无需额外处理 |
| 语言 | 使用有意义的英文文案——不使用 lorem ipsum |

---

## 状态总览

| 状态 | 表现 |
|------|------|
| **Default** | 图标 + 标题 + 描述（+ 可选 CTA） |
| **Hover (CTA)** | 按钮 hover 效果——`hover:bg-indigo-700` 或 `hover:bg-gray-100` |
| **Press (CTA)** | 按钮按下——`active:scale-[0.97]` |
| **Loading (CTA)** | 按钮可置为 loading 态——见 [Button](./button.md) Loading 变体 |

---

## 复用指南

### 何时使用 Empty State

| 场景 | 变体 | 说明 |
|------|------|------|
| 表格无数据 | Base | `colspan` 覆盖全行，居中展示 |
| 列表为空（只读） | Base | Card 列表无内容 |
| 列表为空（可编辑） | With Action | 提供创建入口 |
| 搜索无结果 | Inline | 紧凑提示——"No results found" |
| 图表无数据 | Inline | 图表卡片内嵌 |
| 新用户首次进入 | Full Page | 欢迎引导 + 双 CTA |
| 筛选后无匹配 | Inline | 建议配合"Clear filters"链接 |

### 何时不用 Empty State

| 场景 | 替代方案 | 原因 |
|------|---------|------|
| 加载中 | Skeleton / Spinner | 空态暗示"无数据"——加载中应用 Skeleton 占位 |
| 仅 1-2 条数据缺失 | 不处理 | 空态是全域占位——零星缺失不需要 |
| 需要复杂图文布局 | 自定义布局 | Empty State 保持简洁——不承载富文本/图片 |
| 错误状态 | Error State（带重试按钮） | 空 ≠ 错——错误态应有错误图标 + 重试操作 |

### 组合规则

```
✅ 表格空态使用 Base 变体 + colspan     → 覆盖整行，视觉完整
✅ 卡片内图表空态使用 Inline 变体        → 紧凑不抢戏
✅ 可编辑列表使用 With Action 变体       → 提供创建入口
✅ 新用户 Dashboard 使用 Full Page       → 引导 + 双按钮
❌ 空态内使用多个 CTA 按钮 (>2)          → 保持简洁——最多两个
❌ 空态图标使用彩色                      → gray-300 统一——不争夺注意力
❌ 空态标题超过一行                      → 简洁第一——过长文案放到描述
```

---

## 在 Table 中使用（内嵌示例）

```html
<!-- Table Empty State — 复用 Base 变体 -->
<tbody>
  <tr>
    <td colspan="5" class="px-4 py-16 text-center">
      <div class="flex flex-col items-center">
        <svg class="size-12 text-gray-300 dark:text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5" aria-hidden="true">
          <path stroke-linecap="round" stroke-linejoin="round" d="M20.25 7.5l-.625 10.632a2.25 2.25 0 01-2.247 2.118H6.622a2.25 2.25 0 01-2.247-2.118L3.75 7.5m6 4.125l2.25 2.25m0 0l2.25 2.25M12 13.875l2.25-2.25M12 13.875l-2.25 2.25M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125z" />
        </svg>
        <h3 class="mt-4 text-sm font-medium text-gray-900 dark:text-gray-100">No data</h3>
        <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">Get started by creating a new entry.</p>
      </div>
    </td>
  </tr>
</tbody>
```

---

> 参考: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Typography](../design-tokens/typography.md) · [Motion](../design-tokens/motion.md) · [Button](./button.md) · [Table](./table.md) · [Chart](./chart.md)
