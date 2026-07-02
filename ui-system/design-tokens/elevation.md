# Elevation

Design System 层次规范。替代传统 `box-shadow` 方案，使用 `inset-ring` + 背景明度差构建深度体系。

> 核心原则来自 [设计共同规律](../../principles/design.md) 第三条——六款顶级产品已放弃阴影。

---

## 一、设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 阴影 | 不使用 `box-shadow` | Linear / Vercel / Notion / Tailwind / Anthropic 均无卡片阴影 |
| 层次传达 | 背景色明度差 | 白色卡片浮于灰色页面——用户"感觉到"层次而非"被告知" |
| 边界定义 | `inset-ring` | Tailwind v4 方案——不占布局空间，比 `border` 更干净 |
| 描边颜色 | 透明度方案 | `gray-950/8%` 自动适配暗色模式，无需 `dark:` 覆盖 |
| hover 反馈 | ring 加深 + 背景微暖 | ≤200ms，仅颜色过渡——原则五 |

---

## 二、Elevation Ladder（层次阶梯）

三级层次，用极小的明度差区分：

```
Level 0 — Page          bg-gray-50          无描边              页面底色
  │
  └─ Level 1 — Card     bg-white            inset-ring 8%       标准容器
       │
       └─ Level 2 — Hover  bg-gray-50/50    inset-ring 20%      交互反馈
```

| Level | 名称 | 背景 | 描边 | 明度 | 用途 |
|-------|------|------|------|------|------|
| **0** | Page | `bg-gray-50` (#f9fafb) | 无 | 98.5% | 页面底色 |
| **1** | Raised | `bg-white` (#fff) | `inset-ring-gray-950/8` | 100% | 卡片、Dropdown、Sheet |
| **2** | Interactive | `bg-gray-50/50` | `inset-ring-gray-950/20` | ~99% | 可交互卡片的 hover 态 |

明度差：Level 0 → Level 1 仅 1.5 个百分点——Linear 的方案（2-3 个明度点差值），层次感来自对比而非绝对值。

### 表单控件层次扩展

表单控件（Input / Select / Textarea）在通用层次阶梯之上增加了两个专用层级：**Disabled（低于 Level 0）** 和 **Error（语义覆盖）**。

```
Level E — Error         bg-white       inset-ring-red-500      语义覆盖（独立于灰阶）
  │
  └─ Level 2 — Focus    bg-white       inset-ring 20% + ring   聚焦交互
       │
       └─ Level 1 — Default  bg-white  inset-ring 8%           标准表单控件
            │
            └─ Level 0- — Disabled  bg-gray-50  inset-ring 5% + opacity-50  不可交互
```

| Level | 名称 | 背景 | 描边 (Light) | 描边 (Dark) | 其他 | 用途 |
|-------|------|------|-------------|------------|------|------|
| **E** | Error | `bg-white` | `inset-ring-red-500` | `inset-ring-red-400/50` | `aria-invalid` + 错误消息 | 验证失败 |
| **2** | Focus | `bg-white` | `inset-ring-gray-950/20` + `ring-2 ring-gray-950/10` | `inset-ring-white/20` + `ring-2 ring-white/10` | `focus:outline-none` | 键盘/点击聚焦 |
| **1** | Default | `bg-white` | `inset-ring-gray-950/8` | `inset-ring-white/10` | — | 标准可编辑状态 |
| **0-** | Disabled | `bg-gray-50` | `inset-ring-gray-950/5` | `inset-ring-white/5` | `opacity-50` + `cursor-not-allowed` | 不可交互 |

> **设计依据**: 表单控件需要明确的"可编辑"视觉信号——白色背景（Level 1）浮于页面底色（Level 0）之上，8% inset-ring 提供清晰的边界而不喧宾夺主。Focus 时 ring 加深至 20% 同时外扩 2px 微光环——双重反馈确保可访问的焦点指示。Disabled 降至 Level 0 以下（灰底 + 最轻 ring + 半透明），明确传达"不可用"。Error 使用语义色 `red-500` 覆盖灰阶，与 [语义色统一原则](../principles/semantic-color-unification.md) 一致。

---

## 三、inset-ring 规范

### 为什么用 inset-ring 而非 border

```
❌ border:        占用 layout 空间，改变元素尺寸
✅ inset-ring:    box-shadow: inset 0 0 0 1px ——不占空间，不影响布局
```

### Transparency Scale

| Token | Tailwind Class | 透明度 | 用途 |
|-------|---------------|--------|------|
| ring-disabled | `inset-ring-gray-950/5` | 5% | 禁用态表单控件——几乎不可见的边界 |
| ring-subtle | `inset-ring-gray-950/8` | 8% | 标准容器边界 / 表单控件默认态 |
| ring-hover | `inset-ring-gray-950/20` | 20% | 可交互元素 hover / 表单控件 Focus |
| ring-strong | `inset-ring-gray-950/30` | 30% | Modal / Dialog（最高层级） |

### 暗色模式

透明度方案的核心优势——暗色模式下自动反转，无需额外声明：

| 模式 | ring-subtle | ring-hover |
|------|------------|------------|
| Light | `inset-ring-gray-950/8` | `inset-ring-gray-950/20` |
| Dark | `dark:inset-ring-white/10` | `dark:inset-ring-white/20` |

```html
<!-- 标准容器：Light + Dark -->
<div class="... inset-ring inset-ring-gray-950/8 dark:inset-ring-white/10">
```

暗色模式下透明度略提高（8%→10%，20%→20%），因为暗背景上透明度视觉效果更弱。

---

## 四、组件层次映射

| 组件 | 默认 Level | Focus/Hover Level | 说明 |
|------|-----------|-------------------|------|
| [Card](../components/card.md) | 1 (Raised) | 2 (Interactive) | 白色卡片浮于灰色页面 |
| [Button](../components/button.md) | 无 (透明) | 背景 2.5% (hover) | 按钮不需要边界抬升 |
| Modal | 3 (最高) | — | `inset-ring 30%` + 背景遮罩 |
| Dropdown | 1 (Raised) | — | 与 Card 同级 |
| Sheet / Drawer | 1 (Raised) | — | 与 Card 同级 |
| Table | 1 (Raised) | — | 可选，数据密集时可省略 ring |
| **表单控件组** | | | |
| [Input](../components/input.md) | 1 (Raised) | 2 (Interactive) | focus: ring 加深至 20% + 外部 2px 微光 |
| [Select](../components/select.md) | 1 (Raised) | 2 (Interactive) | 与 Input 完全一致 |
| [Textarea](../components/textarea.md) | 1 (Raised) | 2 (Interactive) | 与 Input 完全一致 |
| [Checkbox](../components/checkbox.md) | 1 (Raised) | — | Level 1 未选中；Focus 使用 ring-2 ring-offset-2（小目标元素模式） |

---

## 五、Migration Guide（从阴影迁移）

### 之前（shadow 方案）

```html
<div class="rounded-xl border border-gray-200 bg-white shadow-sm
  transition-shadow hover:shadow-md">
  <!-- content -->
</div>
```

### 之后（inset-ring 方案）

```html
<div class="rounded-xl bg-white
  inset-ring inset-ring-gray-950/8
  transition-colors duration-150
  hover:bg-gray-50/50 hover:inset-ring-gray-950/20
  dark:bg-gray-900 dark:inset-ring-white/10
  dark:hover:bg-gray-800/50 dark:hover:inset-ring-white/20
  motion-reduce:transition-none">
  <!-- content -->
</div>
```

### 迁移检查清单

1. 删除所有 `shadow-sm` / `shadow-md` / `shadow-lg`
2. 删除 `border border-gray-200`，替换为 `inset-ring inset-ring-gray-950/8`
3. `transition-shadow` → `transition-colors duration-150`
4. `hover:shadow-md` → `hover:inset-ring-gray-950/20` + `hover:bg-gray-50/50`
5. 添加 `dark:` 变体（透明度自动适配，仅需微调百分比）
6. 添加 `motion-reduce:transition-none`

---

## 六、Design Tokens 汇总

| Token | Light | Dark | 用途 |
|-------|-------|------|------|
| `elevation-page` | `bg-gray-50` | `dark:bg-gray-950` | 页面底色 |
| `elevation-card` | `bg-white` + `inset-ring-gray-950/8` | `dark:bg-gray-900` + `dark:inset-ring-white/10` | 卡片 / Dropdown |
| `elevation-card-hover` | `bg-gray-50/50` + `inset-ring-gray-950/20` | `dark:bg-gray-800/50` + `dark:inset-ring-white/20` | 可交互卡片 hover |
| `elevation-modal` | `bg-white` + `inset-ring-gray-950/30` | `dark:bg-gray-900` + `dark:inset-ring-white/30` | Modal / Dialog |
| `elevation-divider` | `border-gray-950/5` | `dark:border-white/5` | 分区卡片内分隔线 |
| **表单控件** | | | |
| `elevation-form-default` | `bg-white` + `inset-ring-gray-950/8` | `dark:bg-gray-900` + `dark:inset-ring-white/10` | Input / Select / Textarea |
| `elevation-form-focus` | `bg-white` + `inset-ring-gray-950/20` + `ring-2 ring-gray-950/10` | `dark:bg-gray-900` + `dark:inset-ring-white/20` + `dark:ring-2 dark:ring-white/10` | 表单控件聚焦态 |
| `elevation-form-disabled` | `bg-gray-50` + `inset-ring-gray-950/5` + `opacity-50` | `dark:bg-gray-800` + `dark:inset-ring-white/5` + `opacity-50` | 表单控件禁用态 |
| `elevation-form-error` | `bg-white` + `inset-ring-red-500` | `dark:bg-gray-900` + `dark:inset-ring-red-400/50` | 表单控件错误态 |

---

> 参考: [设计共同规律](../../principles/design.md) · [Colors](./colors.md) · [语义色统一](../principles/semantic-color-unification.md) · [Card](../components/card.md) · [Button](../components/button.md) · [Input](../components/input.md) · [Select](../components/select.md) · [Textarea](../components/textarea.md) · [Checkbox](../components/checkbox.md)
