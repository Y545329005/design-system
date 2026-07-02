# {{PROJECT_NAME}}

## 设计系统

本项目的所有 UI 设计**必须**遵循统一 Design System。

### 规范来源

所有 UI 规范位于本项目的 `ui-system/` 目录中（通过 git submodule 或直接复制引入）。

### AI 工作流程

所有 AI 在生成页面前，必须按以下顺序读取规范：

```
1. ui-system/README.md          → 了解整体架构
2. ui-system/design-tokens/     → 色彩 / 间距 / 排版 / 动效 / 层次
3. ui-system/components/        → 需要使用的组件代码
4. ui-system/templates/         → 如果存在匹配的模板
5. 开始设计
6. checklists/ui-review.md      → 自检
```

### 设计约束

- ✅ 优先复用已有组件——禁止重复创造
- ✅ 统一使用 `inset-ring` 而非 `border`
- ✅ 交互元素圆角统一 `rounded-lg` (8px)
- ✅ 容器圆角统一 `rounded-xl` (12px)
- ✅ 过渡统一 `transition-colors duration-150`
- ✅ 品牌色仅 Indigo——不引入第二种强调色
- ✅ 所有组件必须包含 `motion-reduce:transition-none`
- ❌ 不使用 `box-shadow`
- ❌ 不使用纯黑 `#000` 或纯白 `#FFF`
- ❌ 不使用 `rounded-full` 于交互元素
- ❌ 不使用 `transition-all`

### 缺少组件时

如果需要的组件在 DS 中不存在：
1. 不要随意设计
2. 先提出组件设计方案
3. 说明为什么不复用已有组件
4. 待确认后再实现

### 完成后

每完成一个页面：
1. 执行 Review（参考 checklists/ui-review.md）
2. 判断是否产生了值得沉淀的设计经验
3. 如果有，提出更新 DS 的建议
