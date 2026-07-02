# Changelog

All notable changes to this Design System project.

---

## [0.1.0] — 2026-07-02

### 🎯 Overview

Initial release. 27 components, 5 design tokens, 3 page templates, 3 design principles, research analysis of 6 reference sites, and a comprehensive component cheatsheet for AI-driven development.

### Design Tokens (5)

- **Colors** — Neutral grays with transparency layers, semantic colors, dark mode palette
- **Spacing** — Spacing scale, border radius tiers, responsive breakpoints
- **Typography** — System font stack, type scale, font weights, line heights, text colors
- **Motion** — Transition durations, easing functions, animation modes, GPU compositing
- **Elevation** — Z-index layers, inset-ring specification, form control hierarchy

### Base Components (10)

| Component | Variants | File |
|-----------|---------|------|
| Button | 5 (Primary, Secondary, Ghost, Danger, Danger Secondary) + 3 sizes + Icon | `ui-system/components/button.md` |
| Badge | 4 (Solid, Outline, Icon, Dismissible) × 6 colors | `ui-system/components/badge.md` |
| Input | 4 (Base, Icon, Error, Disabled) + states | `ui-system/components/input.md` |
| Select | 5 (Base, Icon, Multiple, Error, Inline) + states | `ui-system/components/select.md` |
| Toggle | 5 (Base, Label, Icon, Color, Disabled) + sizes | `ui-system/components/toggle.md` |
| Checkbox | 7 (Base, Description, Indeterminate, Error, Group, Inline, Disabled) + sizes | `ui-system/components/checkbox.md` |
| Textarea | 5 (Base, CharacterCount, AutoResize, Error, Disabled) + states | `ui-system/components/textarea.md` |
| Radio | 7 (Base, Description, Card, Group, Inline, Error, Disabled) + sizes | `ui-system/components/radio.md` |
| Tabs | 4 (Underline, Pill, Block, Icon) | `ui-system/components/tabs.md` |
| Segmented Control | 3 (Base, BadgeCount, IconOnly) | `ui-system/components/segmented-control.md` |

### Composite Components (15)

| Component | Variants | File |
|-----------|---------|------|
| Card | 6 (Blog, Feature, Profile, Stat, Product, Pricing) + layouts | `ui-system/components/card.md` |
| Modal | 4 (Base, Close, Confirm, Form) + sizes | `ui-system/components/modal.md` |
| Toast | 6 (Success, Error, Warning, Info, Action, Standout) × 4 colors | `ui-system/components/toast.md` |
| Table | 5 (Base, Striped, Actions, Checkbox, Responsive) | `ui-system/components/table.md` |
| Sidebar | 3 (Base, Collapsed, Compact) + responsive | `ui-system/components/sidebar.md` |
| Navbar | 3 (Standalone, Companion, Simple) + responsive | `ui-system/components/navbar.md` |
| Footer | 3 (Base, Compact, Simple) | `ui-system/components/footer.md` |
| Empty State | 4 (Base, WithAction, Inline, FullPage) + icons | `ui-system/components/empty-state.md` |
| Pagination | 4 (Base, Simple, Compact, WithPageSize) + logic | `ui-system/components/pagination.md` |
| Dropdown Menu | 3 (Base, UserMenu, ContextMenu) | `ui-system/components/dropdown-menu.md` |
| Tooltip | 4 directions (Top, Bottom, Left, Right) | `ui-system/components/tooltip.md` |
| Avatar | 4 (Image, Initials, Status, Group) + 5 sizes | `ui-system/components/avatar.md` |
| Skeleton | 6 (Text, Circle, Card, List, Table, FullPage) | `ui-system/components/skeleton.md` |
| Breadcrumb | 4 (Base, Slash, HomeIcon, Mobile) | `ui-system/components/breadcrumb.md` |
| Progress Bar | 6 (Base, Semantic, Indeterminate, Multi, Steps, Icon) | `ui-system/components/progress-bar.md` |

### Data Visualization (1)

- **Chart** — 4 types (Bar, Donut, Sparkline, Area) + 3 states (Loading, Empty, Error)

### Content Presentation (1)

- **Prose** — 3 variants × 17 HTML elements for long-form content

### Page Templates (3)

- **Dashboard** — Sidebar + Navbar + Cards + Table + Chart + Badges
- **Settings** — Sidebar + Navbar + full form components validation
- **Landing Page** — Simple Navbar + Hero + Features + Pricing Cards + Footer

### Design Principles (3)

- **Semantic Color Unification** — Cross-component color consistency rules
- **Compose Don't Duplicate** — Component dependency and composition patterns
- **Naming** — Component / Token / Template naming conventions

### Engineering

- **`components-cheatsheet.md`** — All 27 components' primary variants in a single copyable file (839 lines)
- **`preview-all.html`** — Visual preview of all 27 components with Light/Dark toggle
- **`preview-settings.html`** — Settings page preview
- **`battle-test-dashboard.html`** — Real-world dashboard built purely from cheatsheet (15 components, 0 errors)
- **`design-tokens.json`** + **`design-tokens.css`** — Programmatic token access
- **Project template** — Starter files for new projects
- **`workflow.md`** — Development workflow reference
- **`REVIEW_GUIDE.md`** — Design review checklist
- **`AI_Guide.md`** — AI usage instructions

### Research (6 reference sites)

- Linear, Notion, Stripe, Vercel, TailwindCSS, Anthropic
- Design patterns, component analysis, typography, spacing, interaction patterns

### Key Design Decisions

- **inset-ring** over `border` for all form controls and containers
- **rounded-lg (8px)** for interactive elements, **rounded-xl (12px)** for containers
- **rounded-full** ONLY for Avatar and Progress Bar (explicitly documented exceptions)
- **bg-gray-950/[2.5%]** for hover backgrounds (transparency-based, Light/Dark compatible)
- **transition-colors duration-150** for hover/focus feedback
- **motion-reduce:transition-none** on all interactive elements
- **shadow-lg** only in Dropdown Menu (floating panel needs elevation — documented exception)
- **System font stack** only (no web fonts)
- **300ms delay** for Tooltip display to prevent flickering
