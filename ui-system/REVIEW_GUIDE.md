# REVIEW GUIDE

## 目的

生成页面不是任务结束。

所有 UI 完成后，都必须进行一次 Design Review。

Review 的目标：

- 保证设计一致性
- 保证组件复用
- 保证可维护性
- 发现值得沉淀的设计经验

---

# Review 流程

请按照以下顺序进行检查：

① Layout

↓

② Design Tokens

↓

③ Components

↓

④ Interaction

↓

⑤ Accessibility

↓

⑥ Responsive

↓

⑦ Maintainability

↓

⑧ Knowledge

---

# 1. Layout

检查：

□ 页面层级是否清晰

□ 是否遵循统一布局

□ 留白是否合理

□ 是否符合 8pt Grid

□ 是否存在视觉中心

如果存在问题，请指出。

---

# 2. Design Tokens

检查：

□ 是否全部使用已有 Colors

□ 是否全部使用已有 Typography

□ 是否全部使用已有 Radius

□ 是否全部使用已有 Spacing

□ 是否新增了 Token

如果新增，

必须说明原因。

---

# 3. Components

检查：

□ 是否全部复用已有组件

□ 是否重复实现 Button

□ 是否重复实现 Card

□ 是否重复实现 Input

□ 是否重复实现 Badge

□ 是否存在新的组件

如果新增组件：

请回答：

为什么不能复用？

是否建议加入 Design System？

---

# 4. Interaction

检查：

Hover

Focus

Loading

Empty State

Disabled

Animation

是否完整。

---

# 5. Accessibility

检查：

□ Alt

□ Heading

□ Contrast

□ Keyboard

□ Focus Ring

□ aria

是否满足。

---

# 6. Responsive

检查：

Desktop

Tablet

Mobile

是否正常。

---

# 7. Maintainability

检查：

□ 是否存在重复代码

□ 是否存在重复样式

□ 是否容易维护

□ 是否容易扩展

---

# 8. Knowledge Review

最后回答：

今天是否产生：

新的：

Design Principle？

新的：

Component？

新的：

Template？

新的：

Design Token？

如果有，

请建议更新对应文档。

---

# 最终输出格式

请输出：

## Review Score

Layout

★★★★★

Components

★★★★★

Maintainability

★★★★★

Accessibility

★★★★★

Consistency

★★★★★

Overall

95 / 100

---

## 优点

……

---

## 问题

……

---

## 建议

……

---

## 是否建议更新 Design System

YES / NO

原因：

……
