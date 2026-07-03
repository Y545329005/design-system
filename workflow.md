# UI 开发工作流程

> 所有 UI 任务必须先识别场景，再走对应流程。**禁止跳过场景识别。**

---

## 零、场景识别（每次 UI 任务的第一步）

在开始任何工作前，先判断当前属于哪个场景：

```
1. 项目中是否已有 HTML 页面？
   没有 → 场景一：首次生成
   有   → 继续下一题

2. 已有页面是否已经遵循 Design System？
   （判断标准：使用 Tailwind class + 组件类名与 cheatsheet 一致）
   是 → 场景二：持续生成
   否 → 场景三：重构
```

**如果无法自行判断，必须直接问用户**：
"当前任务是：A) 全新页面  B) 已有 DS 页面的增量开发  C) 旧页面的 DS 重构？"

---

## 一、场景一：首次生成

### 适用条件

- 项目中没有任何 HTML 页面
- 或用户明确表示从零开始

### 技术准备（必须全部完成）

- [ ] 页面引入 Tailwind CSS CDN：`<script src="https://cdn.tailwindcss.com"></script>`
- [ ] 页面引入 Design Tokens：`<link rel="stylesheet" href="design-tokens.css" />`
- [ ] `<body>` 设置基础样式：`class="bg-gray-50 text-gray-700 antialiased"`
- [ ] 暗色模式防闪烁脚本已添加

### 步骤

1. **读取规范**（必须按顺序）：
   - `/Users/yangqing/Desktop/design/components-cheatsheet.md`
   - `/Users/yangqing/Desktop/design/ui-system/templates/` 中匹配的模板（如存在）
2. **确定页面结构**：列出所需组件清单
3. **从 cheatsheet 复制组件代码**：严格保持所有类名不变
4. **组装页面**
5. **执行共通收尾**（见第五节）

### 硬约束

- ✅ 组件类名必须与 cheatsheet **完全一致**，禁止修改任何颜色 / 间距 / 圆角
- ✅ 禁止自创组件变体——如果 cheatsheet 中没有，先提出建议
- ✅ 全部颜色只能从 cheatsheet 中出现的色值中选取
- ❌ 禁止使用 `box-shadow`
- ❌ 禁止使用纯黑 `#000` 或纯白 `#FFF` 作为文字色 / 背景色
- ❌ 禁止使用 `rounded-full` 于交互元素
- ❌ 禁止使用 `transition-all`

---

## 二、场景二：持续生成

### 适用条件

- 项目中已有遵循 Design System 的页面
- 本次任务是添加新页面或新功能模块

### 步骤

1. **先读已有页面**：找一两个已有页面的 HTML，理解当前使用的组件和模式
2. **读取相关组件**：从 `/Users/yangqing/Desktop/design/components-cheatsheet.md` 中读取本次需要的组件
3. **匹配已有模式**：新组件的类名、结构、交互方式必须与已有页面一致
4. **增量开发**
5. **执行共通收尾**（见第五节）

### 硬约束

- ✅ 新页面的组件类名必须与已有页面中的同类组件一致
- ✅ 如果已有页面中对 cheatsheet 组件做了调整，新页面沿用调整后的版本
- ✅ 新增组件类型时，必须从 cheatsheet 复制，禁止自创
- ❌ 禁止修改已有组件的样式——即使你觉得"可以改进"
- ❌ 禁止引入已有页面中不存在的颜色或字体

---

## 三、场景三：重构

### 适用条件

- 项目中已有 HTML 页面，但**不遵循** Design System
- 判断标准：页面未使用 Tailwind class，或使用了但与 cheatsheet 组件不一致

### ⚠️ 核心原则（重构专用）

> **重构 = 完全替换，不是增量改进。**
>
> 禁止：保留旧 class + 加几个新 class
> 必须：删除所有旧样式，用 DS 组件重新实现

### 步骤

#### 3.1 技术准备

- [ ] 如果页面未引入 Tailwind CSS CDN：**必须先添加**
  ```html
  <script src="https://cdn.tailwindcss.com"></script>
  ```
- [ ] 确认 `<body>` 设置了基础样式：`class="bg-gray-50 text-gray-700 antialiased"`
- [ ] 如果有旧的 `<style>` 块或外部 CSS 文件：标记为待替换

#### 3.2 读取规范

- `/Users/yangqing/Desktop/design/components-cheatsheet.md`（全部组件）

#### 3.3 分析并替换

对页面中的每个元素，执行以下三步：

```
① 识别：这个元素是什么组件？（按钮 / 卡片 / 输入框 / ...）
② 查找：在 cheatsheet 中找到对应组件代码
③ 替换：删除旧元素的全部 class/style，复制 cheatsheet 组件代码
```

**重点元素检查清单**：

- [ ] 所有按钮 → 替换为 cheatsheet Button
- [ ] 所有输入框 / 下拉框 → 替换为 cheatsheet Input / Select
- [ ] 所有卡片容器 → 替换为 cheatsheet Card
- [ ] 所有表格 → 替换为 cheatsheet Table
- [ ] 所有标签 / 状态标记 → 替换为 cheatsheet Badge
- [ ] 页面背景色 → `bg-gray-50`
- [ ] 所有文字色 → 使用映射表替换（见 3.4）
- [ ] 所有边框 → 改用 `inset-ring`
- [ ] 所有 `box-shadow` → 删除
- [ ] 所有自定义字体 → 删除，使用系统字体栈
- [ ] 所有 `transition: all` → 替换为 `transition-colors duration-150`

#### 3.4 样式映射表（旧 → 新，必须逐条执行）

##### 文字色

| 旧值（任意匹配） | 新值（Tailwind class） |
|----------------|----------------------|
| `#000`, `#111`, `#222`, `#333`, `black` | `text-gray-900` |
| `#444`, `#555`, `#666`, `#777` | `text-gray-700` |
| `#888`, `#999`, `#aaa` | `text-gray-500` |
| `#bbb`, `#ccc` | `text-gray-400` |
| Blue links | `text-indigo-600 hover:text-indigo-700` |
| Red / error text | `text-red-600` |
| Green / success text | `text-green-700` |

##### 背景色

| 旧值 | 新值 |
|------|------|
| `#fafafa`, `#f5f5f5`, `#f0f0f0`, `#f9f9f9` | `bg-gray-50` |
| `#fff`, `white`, `#ffffff` | `bg-white` |
| `#eee`, `#e5e5e5`, `#f3f3f3` | `bg-gray-100` |
| `#ddd`, `#d5d5d5` | `bg-gray-200` |
| Dark backgrounds | `bg-gray-950` |

##### 边框 & 层次

| 旧值 | 新值 |
|------|------|
| `border: 1px solid #ddd` / `#e5e5e5` / `#eee` | `inset-ring inset-ring-gray-950/8` |
| `border: 1px solid #ccc` | `inset-ring inset-ring-gray-950/20` |
| 任何 `box-shadow` | **删除**（用 `inset-ring` + 背景明度差代替） |
| `outline` 用于 focus | `focus-visible:outline-2 focus-visible:outline-offset-2` |
| `input:focus`, `select:focus`, `textarea:focus` 上的 `box-shadow` / `outline` | `focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none` |

> **box-shadow 例外**：overlay 类元素（Dropdown Menu、Tooltip、Modal backdrop）保留 `shadow-lg` / `shadow-sm`，用于传达 Z 轴层级。卡片、按钮、输入框等非 overlay 元素一律禁止。

##### 圆角

| 旧值 | 新值 |
|------|------|
| 按钮 / 输入框 / Badge 上的 `border-radius: 4px~8px` | `rounded-lg` |
| 卡片 / Modal 上的 `border-radius: 8px~16px` | `rounded-xl` |
| `border-radius: 50%` 或 `999px` 于交互元素 | `rounded-lg`（不用 `rounded-full`） |

##### 按钮

| 旧按钮类型 | 新值（完整替换） |
|-----------|----------------|
| 主按钮（蓝 / 绿 / 任意彩色） | `bg-indigo-600 hover:bg-indigo-700 text-white rounded-lg` |
| 次要按钮（白底边框） | `text-gray-900 inset-ring inset-ring-gray-950/8 hover:bg-gray-950/[2.5%] rounded-lg` |
| 危险按钮 | `bg-red-600 hover:bg-red-700 text-white rounded-lg` |
| 文字按钮 / 链接按钮 | `text-gray-700 hover:bg-gray-950/[2.5%] hover:text-gray-900 rounded-lg` |

##### 动效 & 其他

| 旧值 | 新值 |
|------|------|
| `transition: all .3s` / `.2s` | `transition-colors duration-150` |
| 任何 `font-family` 声明 | **删除**（使用系统字体栈） |
| `font-weight: bold` (700) 于标题 | `font-semibold` (600) |
| `font-size` 非 Tailwind 标准值 | 就近选取 `text-xs/sm/base/lg/xl/2xl/3xl/4xl` |

#### 3.5 重构验证（逐元素检查）

- [ ] 页面中**不存在**旧的 class 名或 inline style
- [ ] 每个元素都能在 cheatsheet 中找到对应的组件代码
- [ ] 所有颜色都来自映射表或 cheatsheet
- [ ] 所有 `box-shadow` 已删除（overlay 元素除外：Dropdown、Tooltip、Modal backdrop 的 `shadow-lg`/`shadow-sm` 保留）
- [ ] 所有 `border` 已改用 `inset-ring`
- [ ] 按钮、输入框圆角统一 `rounded-lg`
- [ ] 卡片圆角统一 `rounded-xl`
- [ ] 页面在视觉上是一个整体（不是新旧混合）

#### 3.6 执行共通收尾（见第五节）

---

## 四、重构常见错误（必须避免）

| 错误做法 | 正确做法 |
|---------|---------|
| 保留旧 `class="panel"` 再加 `class="rounded-xl bg-white"` | 删除 `panel`，只保留 DS 类名 |
| 保留旧 `<style>` 块 | 删除整个 `<style>` 块 |
| 只改按钮颜色，不改文字色 | 所有文字色也按映射表替换 |
| 加 `box-shadow` 做层次（非 overlay） | 用 `bg-gray-50` 和 `inset-ring`（overlay 可用 shadow） |
| 保留 `border-radius: 50%` 按钮 | 改为 `rounded-lg` |
| 加 `transition: all` | 改为 `transition-colors duration-150` |
| 保留自定义字体 | 删除 `font-family`，使用系统栈 |

---

## 五、共通收尾（所有场景必须执行）

### 5.1 自检

按照以下清单逐项检查：

**配色**
- [ ] 正文非纯黑 `#000`
- [ ] 背景非纯白 `#FFF`
- [ ] 仅一个强调色（Indigo）
- [ ] 语义色仅用于状态传达
- [ ] 优先使用透明度方案（`black/5`、`gray-950/8`）

**层次**
- [ ] 无 `box-shadow`（全部改用 `inset-ring` + 背景明度差）
- [ ] 卡片使用 `inset-ring` 而非 `border`

**排版**
- [ ] UI 组件字号 `text-sm` (14px)
- [ ] 正文 `text-base` (16px)
- [ ] 标题 `font-semibold` + `tracking-tight`
- [ ] 字重 ≤ 4 种 (400/500/600/700)
- [ ] 无自定义字体

**组件**
- [ ] 交互元素圆角统一 `rounded-lg`
- [ ] 容器圆角统一 `rounded-xl`
- [ ] 不存在 cheatsheet 之外的组件变体

**动效**
- [ ] 过渡时长 ≤ 200ms
- [ ] 使用 `transition-colors` 而非 `transition-all`（例外：进度条可用 `transition-[width]`，仅过渡宽度）
- [ ] 所有交互元素含 `motion-reduce:transition-none`
- [ ] Press 反馈：按钮 `active:scale-[0.97]`，卡片 `active:scale-[0.99]`

**可访问性**
- [ ] 对比度 ≥ 4.5:1
- [ ] Focus ring 完整（`focus-visible:outline-2 outline-offset-2`）
- [ ] 纯图标按钮有 `aria-label`
- [ ] 使用语义 HTML

### 5.2 知识沉淀

每完成一个页面，思考以下问题：

- [ ] 本次是否产生了值得复用的设计经验？
- [ ] 如果有，应更新到哪个模块？
  - Design Tokens（颜色 / 间距 / 圆角 / 动效）
  - Components（新增组件或变体）
  - Templates（页面模板）
  - Checklist（评审清单）

**先提出建议，待确认后再更新规范。禁止直接修改。**

**反馈规范问题时，必须先打开对应 token 源文件确认引用正确，禁止凭记忆引用不存在的 token 或值。**（示例：声称 `--transition-base` 存在但实际 token 是 `--duration-instant`——先 grep 再写反馈。）

### 5.3 隐私自检（每次提交前必须执行）

- [ ] 页面中无真实姓名（检查 `alt` / `aria-label` / 用户名 / 署名）
- [ ] 页面中无真实邮箱（`@example.com` 以外的域名）
- [ ] 页面中无本地绝对路径（`/Users/...`）
- [ ] 所有占位值来自 `checklists/privacy.md` 占位值表，全仓库一致

**如果发现使用了真实信息，立即替换为占位值，单独 commit（不和其他改动混合）。**

快速自检命令：
```bash
grep -rn 'Raymond\|Yang Qing\|yangqing' . --include='*.md' --include='*.html' | grep -v .git
```
返回空即通过。

---

## 六、文件索引

所有场景下可引用的设计系统文件：

| 文件 | 路径 | 用途 |
|------|------|------|
| 组件速查表 | `/Users/yangqing/Desktop/design/components-cheatsheet.md` | **所有场景必读**——全部组件的可复制 HTML |
| 色彩规范 | `/Users/yangqing/Desktop/design/ui-system/design-tokens/colors.md` | 配色决策参考 |
| 排版规范 | `/Users/yangqing/Desktop/design/ui-system/design-tokens/typography.md` | 字体 / 字号 / 字重决策 |
| 间距规范 | `/Users/yangqing/Desktop/design/ui-system/design-tokens/spacing.md` | 间距 / 圆角 / 断点 |
| 动效规范 | `/Users/yangqing/Desktop/design/ui-system/design-tokens/motion.md` | 过渡 / 动画 |
| 层次规范 | `/Users/yangqing/Desktop/design/ui-system/design-tokens/elevation.md` | 阴影 / inset-ring |
| Design Tokens CSS | `/Users/yangqing/Desktop/design/design-tokens.css` | 可复制的 CSS 变量文件 |
| 评审清单 | `/Users/yangqing/Desktop/design/checklists/ui-review.md` | 自检清单 |
| 设计原则 | `/Users/yangqing/Desktop/design/principles/design.md` | 顶级产品设计规律 |

---

## 七、DS 问题反馈指南

> 当你在使用 Design System 过程中发现 cheatsheet 代码与你期望的行为不一致时，按以下流程提交反馈。**禁止凭记忆或印象引用不存在的 token。**

### 反馈前必须执行的步骤

1. **定位差异**
   - cheatsheet 的哪一行 / 哪个 class 让你觉得有问题？
   - 你期望的行为是什么？

2. **查源 token 文件**
   - 打开 `components-cheatsheet.md` 顶部的 Token 溯源索引表
   - 找到对应组件的源 token 文件并打开
   - 确认当前 DS 规范的**真实值**是什么

3. **判断问题类型**
   - 🐛 **Bug**：cheatsheet 代码与 token 文件不一致 → 修复 cheatsheet
   - 💡 **建议**：token 文件本身需要改 → 说明理由，待确认
   - ❓ **疑问**：不确定是有意设计还是疏漏 → 先问，不要断言

4. **写反馈**
   - 引用源文件的具体行号和 token 名（如 `motion.md L32: duration-150`）
   - 附上期望值和当前值的对比
   - 标注类型标签（🐛/💡/❓）

### 反馈格式模板

```markdown
### 🐛/💡/❓ 标题

- **源文件**：`motion.md` L32
- **当前规范值**：`--duration-instant: 150ms`
- **cheatsheet 当前值**：`duration-150`（一致 / 不一致）
- **期望**：xxx
- **理由**：xxx
```

### 常见误解（反馈前先确认）

| 如果你觉得... | 先确认... |
|-------------|---------|
| "transition 应该是 200ms" | `motion.md` L32：默认是 150ms，200ms 是退出动画 |
| "焦点环应该用品牌色" | `elevation.md` L58：表单焦点环是有意用灰色的——品牌色仅用于主按钮/选中态/链接 |
| "卡片应该有 shadow" | `elevation.md` L56：DS 用 `inset-ring` + 背景明度差代替 shadow |
| "这里缺一个 token" | `design-tokens.css` 中 grep 确认，token 可能有不同的命名 |
