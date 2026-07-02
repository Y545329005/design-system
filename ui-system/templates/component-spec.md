# Component Spec Template

新组件的规范文档模板。覆盖组件从设计决策到实现细节的所有关键维度。

> **何时使用**: 创建任何新组件规范时，复制此模板作为起点。
>
> **参考示例**: [Content/Prose](../components/content/prose.md)（397 行，17 种元素，3 个变体——最完整的实现案例） · [Button](../components/button.md) · [Checkbox](../components/checkbox.md)

---

## 模板

```markdown
# {Component Name}

{一句话描述——组件是什么，解决什么问题，不绑定数据源或业务场景}

> **Design Tokens**: [Colors](../design-tokens/colors.md) · [Spacing](../design-tokens/spacing.md) · [Elevation](../design-tokens/elevation.md)
>
> **关联组件**: [RelatedComponent](./related-component.md)（关系说明）
>
> **依赖**: {有无外部插件/库依赖}

---

## 设计决策

| 决策 | 选择 | 依据 |
|------|------|------|
| 过渡 | `transition-colors duration-150` | 见 [Motion Token](../design-tokens/motion.md)——禁止 `transition-all`，禁止自定义时长 |
| {决策点 1} | {选择} | {为什么——引用原则/产品共识/WCAG} |
| {决策点 2} | {选择} | {为什么} |
| ... | ... | ... |

---

## 变体

### 1. {Variant Name}（{中文说明}）

{变体的使用场景——什么时候用这个变体}

```html
<!-- {Variant Name} -->
<div class="{tailwind classes}">
  <!-- content -->
</div>
```

**设计要点：**
- {关键设计决策 1}
- {关键设计决策 2}

---

### 2. {Variant Name 2}

{重复以上结构...}

---

## 元素总览

| 元素 | 字号 | 字重 | 颜色 (Light) | 颜色 (Dark) | 特殊样式 |
|------|------|------|-------------|------------|---------|
| {element} | {size} | {weight} | {color} | {color} | {特殊样式说明} |
| ... | ... | ... | ... | ... | ... |

---

## {关键子系统的详细设计}（可选）

如果组件有特别复杂的子系统（如 Prose 的代码块配色），单独展开说明。

| 模式 | 属性 1 | 属性 2 | 说明 |
|------|--------|--------|------|
| Light | ... | ... | ... |
| Dark | ... | ... | ... |

---

## 尺寸

| Size | 字号 | 宽度/最大宽度 | 间距 | 用途 |
|------|------|-------------|------|------|
| **{Variant 1}** | {font size} | {width} | {spacing} | {use case} |
| **{Variant 2}** | {font size} | {width} | {spacing} | {use case} |

---

## Design Tokens

| Token | Light | Dark | Tailwind | 说明 |
|-------|-------|------|----------|------|
| {token-name} | {light value} | {dark value} | {tailwind class} | {说明} |
| ... | ... | ... | ... | ... |

---

## 可访问性

| 要求 | 实现 |
|------|------|
| {WCAG / a11y 要求} | {具体实现方式} |
| ... | ... |

---

## 复用指南

### 何时使用 {Component Name}

| 场景 | 变体 | 说明 |
|------|------|------|
| {场景 1} | {Variant} | {说明} |
| ... | ... | ... |

### 何时不用 {Component Name}

| 场景 | 替代方案 | 原因 |
|------|---------|------|
| {场景} | {替代组件/方案} | {为什么不适用} |

### 组合规则

```
✅ {正确的组合方式}  → {说明}
❌ {错误的组合方式}  → {说明}
```

---

## 与旧版的变更（如果是 Redesign）

| 变更 | 旧方案 | 新方案 | 依据 |
|------|--------|--------|------|
| {变更项} | {旧} | {新} | {依据} |

---

> 参考: {链接到相关的 Design Tokens、组件、原则文件}
```

---

## 使用说明

### 必填章节

每个组件规范**至少**包含以下 7 个章节：

| # | 章节 | 为什么必须 |
|---|------|-----------|
| 1 | 设计决策 | 记录"为什么"而非只是"是什么"——方便未来的自己和团队成员理解选择背后的推理 |
| 2 | 变体 | 至少一个变体的完整代码——可直接复制使用 |
| 3 | Design Tokens | 所有颜色、字号、间距的精确值——保证实现一致性 |
| 4 | 可访问性 | 键盘导航、对比度、语义 HTML、motion-reduce——缺一不可 |
| 5 | 复用指南 | 何时用/何时不用/组合规则——防止误用 |
| 6 | 参考链接 | 关联到当前组件的 Token、原则、关联组件——建立知识网络 |

### 可选章节

| 章节 | 何时添加 |
|------|---------|
| 元素总览 | 组件覆盖多个子元素时（如 Prose 的 17 种元素） |
| 关键子系统 | 某个子系统有独立的设计逻辑需要展开（如代码块配色） |
| 尺寸 | 有多个尺寸变体时 |
| 与旧版的变更 | 这是对已有组件的 redesign |

### 代码规范

- 所有代码示例使用完整的 Tailwind 类名——不缩写、不省略
- Light + Dark 双模式必须覆盖（使用 `dark:` 变体）
- 交互元素必须包含 `focus-visible` 样式
- 过渡必须引用 Motion Token——默认 `transition-colors duration-150`，禁止 `transition-all`
- 过渡必须包含 `motion-reduce:transition-none`
- 代码示例中的内容使用有意义的示例文本，不使用 lorem ipsum

---

> 沉淀自: Prose 组件规范编写过程——397 行规范经过两轮重命名验证，结构被证明完整且可复用
