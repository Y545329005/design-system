# Components Cheatsheet

> 所有组件的可复制 HTML 代码块汇总。AI 读一个文件即可获取全部组件的全部变体。
> Light mode 为主，暗色模式在需要时从完整文档补充。
> 最后更新：2026-07-02 · 27 个组件（Card Footer 正式化）

---

## Button

```html
<!-- Primary -->
<button type="button" class="inline-flex items-center justify-center gap-2 rounded-lg bg-indigo-600 px-4 py-2.5 text-sm font-semibold text-white transition-colors duration-150 hover:bg-indigo-700 active:scale-[0.97] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 disabled:cursor-not-allowed disabled:opacity-50 motion-reduce:transition-none">Get started</button>

<!-- Secondary -->
<button type="button" class="inline-flex items-center justify-center gap-2 rounded-lg px-4 py-2.5 text-sm font-semibold text-gray-900 inset-ring inset-ring-gray-950/8 transition-colors duration-150 hover:bg-gray-950/[2.5%] hover:inset-ring-gray-950/20 active:scale-[0.97] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900 disabled:cursor-not-allowed disabled:opacity-50 motion-reduce:transition-none">Learn more</button>

<!-- Ghost -->
<button type="button" class="inline-flex items-center justify-center gap-2 rounded-lg px-3 py-2 text-sm font-medium text-gray-700 transition-colors duration-150 hover:bg-gray-950/[2.5%] hover:text-gray-900 active:scale-[0.97] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900 disabled:cursor-not-allowed disabled:opacity-50 motion-reduce:transition-none">Cancel</button>

<!-- Danger -->
<button type="button" class="inline-flex items-center justify-center gap-2 rounded-lg bg-red-600 px-4 py-2.5 text-sm font-semibold text-white transition-colors duration-150 hover:bg-red-700 active:scale-[0.97] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-red-600 disabled:cursor-not-allowed disabled:opacity-50 motion-reduce:transition-none">Delete</button>

<!-- Danger Secondary -->
<button type="button" class="inline-flex items-center justify-center gap-2 rounded-lg px-4 py-2.5 text-sm font-semibold text-red-600 inset-ring inset-ring-red-200 transition-colors duration-150 hover:bg-red-50 hover:inset-ring-red-300 active:scale-[0.97] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-red-600 disabled:cursor-not-allowed disabled:opacity-50 motion-reduce:transition-none">Remove</button>

<!-- Sizes: sm (32px) / md (40px) / lg (48px) -->
<!-- sm: py-1.5 px-3 text-xs / md: py-2.5 px-4 text-sm / lg: py-3 px-6 text-sm -->

<!-- Icon Button (Ghost) -->
<button type="button" class="inline-flex items-center justify-center rounded-lg p-2.5 text-gray-700 transition-colors duration-150 hover:bg-gray-950/[2.5%] hover:text-gray-900 active:scale-[0.97] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900 motion-reduce:transition-none" aria-label="Settings"><svg class="size-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M12 15a3 3 0 100-6 3 3 0 000 6z"/><path stroke-linecap="round" stroke-linejoin="round" d="M19.4 15a1.65 1.65 0 00.33 1.82l.06.06a2 2 0 010 2.83 2 2 0 01-2.83 0l-.06-.06a1.65 1.65 0 00-1.82-.33 1.65 1.65 0 00-1 1.51V21a2 2 0 01-4 0v-.09A1.65 1.65 0 009 19.4a1.65 1.65 0 00-1.82.33l-.06.06a2 2 0 01-2.83-2.83l.06-.06A1.65 1.65 0 004.68 15a1.65 1.65 0 00-1.51-1H3a2 2 0 010-4h.09A1.65 1.65 0 004.6 9a1.65 1.65 0 00-.33-1.82l-.06-.06a2 2 0 012.83-2.83l.06.06A1.65 1.65 0 009 4.68a1.65 1.65 0 001-1.51V3a2 2 0 014 0v.09a1.65 1.65 0 001 1.51 1.65 1.65 0 001.82-.33l.06-.06a2 2 0 012.83 2.83l-.06.06A1.65 1.65 0 0019.4 9a1.65 1.65 0 001.51 1H21a2 2 0 010 4h-.09a1.65 1.65 0 00-1.51 1z"/></svg></button>
```

---

## Badge

```html
<!-- Solid Success -->
<span class="inline-flex items-center rounded-lg bg-green-50 px-2 py-0.5 text-xs font-medium text-green-700">Active</span>

<!-- Solid Warning -->
<span class="inline-flex items-center rounded-lg bg-amber-50 px-2 py-0.5 text-xs font-medium text-amber-700">Pending</span>

<!-- Solid Error -->
<span class="inline-flex items-center rounded-lg bg-red-50 px-2 py-0.5 text-xs font-medium text-red-700">Overdue</span>

<!-- Solid Info -->
<span class="inline-flex items-center rounded-lg bg-blue-50 px-2 py-0.5 text-xs font-medium text-blue-700">New</span>

<!-- Solid Neutral -->
<span class="inline-flex items-center rounded-lg bg-gray-50 px-2 py-0.5 text-xs font-medium text-gray-700">Draft</span>

<!-- Solid Brand -->
<span class="inline-flex items-center rounded-lg bg-indigo-50 px-2 py-0.5 text-xs font-medium text-indigo-700">Featured</span>

<!-- Outline Success -->
<span class="inline-flex items-center rounded-lg px-2 py-0.5 text-xs font-medium text-green-700 inset-ring inset-ring-green-300">Completed</span>

<!-- With Icon (Success + Check) -->
<span class="inline-flex items-center gap-1 rounded-lg bg-green-50 px-2 py-0.5 text-xs font-medium text-green-700">
  <svg class="size-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5"/></svg>
  Verified
</span>

<!-- Dismissible -->
<span class="inline-flex items-center gap-1 rounded-lg bg-gray-50 pl-2 pr-1 py-0.5 text-xs font-medium text-gray-700">
  Design
  <button type="button" class="inline-flex items-center justify-center rounded p-0.5 text-gray-400 transition-colors duration-150 hover:bg-gray-200 hover:text-gray-600 motion-reduce:transition-none" aria-label="Remove Design">
    <svg class="size-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5"><path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"/></svg>
  </button>
</span>
```

---

## Input

```html
<!-- Base Input -->
<div class="flex flex-col gap-1.5">
  <label for="email" class="text-sm font-medium text-gray-900">Email address</label>
  <input type="email" id="email" placeholder="you@example.com" class="w-full rounded-lg bg-white px-3 py-2 text-sm/6 text-gray-900 inset-ring inset-ring-gray-950/8 placeholder:text-gray-400 transition-colors duration-150 focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none disabled:cursor-not-allowed disabled:opacity-50 disabled:bg-gray-50 motion-reduce:transition-none" />
</div>

<!-- With Icon (Search) -->
<div class="flex flex-col gap-1.5">
  <label for="search" class="text-sm font-medium text-gray-900">Search</label>
  <div class="relative">
    <svg class="pointer-events-none absolute left-3 top-1/2 size-4 -translate-y-1/2 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z"/></svg>
    <input type="search" id="search" placeholder="Search..." class="w-full rounded-lg bg-white py-2 pl-10 pr-3 text-sm/6 text-gray-900 inset-ring inset-ring-gray-950/8 placeholder:text-gray-400 transition-colors duration-150 focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none motion-reduce:transition-none" />
  </div>
</div>

<!-- Error State -->
<div class="flex flex-col gap-1.5">
  <label for="email-error" class="text-sm font-medium text-gray-900">Email address</label>
  <input type="email" id="email-error" value="not-an-email" class="w-full rounded-lg bg-white px-3 py-2 text-sm/6 text-gray-900 inset-ring inset-ring-red-500 placeholder:text-gray-400 transition-colors duration-150 focus:inset-ring-red-600 focus:ring-2 focus:ring-red-500/10 focus:outline-none motion-reduce:transition-none" aria-invalid="true" aria-describedby="email-error-msg" />
  <p id="email-error-msg" class="text-xs text-red-600" role="alert">Please enter a valid email address.</p>
</div>

<!-- Disabled -->
<input type="text" value="Cannot edit" disabled class="w-full rounded-lg bg-gray-50 px-3 py-2 text-sm/6 text-gray-500 inset-ring inset-ring-gray-950/5 disabled:cursor-not-allowed disabled:opacity-50 motion-reduce:transition-none" />
```

---

## Select

```html
<!-- Base Select -->
<div class="flex flex-col gap-1.5">
  <label for="country" class="text-sm font-medium text-gray-900">Country</label>
  <div class="relative">
    <select id="country" class="w-full appearance-none rounded-lg bg-white px-3 py-2 pr-10 text-sm/6 text-gray-900 inset-ring inset-ring-gray-950/8 transition-colors duration-150 focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none disabled:cursor-not-allowed disabled:opacity-50 disabled:bg-gray-50 motion-reduce:transition-none">
      <option>United States</option>
      <option>Canada</option>
      <option>United Kingdom</option>
    </select>
    <svg class="pointer-events-none absolute right-3 top-1/2 size-4 -translate-y-1/2 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M8.25 15L12 18.75 15.75 15m-7.5-6L12 5.25 15.75 9"/></svg>
  </div>
</div>
```

---

## Textarea

```html
<!-- Base Textarea -->
<div class="flex flex-col gap-1.5">
  <label for="bio" class="text-sm font-medium text-gray-900">Bio</label>
  <textarea id="bio" rows="4" placeholder="Tell us about yourself..." class="w-full rounded-lg bg-white px-3 py-2 text-sm/6 text-gray-900 inset-ring inset-ring-gray-950/8 placeholder:text-gray-400 transition-colors duration-150 focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none disabled:cursor-not-allowed disabled:opacity-50 disabled:bg-gray-50 motion-reduce:transition-none"></textarea>
</div>
```

---

## Toggle

```html
<!-- Toggle ON -->
<label class="relative inline-flex cursor-pointer items-center">
  <input type="checkbox" class="peer sr-only" checked />
  <span class="block h-6 w-11 rounded-full bg-indigo-600 transition-colors duration-150 peer-focus-visible:outline-2 peer-focus-visible:outline-offset-2 peer-focus-visible:outline-indigo-600 motion-reduce:transition-none" aria-hidden="true"></span>
  <span class="absolute start-0.5 top-0.5 size-5 rounded-full bg-white transition-transform duration-150 peer-checked:translate-x-[22px] motion-reduce:transition-none" aria-hidden="true"></span>
</label>

<!-- Toggle OFF -->
<label class="relative inline-flex cursor-pointer items-center">
  <input type="checkbox" class="peer sr-only" />
  <span class="block h-6 w-11 rounded-full bg-gray-200 transition-colors duration-150 peer-checked:bg-indigo-600 peer-focus-visible:outline-2 peer-focus-visible:outline-offset-2 peer-focus-visible:outline-indigo-600 motion-reduce:transition-none" aria-hidden="true"></span>
  <span class="absolute start-0.5 top-0.5 size-5 rounded-full bg-white shadow-sm transition-transform duration-150 peer-checked:translate-x-[22px] motion-reduce:transition-none" aria-hidden="true"></span>
</label>

<!-- Toggle with Label -->
<div class="flex items-center justify-between">
  <div>
    <p class="text-sm font-medium text-gray-900">Email notifications</p>
    <p class="text-xs text-gray-500">Receive weekly digests and updates</p>
  </div>
  <label class="relative inline-flex shrink-0 cursor-pointer items-center">
    <input type="checkbox" class="peer sr-only" checked />
    <span class="block h-6 w-11 rounded-full bg-indigo-600 transition-colors duration-150 peer-focus-visible:outline-2 peer-focus-visible:outline-offset-2 peer-focus-visible:outline-indigo-600 motion-reduce:transition-none" aria-hidden="true"></span>
    <span class="absolute start-0.5 top-0.5 size-5 rounded-full bg-white transition-transform duration-150 peer-checked:translate-x-[22px] motion-reduce:transition-none" aria-hidden="true"></span>
  </label>
</div>
```

---

## Checkbox

```html
<!-- Base Checkbox -->
<label class="inline-flex items-start gap-2 cursor-pointer">
  <input type="checkbox" class="peer sr-only" />
  <span class="mt-0.5 flex size-4 shrink-0 items-center justify-center rounded bg-white inset-ring inset-ring-gray-950/8 peer-checked:bg-indigo-600 peer-checked:inset-ring-indigo-600 peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10 peer-disabled:opacity-50 peer-disabled:cursor-not-allowed transition-colors duration-150 motion-reduce:transition-none" aria-hidden="true">
    <svg class="size-3 text-white" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7"/></svg>
  </span>
  <span class="text-sm text-gray-700">Accept terms and conditions</span>
</label>

<!-- With Description -->
<label class="inline-flex items-start gap-2 cursor-pointer">
  <input type="checkbox" class="peer sr-only" />
  <span class="mt-0.5 flex size-4 shrink-0 items-center justify-center rounded bg-white inset-ring inset-ring-gray-950/8 peer-checked:bg-indigo-600 peer-checked:inset-ring-indigo-600 peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10 transition-colors duration-150 motion-reduce:transition-none" aria-hidden="true">
    <svg class="size-3 text-white" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7"/></svg>
  </span>
  <span class="flex flex-col gap-0.5">
    <span class="text-sm font-medium text-gray-900">Email notifications</span>
    <span class="text-sm text-gray-500">Receive email updates about your account activity.</span>
  </span>
</label>

<!-- Checkbox Group (Vertical) -->
<fieldset>
  <legend class="text-sm font-medium text-gray-900 mb-3">Notification preferences</legend>
  <div class="flex flex-col gap-3">
    <label class="inline-flex items-start gap-2 cursor-pointer">
      <input type="checkbox" class="peer sr-only" checked />
      <span class="mt-0.5 flex size-4 shrink-0 items-center justify-center rounded bg-indigo-600 inset-ring inset-ring-indigo-600 peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10 transition-colors duration-150 motion-reduce:transition-none" aria-hidden="true">
        <svg class="size-3 text-white" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7"/></svg>
      </span>
      <span class="text-sm text-gray-700">Comments</span>
    </label>
    <label class="inline-flex items-start gap-2 cursor-pointer">
      <input type="checkbox" class="peer sr-only" />
      <span class="mt-0.5 flex size-4 shrink-0 items-center justify-center rounded bg-white inset-ring inset-ring-gray-950/8 peer-checked:bg-indigo-600 peer-checked:inset-ring-indigo-600 peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10 transition-colors duration-150 motion-reduce:transition-none" aria-hidden="true">
        <svg class="size-3 text-white" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7"/></svg>
      </span>
      <span class="text-sm text-gray-700">Marketing emails</span>
    </label>
  </div>
</fieldset>

<!-- Inline Checkbox Group -->
<div class="flex flex-wrap items-center gap-4">
  <label class="inline-flex items-center gap-2 cursor-pointer">
    <input type="checkbox" class="peer sr-only" checked />
    <span class="flex size-4 shrink-0 items-center justify-center rounded bg-indigo-600 inset-ring inset-ring-indigo-600 peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10 transition-colors duration-150 motion-reduce:transition-none" aria-hidden="true">
      <svg class="size-3 text-white" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7"/></svg>
    </span>
    <span class="text-sm text-gray-700">Active</span>
  </label>
</div>
```

---

## Radio

```html
<!-- Base Radio -->
<label class="inline-flex items-center gap-2 cursor-pointer">
  <input type="radio" name="option" class="peer sr-only" />
  <span class="flex size-4 shrink-0 items-center justify-center rounded-full bg-white inset-ring inset-ring-gray-950/8 peer-checked:bg-indigo-600 peer-checked:inset-ring-indigo-600 peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10 peer-disabled:opacity-50 peer-disabled:cursor-not-allowed transition-colors duration-150 motion-reduce:transition-none" aria-hidden="true">
    <span class="size-1.5 rounded-full bg-white"></span>
  </span>
  <span class="text-sm text-gray-700">Option label</span>
</label>

<!-- Radio Group -->
<fieldset>
  <legend class="text-sm font-medium text-gray-900 mb-3">Plan</legend>
  <div class="flex flex-col gap-3">
    <label class="inline-flex items-center gap-2 cursor-pointer">
      <input type="radio" name="plan" class="peer sr-only" checked />
      <span class="flex size-4 shrink-0 items-center justify-center rounded-full bg-indigo-600 inset-ring inset-ring-indigo-600 peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10 transition-colors duration-150 motion-reduce:transition-none" aria-hidden="true">
        <span class="size-1.5 rounded-full bg-white"></span>
      </span>
      <span class="text-sm text-gray-700">Starter — $10/mo</span>
    </label>
    <label class="inline-flex items-center gap-2 cursor-pointer">
      <input type="radio" name="plan" class="peer sr-only" />
      <span class="flex size-4 shrink-0 items-center justify-center rounded-full bg-white inset-ring inset-ring-gray-950/8 peer-checked:bg-indigo-600 peer-checked:inset-ring-indigo-600 peer-focus-visible:ring-2 peer-focus-visible:ring-offset-2 peer-focus-visible:ring-gray-950/10 transition-colors duration-150 motion-reduce:transition-none" aria-hidden="true">
        <span class="size-1.5 rounded-full bg-white"></span>
      </span>
      <span class="text-sm text-gray-700">Pro — $30/mo</span>
    </label>
  </div>
</fieldset>
```

---

## Card

```html
<!-- Base Card -->
<div class="rounded-xl bg-white inset-ring inset-ring-gray-950/8 p-6">
  <h3 class="text-lg font-semibold tracking-tight text-gray-900">Card Title</h3>
  <p class="mt-2 text-sm text-gray-500">Card description goes here. Keep it concise.</p>
</div>

<!-- Interactive Card -->
<div class="rounded-xl bg-white inset-ring inset-ring-gray-950/8 p-6 transition-colors duration-150 hover:bg-gray-50/50 hover:inset-ring-gray-950/20 active:scale-[0.99] cursor-pointer motion-reduce:transition-none">
  <h3 class="text-lg font-semibold tracking-tight text-gray-900">Clickable Card</h3>
  <p class="mt-2 text-sm text-gray-500">This card responds to hover and click.</p>
</div>

<!-- Stat Card -->
<div class="rounded-xl bg-white inset-ring inset-ring-gray-950/8 p-6">
  <p class="text-xs font-medium uppercase tracking-wider text-gray-500">Total Revenue</p>
  <p class="mt-2 text-3xl font-semibold tracking-tight text-gray-900">$48,292</p>
  <p class="mt-1 text-sm text-gray-500"><span class="text-green-600 font-medium">↑ 12.5%</span> from last month</p>
</div>

<!-- Card with Section (Header / Body / Footer) -->
<div class="overflow-hidden rounded-xl bg-white inset-ring inset-ring-gray-950/8 dark:bg-gray-950 dark:inset-ring-white/10">
  <div class="border-b border-gray-950/5 px-5 py-4 sm:px-6 dark:border-white/5">
    <h3 class="text-base font-semibold text-gray-900 dark:text-gray-100">Card Header</h3>
    <p class="mt-0.5 text-xs text-gray-500 dark:text-gray-400">Optional description</p>
  </div>
  <div class="px-5 py-4 sm:px-6"><!-- Body content --></div>
  <div class="flex items-center justify-end gap-3 border-t border-gray-950/5 px-5 py-3 sm:px-6 dark:border-white/5">
    <button type="button" class="inline-flex items-center justify-center gap-2 rounded-lg px-3 py-2 text-sm font-medium text-gray-700 transition-colors duration-150 hover:bg-gray-950/[2.5%] hover:text-gray-900 active:scale-[0.97] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900 dark:text-gray-400 dark:hover:bg-white/[2.5%] dark:hover:text-white motion-reduce:transition-none">Cancel</button>
    <button type="button" class="inline-flex items-center justify-center gap-2 rounded-lg bg-indigo-600 px-4 py-2.5 text-sm font-semibold text-white transition-colors duration-150 hover:bg-indigo-700 active:scale-[0.97] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 dark:bg-indigo-500 dark:hover:bg-indigo-400 dark:focus-visible:outline-indigo-400 motion-reduce:transition-none">Save</button>
  </div>
</div>

<!-- Card Grid (3 columns) -->
<div class="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3">
  <div class="rounded-xl bg-white inset-ring inset-ring-gray-950/8 p-6">...</div>
  <div class="rounded-xl bg-white inset-ring inset-ring-gray-950/8 p-6">...</div>
  <div class="rounded-xl bg-white inset-ring inset-ring-gray-950/8 p-6">...</div>
</div>
```

---

## Modal

```html
<!-- Modal Overlay + Panel -->
<div class="fixed inset-0 z-50 flex items-center justify-center bg-gray-950/50 backdrop-blur-sm transition-opacity duration-150 ease-in-out motion-reduce:transition-none" role="dialog" aria-modal="true">
  <!-- Modal Panel -->
  <div class="w-full max-w-md rounded-xl bg-white inset-ring inset-ring-gray-950/30 p-6 shadow-none mx-4">
    <!-- Header -->
    <div class="flex items-center justify-between">
      <h2 class="text-lg font-semibold text-gray-900">Modal Title</h2>
      <button type="button" class="inline-flex items-center justify-center rounded-lg p-2 text-gray-400 transition-colors duration-150 hover:bg-gray-100 hover:text-gray-600 motion-reduce:transition-none" aria-label="Close">
        <svg class="size-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"/></svg>
      </button>
    </div>
    <!-- Body -->
    <div class="mt-4 text-sm text-gray-700">
      Modal content goes here.
    </div>
    <!-- Footer -->
    <div class="mt-6 flex items-center justify-end gap-3">
      <button type="button" class="inline-flex items-center justify-center gap-2 rounded-lg px-3 py-2 text-sm font-medium text-gray-700 transition-colors duration-150 hover:bg-gray-950/[2.5%] hover:text-gray-900 active:scale-[0.97] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-900 motion-reduce:transition-none">Cancel</button>
      <button type="button" class="inline-flex items-center justify-center gap-2 rounded-lg bg-indigo-600 px-4 py-2.5 text-sm font-semibold text-white transition-colors duration-150 hover:bg-indigo-700 active:scale-[0.97] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 motion-reduce:transition-none">Confirm</button>
    </div>
  </div>
</div>
```

---

## Toast

```html
<!-- Toast Container -->
<div class="pointer-events-none fixed right-4 top-16 z-50 flex flex-col gap-3" aria-live="polite">
  <!-- Success Toast -->
  <div role="status" class="pointer-events-auto w-full max-w-sm rounded-lg bg-green-50 p-4 inset-ring inset-ring-green-300">
    <div class="flex items-start gap-3">
      <svg class="mt-0.5 size-5 shrink-0 text-green-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
      <div class="flex-1">
        <p class="text-sm font-medium text-green-800">Successfully saved!</p>
        <p class="mt-1 text-sm text-green-700">Your changes have been saved.</p>
      </div>
      <button type="button" class="shrink-0 rounded-lg p-1 text-green-600 transition-colors duration-150 hover:bg-green-200 motion-reduce:transition-none" aria-label="Dismiss">
        <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"/></svg>
      </button>
    </div>
  </div>
  <!-- Error / Warning / Info — same structure, different semantic colors -->
</div>
```

---

## Table

```html
<!-- Base Table -->
<div class="overflow-x-auto rounded-xl bg-white inset-ring inset-ring-gray-950/8">
  <table class="w-full text-left text-sm">
    <thead>
      <tr class="border-b border-gray-950/5">
        <th class="px-4 py-3 text-xs font-medium uppercase tracking-wider text-gray-500">Name</th>
        <th class="px-4 py-3 text-xs font-medium uppercase tracking-wider text-gray-500">Status</th>
        <th class="px-4 py-3 text-xs font-medium uppercase tracking-wider text-gray-500">Role</th>
      </tr>
    </thead>
    <tbody>
      <tr class="border-b border-gray-950/5 transition-colors duration-150 hover:bg-gray-50/50 motion-reduce:transition-none">
        <td class="px-4 py-3 text-gray-900 font-medium">Lindsay Walton</td>
        <td class="px-4 py-3"><span class="inline-flex items-center rounded-lg bg-green-50 px-2 py-0.5 text-xs font-medium text-green-700">Active</span></td>
        <td class="px-4 py-3 text-gray-700">Front-end Developer</td>
      </tr>
      <tr class="border-b border-gray-950/5 transition-colors duration-150 hover:bg-gray-50/50 motion-reduce:transition-none">
        <td class="px-4 py-3 text-gray-900 font-medium">Courtney Henry</td>
        <td class="px-4 py-3"><span class="inline-flex items-center rounded-lg bg-amber-50 px-2 py-0.5 text-xs font-medium text-amber-700">Pending</span></td>
        <td class="px-4 py-3 text-gray-700">Designer</td>
      </tr>
    </tbody>
  </table>
</div>

<!-- Table with Actions -->
<td class="px-4 py-3">
  <div class="flex items-center gap-1">
    <button type="button" class="rounded-lg p-1.5 text-gray-400 transition-colors duration-150 hover:bg-gray-100 hover:text-gray-600 motion-reduce:transition-none" aria-label="Edit">
      <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/></svg>
    </button>
    <button type="button" class="rounded-lg p-1.5 text-gray-400 transition-colors duration-150 hover:bg-red-100 hover:text-red-600 motion-reduce:transition-none" aria-label="Delete">
      <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/></svg>
    </button>
  </div>
</td>
```

---

## Sidebar

```html
<!-- Sidebar (Base) — fixed left, 240px -->
<aside class="fixed left-0 top-0 z-40 flex h-full w-60 flex-col border-r border-gray-950/5 bg-white">
  <!-- Logo -->
  <div class="flex h-14 items-center gap-2 px-4 border-b border-gray-950/5">
    <span class="size-7 rounded-lg bg-indigo-600 flex items-center justify-center text-white font-semibold text-sm">A</span>
    <span class="text-sm font-semibold text-gray-900">Acme Inc</span>
  </div>
  <!-- Nav Items -->
  <nav class="flex-1 overflow-y-auto p-3">
    <div class="flex flex-col gap-1">
      <a href="#" class="flex items-center gap-3 rounded-lg px-3 py-2 text-sm font-medium text-indigo-600 bg-indigo-50 transition-colors duration-150 motion-reduce:transition-none">
        <svg class="size-5 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M2.25 12l8.954-8.955a1.126 1.126 0 011.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25"/></svg>
        Dashboard
      </a>
      <a href="#" class="flex items-center gap-3 rounded-lg px-3 py-2 text-sm font-medium text-gray-700 transition-colors duration-150 hover:bg-gray-50 hover:text-gray-900 motion-reduce:transition-none">
        <svg class="size-5 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z"/></svg>
        Team
      </a>
    </div>
  </nav>
  <!-- Footer -->
  <div class="border-t border-gray-950/5 p-3">
    <div class="flex items-center gap-3 rounded-lg px-3 py-2">
      <span class="size-7 rounded-full bg-gray-200 flex items-center justify-center text-xs font-medium text-gray-600">LW</span>
      <div class="flex-1 min-w-0">
        <p class="text-sm font-medium text-gray-900 truncate">Lindsay Walton</p>
        <p class="text-xs text-gray-500 truncate">lindsay@acme.com</p>
      </div>
    </div>
  </div>
</aside>

<!-- Content area next to sidebar -->
<main class="ml-60 min-h-screen bg-gray-50 p-6">
  <!-- page content -->
</main>
```

---

## Navbar

```html
<!-- Simple Navbar (Landing Page) -->
<header class="sticky top-0 z-50 bg-white/80 backdrop-blur-md border-b border-gray-950/5">
  <div class="mx-auto flex h-14 max-w-6xl items-center justify-between px-4 sm:px-6">
    <div class="flex items-center gap-2">
      <span class="size-7 rounded-lg bg-indigo-600 flex items-center justify-center text-white font-semibold text-sm">A</span>
      <span class="text-sm font-semibold text-gray-900">Acme Inc</span>
    </div>
    <nav class="hidden md:flex items-center gap-1">
      <a href="#" class="rounded-lg px-3 py-2 text-sm font-medium text-gray-700 transition-colors duration-150 hover:text-gray-900 hover:bg-gray-50 motion-reduce:transition-none">Features</a>
      <a href="#" class="rounded-lg px-3 py-2 text-sm font-medium text-gray-700 transition-colors duration-150 hover:text-gray-900 hover:bg-gray-50 motion-reduce:transition-none">Pricing</a>
      <a href="#" class="rounded-lg px-3 py-2 text-sm font-medium text-gray-700 transition-colors duration-150 hover:text-gray-900 hover:bg-gray-50 motion-reduce:transition-none">Docs</a>
    </nav>
    <div class="flex items-center gap-2">
      <button type="button" class="inline-flex items-center justify-center gap-2 rounded-lg px-3 py-2 text-sm font-medium text-gray-700 transition-colors duration-150 hover:bg-gray-950/[2.5%] hover:text-gray-900 active:scale-[0.97] motion-reduce:transition-none">Sign in</button>
      <button type="button" class="inline-flex items-center justify-center gap-2 rounded-lg bg-indigo-600 px-4 py-2.5 text-sm font-semibold text-white transition-colors duration-150 hover:bg-indigo-700 active:scale-[0.97] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 motion-reduce:transition-none">Get started</button>
    </div>
  </div>
</header>
```

---

## Footer

```html
<!-- Base Footer (5-column) -->
<footer class="border-t border-gray-950/5 bg-white">
  <div class="mx-auto max-w-6xl px-4 py-12 sm:px-6">
    <div class="grid grid-cols-2 gap-8 sm:grid-cols-3 lg:grid-cols-5">
      <!-- Brand column -->
      <div class="col-span-2 sm:col-span-3 lg:col-span-2">
        <div class="flex items-center gap-2">
          <span class="size-7 rounded-lg bg-indigo-600 flex items-center justify-center text-white font-semibold text-sm">A</span>
          <span class="text-sm font-semibold text-gray-900">Acme Inc</span>
        </div>
        <p class="mt-3 text-sm text-gray-500 max-w-xs">Build better products with our platform.</p>
      </div>
      <!-- Link columns -->
      <div>
        <h4 class="text-xs font-medium uppercase tracking-wider text-gray-500">Product</h4>
        <ul class="mt-3 flex flex-col gap-2">
          <li><a href="#" class="text-sm text-gray-700 transition-colors duration-150 hover:text-gray-900 motion-reduce:transition-none">Features</a></li>
          <li><a href="#" class="text-sm text-gray-700 transition-colors duration-150 hover:text-gray-900 motion-reduce:transition-none">Pricing</a></li>
        </ul>
      </div>
      <div>
        <h4 class="text-xs font-medium uppercase tracking-wider text-gray-500">Company</h4>
        <ul class="mt-3 flex flex-col gap-2">
          <li><a href="#" class="text-sm text-gray-700 transition-colors duration-150 hover:text-gray-900 motion-reduce:transition-none">About</a></li>
          <li><a href="#" class="text-sm text-gray-700 transition-colors duration-150 hover:text-gray-900 motion-reduce:transition-none">Blog</a></li>
        </ul>
      </div>
      <div>
        <h4 class="text-xs font-medium uppercase tracking-wider text-gray-500">Legal</h4>
        <ul class="mt-3 flex flex-col gap-2">
          <li><a href="#" class="text-sm text-gray-700 transition-colors duration-150 hover:text-gray-900 motion-reduce:transition-none">Privacy</a></li>
          <li><a href="#" class="text-sm text-gray-700 transition-colors duration-150 hover:text-gray-900 motion-reduce:transition-none">Terms</a></li>
        </ul>
      </div>
    </div>
    <!-- Bottom bar -->
    <div class="mt-12 border-t border-gray-950/5 pt-6">
      <p class="text-sm text-gray-500">&copy; 2026 Acme Inc. All rights reserved.</p>
    </div>
  </div>
</footer>
```

---

## Empty State

```html
<!-- Base Empty State -->
<div class="flex flex-col items-center justify-center py-16 text-center">
  <svg class="size-12 text-gray-300" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1 1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4"/></svg>
  <h3 class="mt-4 text-sm font-semibold text-gray-900">No items yet</h3>
  <p class="mt-1 text-sm text-gray-500">Get started by creating your first item.</p>
  <button type="button" class="mt-4 inline-flex items-center justify-center gap-2 rounded-lg bg-indigo-600 px-4 py-2.5 text-sm font-semibold text-white transition-colors duration-150 hover:bg-indigo-700 active:scale-[0.97] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 motion-reduce:transition-none">
    <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15"/></svg>
    Create item
  </button>
</div>
```

---

## Pagination

```html
<!-- Base Pagination -->
<nav class="flex items-center justify-between border-t border-gray-950/5 px-4 py-3" aria-label="Pagination">
  <p class="text-sm text-gray-500">Showing <span class="font-medium">1</span> to <span class="font-medium">10</span> of <span class="font-medium">48</span> results</p>
  <div class="flex items-center gap-1">
    <button type="button" class="inline-flex items-center justify-center rounded-lg p-2 text-gray-500 transition-colors duration-150 hover:bg-gray-100 hover:text-gray-700 disabled:opacity-50 disabled:cursor-not-allowed motion-reduce:transition-none" disabled aria-label="Previous">
      <svg class="size-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M15.75 19.5L8.25 12l7.5-7.5"/></svg>
    </button>
    <span class="inline-flex items-center justify-center rounded-lg bg-indigo-600 px-3 py-2 text-sm font-semibold text-white min-w-[36px]">1</span>
    <button type="button" class="inline-flex items-center justify-center rounded-lg px-3 py-2 text-sm font-medium text-gray-700 transition-colors duration-150 hover:bg-gray-100 hover:text-gray-900 min-w-[36px] motion-reduce:transition-none">2</button>
    <button type="button" class="inline-flex items-center justify-center rounded-lg px-3 py-2 text-sm font-medium text-gray-700 transition-colors duration-150 hover:bg-gray-100 hover:text-gray-900 min-w-[36px] motion-reduce:transition-none">3</button>
    <button type="button" class="inline-flex items-center justify-center rounded-lg p-2 text-gray-500 transition-colors duration-150 hover:bg-gray-100 hover:text-gray-700 motion-reduce:transition-none" aria-label="Next">
      <svg class="size-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5"/></svg>
    </button>
  </div>
</nav>
```

---

## Chart (Quick Reference)

```html
<!-- Bar Chart skeleton — use a charting library for actual rendering -->
<div class="rounded-xl bg-white inset-ring inset-ring-gray-950/8 p-6">
  <div class="flex items-center justify-between">
    <h3 class="text-lg font-semibold tracking-tight text-gray-900">Revenue</h3>
    <select class="appearance-none rounded-lg bg-white px-3 py-2 text-sm/6 text-gray-900 inset-ring inset-ring-gray-950/8 transition-colors duration-150 focus:inset-ring-gray-950/20 focus:ring-2 focus:ring-gray-950/10 focus:outline-none motion-reduce:transition-none">
      <option>Last 7 days</option>
      <option>Last 30 days</option>
    </select>
  </div>
  <!-- Chart goes here -->
  <div class="mt-4 h-64 flex items-center justify-center text-sm text-gray-400">
    Chart rendering area — use Chart.js / ECharts / Recharts
  </div>
</div>
```

---

## Prose (Content Typography)

```html
<!-- Prose Container -->
<article class="prose prose-gray max-w-none">
  <h1 class="text-3xl font-semibold tracking-tight text-gray-900">Heading 1</h1>
  <h2 class="text-xl font-semibold tracking-tight text-gray-900 mt-8 mb-4">Heading 2</h2>
  <h3 class="text-lg font-semibold text-gray-900 mt-6 mb-3">Heading 3</h3>
  <p class="text-base font-normal leading-relaxed text-gray-700 mb-4">Paragraph text for long-form content.</p>
  <a href="#" class="text-indigo-600 transition-colors duration-150 hover:text-indigo-700 motion-reduce:transition-none">Link</a>
  <code class="text-sm font-medium font-mono text-gray-800 bg-gray-100 rounded px-1.5 py-0.5">inline code</code>
  <blockquote class="border-l-4 border-gray-300 pl-4 text-gray-600 italic">Blockquote</blockquote>
  <ul class="list-disc pl-6 text-base text-gray-700">
    <li>List item</li>
  </ul>
  <ol class="list-decimal pl-6 text-base text-gray-700">
    <li>Ordered item</li>
  </ol>
  <hr class="my-8 border-gray-950/5" />
  <img src="..." alt="..." class="rounded-xl" />
  <table class="w-full text-left text-sm">
    <thead><tr class="border-b border-gray-950/5">
      <th class="px-4 py-3 text-xs font-medium uppercase tracking-wider text-gray-500">Header</th>
    </tr></thead>
    <tbody><tr class="border-b border-gray-950/5">
      <td class="px-4 py-3 text-gray-700">Cell</td>
    </tr></tbody>
  </table>
</article>
```

---

## Tabs

```html
<!-- Underline Tabs -->
<nav class="flex border-b border-gray-950/5 dark:border-white/5" role="tablist" aria-label="Content sections">
  <button role="tab" aria-selected="true" aria-controls="panel-1"
    class="relative px-4 py-2.5 text-sm font-medium text-gray-900 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-white dark:hover:text-gray-300">
    Overview
    <span class="absolute inset-x-0 -bottom-px h-0.5 bg-indigo-600 dark:bg-indigo-400" aria-hidden="true"></span>
  </button>
  <button role="tab" aria-selected="false" aria-controls="panel-2"
    class="relative px-4 py-2.5 text-sm font-medium text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-300">
    Analytics
  </button>
  <button role="tab" aria-selected="false" aria-controls="panel-3"
    class="relative px-4 py-2.5 text-sm font-medium text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-300">
    Settings
  </button>
</nav>
<div id="panel-1" role="tabpanel" class="pt-4"><!-- Content --></div>

<!-- Pill Tabs -->
<nav class="inline-flex rounded-lg bg-gray-950/[2.5%] p-1 dark:bg-white/[2.5%]" role="tablist" aria-label="View">
  <button role="tab" aria-selected="true"
    class="rounded-md px-3 py-1.5 text-sm font-medium text-gray-900 bg-white inset-ring inset-ring-gray-950/8 transition-colors duration-150 motion-reduce:transition-none dark:bg-gray-700 dark:text-white dark:inset-ring-white/10">Day</button>
  <button role="tab" aria-selected="false"
    class="rounded-md px-3 py-1.5 text-sm font-medium text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-300">Week</button>
  <button role="tab" aria-selected="false"
    class="rounded-md px-3 py-1.5 text-sm font-medium text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-300">Month</button>
</nav>
```

---

## Dropdown Menu

```html
<!-- Trigger -->
<button type="button" onclick="toggleDropdown('menu')" aria-expanded="false" aria-haspopup="true"
  class="inline-flex items-center gap-2 rounded-lg px-4 py-2.5 text-sm font-semibold text-gray-900 inset-ring inset-ring-gray-950/8 transition-colors duration-150 hover:bg-gray-950/[2.5%] active:scale-[0.97] motion-reduce:transition-none">
  Actions
  <svg class="size-4 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5"/></svg>
</button>

<!-- Panel -->
<div role="menu" aria-orientation="vertical" hidden
  class="absolute left-0 top-full z-30 mt-2 w-56 rounded-xl bg-white p-1 inset-ring inset-ring-gray-950/8 shadow-lg dark:bg-gray-800 dark:inset-ring-white/10">
  <button role="menuitem" class="flex w-full items-center gap-2 rounded-lg px-3 py-2 text-sm text-gray-700 transition-colors duration-150 hover:bg-gray-950/[2.5%] hover:text-gray-900 motion-reduce:transition-none dark:text-gray-300 dark:hover:bg-white/[2.5%] dark:hover:text-white">
    <svg class="size-4 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0115.75 21H5.25A2.25 2.25 0 013 18.75V8.25A2.25 2.25 0 015.25 6H10"/></svg>
    Edit
  </button>
  <div class="my-1 h-px bg-gray-950/5 dark:bg-white/5" role="separator"></div>
  <button role="menuitem" class="flex w-full items-center gap-2 rounded-lg px-3 py-2 text-sm text-red-600 transition-colors duration-150 hover:bg-red-50 hover:text-red-700 motion-reduce:transition-none dark:text-red-400 dark:hover:bg-red-900/30 dark:hover:text-red-300">
    <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0"/></svg>
    Delete
  </button>
</div>
```

---

## Tooltip

```html
<!-- Top Tooltip -->
<div class="relative inline-flex">
  <button type="button" aria-describedby="tt-1"
    class="inline-flex items-center justify-center rounded-lg p-2.5 text-gray-700 transition-colors duration-150 hover:bg-gray-950/[2.5%] hover:text-gray-900 motion-reduce:transition-none">
    <svg class="size-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M12 15a3 3 0 100-6 3 3 0 000 6z"/><path stroke-linecap="round" stroke-linejoin="round" d="M19.4 15a1.65 1.65 0 00.33 1.82l.06.06a2 2 0 010 2.83 2 2 0 01-2.83 0l-.06-.06a1.65 1.65 0 00-1.82-.33 1.65 1.65 0 00-1 1.51V21a2 2 0 01-4 0v-.09A1.65 1.65 0 009 19.4a1.65 1.65 0 00-1.82.33l-.06.06a2 2 0 01-2.83-2.83l.06-.06A1.65 1.65 0 004.68 15a1.65 1.65 0 00-1.51-1H3a2 2 0 010-4h.09A1.65 1.65 0 004.6 9a1.65 1.65 0 00-.33-1.82l-.06-.06a2 2 0 012.83-2.83l.06.06A1.65 1.65 0 009 4.68a1.65 1.65 0 001-1.51V3a2 2 0 014 0v.09a1.65 1.65 0 001 1.51 1.65 1.65 0 001.82-.33l.06-.06a2 2 0 012.83 2.83l-.06.06A1.65 1.65 0 0019.4 9a1.65 1.65 0 001.51 1H21a2 2 0 010 4h-.09a1.65 1.65 0 00-1.51 1z"/></svg>
  </button>
  <div id="tt-1" role="tooltip" hidden
    class="absolute bottom-full left-1/2 -translate-x-1/2 mb-2 px-2.5 py-1.5 text-xs font-medium text-white bg-gray-900 rounded-lg shadow-sm whitespace-nowrap max-w-xs dark:bg-gray-700">
    Settings
    <div class="absolute top-full left-1/2 -translate-x-1/2 -mt-px border-4 border-transparent border-t-gray-900 dark:border-t-gray-700" aria-hidden="true"></div>
  </div>
</div>
```

---

## Avatar

```html
<!-- Image Avatar MD -->
<img src="..." alt="Yang Qing" class="size-10 rounded-full object-cover inset-ring inset-ring-white dark:inset-ring-gray-900">

<!-- Initials Avatar MD -->
<span class="inline-flex items-center justify-center size-10 rounded-full bg-indigo-600 text-sm font-medium text-white inset-ring inset-ring-white dark:inset-ring-gray-900" aria-label="Yang Qing">YQ</span>

<!-- With Online Status -->
<div class="relative inline-flex">
  <img src="..." alt="Yang Qing" class="size-10 rounded-full object-cover inset-ring inset-ring-white dark:inset-ring-gray-900">
  <span class="absolute bottom-0 right-0 size-3 rounded-full bg-green-500 inset-ring inset-ring-2 inset-ring-white dark:inset-ring-gray-900" aria-label="Online"></span>
</div>

<!-- Avatar Group -->
<div class="flex items-center -space-x-2">
  <img src="..." alt="A" class="relative size-10 rounded-full object-cover inset-ring inset-ring-2 inset-ring-white dark:inset-ring-gray-900">
  <img src="..." alt="B" class="relative size-10 rounded-full object-cover inset-ring inset-ring-2 inset-ring-white dark:inset-ring-gray-900">
  <span class="relative inline-flex items-center justify-center size-10 rounded-full bg-gray-100 text-xs font-medium text-gray-600 inset-ring inset-ring-2 inset-ring-white dark:bg-gray-800 dark:text-gray-400 dark:inset-ring-gray-900">+3</span>
</div>
```

---

## Skeleton

```html
<!-- Text Skeleton -->
<div class="space-y-2.5">
  <div class="h-5 w-[70%] bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
  <div class="h-4 bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
  <div class="h-4 w-[85%] bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
</div>

<!-- Avatar Skeleton -->
<div class="size-10 rounded-full bg-gray-200 animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>

<!-- Card Skeleton -->
<div class="rounded-xl bg-white p-6 inset-ring inset-ring-gray-950/8 dark:bg-gray-900 dark:inset-ring-white/10">
  <div class="h-48 bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
  <div class="mt-5 space-y-3">
    <div class="h-5 w-[60%] bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
    <div class="h-4 bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
    <div class="h-4 w-[75%] bg-gray-200 rounded-lg animate-pulse motion-reduce:animate-none dark:bg-gray-700"></div>
  </div>
</div>
```

---

## Breadcrumb

```html
<!-- Slash Separator -->
<nav aria-label="Breadcrumb" class="flex items-center gap-1.5 text-sm">
  <a href="/" class="text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-200">Home</a>
  <span class="text-gray-400 select-none" aria-hidden="true">/</span>
  <a href="/products" class="text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-200">Products</a>
  <span class="text-gray-400 select-none" aria-hidden="true">/</span>
  <span class="text-gray-900 font-medium dark:text-white" aria-current="page">Item Name</span>
</nav>
```

---

## Progress Bar

```html
<!-- Base (60%) -->
<div class="space-y-1.5">
  <div class="flex items-center justify-between text-xs text-gray-500 dark:text-gray-400">
    <span>Progress</span><span>60%</span>
  </div>
  <div role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
    class="h-2 rounded-full bg-gray-200 dark:bg-gray-700">
    <div class="h-full rounded-full bg-indigo-600 transition-all duration-300 ease-in-out motion-reduce:transition-none" style="width:60%"></div>
  </div>
</div>

<!-- Indeterminate -->
<div role="progressbar" aria-label="Loading" class="h-2 rounded-full bg-gray-200 overflow-hidden dark:bg-gray-700">
  <div class="h-full w-1/2 rounded-full bg-indigo-600 animate-[indeterminate_1.5s_ease-in-out_infinite] motion-reduce:animate-none"></div>
</div>
<!-- CSS: @keyframes indeterminate { 0%{translate:-100%} 100%{translate:300%} } -->

<!-- Steps (3/5) -->
<div class="flex gap-1.5">
  <div class="h-2 flex-1 rounded-full bg-indigo-600"></div>
  <div class="h-2 flex-1 rounded-full bg-indigo-600"></div>
  <div class="h-2 flex-1 rounded-full bg-indigo-600"></div>
  <div class="h-2 flex-1 rounded-full bg-gray-200 dark:bg-gray-700"></div>
  <div class="h-2 flex-1 rounded-full bg-gray-200 dark:bg-gray-700"></div>
</div>
```

---

## Segmented Control

```html
<!-- Filter by Status -->
<div class="inline-flex rounded-lg bg-gray-950/[2.5%] p-1 dark:bg-white/[2.5%]" role="radiogroup" aria-label="Filter">
  <button role="radio" aria-checked="true"
    class="rounded-md px-3 py-1.5 text-sm font-medium text-gray-900 bg-white inset-ring inset-ring-gray-950/8 transition-colors duration-150 motion-reduce:transition-none dark:bg-gray-700 dark:text-white dark:inset-ring-white/10">All</button>
  <button role="radio" aria-checked="false"
    class="rounded-md px-3 py-1.5 text-sm font-medium text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-300">Active</button>
  <button role="radio" aria-checked="false"
    class="rounded-md px-3 py-1.5 text-sm font-medium text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-300">Draft</button>
</div>

<!-- Icon-only View Toggle -->
<div class="inline-flex rounded-lg bg-gray-950/[2.5%] p-1 dark:bg-white/[2.5%]" role="radiogroup" aria-label="View mode">
  <button role="radio" aria-checked="true" aria-label="Grid view"
    class="rounded-md p-2 text-gray-900 bg-white inset-ring inset-ring-gray-950/8 transition-colors duration-150 motion-reduce:transition-none dark:bg-gray-700 dark:text-white dark:inset-ring-white/10">
    <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6A2.25 2.25 0 016 3.75h2.25A2.25 2.25 0 0110.5 6v2.25a2.25 2.25 0 01-2.25 2.25H6a2.25 2.25 0 01-2.25-2.25V6zM3.75 15.75A2.25 2.25 0 016 13.5h2.25a2.25 2.25 0 012.25 2.25V18a2.25 2.25 0 01-2.25 2.25H6A2.25 2.25 0 013.75 18v-2.25zM13.5 6a2.25 2.25 0 012.25-2.25H18A2.25 2.25 0 0120.25 6v2.25A2.25 2.25 0 0118 10.5h-2.25a2.25 2.25 0 01-2.25-2.25V6zM13.5 15.75a2.25 2.25 0 012.25-2.25H18a2.25 2.25 0 012.25 2.25V18A2.25 2.25 0 0118 20.25h-2.25A2.25 2.25 0 0113.5 18v-2.25z"/></svg>
  </button>
  <button role="radio" aria-checked="false" aria-label="List view"
    class="rounded-md p-2 text-gray-500 transition-colors duration-150 hover:text-gray-700 motion-reduce:transition-none dark:text-gray-400 dark:hover:text-gray-300">
    <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M8.25 6.75h12M8.25 12h12m-12 5.25h12M3.75 6.75h.007v.008H3.75V6.75zm.375 5.25h.007v.008H3.75V12zm.375 5.25h.007v.008H3.75V17.25z"/></svg>
  </button>
</div>
```

---

## Layout Patterns

```html
<!-- Sidebar + Content Layout (App) -->
<div class="flex min-h-screen bg-gray-50">
  <aside class="fixed left-0 top-0 z-40 h-full w-60 ..."><!-- Sidebar --></aside>
  <main class="ml-60 flex-1 p-6"><!-- Content --></main>
</div>

<!-- Header + Content Layout (Landing) -->
<header class="sticky top-0 z-50 bg-white/80 backdrop-blur-md border-b border-gray-950/5"><!-- Navbar --></header>
<main class="min-h-screen"><!-- Sections --></main>
<footer class="border-t border-gray-950/5 bg-white"><!-- Footer --></footer>

<!-- Section Container -->
<section class="mx-auto max-w-6xl px-4 py-12 sm:px-6 sm:py-16 lg:py-24">
  <h2 class="text-3xl font-semibold tracking-tight text-gray-900">Section Title</h2>
  <p class="mt-4 text-base text-gray-500 max-w-2xl">Section description.</p>
  <!-- content -->
</section>
```

---

## 使用说明

1. **复制代码块** — 所有代码可复制到 Tailwind CSS 项目中直接使用
2. **暗色模式** — 需要时添加 `dark:` 前缀变体（参考完整组件文档）
3. **motion-reduce** — 所有交互元素已包含 `motion-reduce:transition-none`
4. **组件文档** — 完整的设计决策、Token 映射、可访问性说明在 `ui-system/components/` 中
