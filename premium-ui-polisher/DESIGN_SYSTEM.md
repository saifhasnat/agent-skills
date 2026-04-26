# Design System Guidelines

Follow these rules for all UI components to maintain a premium feel.

## Typography
- Use modern fonts like **Inter**, **Outfit**, or **Roboto**.
- Always define a clear hierarchy:
  - `h1`: 2.5rem+, bold
  - `h2`: 1.75rem, semi-bold
  - `body`: 1rem, regular
- Leading (line-height) should be 1.5 - 1.6 for readability.

## Color Palette
- Avoid `#000000` or `#ffffff` as base colors. Use soft blacks (`#121212`) and off-whites.
- Use HSL for color variations to ensure harmony.
- **Primary**: Sleek Indigo or Deep Teal.
- **Secondary**: Vibrant Accent (Gold, Rose, or Neon Green).
- **Gradients**: Use linear-gradients at 135deg with subtle opacity shifts.

## Glassmorphism & Depth
- Use `backdrop-filter: blur(10px)` for overlays.
- Add subtle borders: `1px solid rgba(255, 255, 255, 0.1)`.
- Use soft, layered box-shadows rather than a single harsh shadow.

## Interactive Elements
- All buttons should have a `hover` and `active` state.
- Use `transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);` for smoothness.
- Checkboxes and toggles should have custom styling (avoid browser defaults).
