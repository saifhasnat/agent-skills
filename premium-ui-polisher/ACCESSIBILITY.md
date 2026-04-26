# Accessibility Standards

All UI components must meet WCAG 2.1 AA as a minimum baseline.

## Color & Contrast
- Normal text (< 18px): minimum contrast ratio **4.5:1**.
- Large text (≥ 18px bold or ≥ 24px): minimum **3:1**.
- UI components and focus indicators: minimum **3:1**.
- Never use color alone to convey meaning — always pair with an icon or label.
- Test contrast with the design tokens from `DESIGN_SYSTEM.md` before shipping.

## Typography & Readability
- Base font size: minimum **16px** (1rem). Never go below **12px** for any visible text.
- Line height: **1.5** minimum for body text.
- Avoid justified text — it creates uneven spacing that harms readability.
- Ensure text can be scaled to **200%** without horizontal scrolling.

## Keyboard Navigation
- All interactive elements must be reachable via `Tab` key.
- Logical tab order: matches the visual reading order.
- Custom components (modals, dropdowns, carousels) must trap focus when open and restore it on close.
- Provide visible focus styles — never `outline: none` without a custom replacement.

## ARIA & Semantics
- Use semantic HTML first: `<button>`, `<nav>`, `<main>`, `<header>`, `<footer>`.
- Add `aria-label` to icon-only buttons: `<button aria-label="Close menu">`.
- Use `aria-live="polite"` for dynamic content updates (toasts, status messages).
- Modals need `role="dialog"` and `aria-modal="true"`.
- Form inputs need associated `<label>` elements — not just placeholder text.

## Images & Media
- All `<img>` elements need `alt` text. Decorative images: `alt=""`.
- Videos need captions. Audio needs transcripts.
- Animations: respect `prefers-reduced-motion`:
  ```css
  @media (prefers-reduced-motion: reduce) {
    *, *::before, *::after {
      animation-duration: 0.01ms !important;
      transition-duration: 0.01ms !important;
    }
  }
  ```

## Testing
- Run automated checks with **axe DevTools** or **Lighthouse** (target score ≥ 90).
- Manually test with keyboard-only navigation before every release.
- Test with **VoiceOver** (macOS/iOS) or **NVDA** (Windows) for screen reader coverage.
