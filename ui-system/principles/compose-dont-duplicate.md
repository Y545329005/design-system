# Compose, Don't Duplicate（组件间引用而非重复）

Design System 中组件不应各自独立设计，而应通过引用已有组件来构建新组件。这确保了单一真相源，减少样式漂移。

> **适用范围**: 所有复合组件的设计与实现
>
> **关联原则**: [语义色统一](./semantic-color-unification.md)

---

## 一、核心规则

**新组件 = 已有组件 + 新布局**

```
不是: Modal 自己写一套按钮样式
而是: Modal 引用 Button 的 Ghost / Solid 变体
```

当你在新组件中发现自己在重写一个已有组件的样式时，说明设计方向错了。

---

## 二、已建立的组件依赖链

### 依赖图

```
                    ┌──────────┐  ┌──────────┐  ┌────────────────┐
                    │  Button  │  │ Checkbox │  │ Content/Prose  │ ← 原子组件，不依赖任何组件
                    └────┬─────┘  └────┬─────┘  └────────────────┘
           ┌─────────────┼─────────────┐  │
           ▼             ▼              ▼  ▼ (语义色共享)
     ┌──────────┐  ┌──────────┐  ┌──────────┐
     │  Modal   │  │  Card    │  │  Input   │
     │ Cancel/  │  │ Product  │  │ With     │
     │ Confirm  │  │ Card CTA │  │ Button   │
     └────┬─────┘  └──────────┘  └────┬─────┘
          │                           │
          ▼                           ▼
     ┌──────────┐              ┌──────────┐
     │  Input   │              │  Select  │ ← border/focus/error/disabled
     │ Form     │              │ Textarea │   全部继承 Input
     │ Variant  │              └──────────┘
     └──────────┘
```

```
     ┌──────────┐
     │  Badge   │ ← 定义了语义色彩映射
     └────┬─────┘
          │
     ┌────┴────┬───────┐
     ▼         ▼       ▼
 ┌───────┐ ┌───────┐ ┌───────┐
 │ Toast │ │ Table │ │ Chart │ ← 图例复用 Badge 指示点模式
 └───────┘ └───────┘ └───┬───┘
                          │
                     ┌────┴────┐
                     ▼         ▼
                ┌───────┐ ┌───────┐
                │ Card  │ │Colors │ ← 容器 Elevation + 系列色盘
                └───────┘ └───────┘
```

### 具体引用关系

| 复合组件 | 引用的原子组件 | 引用方式 |
|---------|-------------|---------|
| Modal | Button | Cancel 用 Ghost（`rounded-lg`），Confirm 用 Solid（`rounded-full`） |
| Modal | Input | Form Modal 的输入框复用 Base Input 完整样式 |
| Card (Product) | Button | "Add to cart" 按钮复用 Solid Primary |
| Card (Stat) | Badge | 趋势指示器复用 Badge Solid 变体 |
| Toast | Badge | 语义色彩映射（green/amber/red/blue）完全一致 |
| Table | Badge | Status 列使用 Badge Solid 变体 |
| Table | Button | Action 列使用 Button Ghost 变体（`p-1.5` 紧凑版） |
| Chart | Card | 图表容器复用 Card 的 Elevation 体系（`inset-ring` + 背景明度差）· Tooltip 复用 Card 的 `inset-ring` + 白色背景 |
| Chart | Badge | 图例指示点复用 Badge 的 `rounded-full` 点状标记模式 + 语义色彩映射 |
| Chart | Colors | 系列色盘从 Brand Indigo 出发，色相环均匀分布；暗色模式略降饱和度 |
| Footer | Navbar | 链接 hover 样式（Ghost 模式）· Logo 颜色（indigo-600）· 分隔线方案（`border-gray-950/5`）——Footer 是 Navbar 的视觉对称物 |
| Select | Input | border / focus ring / error / disabled 状态样式 100% 复制 |
| Textarea | Input | border / focus ring / error / disabled 状态样式 100% 复制 |
| Checkbox | Input | error / disabled 语义色体系引用（`red-500` / `opacity-50`）；Focus 模式不同（`ring-2 ring-offset-2` vs `inset-ring` 加深） |
| Input (With Button) | Button | 右侧按钮复用 Solid Primary |
| Card (Content) | Content/Prose | Card 内嵌内容区使用 Compact Prose 排版样式 |
| Modal (Body) | Content/Prose | Modal 中的文档/说明内容使用 Prose 排版样式 |
| Content/Prose | — | 原子组件——纯 Typography，引用 spacing.md 的 Typography Scale 和 colors.md 的颜色 Token |

---

## 三、引用方式分级

### Level 1: 完全复用（Copy-Paste）

子组件直接复制父组件的 Tailwind 类名，不做任何修改。

```html
<!-- Input 的 focus 态 -->
class="... focus:border-gray-900 focus:outline-none focus:ring-2 focus:ring-gray-900/10 ..."

<!-- Select 的 focus 态 — 完全一致 -->
class="... focus:border-gray-900 focus:outline-none focus:ring-2 focus:ring-gray-900/10 ..."

<!-- Textarea 的 focus 态 — 完全一致 -->
class="... focus:border-gray-900 focus:outline-none focus:ring-2 focus:ring-gray-900/10 ..."
```

**适用**: 同一 UI 模式跨组件使用（form control states、focus rings、disabled states）

### Level 2: 适配复用（Adapted）

子组件复用父组件样式，但根据上下文微调（如间距、尺寸）。

```html
<!-- Button Ghost 标准版 — px-3 py-2 -->
<button class="rounded-lg px-3 py-2 text-sm font-medium ...">Cancel</button>

<!-- Table Action Button 紧凑版 — px-2 py-1，基于 Ghost 精简 -->
<button class="rounded-lg px-2 py-1 text-xs font-medium ...">Edit</button>
```

**适用**: 子场景需要更紧凑/更宽松的变体

### Level 3: 语义复用（Semantic）

子组件引用父组件的设计决策（如颜色映射），而非直接复制代码。

```
Badge 语义色:
  Success → bg-green-100 + text-green-700
  Error   → bg-red-100   + text-red-700

Toast 语义色:
  Success → bg-green-50 + border-green-300 + text-green-700
  Error   → bg-red-50   + border-red-300   + text-red-700

Table Status 列:
  Active  → Badge Success 变体
  Overdue → Badge Error   变体
```

**适用**: 跨组件的语义一致性（状态传达、品牌色）

---

## 四、如何判断是否需要引用

在创建新组件时，问三个问题：

| 问题 | 如果答案是"是" | 行动 |
|------|-------------|------|
| 新组件中是否有按钮？ | → | 引用 [Button](./components/button.md)，不要重写 |
| 新组件中是否有输入框？ | → | 引用 [Input](./components/input.md) 或 [Textarea](./components/textarea.md) |
| 新组件中是否需要状态色彩？ | → | 引用 [语义色统一](./semantic-color-unification.md) 映射 |

**反模式:**

```html
<!-- ❌ Modal 中重写了一套 Cancel 按钮样式 — 与 Button Ghost 不一致 -->
<button class="rounded-md border px-2 py-1 text-sm font-normal text-gray-500">
  Cancel
</button>
```

**正确做法:**

```html
<!-- ✅ 直接复用 Button Ghost 的 Tailwind 类 -->
<button class="rounded-lg px-3 py-2 text-sm font-medium text-gray-700
  transition-colors hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-800">
  Cancel
</button>
```

---

## 五、例外情况

以下场景允许不引用已有组件：

| 场景 | 原因 | 示例 |
|------|------|------|
| 新组件语义与已有组件完全不同 | 强行复用会误导用户 | Date Picker（不是 Select 的变体） |
| 已有组件的交互模式不适用 | 技术限制 | 拖拽排序（不是 Button） |
| 组件尚未创建 | 先标注 `TODO: 引用 X` | "后续补充" 类型的组件 |

---

## 六、与"语义色统一"的关系

- **语义色统一** 关注的是 **颜色** 跨组件一致性
- **Compose, Don't Duplicate** 关注的是 **整个样式模式** 跨组件一致性

两者互补，共同构成 Design System 的质量底线。

---

> 沉淀自: Modal / Table / Select / Textarea / Toast / Checkbox / Content/Prose 组件设计过程中发现的跨组件依赖模式
