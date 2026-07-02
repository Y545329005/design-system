# Table

Table 是数据表格组件，用于展示结构化数据集。支持排序、多选、行操作和响应式适配。Status 列复用 [Badge](./badge.md) 语义色，Action 列复用 [Button](./button.md) Ghost 紧凑变体。

> **Design Tokens**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Elevation](../design-tokens/elevation.md)
>
> **关联组件**: [Badge](./badge.md)（Status 列）· [Button](./button.md)（Action 列）· [Checkbox](./checkbox.md)（多选模式）
>
> **依赖**: 无额外依赖

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 描边 | `inset-ring` 容器 + `border-b` 行分隔 | 表格的 data-heavy 特性不适合只有 inset-ring 容器——行需要视觉分隔 |
| 行分隔 | `border-gray-950/5` | 透明度方案，最轻的分隔线 |
| hover 行 | `bg-gray-50/50` | 与 Card hover 一致，微暖背景引导视线 |
| 表头 | `bg-gray-50` + `text-xs font-medium uppercase` | 区分表头与数据行，大写增加扫描性 |
| 字体 | 数据行 `text-sm` | 与全局正文一致，保持可读性 |
| 内边距 | `px-4 py-3` | 行高 44px，舒适的点击/阅读区域 |
| 圆角 | `rounded-xl` | 容器圆角——与 Card 一致 |
| Status 列 | 复用 [Badge](./badge.md) Solid 变体 | 语义色完全复用 |
| Action 列 | 复用 [Button](./button.md) Ghost sm 变体 | 紧凑版，`p-1.5` 而非 `py-2 px-3` |
| 响应式 | 移动端横向滚动 | 表格不适合卡片堆叠——保持行列结构 |

---

## 变体

### 1. Base Table — 基础表格

最常用的数据表格。表头 + 数据行 + 行分隔线。

```html
<div class="overflow-hidden rounded-xl bg-white
  inset-ring inset-ring-gray-950/8
  dark:bg-gray-900 dark:inset-ring-white/10">
  <div class="overflow-x-auto">
    <table class="w-full text-left text-sm">
      <thead>
        <tr class="border-b border-gray-950/5 bg-gray-50 dark:border-white/5 dark:bg-gray-800/50">
          <th class="px-4 py-3 text-xs font-medium uppercase tracking-wider text-gray-500 dark:text-gray-400">
            Name
          </th>
          <th class="px-4 py-3 text-xs font-medium uppercase tracking-wider text-gray-500 dark:text-gray-400">
            Role
          </th>
          <th class="px-4 py-3 text-xs font-medium uppercase tracking-wider text-gray-500 dark:text-gray-400">
            Status
          </th>
          <th class="px-4 py-3 text-xs font-medium uppercase tracking-wider text-gray-500 dark:text-gray-400">
            Joined
          </th>
          <th class="relative px-4 py-3">
            <span class="sr-only">Actions</span>
          </th>
        </tr>
      </thead>
      <tbody class="divide-y divide-gray-950/5 dark:divide-white/5">
        <tr class="transition-colors duration-150 hover:bg-gray-50/50 dark:hover:bg-gray-800/50 motion-reduce:transition-none">
          <td class="px-4 py-3 text-sm font-medium text-gray-900 dark:text-gray-100">
            Alex Chen
          </td>
          <td class="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">
            Product Designer
          </td>
          <td class="px-4 py-3">
            <span class="inline-flex items-center rounded-lg bg-green-50 px-2 py-0.5 text-xs font-medium text-green-700 dark:bg-green-900/30 dark:text-green-400">
              Active
            </span>
          </td>
          <td class="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">
            Jun 15, 2026
          </td>
          <td class="px-4 py-3 text-right">
            <button type="button"
              class="rounded-lg p-1.5 text-gray-400 transition-colors duration-150 hover:bg-gray-100 hover:text-gray-600 dark:text-gray-500 dark:hover:bg-gray-800 dark:hover:text-gray-300 motion-reduce:transition-none"
              aria-label="Edit Alex Chen">
              <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0115.75 21H5.25A2.25 2.25 0 013 18.75V8.25A2.25 2.25 0 015.25 6H10" />
              </svg>
            </button>
          </td>
        </tr>
        <tr class="transition-colors duration-150 hover:bg-gray-50/50 dark:hover:bg-gray-800/50 motion-reduce:transition-none">
          <td class="px-4 py-3 text-sm font-medium text-gray-900 dark:text-gray-100">
            Sarah Kim
          </td>
          <td class="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">
            Frontend Engineer
          </td>
          <td class="px-4 py-3">
            <span class="inline-flex items-center rounded-lg bg-green-50 px-2 py-0.5 text-xs font-medium text-green-700 dark:bg-green-900/30 dark:text-green-400">
              Active
            </span>
          </td>
          <td class="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">
            Mar 3, 2026
          </td>
          <td class="px-4 py-3 text-right">
            <button type="button"
              class="rounded-lg p-1.5 text-gray-400 transition-colors duration-150 hover:bg-gray-100 hover:text-gray-600 dark:text-gray-500 dark:hover:bg-gray-800 dark:hover:text-gray-300 motion-reduce:transition-none"
              aria-label="Edit Sarah Kim">
              <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0115.75 21H5.25A2.25 2.25 0 013 18.75V8.25A2.25 2.25 0 015.25 6H10" />
              </svg>
            </button>
          </td>
        </tr>
        <tr class="transition-colors duration-150 hover:bg-gray-50/50 dark:hover:bg-gray-800/50 motion-reduce:transition-none">
          <td class="px-4 py-3 text-sm font-medium text-gray-900 dark:text-gray-100">
            James Wilson
          </td>
          <td class="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">
            Backend Engineer
          </td>
          <td class="px-4 py-3">
            <span class="inline-flex items-center rounded-lg bg-amber-50 px-2 py-0.5 text-xs font-medium text-amber-700 dark:bg-amber-900/30 dark:text-amber-400">
              Pending
            </span>
          </td>
          <td class="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">
            Jul 1, 2026
          </td>
          <td class="px-4 py-3 text-right">
            <button type="button"
              class="rounded-lg p-1.5 text-gray-400 transition-colors duration-150 hover:bg-gray-100 hover:text-gray-600 dark:text-gray-500 dark:hover:bg-gray-800 dark:hover:text-gray-300 motion-reduce:transition-none"
              aria-label="Edit James Wilson">
              <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0115.75 21H5.25A2.25 2.25 0 013 18.75V8.25A2.25 2.25 0 015.25 6H10" />
              </svg>
            </button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
```

**设计要点：**
- 外层容器 `rounded-xl` + `inset-ring`——与 Card 容器一致
- 内层 `overflow-x-auto`——移动端横向滚动，表头与数据行同步滚动
- 表头 `bg-gray-50` + `text-xs uppercase tracking-wider`——明显的表头/数据区分
- `divide-y divide-gray-950/5`——行之间的轻分隔
- 数据行 hover `bg-gray-50/50`——与 Card hover 一致的微暖反馈
- Action 列 `p-1.5` (6px)——紧凑版 Button Ghost，小于标准 Ghost (`p-2`)
- 第一列 `font-medium`——名称/标识符列加粗，引导视线
- Action 列表头 `<span class="sr-only">Actions</span>`——视觉隐藏但可访问

---

### 2. Striped — 斑马纹表格

交替行背景色，适合宽表格（列数多、数据密集），帮助视线追踪水平行。

```html
<div class="overflow-hidden rounded-xl bg-white
  inset-ring inset-ring-gray-950/8
  dark:bg-gray-900 dark:inset-ring-white/10">
  <div class="overflow-x-auto">
    <table class="w-full text-left text-sm">
      <thead>
        <tr class="border-b border-gray-950/5 bg-gray-50 dark:border-white/5 dark:bg-gray-800/50">
          <th class="px-4 py-3 text-xs font-medium uppercase tracking-wider text-gray-500 dark:text-gray-400">Name</th>
          <th class="px-4 py-3 text-xs font-medium uppercase tracking-wider text-gray-500 dark:text-gray-400">Role</th>
          <th class="px-4 py-3 text-xs font-medium uppercase tracking-wider text-gray-500 dark:text-gray-400">Status</th>
        </tr>
      </thead>
      <tbody>
        <tr class="transition-colors duration-150 hover:bg-gray-100/50 dark:hover:bg-gray-800/50 motion-reduce:transition-none">
          <td class="px-4 py-3 text-sm font-medium text-gray-900 dark:text-gray-100">Alex Chen</td>
          <td class="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">Product Designer</td>
          <td class="px-4 py-3"><span class="inline-flex items-center rounded-lg bg-green-50 px-2 py-0.5 text-xs font-medium text-green-700 dark:bg-green-900/30 dark:text-green-400">Active</span></td>
        </tr>
        <tr class="bg-gray-50/50 transition-colors duration-150 hover:bg-gray-100/50 dark:bg-gray-800/30 dark:hover:bg-gray-800/50 motion-reduce:transition-none">
          <td class="px-4 py-3 text-sm font-medium text-gray-900 dark:text-gray-100">Sarah Kim</td>
          <td class="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">Frontend Engineer</td>
          <td class="px-4 py-3"><span class="inline-flex items-center rounded-lg bg-green-50 px-2 py-0.5 text-xs font-medium text-green-700 dark:bg-green-900/30 dark:text-green-400">Active</span></td>
        </tr>
        <tr class="transition-colors duration-150 hover:bg-gray-100/50 dark:hover:bg-gray-800/50 motion-reduce:transition-none">
          <td class="px-4 py-3 text-sm font-medium text-gray-900 dark:text-gray-100">James Wilson</td>
          <td class="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">Backend Engineer</td>
          <td class="px-4 py-3"><span class="inline-flex items-center rounded-lg bg-amber-50 px-2 py-0.5 text-xs font-medium text-amber-700 dark:bg-amber-900/30 dark:text-amber-400">Pending</span></td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
```

**设计要点：**
- 奇数行默认白底，偶数行 `bg-gray-50/50`——斑马纹
- hover 时统一加深至 `bg-gray-100/50`——hover 优先级高于 stripe
- 适合 ≥ 5 列的场景——斑马纹在宽表格中最有效

---

### 3. With Actions — 带行操作

在 Base Table 基础上添加多操作列（编辑/删除/更多）。适用于数据管理界面。

```html
<div class="overflow-hidden rounded-xl bg-white
  inset-ring inset-ring-gray-950/8
  dark:bg-gray-900 dark:inset-ring-white/10">
  <div class="overflow-x-auto">
    <table class="w-full text-left text-sm">
      <thead>
        <tr class="border-b border-gray-950/5 bg-gray-50 dark:border-white/5 dark:bg-gray-800/50">
          <th class="px-4 py-3 text-xs font-medium uppercase tracking-wider text-gray-500 dark:text-gray-400">Name</th>
          <th class="px-4 py-3 text-xs font-medium uppercase tracking-wider text-gray-500 dark:text-gray-400">Role</th>
          <th class="px-4 py-3 text-xs font-medium uppercase tracking-wider text-gray-500 dark:text-gray-400">Status</th>
          <th class="relative px-4 py-3"><span class="sr-only">Actions</span></th>
        </tr>
      </thead>
      <tbody class="divide-y divide-gray-950/5 dark:divide-white/5">
        <tr class="transition-colors duration-150 hover:bg-gray-50/50 dark:hover:bg-gray-800/50 motion-reduce:transition-none">
          <td class="px-4 py-3 text-sm font-medium text-gray-900 dark:text-gray-100">Alex Chen</td>
          <td class="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">Product Designer</td>
          <td class="px-4 py-3">
            <span class="inline-flex items-center rounded-lg bg-green-50 px-2 py-0.5 text-xs font-medium text-green-700 dark:bg-green-900/30 dark:text-green-400">Active</span>
          </td>
          <td class="px-4 py-3">
            <div class="flex items-center justify-end gap-1">
              <!-- Edit (Ghost sm) -->
              <button type="button"
                class="rounded-lg p-1.5 text-gray-400 transition-colors duration-150 hover:bg-gray-100 hover:text-gray-600 dark:text-gray-500 dark:hover:bg-gray-800 dark:hover:text-gray-300 motion-reduce:transition-none"
                aria-label="Edit Alex Chen">
                <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0115.75 21H5.25A2.25 2.25 0 013 18.75V8.25A2.25 2.25 0 015.25 6H10" />
                </svg>
              </button>
              <!-- Delete (Danger Ghost sm) -->
              <button type="button"
                class="rounded-lg p-1.5 text-gray-400 transition-colors duration-150 hover:bg-red-50 hover:text-red-600 dark:text-gray-500 dark:hover:bg-red-900/30 dark:hover:text-red-400 motion-reduce:transition-none"
                aria-label="Delete Alex Chen">
                <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0" />
                </svg>
              </button>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
```

**设计要点：**
- Actions 容器 `flex items-center justify-end gap-1`——右对齐，紧凑排列
- Edit 使用标准 Ghost sm（灰色图标）
- Delete 使用 Danger Ghost sm——仅在 hover 时变红（`hover:bg-red-50 hover:text-red-600`）
- 每个按钮必须有描述性 `aria-label`

---

### 4. With Checkbox — 多选表格

在 Base Table 基础上添加选择框列。使用 [Checkbox](./checkbox.md) 组件。

```html
<div class="overflow-hidden rounded-xl bg-white
  inset-ring inset-ring-gray-950/8
  dark:bg-gray-900 dark:inset-ring-white/10">
  <div class="overflow-x-auto">
    <table class="w-full text-left text-sm">
      <thead>
        <tr class="border-b border-gray-950/5 bg-gray-50 dark:border-white/5 dark:bg-gray-800/50">
          <!-- Select All Checkbox -->
          <th class="w-10 px-4 py-3">
            <label class="flex cursor-pointer items-center">
              <input type="checkbox" class="peer sr-only" />
              <span class="flex size-4 items-center justify-center rounded border border-gray-300 bg-white transition-colors duration-150 peer-checked:border-indigo-600 peer-checked:bg-indigo-600 peer-focus-visible:outline-2 peer-focus-visible:outline-offset-2 peer-focus-visible:outline-indigo-600 dark:border-gray-600 dark:bg-gray-900 dark:peer-checked:border-indigo-500 dark:peer-checked:bg-indigo-500 motion-reduce:transition-none" aria-hidden="true">
                <svg class="size-3 text-white opacity-0 peer-checked:opacity-100" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="3" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5"/></svg>
              </span>
            </label>
          </th>
          <th class="px-4 py-3 text-xs font-medium uppercase tracking-wider text-gray-500 dark:text-gray-400">Name</th>
          <th class="px-4 py-3 text-xs font-medium uppercase tracking-wider text-gray-500 dark:text-gray-400">Role</th>
          <th class="px-4 py-3 text-xs font-medium uppercase tracking-wider text-gray-500 dark:text-gray-400">Status</th>
        </tr>
      </thead>
      <tbody class="divide-y divide-gray-950/5 dark:divide-white/5">
        <tr class="transition-colors duration-150 hover:bg-gray-50/50 dark:hover:bg-gray-800/50 motion-reduce:transition-none">
          <td class="px-4 py-3">
            <label class="flex cursor-pointer items-center">
              <input type="checkbox" class="peer sr-only" />
              <span class="flex size-4 items-center justify-center rounded border border-gray-300 bg-white transition-colors duration-150 peer-checked:border-indigo-600 peer-checked:bg-indigo-600 peer-focus-visible:outline-2 peer-focus-visible:outline-offset-2 peer-focus-visible:outline-indigo-600 dark:border-gray-600 dark:bg-gray-900 dark:peer-checked:border-indigo-500 dark:peer-checked:bg-indigo-500 motion-reduce:transition-none" aria-hidden="true">
                <svg class="size-3 text-white opacity-0 peer-checked:opacity-100" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="3" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5"/></svg>
              </span>
            </label>
          </td>
          <td class="px-4 py-3 text-sm font-medium text-gray-900 dark:text-gray-100">Alex Chen</td>
          <td class="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">Product Designer</td>
          <td class="px-4 py-3">
            <span class="inline-flex items-center rounded-lg bg-green-50 px-2 py-0.5 text-xs font-medium text-green-700 dark:bg-green-900/30 dark:text-green-400">Active</span>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  <!-- Batch Action Bar（选中后显示） -->
  <div class="hidden border-t border-gray-950/5 bg-gray-50 px-4 py-3 dark:border-white/5 dark:bg-gray-800/50" id="batch-bar">
    <div class="flex items-center justify-between">
      <p class="text-sm text-gray-600 dark:text-gray-400">
        <span id="selected-count">0</span> selected
      </p>
      <div class="flex items-center gap-2">
        <button type="button" class="rounded-lg px-3 py-1.5 text-sm font-medium text-gray-700 transition-colors duration-150 hover:bg-gray-100 dark:text-gray-300 dark:hover:bg-gray-800 motion-reduce:transition-none">
          Archive
        </button>
        <button type="button" class="rounded-lg px-3 py-1.5 text-sm font-medium text-red-600 transition-colors duration-150 hover:bg-red-50 dark:text-red-400 dark:hover:bg-red-900/30 motion-reduce:transition-none">
          Delete selected
        </button>
      </div>
    </div>
  </div>
</div>
```

**设计要点：**
- Checkbox 列宽度固定 `w-10`——不随内容变化
- Select All 表头 Checkbox + 每行 Checkbox——完整的批量操作能力
- Batch Action Bar：选中行后从底部滑入，显示批量操作按钮
- Checkbox 样式完全复用 [Checkbox](./checkbox.md) 组件

---

### 5. Responsive — 响应式表格

移动端通过横向滚动保持表格结构。对于简单表格，可选择卡片堆叠模式。

**方案 A: 横向滚动（推荐——保持行列关系）**

```html
<div class="overflow-hidden rounded-xl bg-white
  inset-ring inset-ring-gray-950/8
  dark:bg-gray-900 dark:inset-ring-white/10">
  <div class="overflow-x-auto">
    <table class="w-full min-w-[640px] text-left text-sm">
      <!-- table content -->
    </table>
  </div>
</div>
```

`min-w-[640px]` 确保移动端表格不塌缩，用户可横向滑动查看全部列。

**方案 B: 卡片堆叠（适合 ≤ 3 列的简单数据）**

```html
<!-- 移动端卡片模式 / 桌面端表格模式 -->
<div class="overflow-hidden rounded-xl bg-white
  inset-ring inset-ring-gray-950/8
  dark:bg-gray-900 dark:inset-ring-white/10">
  <!-- Desktop: Table -->
  <div class="hidden sm:block overflow-x-auto">
    <table class="w-full text-left text-sm">
      <!-- standard table -->
    </table>
  </div>
  <!-- Mobile: Card Stack -->
  <div class="divide-y divide-gray-950/5 sm:hidden dark:divide-white/5">
    <div class="px-4 py-3">
      <div class="flex items-center justify-between">
        <p class="text-sm font-medium text-gray-900 dark:text-gray-100">Alex Chen</p>
        <span class="inline-flex items-center rounded-lg bg-green-50 px-2 py-0.5 text-xs font-medium text-green-700 dark:bg-green-900/30 dark:text-green-400">Active</span>
      </div>
      <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">Product Designer</p>
      <p class="mt-0.5 text-xs text-gray-500 dark:text-gray-400">Joined Jun 15, 2026</p>
    </div>
  </div>
</div>
```

---

## 列对齐规范

| 列类型 | 对齐方式 | Tailwind | 说明 |
|--------|---------|----------|------|
| 文本/名称 | 左对齐 | `text-left`（默认） | 自然阅读流向 |
| 数字/金额 | 右对齐 | `text-right` | 便于数值比较 |
| 状态/标签 | 左对齐 | `text-left` | 与文本列一致 |
| 日期/时间 | 左对齐 | `text-left` | 与文本列一致 |
| 操作按钮 | 右对齐 | `text-right` | 视觉收束 |
| 选择框 | 居中 | `text-center` | 独立列 |

```html
<!-- 数字列右对齐 -->
<td class="px-4 py-3 text-right text-sm tabular-nums text-gray-900 dark:text-gray-100">
  $48,295
</td>
```

`tabular-nums` 确保数字等宽——数值上下对比时不会跳动。

---

## 排序指示器

```html
<!-- Sortable Column Header -->
<th class="px-4 py-3 text-xs font-medium uppercase tracking-wider text-gray-500 dark:text-gray-400">
  <button type="button"
    class="group inline-flex items-center gap-1 transition-colors duration-150 hover:text-gray-900 dark:hover:text-gray-100 motion-reduce:transition-none">
    Name
    <!-- Sort Icon -->
    <svg class="size-3 text-gray-400 transition-colors duration-150 group-hover:text-gray-600 dark:text-gray-500 dark:group-hover:text-gray-300 motion-reduce:transition-none"
      fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true">
      <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 15L12 18.75 15.75 15m-7.5-6L12 5.25 15.75 9" />
    </svg>
  </button>
</th>
```

---

## 空状态

> Table 空态复用 **[Empty State](./empty-state.md)** 组件的 **Base** 变体。使用 `colspan` 覆盖整行，内嵌 Empty State 的图标 + 标题 + 描述结构。完整规范（包括 With Action / Inline / Full Page 变体及图标语义映射）请参见独立组件文档。

```html
<tbody>
  <tr>
    <td colspan="5" class="px-4 py-16 text-center">
      <svg class="mx-auto size-10 text-gray-300 dark:text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5" aria-hidden="true">
        <path stroke-linecap="round" stroke-linejoin="round" d="M20.25 7.5l-.625 10.632a2.25 2.25 0 01-2.247 2.118H6.622a2.25 2.25 0 01-2.247-2.118L3.75 7.5m6 4.125l2.25 2.25m0 0l2.25 2.25M12 13.875l2.25-2.25M12 13.875l-2.25 2.25M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125z" />
      </svg>
      <p class="mt-3 text-sm font-medium text-gray-900 dark:text-gray-100">No data</p>
      <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">Get started by creating a new entry.</p>
    </td>
  </tr>
</tbody>
```

---

## 状态总览

| 状态 | 表现 |
|------|------|
| **Default** | 标准行背景，`divide-y` 分隔 |
| **Hover** | `bg-gray-50/50` 微暖背景，`duration-150` |
| **Striped** | 偶数行 `bg-gray-50/50`（可选） |
| **Selected** | `bg-indigo-50` + 品牌色边框（配合 Checkbox） |
| **Empty** | 居中空状态插画 + 引导文案 |
| **Loading** | Skeleton rows（建议 3-5 行骨架屏） |

---

## Design Tokens

| Token | Tailwind | 值 | 说明 |
|-------|----------|-----|------|
| 容器圆角 | `rounded-xl` | 12px | 与 Card 一致 |
| 容器描边 | `inset-ring-gray-950/8` | 8% 黑 | 与 Card 一致 |
| 行分隔线 | `divide-gray-950/5` | 5% 黑 | 行间分隔 |
| 表头背景 | `bg-gray-50` | `#f9fafb` | 表头底色 |
| 表头字号 | `text-xs uppercase tracking-wider` | 12px | 紧凑扫描友好 |
| 数据行字号 | `text-sm` | 14px | 正文标准 |
| 行内边距 | `px-4 py-3` | 16px 12px | 44px 行高 |
| hover 背景 | `bg-gray-50/50` | — | 微暖反馈 |
| 第一列字重 | `font-medium` | 500 | 标识符列 |
| 数字字宽 | `tabular-nums` | — | 等宽数字 |
| Action 按钮 padding | `p-1.5` | 6px | 紧凑版 Ghost |
| 移动端最小宽度 | `min-w-[640px]` | 640px | 横向滚动阈值 |
| 过渡 | `transition-colors duration-150` | 150ms | 行 hover |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| 语义元素 | 使用原生 `<table>` / `<thead>` / `<tbody>` / `<th>` / `<tr>` / `<td>` |
| 表头作用域 | `<th scope="col">` 或 `<span class="sr-only">Actions</span>` |
| Action 列 | `aria-label="Edit {name}"` 描述性标签 |
| 图标按钮 | 必须有 `aria-label` |
| 排序按钮 | 使用 `<button>` + `aria-sort` 属性 |
| 多选 | Checkbox `<label>` 包裹——点击任意区域选中 |
| 空状态 | 使用 `colspan` 覆盖全行 |
| 响应式 | `overflow-x-auto` 确保键盘聚焦不丢失 |
| 减少动画 | `motion-reduce:transition-none` |

---

## 复用指南

### 何时使用

| 场景 | 变体 | 说明 |
|------|------|------|
| 一般数据展示 | Base | 最常用 |
| 宽表格（≥ 5 列） | Striped | 斑马纹辅助视线追踪 |
| 数据管理（CRUD） | With Actions | 行编辑/删除 |
| 批量操作 | With Checkbox | 多选 + 批量工具栏 |
| 移动端适配 | Responsive | 横向滚动或卡片堆叠 |

### 何时不用

| 场景 | 替代方案 |
|------|---------|
| 数据 < 3 行 | 简单的 `<ul>` 列表 |
| 数据需要可视化 | [Chart](./chart.md) |
| 层级/树形数据 | Tree View（后续补充） |
| 卡片列表（图片为主） | [Card](./card.md) Grid |
| 复杂的筛选/排序 | Data Grid / Airtable 风格（后续补充） |

### 组合规则

```
✅ Status 列使用 Badge Solid     → 随 Badge 更新自动同步
✅ Action 按钮使用 Button Ghost sm → p-1.5 紧凑版
✅ Checkbox 使用 Checkbox 组件    → 完整的 focus/checked 状态
❌ 表格内使用实心按钮            → 太重——用 Ghost
❌ 自定义 Status 颜色             → 必须从 Badge 映射表取值
```

---

> 参考: [Badge](./badge.md) · [Button](./button.md) · [Checkbox](./checkbox.md) · [Colors](../design-tokens/colors.md) · [Elevation](../design-tokens/elevation.md)
