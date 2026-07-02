# Content（内容呈现体系）

Content 是所有"内容呈现"规范的命名空间。它定义了产品中各类内容形态的视觉呈现标准——从基础排版到 AI 特有的交互模式。

> **设计原则**: 内容呈现与内容来源解耦。无论内容来自 Markdown 解析、Headless CMS、富文本编辑器还是 AI 模型输出，均使用统一的呈现规范。

---

## 一、架构

```
Content（内容呈现体系）
│
├── Prose（基础排版）        ← 所有内容呈现的 Foundation
│   ├── Base Prose           标准长文本排版
│   ├── Compact Prose        紧凑排版（Card / 评论）
│   └── Inline Prose         行内元素样式片段
│
├── Code Block（代码块）      ← 未来：语法高亮
├── Callout（提示块）         ← 未来：info / warning / error
├── Mermaid（图表）           ← 未来：流程图 / 时序图
├── KaTeX（数学公式）         ← 未来：行内 & 块级公式
└── AI（AI 内容扩展）         ← 未来：Citation / Thinking Block
```

**核心规则**: Prose 是所有内容呈现的 Foundation。每个扩展模块复用 Prose 的排版基础，仅增加自身特有的样式。

---

## 二、模块总览

| 模块 | 状态 | 文件 | 说明 |
|------|------|------|------|
| **Prose** | ✅ 已规范 | [prose.md](./prose.md) | 基础排版——标题、段落、列表、引用、表格、代码等 17 种元素 |
| **Code Block** | 🔮 规划中 | — | 语法高亮代码块（Shiki / Prism 集成） |
| **Callout** | 🔮 规划中 | — | 提示/警告/信息/成功块，复用 Badge 语义色 |
| **Mermaid** | 🔮 规划中 | — | 流程图、时序图、类图渲染 |
| **KaTeX** | 🔮 规划中 | — | 行内 & 块级数学公式 |
| **AI Citation** | 🔮 规划中 | — | AI 生成内容的引用标注 |
| **AI Thinking Block** | 🔮 规划中 | — | AI 推理过程的折叠展示 |

---

## 三、Prose 与扩展模块的关系

```
Prose（Foundation）
  │
  │  复用排版基础（字号、颜色、间距、行高）
  ▼
┌──────────┬──────────┬──────────┬──────────┐
│ Callout  │  Code    │  AI      │  KaTeX   │
│          │  Block   │Citation  │          │
│ 复用      │ 复用      │ 复用      │ 复用      │
│ blockquote│ pre +    │ 引用块     │ 行内代码   │
│ 结构      │ code 结构 │ 排版基础   │ 排版基础   │
└──────────┴──────────┴──────────┴──────────┘
```

每个扩展模块：
- **继承** Prose 的字号体系、颜色 Token、间距节奏
- **新增** 自身特有的视觉语言（如 Callout 的左侧色条、AI Citation 的来源标记）
- **不重复** Prose 已有的元素样式

---

## 四、为什么是"Content"而非"Prose"

| 名称 | 范围 | 问题 |
|------|------|------|
| Markdown | 单一输入格式 | 绑定 .md 文件——CMS、富文本、AI 输出均不适用 |
| Prose | 排版能力 | 准确但不完整——无法收纳图表、公式、AI 交互 |
| **Content** | **内容呈现领域** | 足够抽象，可随产品演进持续扩展 |

Prose 是 Content 体系下**最核心的模块**（Foundation），但不是全部。Content 命名空间为 AI 产品的长期演进预留了空间。

---

## 五、引用方式

其他组件引用 Content 体系时，统一引用具体模块：

```markdown
<!-- Card 内嵌内容 → 引用 Compact Prose -->
[Prose](./content/prose.md) — Compact 变体

<!-- Modal 文档内容 → 引用 Base Prose -->
[Prose](./content/prose.md) — Base 变体

<!-- 未来 -->
[Callout](./content/callout.md)
[AI Citation](./content/ai.md#citation)
```

**不在 compose-dont-duplicate.md 中引用 Content 整体**——只引用具体模块，因为 Content 是命名空间而非组件。

---

## 六、与 Design Tokens 的关系

Content 体系下的所有模块共享同一套 Token 来源：

```
Content/
  ├── Prose ──────────── 引用 spacing.md (Typography Scale)
  │                      引用 colors.md (gray-* Token)
  │                      引用 elevation.md (透明度方案)
  │
  ├── Callout (未来) ──── 复用 Prose 排版 + 语义色统一
  │
  └── AI (未来) ───────── 复用 Prose 排版 + 新增 AI 特有 Token
```

---

> 沉淀自: Prose 组件重命名讨论——从 Markdown → Prose → Content 的命名演进，确立了"命名空间 + Foundation 模块"的架构模式
