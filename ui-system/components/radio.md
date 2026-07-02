# Radio

单选按钮是用于互斥选择的基础表单控件。采用 `inset-ring` 描边体系，与 [Input](./input.md)、[Select](./select.md)、[Checkbox](./checkbox.md)、[Textarea](./textarea.md) 保持一致的表单控件设计语言。

> **Design Tokens**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Typography](../design-tokens/typography.md) · [Motion](../design-tokens/motion.md) · [Elevation](../design-tokens/elevation.md)
>
> **关联组件**: [Checkbox](./checkbox.md)（对偶组件——共享全部表单 Token） · [Input](./input.md) · [Select](./select.md) · [Card](./card.md)（Card Radio 变体）
>
> **依赖**: 无额外插件依赖（使用 `peer` + `inset-ring` 替代传统 radio 样式）

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 过渡 | `transition-colors duration-150` | 见 [Motion Token](../design-tokens/motion.md)——禁止 `transition-all`，禁止自定义时长 |
| 形状 | `rounded-full`（圆形） | Radio 传统语义——圆形 = 单选，方形 = 多选 |
| 描边 | `inset-ring` 透明度方案 | 与 Input / Select / Checkbox / Textarea 共享 Level 1 (Default) 描边模式 |
| 选中标记 | 填充圆点（`size-1.5` 内圆） | 比 Checkbox 的 checkmark 更轻——Radio 选项通常较少，标记体量相应缩小 |
| 选中背景 | `indigo-600` | 与 Button Primary / Checkbox Checked 一致——品牌色 = 选中态 |
| Focus | `ring-2 ring-offset-2` | 与 Button / Checkbox 相同的小目标 Focus 模式 |
| 互斥行为 | 原生 `name` 属性 | 不依赖 JS——浏览器原生 radio group 互斥 |
| 禁用 | `opacity-50` | 与 Input / Button / Checkbox 禁用态保持 50% 一致性 |
| 暗色模式 | 透明度反转 + 黑白反转 | `inset-ring-white/10` + 选中态 `bg-indigo-500` |

---

## 变体

### 1. Base Radio（基础单选）

最常用的单选按钮。整个 `<label>` 区域可点击。

```html
<!-- Base Radio -->
<label class="inline-flex items-center gap-2 cursor-pointer">
  <input
    type="radio"
    name="example"
    class="peer sr-only"
  />
  <span
    class="flex size-4 shrink-0 items-center justify-center rounded-full
      bg-white
      inset-ring inset-ring-gray-950/8
      peer-checked:bg-indigo-600 peer-checked:inset-ring-indigo-600
      peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10
      peer-disabled:opacity-50 peer-disabled:cursor-not-allowed
      dark:bg-gray-900 dark:inset-ring-white/10
      dark:peer-checked:bg-indigo-500 dark:peer-checked:inset-ring-indigo-500
      dark:peer-focus-visible:ring-white/10
      transition-colors duration-150
      motion-reduce:transition-none"
    aria-hidden="true"
  >
    <!-- 内圆点 — unchecked 时与背景同色（不可见），checked 时白色在品牌色上可见 -->
    <span
      class="size-1.5 rounded-full bg-white dark:bg-gray-900
        peer-checked:bg-white dark:peer-checked:bg-white"
      aria-hidden="true"
    ></span>
  </span>
  <span class="text-sm text-gray-700 dark:text-gray-300">
    Option A
  </span>
</label>
```

**设计要点：**
- `size-4` (16px) 外圆 — 与 Checkbox 尺寸一致
- `size-1.5` (6px) 内圆点 — 外圆 16px、内圆 6px，比例 2.67:1，视觉均衡
- `items-center`（非 `items-start`）—— 圆形 Radio 天然居中，无需 `mt-0.5` 基线微调
- `peer sr-only` — 隐藏原生 input，保留可聚焦和可访问性
- `inset-ring-gray-950/8` — 与 Input / Checkbox 默认态共享 Level 1 描边
- 内圆点颜色技巧：Light unchecked 时 `bg-white`（与外圆 `bg-white` 同色→不可见）；Light checked 时 `bg-white`（在 `bg-indigo-600` 上可见）。Dark unchecked 时 `bg-gray-900`（与外圆 `bg-gray-900` 同色→不可见）；Dark checked 时 `bg-white`（在 `bg-indigo-500` 上可见）
- 整个 `<label>` 可点击——扩大触控区域
- `name="example"` —— 同 name 的 Radio 自动互斥

---

### 2. With Description（带描述单选）

单选附带说明文字。用于需要解释选项含义的场景（如设置页、计划选择）。

```html
<!-- With Description -->
<label class="inline-flex items-start gap-2 cursor-pointer">
  <input
    type="radio"
    name="plan"
    class="peer sr-only"
  />
  <span
    class="mt-0.5 flex size-4 shrink-0 items-center justify-center rounded-full
      bg-white
      inset-ring inset-ring-gray-950/8
      peer-checked:bg-indigo-600 peer-checked:inset-ring-indigo-600
      peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10
      peer-disabled:opacity-50 peer-disabled:cursor-not-allowed
      dark:bg-gray-900 dark:inset-ring-white/10
      dark:peer-checked:bg-indigo-500 dark:peer-checked:inset-ring-indigo-500
      dark:peer-focus-visible:ring-white/10
      transition-colors duration-150
      motion-reduce:transition-none"
    aria-hidden="true"
  >
    <span
      class="size-1.5 rounded-full bg-white dark:bg-gray-900
        peer-checked:bg-white dark:peer-checked:bg-white"
      aria-hidden="true"
    ></span>
  </span>
  <span class="flex flex-col gap-0.5">
    <span class="text-sm font-medium text-gray-900 dark:text-gray-100">
      Standard plan
    </span>
    <span class="text-sm text-gray-500 dark:text-gray-400">
      Basic features for individuals and small teams. Up to 5 projects included.
    </span>
  </span>
</label>
```

**设计要点：**
- `items-start` + `mt-0.5` — 当描述文字多行时，Radio 固定顶部对齐（与 Checkbox With Description 一致）
- 主标签 `font-medium text-gray-900` — 与 Checkbox With Description 完全一致
- 描述 `text-sm text-gray-500` — 辅助信息层级
- `gap-0.5` (2px) — 主标签与描述紧凑间距

---

### 3. Card Radio（卡片单选）

Radio 嵌入 Card 中——选中时整张卡片高亮。用于计划选择、支付方式、模板选择等需要视觉对比的场景。

```html
<!-- Card Radio Group -->
<fieldset>
  <legend class="text-sm font-medium text-gray-900 dark:text-gray-100 mb-3">
    Select a plan
  </legend>
  <div class="grid grid-cols-1 sm:grid-cols-3 gap-3">
    <!-- Option 1 — Selected -->
    <label class="relative cursor-pointer">
      <input
        type="radio"
        name="card-plan"
        class="peer sr-only"
        checked
      />
      <span
        class="block rounded-xl border border-gray-200 bg-white p-4
          peer-checked:border-indigo-600 peer-checked:bg-indigo-50/50
          peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10
          dark:border-gray-700 dark:bg-gray-900
          dark:peer-checked:border-indigo-500 dark:peer-checked:bg-indigo-500/10
          dark:peer-focus-visible:ring-white/10
          transition-colors duration-150
          motion-reduce:transition-none"
      >
        <span class="flex items-center gap-2">
          <!-- Radio indicator inside card -->
          <span
            class="flex size-4 shrink-0 items-center justify-center rounded-full
              bg-white
              inset-ring inset-ring-gray-950/8
              peer-checked:bg-indigo-600 peer-checked:inset-ring-indigo-600
              dark:bg-gray-900 dark:inset-ring-white/10
              dark:peer-checked:bg-indigo-500 dark:peer-checked:inset-ring-indigo-500
              transition-colors duration-150
              motion-reduce:transition-none"
            aria-hidden="true"
          >
            <span
              class="size-1.5 rounded-full bg-white dark:bg-gray-900
                peer-checked:bg-white dark:peer-checked:bg-white"
              aria-hidden="true"
            ></span>
          </span>
          <span class="text-sm font-semibold text-gray-900 dark:text-gray-100">Pro</span>
        </span>
        <span class="mt-2 block text-sm text-gray-500 dark:text-gray-400">
          Unlimited projects, advanced analytics, priority support.
        </span>
        <span class="mt-2 block text-lg font-semibold text-gray-900 dark:text-gray-100">
          $29<span class="text-sm font-normal text-gray-500">/mo</span>
        </span>
      </span>
    </label>

    <!-- Option 2 — Unselected -->
    <label class="relative cursor-pointer">
      <input
        type="radio"
        name="card-plan"
        class="peer sr-only"
      />
      <span
        class="block rounded-xl border border-gray-200 bg-white p-4
          peer-checked:border-indigo-600 peer-checked:bg-indigo-50/50
          peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10
          dark:border-gray-700 dark:bg-gray-900
          dark:peer-checked:border-indigo-500 dark:peer-checked:bg-indigo-500/10
          dark:peer-focus-visible:ring-white/10
          transition-colors duration-150
          motion-reduce:transition-none"
      >
        <span class="flex items-center gap-2">
          <span
            class="flex size-4 shrink-0 items-center justify-center rounded-full
              bg-white
              inset-ring inset-ring-gray-950/8
              peer-checked:bg-indigo-600 peer-checked:inset-ring-indigo-600
              dark:bg-gray-900 dark:inset-ring-white/10
              dark:peer-checked:bg-indigo-500 dark:peer-checked:inset-ring-indigo-500
              transition-colors duration-150
              motion-reduce:transition-none"
            aria-hidden="true"
          >
            <span
              class="size-1.5 rounded-full bg-white dark:bg-gray-900
                peer-checked:bg-white dark:peer-checked:bg-white"
              aria-hidden="true"
            ></span>
          </span>
          <span class="text-sm font-semibold text-gray-900 dark:text-gray-100">Starter</span>
        </span>
        <span class="mt-2 block text-sm text-gray-500 dark:text-gray-400">
          Essential features for getting started. Up to 10 projects.
        </span>
        <span class="mt-2 block text-lg font-semibold text-gray-900 dark:text-gray-100">
          $9<span class="text-sm font-normal text-gray-500">/mo</span>
        </span>
      </span>
    </label>

    <!-- Option 3 — Unselected -->
    <label class="relative cursor-pointer">
      <input
        type="radio"
        name="card-plan"
        class="peer sr-only"
      />
      <span
        class="block rounded-xl border border-gray-200 bg-white p-4
          peer-checked:border-indigo-600 peer-checked:bg-indigo-50/50
          peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10
          dark:border-gray-700 dark:bg-gray-900
          dark:peer-checked:border-indigo-500 dark:peer-checked:bg-indigo-500/10
          dark:peer-focus-visible:ring-white/10
          transition-colors duration-150
          motion-reduce:transition-none"
      >
        <span class="flex items-center gap-2">
          <span
            class="flex size-4 shrink-0 items-center justify-center rounded-full
              bg-white
              inset-ring inset-ring-gray-950/8
              peer-checked:bg-indigo-600 peer-checked:inset-ring-indigo-600
              dark:bg-gray-900 dark:inset-ring-white/10
              dark:peer-checked:bg-indigo-500 dark:peer-checked:inset-ring-indigo-500
              transition-colors duration-150
              motion-reduce:transition-none"
            aria-hidden="true"
          >
            <span
              class="size-1.5 rounded-full bg-white dark:bg-gray-900
                peer-checked:bg-white dark:peer-checked:bg-white"
              aria-hidden="true"
            ></span>
          </span>
          <span class="text-sm font-semibold text-gray-900 dark:text-gray-100">Enterprise</span>
        </span>
        <span class="mt-2 block text-sm text-gray-500 dark:text-gray-400">
          Custom solutions, dedicated support, SSO, audit logs.
        </span>
        <span class="mt-2 block text-lg font-semibold text-gray-900 dark:text-gray-100">
          Custom
        </span>
      </span>
    </label>
  </div>
</fieldset>
```

**设计要点：**
- Card Radio 本质是 Card + Radio 的组合——外层容器用 Card 样式（`rounded-xl border`），内部嵌入 Radio 指示器
- 选中态：`border-indigo-600` + `bg-indigo-50/50` — 整张卡片品牌色边框 + 微暖背景
- 暗色选中态：`border-indigo-500` + `bg-indigo-500/10` — 暗背景降低饱和度
- Radio 指示器位于卡片左上角——与内容对齐，不破坏卡片布局
- `grid-cols-3` 三列等宽——常见于计划/方案选择
- Radio 嵌套在 `<label>` 内——点击卡片任意位置即选中
- 价格用 `text-lg font-semibold` + `/mo` 用 `text-sm font-normal text-gray-500` —— 主数据与单位的层级关系

---

### 4. Radio Group（垂直单选组）

多个 Radio 的垂直列表，`<fieldset>` + `<legend>` 语义化分组。

```html
<!-- Radio Group — Vertical -->
<fieldset>
  <legend class="text-sm font-medium text-gray-900 dark:text-gray-100 mb-3">
    Notification method
  </legend>
  <div class="flex flex-col gap-3">
    <!-- Option 1 — Selected -->
    <label class="inline-flex items-center gap-2 cursor-pointer">
      <input type="radio" name="notify" class="peer sr-only" checked />
      <span
        class="flex size-4 shrink-0 items-center justify-center rounded-full
          bg-indigo-600
          inset-ring inset-ring-indigo-600
          peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10
          dark:bg-indigo-500 dark:inset-ring-indigo-500
          dark:peer-focus-visible:ring-white/10
          transition-colors duration-150
          motion-reduce:transition-none"
        aria-hidden="true"
      >
        <span class="size-1.5 rounded-full bg-white" aria-hidden="true"></span>
      </span>
      <span class="text-sm text-gray-700 dark:text-gray-300">Email</span>
    </label>

    <!-- Option 2 -->
    <label class="inline-flex items-center gap-2 cursor-pointer">
      <input type="radio" name="notify" class="peer sr-only" />
      <span
        class="flex size-4 shrink-0 items-center justify-center rounded-full
          bg-white
          inset-ring inset-ring-gray-950/8
          peer-checked:bg-indigo-600 peer-checked:inset-ring-indigo-600
          peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10
          dark:bg-gray-900 dark:inset-ring-white/10
          dark:peer-checked:bg-indigo-500 dark:peer-checked:inset-ring-indigo-500
          dark:peer-focus-visible:ring-white/10
          transition-colors duration-150
          motion-reduce:transition-none"
        aria-hidden="true"
      >
        <span
          class="size-1.5 rounded-full bg-white dark:bg-gray-900
            peer-checked:bg-white dark:peer-checked:bg-white"
          aria-hidden="true"
        ></span>
      </span>
      <span class="text-sm text-gray-700 dark:text-gray-300">Push notification</span>
    </label>

    <!-- Option 3 -->
    <label class="inline-flex items-center gap-2 cursor-pointer">
      <input type="radio" name="notify" class="peer sr-only" />
      <span
        class="flex size-4 shrink-0 items-center justify-center rounded-full
          bg-white
          inset-ring inset-ring-gray-950/8
          peer-checked:bg-indigo-600 peer-checked:inset-ring-indigo-600
          peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10
          dark:bg-gray-900 dark:inset-ring-white/10
          dark:peer-checked:bg-indigo-500 dark:peer-checked:inset-ring-indigo-500
          dark:peer-focus-visible:ring-white/10
          transition-colors duration-150
          motion-reduce:transition-none"
        aria-hidden="true"
      >
        <span
          class="size-1.5 rounded-full bg-white dark:bg-gray-900
            peer-checked:bg-white dark:peer-checked:bg-white"
          aria-hidden="true"
        ></span>
      </span>
      <span class="text-sm text-gray-700 dark:text-gray-300">SMS</span>
    </label>

    <!-- Option 4 — Disabled -->
    <label class="inline-flex items-center gap-2 cursor-not-allowed">
      <input type="radio" name="notify" class="peer sr-only" disabled />
      <span
        class="flex size-4 shrink-0 items-center justify-center rounded-full
          bg-gray-50
          inset-ring inset-ring-gray-950/5
          peer-disabled:opacity-50
          dark:bg-gray-800 dark:inset-ring-white/5
          transition-colors duration-150
          motion-reduce:transition-none"
        aria-hidden="true"
      >
        <span class="size-1.5 rounded-full bg-gray-50 dark:bg-gray-800" aria-hidden="true"></span>
      </span>
      <span class="text-sm text-gray-400 dark:text-gray-500">Phone call (unavailable)</span>
    </label>
  </div>
</fieldset>
```

**设计要点：**
- `<fieldset>` + `<legend>` — 语义化分组，屏幕阅读器朗读 "Notification method, group, 4 options"
- `gap-3` (12px) — Radio 之间标准间距，与 Checkbox Group 一致
- `mb-3` (12px) — legend 与选项之间间距
- 每个 `<label>` 独立可点击——不依赖 radio group 全局行为
- 混合展示 checked / unchecked / disabled 状态
- 同一 `name="notify"` — 浏览器原生互斥
- Disabled Radio 内圆点颜色 `bg-gray-50` — 与外圆底色一致，不显示圆点

---

### 5. Inline Radio Group（行内单选组）

水平排列，适用于筛选栏、Tab 替代、分段选择等紧凑场景。

```html
<!-- Inline Radio Group -->
<fieldset>
  <legend class="sr-only">View mode</legend>
  <div class="flex flex-wrap items-center gap-4">
    <label class="inline-flex items-center gap-2 cursor-pointer">
      <input type="radio" name="view" class="peer sr-only" checked />
      <span
        class="flex size-4 shrink-0 items-center justify-center rounded-full
          bg-indigo-600
          inset-ring inset-ring-indigo-600
          peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10
          dark:bg-indigo-500 dark:inset-ring-indigo-500
          dark:peer-focus-visible:ring-white/10
          transition-colors duration-150
          motion-reduce:transition-none"
        aria-hidden="true"
      >
        <span class="size-1.5 rounded-full bg-white" aria-hidden="true"></span>
      </span>
      <span class="text-sm font-medium text-gray-900 dark:text-gray-100">Day</span>
    </label>

    <label class="inline-flex items-center gap-2 cursor-pointer">
      <input type="radio" name="view" class="peer sr-only" />
      <span
        class="flex size-4 shrink-0 items-center justify-center rounded-full
          bg-white
          inset-ring inset-ring-gray-950/8
          peer-checked:bg-indigo-600 peer-checked:inset-ring-indigo-600
          peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10
          dark:bg-gray-900 dark:inset-ring-white/10
          dark:peer-checked:bg-indigo-500 dark:peer-checked:inset-ring-indigo-500
          dark:peer-focus-visible:ring-white/10
          transition-colors duration-150
          motion-reduce:transition-none"
        aria-hidden="true"
      >
        <span
          class="size-1.5 rounded-full bg-white dark:bg-gray-900
            peer-checked:bg-white dark:peer-checked:bg-white"
          aria-hidden="true"
        ></span>
      </span>
      <span class="text-sm text-gray-700 dark:text-gray-300">Week</span>
    </label>

    <label class="inline-flex items-center gap-2 cursor-pointer">
      <input type="radio" name="view" class="peer sr-only" />
      <span
        class="flex size-4 shrink-0 items-center justify-center rounded-full
          bg-white
          inset-ring inset-ring-gray-950/8
          peer-checked:bg-indigo-600 peer-checked:inset-ring-indigo-600
          peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10
          dark:bg-gray-900 dark:inset-ring-white/10
          dark:peer-checked:bg-indigo-500 dark:peer-checked:inset-ring-indigo-500
          dark:peer-focus-visible:ring-white/10
          transition-colors duration-150
          motion-reduce:transition-none"
        aria-hidden="true"
      >
        <span
          class="size-1.5 rounded-full bg-white dark:bg-gray-900
            peer-checked:bg-white dark:peer-checked:bg-white"
          aria-hidden="true"
        ></span>
      </span>
      <span class="text-sm text-gray-700 dark:text-gray-300">Month</span>
    </label>
  </div>
</fieldset>
```

**设计要点：**
- `items-center` — 行内模式下 Radio 与文字垂直居中
- `gap-4` (16px) — 行内选项之间宽松间距，与 Checkbox Inline Group 一致
- `flex-wrap` — 选项过多时自动换行
- `sr-only` legend — 视觉隐藏但屏幕阅读器可访问
- 选中项文字 `font-medium text-gray-900` — 比未选中 `text-gray-700` 重一级，加强选中感知
- 未选中文字 `text-gray-700` — 与 Checkbox Inline 一致

---

### 6. Error 状态

复用语义色系统（[Colors](../design-tokens/colors.md) 第三节）。用于表单验证失败的 Radio Group（如"请选择一项"）。

```html
<!-- Error State (per-radio) -->
<label class="inline-flex items-center gap-2 cursor-pointer">
  <input
    type="radio"
    name="required-choice"
    class="peer sr-only"
    aria-invalid="true"
    aria-describedby="radio-error"
  />
  <span
    class="flex size-4 shrink-0 items-center justify-center rounded-full
      bg-white
      inset-ring inset-ring-red-500
      peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-red-500/10
      dark:bg-gray-900 dark:inset-ring-red-400/50
      dark:peer-focus-visible:ring-red-400/20
      transition-colors duration-150
      motion-reduce:transition-none"
    aria-hidden="true"
  >
    <span
      class="size-1.5 rounded-full bg-white dark:bg-gray-900"
      aria-hidden="true"
    ></span>
  </span>
  <span class="text-sm text-gray-700 dark:text-gray-300">
    I agree
  </span>
</label>

<!-- Error message — placed below the radio group -->
<p id="radio-error" class="mt-2 text-xs text-red-600 dark:text-red-400" role="alert">
  Please select an option to continue.
</p>
```

**设计要点：**
- `inset-ring-red-500` — 与 Input / Checkbox Error 状态完全一致
- 错误消息放在 Radio Group 下方（非每个 Radio 内）——因为错误是针对整个 Group 的"未选择"
- `aria-invalid="true"` + `aria-describedby` + `role="alert"` — 完整的可访问错误关联
- Focus 时 `ring-red-500/10` — 红色微光环，与其他表单 Error Focus 一致
- 暗色模式 `inset-ring-red-400/50` — 与 Checkbox Error 一致
- 错误消息 `text-xs text-red-600` — 与 Input / Checkbox 错误消息层级一致

---

### 7. Disabled 状态

禁用态覆盖 unchecked 和 checked 两种场景。

```html
<!-- Disabled — Unchecked -->
<label class="inline-flex items-center gap-2 cursor-not-allowed">
  <input
    type="radio"
    name="disabled-demo-1"
    class="peer sr-only"
    disabled
  />
  <span
    class="flex size-4 shrink-0 items-center justify-center rounded-full
      bg-gray-50
      inset-ring inset-ring-gray-950/5
      peer-disabled:opacity-50
      dark:bg-gray-800 dark:inset-ring-white/5
      transition-colors duration-150
      motion-reduce:transition-none"
    aria-hidden="true"
  >
    <span class="size-1.5 rounded-full bg-gray-50 dark:bg-gray-800" aria-hidden="true"></span>
  </span>
  <span class="text-sm text-gray-400 dark:text-gray-500">
    Disabled option
  </span>
</label>

<!-- Disabled — Checked -->
<label class="inline-flex items-center gap-2 cursor-not-allowed">
  <input
    type="radio"
    name="disabled-demo-2"
    class="peer sr-only"
    disabled
    checked
  />
  <span
    class="flex size-4 shrink-0 items-center justify-center rounded-full
      bg-gray-50
      inset-ring inset-ring-gray-950/5
      peer-disabled:opacity-50
      dark:bg-gray-800 dark:inset-ring-white/5
      transition-colors duration-150
      motion-reduce:transition-none"
    aria-hidden="true"
  >
    <span class="size-1.5 rounded-full bg-gray-400 dark:bg-gray-500" aria-hidden="true"></span>
  </span>
  <span class="text-sm text-gray-400 dark:text-gray-500">
    Disabled selected option
  </span>
</label>
```

**设计要点：**
- `opacity-50` — 与 Button / Input / Checkbox 禁用态保持 50% 一致性
- `bg-gray-50` + `inset-ring-gray-950/5` — 与 Checkbox Disabled 的 Level 0- 模式一致
- `cursor-not-allowed` — 整个 label 区域禁止点击
- Label 文字同步变淡 `text-gray-400` — 整体传达"不可用"
- Checked Disabled 内圆点 `bg-gray-400`（非 white）—— 降低对比度，配合 `opacity-50`
- Unchecked Disabled 内圆点与外圆同色 `bg-gray-50` —— 不可见（符合预期）
- 每个 Disabled Radio 使用不同 `name`（或不同 group）——避免 disabled radio 阻止同组其他 radio 的互斥行为

---

## 尺寸

两种尺寸覆盖所有场景。与 Checkbox 尺寸体系完全一致。

| Size | Radio 外圆 | 内圆点 | 文字 | 间距 | 用途 |
|------|-----------|--------|------|------|------|
| **md** (默认) | `size-4` (16px) | `size-1.5` (6px) | `text-sm` (14px) | `gap-2` (8px) | 标准表单、设置页 |
| **lg** | `size-5` (20px) | `size-2` (8px) | `text-base` (16px) | `gap-3` (12px) | 大表单、Hero 选项 |

```html
<!-- lg 尺寸 -->
<label class="inline-flex items-center gap-3 cursor-pointer">
  <input type="radio" name="large" class="peer sr-only" />
  <span
    class="flex size-5 shrink-0 items-center justify-center rounded-full
      bg-white
      inset-ring inset-ring-gray-950/8
      peer-checked:bg-indigo-600 peer-checked:inset-ring-indigo-600
      peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10
      dark:bg-gray-900 dark:inset-ring-white/10
      dark:peer-checked:bg-indigo-500 dark:peer-checked:inset-ring-indigo-500
      dark:peer-focus-visible:ring-white/10
      transition-colors duration-150
      motion-reduce:transition-none"
    aria-hidden="true"
  >
    <span
      class="size-2 rounded-full bg-white dark:bg-gray-900
        peer-checked:bg-white dark:peer-checked:bg-white"
      aria-hidden="true"
    ></span>
  </span>
  <span class="text-base text-gray-700 dark:text-gray-300">
    Large radio option
  </span>
</label>
```

**设计要点：**
- lg 外圆 20px / 内圆 8px — 比例 2.5:1，略低于 md 的 2.67:1——大尺寸下稍粗的圆点更平衡
- `gap-3` (12px) — 与 Checkbox lg 间距一致
- `text-base` — 与 Checkbox lg 文字一致

---

## CSS-Only 颜色技巧

Radio 内圆点的颜色选择利用了"同色不可见"原理，实现了零 JS 的选中态切换：

```
Light Mode:
  Unchecked: 外圆 bg-white → 内圆 bg-white（同色，不可见）
  Checked:   外圆 bg-indigo-600 → 内圆 bg-white（异色，可见）

Dark Mode:
  Unchecked: 外圆 bg-gray-900 → 内圆 bg-gray-900（同色，不可见）
  Checked:   外圆 bg-indigo-500 → 内圆 bg-white（异色，可见）
```

与 Checkbox 使用 SVG checkmark 不同，Radio 使用纯 `<span>` 圆点——因为 `<span>` 可以复用同一颜色技巧，无需额外 SVG 管理。

---

## 状态总览

| 状态 | 外圆背景 (Light) | 外圆描边 (Light) | 内圆点 (Light) | 外圆背景 (Dark) | 外圆描边 (Dark) | 内圆点 (Dark) |
|------|-----------------|-----------------|---------------|----------------|----------------|--------------|
| Unchecked | `bg-white` | `inset-ring-gray-950/8` | 与外圆同色（不可见） | `bg-gray-900` | `inset-ring-white/10` | 与外圆同色（不可见） |
| Checked | `bg-indigo-600` | `inset-ring-indigo-600` | `bg-white` | `bg-indigo-500` | `inset-ring-indigo-500` | `bg-white` |
| Focus | — | `ring-2 ring-offset-2 ring-gray-950/10` | — | — | `ring-white/10` | — |
| Error | `bg-white` | `inset-ring-red-500` | 与外圆同色 | `bg-gray-900` | `inset-ring-red-400/50` | 与外圆同色 |
| Error Focus | — | `ring-red-500/10` | — | — | `ring-red-400/20` | — |
| Disabled (Unchecked) | `bg-gray-50` | `inset-ring-gray-950/5` | 与外圆同色 | `bg-gray-800` | `inset-ring-white/5` | 与外圆同色 |
| Disabled (Checked) | `bg-gray-50` | `inset-ring-gray-950/5` | `bg-gray-400` | `bg-gray-800` | `inset-ring-white/5` | `bg-gray-500` |

### 层次模型

```
Level 1 (Default)  → bg-white + inset-ring 8%    标准 Radio
Level 2 (Checked)  → bg-indigo-600 + 白色内圆点    选中态 = 最高视觉权重
Level 0- (Disabled)→ bg-gray-50 + opacity-50       不可交互
Level E (Error)    → inset-ring-red-500            语义覆盖
```

> 与 Input / Select / Checkbox / Textarea 共享 Level 1 / Level 0- / Level E 层次模式。

---

## Design Tokens

| Token | Light | Dark | Tailwind | 说明 |
|-------|-------|------|----------|------|
| 过渡 | 150ms | 150ms | `transition-colors duration-150` | 见 Motion Token——禁止自定义 |
| 外圆尺寸 (md) | 16px | 16px | `size-4` | Radio 视觉区域 |
| 外圆尺寸 (lg) | 20px | 20px | `size-5` | 大尺寸变体 |
| 内圆点 (md) | 6px | 6px | `size-1.5` | 选中标记 |
| 内圆点 (lg) | 8px | 8px | `size-2` | 大尺寸标记 |
| 形状 | 圆形 | 圆形 | `rounded-full` | Radio 传统语义 |
| 字间距 (md) | 8px | 8px | `gap-2` | Radio 与 label 间距 |
| 字间距 (lg) | 12px | 12px | `gap-3` | 大尺寸间距 |
| Label 字号 | 14px | 14px | `text-sm` | 标签文字 |
| Label 颜色 | `gray-700` | `gray-300` | — | 标签文字颜色 |
| Description 字号 | 14px | 14px | `text-sm` | 描述文字 |
| Description 颜色 | `gray-500` | `gray-400` | — | 描述文字颜色 |
| 外圆背景 未选中 | `white` | `gray-900` | — | Radio 背景 |
| 外圆描边 未选中 | `gray-950/8` | `white/10` | `inset-ring` + 透明度 | Level 1 |
| 外圆背景 选中 | `indigo-600` | `indigo-500` | — | 品牌色选中态 |
| 外圆描边 选中 | `indigo-600` | `indigo-500` | — | 选中态描边 = 背景色 |
| 内圆点 选中 | `white` | `white` | `bg-white` | 选中标记 |
| Focus ring | `gray-950/10` | `white/10` | `ring-2 ring-offset-2` | 焦点指示 |
| Error 描边 | `red-500` | `red-400/50` | `inset-ring-red-500` | 错误边框 |
| Error 文字 | `red-600` | `red-400` | `text-red-600` | 错误消息 |
| Disabled 外圆背景 | `gray-50` | `gray-800` | — | 禁用底色 |
| Disabled 描边 | `gray-950/5` | `white/5` | `inset-ring` 5% | 最轻描边 |
| Disabled 透明度 | 50% | 50% | `opacity-50` | 整体降低 |
| Disabled 文字 | `gray-400` | `gray-500` | — | 禁用标签 |
| Disabled Checked 内圆点 | `gray-400` | `gray-500` | — | 降低可见度 |
| Group 选项间距 | 12px | 12px | `gap-3` | 垂直组内间距 |
| Group 行内间距 | 16px | 16px | `gap-4` | 行内选项间距 |
| Card Radio 选中边框 | `indigo-600` | `indigo-500` | `border-indigo-600` | 卡片选中语言 |
| Card Radio 选中背景 | `indigo-50/50` | `indigo-500/10` | — | 微暖品牌色背景 |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| Label 关联 | `<label>` 包裹 `<input>` + 文字 —— 扩大可点击区域 |
| 键盘操作 | 原生 `<input type="radio">` 支持 Arrow Keys 切换选项 |
| Tab 导航 | Tab 聚焦到 Group 中第一个/选中项，Arrow Keys 在同 name Radio 间移动 |
| 可见焦点 | `peer-focus-visible:ring-2 ring-offset-2`，仅键盘导航时显示 |
| 屏幕阅读器 | 原生 input 保留（`sr-only` 仅视觉隐藏），`aria-hidden="true"` 在视觉 span 上 |
| 分组语义 | `<fieldset>` + `<legend>` — 屏幕阅读器朗读 "group name, N options" |
| 错误提示 | `aria-describedby="error-id"` 关联错误消息 + `role="alert"` |
| 错误状态 | `aria-invalid="true"` 标记无效输入 |
| 禁用态 | `disabled` 属性 + `cursor-not-allowed` |
| 减少动画 | `motion-reduce:transition-none` |
| 颜色对比度 | Checked: `indigo-600` (#4F46E5) : `white` (#FFF) = 6.54:1 (WCAG AA) ✅ |
| 颜色对比度 | Unchecked 外圆: `gray-950/8` ≈ #D1D5DB : `white` = 满足 WCAG AA 非文本对比度 |
| 视觉指示 | 选中态不仅是颜色变化（内圆点出现/消失），符合 WCAG 1.4.1 |

---

## Radio vs Checkbox 选择指南

| 场景 | 使用 | 原因 |
|------|------|------|
| 从多个选项中选一个 | **Radio** | 互斥语义——圆形 + name 分组 |
| 从多个选项中选多个 | **Checkbox** | 多选语义——方形 + 独立勾选 |
| 即时生效的开关 | **Toggle** | 开关暗示即时生效，不需要提交 |
| 筛选栏多选 | **Checkbox** | 可同时选中多个筛选条件 |
| 计划/方案选择 | **Radio Card** | 单选 + 视觉对比 |
| 同意条款（单条） | **Checkbox** | 二元选择（同意/不同意）更适合复选框 |

---

## 复用指南

### 何时使用 Radio

- 互斥选项列表（通知方式、显示模式）
- 计划/方案选择（Starter / Pro / Enterprise）
- 设置页中的二选一或多选一
- 表单中的单选字段（性别、国家、类型）
- 替代 Tab 的行内分段选择（Day / Week / Month）

### 何时不用 Radio

| 场景 | 替代方案 | 原因 |
|------|---------|------|
| 多选列表 | Checkbox | Radio 是互斥的——多选应使用 Checkbox |
| 即时生效的开关 | Toggle | 切换单个布尔值——Toggle 提供即时反馈 |
| 选项 ≥ 6 个 | Select | 大量选项挤占垂直空间——Select 下拉更高效 |
| 二元选择（同意/不同意） | Checkbox | 更自然的单选框——用户习惯"勾选同意" |
| 复杂内容的选项对比 | 自定义 Card 布局 + Radio | Card Radio 是推荐的组合方式 |

### 组合规则

```
✅ Radio Group (垂直)     → gap-3，<fieldset> + <legend>
✅ Inline Group (水平)     → gap-4，items-center，flex-wrap
✅ Radio + Description     → 双层文字，items-start + mt-0.5
✅ Radio + Card            → Card Radio——整卡可点击，品牌色高亮选中态
✅ Error 消息在 Group 下方  → 错误是针对整个 Group 的，非单个 Radio
❌ 同一个 Group 混用多个 name → 破坏互斥行为
❌ 单 Radio 无法取消选中     → 提供一个 "None" 选项（如"不通知"）
```

---

> 参考: [Colors](../design-tokens/colors.md) · [Typography](../design-tokens/typography.md) · [Motion](../design-tokens/motion.md) · [Elevation](../design-tokens/elevation.md) · [Checkbox](./checkbox.md) · [Input](./input.md) · [语义色统一](../principles/semantic-color-unification.md) · [组件间引用而非重复](../principles/compose-dont-duplicate.md)
