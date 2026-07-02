# Pagination

分页组件用于在大量数据中导航。通常配合 [Table](./table.md) 使用，也可独立用于列表、搜索结果、卡片网格等需要分页的场景。

> **Design Tokens**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Typography](../design-tokens/typography.md) · [Motion](../design-tokens/motion.md)
>
> **关联组件**: [Table](./table.md)（主要搭配） · [Button](./button.md)（页码按钮复用 Ghost 交互模式） · [Select](./select.md)（每页条数选择器）
>
> **依赖**: 无外部依赖

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 过渡 | `transition-colors duration-150` | 见 [Motion Token](../design-tokens/motion.md)——禁止 `transition-all`，禁止自定义时长 |
| 按钮形状 | `rounded-lg` (8px) | 与 Button / Badge 一致——交互元素统一 8px 圆角 |
| 激活页背景 | `bg-indigo-600` + `text-white` | 与 Button Primary 一致——当前页 = 最高视觉权重 |
| 非激活页 Hover | `hover:bg-gray-100` | 与 Button Ghost 一致——轻量交互反馈 |
| 禁用态 | `opacity-50` + `cursor-not-allowed` | 与 Button / Input 禁用态一致 |
| 字号 | `text-sm` (14px) | UI 正文标准——与 Button label 一致 |
| 数字宽度 | `tabular-nums` | 等宽数字——切换页码时布局不抖动 |
| 间距 | `gap-1` (4px) | 页码之间紧凑排列——相邻按钮的关联性强 |
| 最大显示页数 | 7 个按钮（含省略号） | 业界共识——1 ... 4 [5] 6 ... 10，覆盖 99% 场景 |
| 移动端 | 仅显示 Prev/Next（隐藏页码） | 小屏空间有限——精简为核心导航操作 |

---

## 变体

### 1. Base（标准分页）

最常用的分页。页码按钮 + 上一页/下一页 + 省略号。

```html
<!-- Pagination: Base -->
<nav aria-label="Pagination" class="flex items-center justify-between">
  <!-- Page info (optional) -->
  <p class="text-sm text-gray-500 dark:text-gray-400">
    Showing <span class="font-medium text-gray-900 dark:text-gray-100">1</span>
    to <span class="font-medium text-gray-900 dark:text-gray-100">10</span>
    of <span class="font-medium text-gray-900 dark:text-gray-100">97</span> results
  </p>

  <!-- Page buttons -->
  <ol class="flex items-center gap-1">
    <!-- Previous — Disabled when on first page -->
    <li>
      <button type="button"
        class="inline-flex items-center gap-1 rounded-lg px-2 py-1.5 text-sm font-medium text-gray-500 transition-colors duration-150 hover:bg-gray-100 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:bg-gray-800 dark:hover:text-gray-300"
        disabled
        aria-label="Previous page">
        <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
          <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 19.5L8.25 12l7.5-7.5" />
        </svg>
        <span class="hidden sm:inline">Prev</span>
      </button>
    </li>

    <!-- Page 1 — Active -->
    <li>
      <button type="button"
        class="rounded-lg bg-indigo-600 px-3 py-1.5 text-sm font-semibold text-white transition-colors duration-150 hover:bg-indigo-700 motion-reduce:transition-none dark:bg-indigo-500 dark:hover:bg-indigo-600"
        aria-current="page"
        aria-label="Page 1">
        1
      </button>
    </li>

    <!-- Page 2 -->
    <li>
      <button type="button"
        class="rounded-lg px-3 py-1.5 text-sm font-medium text-gray-700 tabular-nums transition-colors duration-150 hover:bg-gray-100 motion-reduce:transition-none dark:text-gray-300 dark:hover:bg-gray-800"
        aria-label="Page 2">
        2
      </button>
    </li>

    <!-- Page 3 -->
    <li>
      <button type="button"
        class="rounded-lg px-3 py-1.5 text-sm font-medium text-gray-700 tabular-nums transition-colors duration-150 hover:bg-gray-100 motion-reduce:transition-none dark:text-gray-300 dark:hover:bg-gray-800"
        aria-label="Page 3">
        3
      </button>
    </li>

    <!-- Ellipsis -->
    <li>
      <span class="flex size-8 items-center justify-center text-sm text-gray-400 dark:text-gray-500" aria-hidden="true">
        &hellip;
      </span>
    </li>

    <!-- Page 10 -->
    <li>
      <button type="button"
        class="rounded-lg px-3 py-1.5 text-sm font-medium text-gray-700 tabular-nums transition-colors duration-150 hover:bg-gray-100 motion-reduce:transition-none dark:text-gray-300 dark:hover:bg-gray-800"
        aria-label="Page 10">
        10
      </button>
    </li>

    <!-- Next -->
    <li>
      <button type="button"
        class="inline-flex items-center gap-1 rounded-lg px-2 py-1.5 text-sm font-medium text-gray-700 transition-colors duration-150 hover:bg-gray-100 motion-reduce:transition-none dark:text-gray-300 dark:hover:bg-gray-800"
        aria-label="Next page">
        <span class="hidden sm:inline">Next</span>
        <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
          <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5" />
        </svg>
      </button>
    </li>
  </ol>
</nav>
```

**设计要点：**
- `<nav aria-label="Pagination">` — 语义化导航，屏幕阅读器可识别为分页区域
- `<ol>` — 页码有序列表，传达页码顺序语义
- `aria-current="page"` — 标记当前页，屏幕阅读器朗读 "Page 1, current page"
- `aria-label="Page N"` — 每个按钮有明确标签
- Prev 按钮 `disabled` — 当位于第一页时禁用
- `gap-1` (4px) — 页码按钮紧凑间距
- 激活页 `font-semibold` — 比非激活 `font-medium` 重一级
- `sm:inline` — 移动端隐藏 Prev/Next 文字，仅保留图标
- `tabular-nums` — 等宽数字防止切换时布局抖动

---

### 2. Simple（简单分页）

仅 Prev / Next 按钮 + 页码指示器。适用于内容流（如博客列表、时间线）。

```html
<!-- Pagination: Simple -->
<nav aria-label="Pagination" class="flex items-center justify-between">
  <button type="button"
    class="inline-flex items-center gap-1.5 rounded-lg px-3 py-2 text-sm font-medium text-gray-700 transition-colors duration-150 hover:bg-gray-100 motion-reduce:transition-none dark:text-gray-300 dark:hover:bg-gray-800">
    <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
      <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 19.5L8.25 12l7.5-7.5" />
    </svg>
    Previous
  </button>

  <span class="text-sm text-gray-500 dark:text-gray-400">
    Page <span class="font-medium text-gray-900 dark:text-gray-100">2</span> of <span class="font-medium text-gray-900 dark:text-gray-100">10</span>
  </span>

  <button type="button"
    class="inline-flex items-center gap-1.5 rounded-lg px-3 py-2 text-sm font-medium text-gray-700 transition-colors duration-150 hover:bg-gray-100 motion-reduce:transition-none dark:text-gray-300 dark:hover:bg-gray-800">
    Next
    <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
      <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5" />
    </svg>
  </button>
</nav>
```

**设计要点：**
- 无页码按钮——仅 Prev / Next + 当前位置文字
- 中间文字 `Page 2 of 10` 提供位置信息
- 不使用 `<ol>` —— 无页码列表，简化语义
- 按钮 padding `px-3 py-2` — 比 Base 的 `px-2 py-1.5` 稍大（按钮文字更长）

---

### 3. Compact（紧凑分页）

专为移动端或侧边栏等窄空间设计。仅显示核心导航元素。

```html
<!-- Pagination: Compact (mobile) -->
<nav aria-label="Pagination" class="flex items-center justify-center gap-2">
  <button type="button"
    class="inline-flex size-8 items-center justify-center rounded-lg text-gray-500 transition-colors duration-150 hover:bg-gray-100 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:bg-gray-800 dark:hover:text-gray-300"
    disabled
    aria-label="Previous page">
    <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
      <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 19.5L8.25 12l7.5-7.5" />
    </svg>
  </button>

  <span class="min-w-[3ch] text-center text-sm font-medium tabular-nums text-gray-900 dark:text-gray-100">
    2
  </span>
  <span class="text-sm text-gray-400 dark:text-gray-500">/</span>
  <span class="text-sm tabular-nums text-gray-500 dark:text-gray-400">10</span>

  <button type="button"
    class="inline-flex size-8 items-center justify-center rounded-lg text-gray-700 transition-colors duration-150 hover:bg-gray-100 motion-reduce:transition-none dark:text-gray-300 dark:hover:bg-gray-800"
    aria-label="Next page">
    <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
      <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5" />
    </svg>
  </button>
</nav>
```

**设计要点：**
- `size-8` (32px) 方形图标按钮 — 触控友好
- `2 / 10` 数字指示器替代页码列表
- `min-w-[3ch]` — 当前页数字最小宽度，两位数不挤压
- `tabular-nums` — 切换时宽度稳定

---

### 4. With Page Size（含每页条数选择器）

分页 + 每页条数下拉。用于数据密集型页面（如管理后台表格）。

```html
<!-- Pagination: With Page Size -->
<nav aria-label="Pagination" class="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
  <!-- Left: Page size selector -->
  <div class="flex items-center gap-2">
    <label for="page-size" class="text-sm text-gray-500 dark:text-gray-400">Show</label>
    <select id="page-size" name="page-size"
      class="rounded-lg bg-white px-2.5 py-1.5 text-sm text-gray-700
        inset-ring inset-ring-gray-950/8
        focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10
        dark:bg-gray-900 dark:text-gray-300 dark:inset-ring-white/10
        dark:focus:inset-ring-white/20 dark:focus:ring-white/10
        transition-colors duration-150
        motion-reduce:transition-none">
      <option value="10">10</option>
      <option value="25">25</option>
      <option value="50">50</option>
      <option value="100">100</option>
    </select>
    <span class="text-sm text-gray-500 dark:text-gray-400">per page</span>
  </div>

  <!-- Right: Page buttons + info -->
  <div class="flex items-center gap-3">
    <p class="text-sm text-gray-500 dark:text-gray-400">
      <span class="font-medium text-gray-900 dark:text-gray-100">1–10</span> of <span class="font-medium text-gray-900 dark:text-gray-100">97</span>
    </p>

    <ol class="flex items-center gap-1">
      <li>
        <button type="button"
          class="inline-flex size-8 items-center justify-center rounded-lg text-gray-500 transition-colors duration-150 hover:bg-gray-100 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:bg-gray-800 dark:hover:text-gray-300"
          disabled
          aria-label="Previous page">
          <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 19.5L8.25 12l7.5-7.5" />
          </svg>
        </button>
      </li>

      <li>
        <button type="button"
          class="rounded-lg bg-indigo-600 px-3 py-1.5 text-sm font-semibold text-white transition-colors duration-150 hover:bg-indigo-700 motion-reduce:transition-none dark:bg-indigo-500 dark:hover:bg-indigo-600"
          aria-current="page"
          aria-label="Page 1">1</button>
      </li>

      <li>
        <button type="button"
          class="rounded-lg px-3 py-1.5 text-sm font-medium text-gray-700 tabular-nums transition-colors duration-150 hover:bg-gray-100 motion-reduce:transition-none dark:text-gray-300 dark:hover:bg-gray-800"
          aria-label="Page 2">2</button>
      </li>

      <li>
        <button type="button"
          class="rounded-lg px-3 py-1.5 text-sm font-medium text-gray-700 tabular-nums transition-colors duration-150 hover:bg-gray-100 motion-reduce:transition-none dark:text-gray-300 dark:hover:bg-gray-800"
          aria-label="Page 3">3</button>
      </li>

      <li>
        <span class="flex size-8 items-center justify-center text-sm text-gray-400 dark:text-gray-500" aria-hidden="true">&hellip;</span>
      </li>

      <li>
        <button type="button"
          class="rounded-lg px-3 py-1.5 text-sm font-medium text-gray-700 tabular-nums transition-colors duration-150 hover:bg-gray-100 motion-reduce:transition-none dark:text-gray-300 dark:hover:bg-gray-800"
          aria-label="Page 10">10</button>
      </li>

      <li>
        <button type="button"
          class="inline-flex size-8 items-center justify-center rounded-lg text-gray-700 transition-colors duration-150 hover:bg-gray-100 motion-reduce:transition-none dark:text-gray-300 dark:hover:bg-gray-800"
          aria-label="Next page">
          <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5" />
          </svg>
        </button>
      </li>
    </ol>
  </div>
</nav>
```

**设计要点：**
- Select 复用 Input/Select 的全部表单 Token——`inset-ring` / `focus:ring-2` / `rounded-lg`
- `sm:flex-row` —— 移动端上下堆叠，桌面端水平排列
- 每页条数选项：10 / 25 / 50 / 100——覆盖常见数据密度
- 信息文字 `1–10 of 97` —— 使用 en dash (–) 而非 hyphen (-)

---

## 省略号生成逻辑

分页计算的核心——决定何时显示省略号、显示多少页码。

```
总页数 ≤ 7:
  显示全部页码——无需省略号
  [1] [2] [3] [4] [5] [6] [7]

总页数 > 7, 当前页 ≤ 4:
  省略号在右侧
  [1] [2] [3] [4] [5] ... [10]

总页数 > 7, 当前页 ≥ 总页数 - 3:
  省略号在左侧
  [1] ... [6] [7] [8] [9] [10]

总页数 > 7, 当前页在中间:
  两端省略号
  [1] ... [4] [5] [6] ... [10]
```

| 规则 | 说明 |
|------|------|
| 始终显示第一页和最后一页 | 用户需要知道范围边界 |
| 始终显示当前页 ±1 的页码 | 前后导航必须可见 |
| 省略号使用 `&hellip;` | HTML 实体，非三个点号 |
| 省略号不可点击 | `<span>` 非 `<button>`——纯视觉元素 |
| 省略号 `aria-hidden="true"` | 屏幕阅读器不需要朗读省略号 |

---

## 交互行为

| 操作 | 行为 |
|------|------|
| 点击页码 | 跳转到该页，该页码变为激活态 |
| 点击 Prev | 跳转到上一页；若在第一页则 disabled |
| 点击 Next | 跳转到下一页；若在最后一页则 disabled |
| 键盘 Left Arrow | 焦点在页码按钮间移动 |
| 键盘 Enter/Space | 激活焦点所在的页码按钮 |
| 更改每页条数 | 重置到第一页（防止当前页超出新总页数） |
| 响应式断点 | `< sm` (640px) → Base 隐藏页码（仅 Prev/Next）；≥ sm → 完整显示 |

---

## 状态总览

| 状态 | 页码按钮 | Prev | Next |
|------|---------|------|------|
| **Default (第 N 页)** | 非激活页: `text-gray-700` / 激活页: `bg-indigo-600 text-white` | 可用 | 可用 |
| **First Page** | 第 1 页激活 | `disabled` (`opacity-50`) | 可用 |
| **Last Page** | 最后一页激活 | 可用 | `disabled` (`opacity-50`) |
| **Single Page** | 总页数 = 1——整个分页隐藏（不渲染） | — | — |
| **Hover (非激活)** | `hover:bg-gray-100` | `hover:bg-gray-100` | `hover:bg-gray-100` |
| **Hover (激活)** | `hover:bg-indigo-700` | — | — |
| **Focus** | 浏览器默认 focus ring（`focus-visible:ring-2`） | 同 | 同 |

---

## 尺寸

| Size | 按钮 padding | 字号 | 最小高度 | 用途 |
|------|-------------|------|---------|------|
| **md** (默认) | `px-3 py-1.5` | `text-sm` | 36px | 标准桌面端 |
| **sm** (紧凑) | `size-8` (32px) | `text-sm` | 32px | Compact 变体、侧边栏 |

> Pagination 不提供 lg 尺寸——分页是辅助导航，不应抢夺主内容视觉权重。需要更大点击区域的场景使用默认 md（36px 已满足 WCAG 2.5.5 的 44px 触控建议——通过相邻间距补偿）。

---

## Design Tokens

| Token | Light | Dark | Tailwind | 说明 |
|-------|-------|------|----------|------|
| 过渡 | 150ms | 150ms | `transition-colors duration-150` | 见 Motion Token |
| 按钮圆角 | 8px | 8px | `rounded-lg` | 交互元素统一 |
| 按钮间距 | 4px | 4px | `gap-1` | 页码之间紧凑 |
| 激活背景 | `indigo-600` | `indigo-500` | `bg-indigo-600` | 品牌色 |
| 激活文字 | `white` | `white` | `text-white` | On Brand |
| 激活字重 | 600 | 600 | `font-semibold` | 比非激活重一级 |
| 非激活文字 | `gray-700` | `gray-300` | — | Body |
| 非激活字重 | 500 | 500 | `font-medium` | UI 标签标准 |
| 非激活 Hover 背景 | `gray-100` | `gray-800` | `hover:bg-gray-100` | Ghost 按钮标准 |
| 禁用透明度 | 50% | 50% | `opacity-50` | — |
| Prev/Next 图标尺寸 | 16px | 16px | `size-4` | — |
| 省略号颜色 | `gray-400` | `gray-500` | — | Disabled 色 |
| 信息文字颜色 | `gray-500` | `gray-400` | — | Secondary |
| 信息数字颜色 | `gray-900` | `gray-100` | — | Primary（数据强调） |
| 数字宽度 | 等宽 | 等宽 | `tabular-nums` | 防止抖动 |
| Select 样式 | 复用 Input Token | 复用 Input Token | — | 见 Input 组件 |
| 移动端隐藏文字 | — | — | `hidden sm:inline` | Prev/Next 标签 |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| 导航语义 | `<nav aria-label="Pagination">` — 屏幕阅读器识别为导航区域 |
| 页码列表 | `<ol>` — 传达顺序语义 |
| 当前页标记 | `aria-current="page"` — 屏幕阅读器朗读 "current page" |
| 按钮标签 | `aria-label="Page N"` / `aria-label="Previous page"` / `aria-label="Next page"` |
| 禁用态 | `disabled` 属性——按钮从 Tab 顺序中移除 |
| 省略号 | `aria-hidden="true"` — 纯装饰，不朗读 |
| 键盘导航 | 原生 `<button>` 支持 Enter/Space；Tab 在按钮间移动 |
| 图标装饰 | `aria-hidden="true"` — SVG 图标不朗读 |
| 焦点可见 | 浏览器默认 `focus-visible` ring |
| Select 标签 | `<label for="page-size">` 关联下拉 |
| 减少动画 | `motion-reduce:transition-none` |
| 单页隐藏 | 总页数 ≤ 1 时不渲染分页——避免无意义导航 |
| 颜色对比度 | 激活页: `indigo-600` : `white` = 6.54:1 (AA) ✅ |
| 颜色对比度 | 非激活: `gray-700` : `white` = 7.1:1 (AAA) ✅ |

---

## 在 Table 中使用

```html
<!-- Table + Pagination 组合 -->
<div class="overflow-hidden rounded-xl inset-ring inset-ring-gray-950/8 dark:inset-ring-white/10">
  <table class="w-full">
    <!-- table content -->
  </table>

  <!-- Pagination bar — attached to table bottom -->
  <div class="border-t border-gray-950/5 px-4 py-3 dark:border-white/5">
    <!-- Pagination: With Page Size 变体 -->
    <nav aria-label="Pagination" class="flex items-center justify-between">
      <!-- ... -->
    </nav>
  </div>
</div>
```

**设计要点：**
- 分页栏贴在 Table 底部——`border-t` 分隔表体与分页
- `px-4 py-3` — 与 Table 单元格内边距对齐
- Table 容器 `rounded-xl` 包裹整个 Table + Pagination——分页也享受圆角

---

## 复用指南

### 何时使用 Pagination

- 表格数据超过 10 行
- 列表/搜索结果需要分页加载
- 卡片网格内容过多
- 管理后台的数据列表

### 何时不用 Pagination

| 场景 | 替代方案 | 原因 |
|------|---------|------|
| 数据量 < 10 条 | 不分页 | 分页的交互成本超过收益 |
| 无限滚动内容流 | Infinite Scroll / "Load More" | 探索式浏览——如社交媒体、图片网格 |
| 总数未知 | "Load More" 按钮 | Pagination 需要知道总页数 |
| 移动端 + 大量页码 | Compact 变体 | 小屏隐藏页码，仅 Prev/Next |

### 组合规则

```
✅ Table + Pagination          → border-t 分隔，贴底布局
✅ Pagination + Page Size      → Select 复用 Input Token
✅ Mobile (< 640px)            → Compact 变体（仅 Prev/Next + 数字指示器）
✅ 总页数 ≤ 7                  → 显示全部页码，无省略号
✅ 单页                        → 不渲染分页
❌ Pagination 独立使用无导航语义 → 始终包裹在 <nav aria-label="...">
❌ 激活页使用 opacity 区分       → 使用背景色 + 字重区分（opacity 太弱）
```

---

> 参考: [Colors](../design-tokens/colors.md) · [Typography](../design-tokens/typography.md) · [Motion](../design-tokens/motion.md) · [Button](./button.md) · [Select](./select.md) · [Table](./table.md)
