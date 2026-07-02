# Semantic Color Unification（语义色统一原则）

Design System 中所有传达状态信息的组件必须使用完全相同的语义色彩映射。

> **适用范围**: Badge · Toast · Alert · Form Validation · Status Indicator
>
> **关联 Token**: [Colors](../design-tokens/colors.md#三semantic-colors语义色)

---

## 一、核心规则

**同一语义 = 同一色彩 = 同一用户心智模型**

```
Success → green   (不是 teal / emerald / lime)
Warning → amber   (不是 orange / yellow)
Error   → red     (不是 rose / pink / crimson)
Info    → blue    (不是 sky / cyan / indigo)
```

用户看到绿色就知道"成功了"，不需要根据组件类型重新学习颜色含义。

---

## 二、统一的语义色映射

### Light Mode

| 语义 | 背景 | 文字 | 边框 | 图标 |
|------|------|------|------|------|
| Success | `bg-green-50` | `text-green-700` | `border-green-300` | `text-green-600` |
| Warning | `bg-amber-50` | `text-amber-700` | `border-amber-300` | `text-amber-600` |
| Error | `bg-red-50` | `text-red-700` | `border-red-300` | `text-red-600` |
| Info | `bg-blue-50` | `text-blue-700` | `border-blue-300` | `text-blue-600` |
| Neutral | `bg-gray-50` | `text-gray-700` | `border-gray-300` | `text-gray-600` |

### Dark Mode

| 语义 | 背景 | 文字 | 边框 |
|------|------|------|------|
| Success | `dark:bg-green-900/30` | `dark:text-green-400` | `dark:border-green-400/50` |
| Warning | `dark:bg-amber-900/30` | `dark:text-amber-400` | `dark:border-amber-400/50` |
| Error | `dark:bg-red-900/30` | `dark:text-red-400` | `dark:border-red-400/50` |
| Info | `dark:bg-blue-900/30` | `dark:text-blue-400` | `dark:border-blue-400/50` |

---

## 三、已应用此原则的组件

| 组件 | 应用方式 | 文件 |
|------|---------|------|
| Badge | Solid / Outline / Icon / Dismissible × 5 色 | [badge.md](../components/badge.md) |
| Toast | Success / Error / Warning / Info / Action / Standout | [toast.md](../components/toast.md) |

两个组件使用完全相同的 `bg-{color}-50` → `bg-{color}-900/30` 映射，零偏差。

---

## 四、未来组件如何遵守

新增组件如果需要传达状态，**必须**从上述映射表取值，不得自行选择颜色。

### 正确示范

```html
<!-- ✅ Alert 组件复用语义色映射 -->
<div class="rounded-lg border border-red-300 bg-red-50 p-4 text-red-700
  dark:border-red-400/50 dark:bg-red-900/30 dark:text-red-400">
  Something went wrong.
</div>
```

### 错误示范

```html
<!-- ❌ 自行选了 rose 色系 — 破坏一致性 -->
<div class="rounded-lg border border-rose-300 bg-rose-50 p-4 text-rose-700">
  Something went wrong.
</div>
```

---

## 五、为什么这条原则重要

1. **降低认知负担** — 用户不需要重新学习每个组件的颜色含义
2. **减少设计漂移** — 没有"这个场景用 green-600，那个场景用 emerald-500"的歧义
3. **暗色模式自动一致** — 统一映射意味着暗色模式也只改一处
4. **新组件加速** — 后续组件直接引用现有映射，零设计决策

---

## 六、例外情况

以下场景允许偏离语义色：

| 场景 | 允许的颜色 | 原因 |
|------|-----------|------|
| 品牌强调 | Primary (当前 gray-900 / TBD) | 品牌色不同于语义色 |
| 装饰性元素 | 任意，但需团队确认 | 不传达信息的纯装饰 |
| 数据可视化 | 扩展色板 | Chart 需要 > 4 种颜色区分数据系列 |

---

> 沉淀自: Badge + Toast 组件设计过程中发现的跨组件一致性模式
