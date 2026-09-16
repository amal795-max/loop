---
name: Loop Communication System
colors:
  surface: '#faf8ff'
  surface-dim: '#d2d9f4'
  surface-bright: '#faf8ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f2f3ff'
  surface-container: '#eaedff'
  surface-container-high: '#e2e7ff'
  surface-container-highest: '#dae2fd'
  on-surface: '#131b2e'
  on-surface-variant: '#44474d'
  inverse-surface: '#283044'
  inverse-on-surface: '#eef0ff'
  outline: '#74777d'
  outline-variant: '#c4c6cd'
  surface-tint: '#4f5f78'
  primary: '#000919'
  on-primary: '#ffffff'
  primary-container: '#0f2137'
  on-primary-container: '#7889a4'
  inverse-primary: '#b6c8e4'
  secondary: '#0051d5'
  on-secondary: '#ffffff'
  secondary-container: '#316bf3'
  on-secondary-container: '#fefcff'
  tertiary: '#00091a'
  on-tertiary: '#ffffff'
  tertiary-container: '#002045'
  on-tertiary-container: '#6f89b5'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#d4e3ff'
  primary-fixed-dim: '#b6c8e4'
  on-primary-fixed: '#091c32'
  on-primary-fixed-variant: '#374860'
  secondary-fixed: '#dbe1ff'
  secondary-fixed-dim: '#b4c5ff'
  on-secondary-fixed: '#00174b'
  on-secondary-fixed-variant: '#003ea8'
  tertiary-fixed: '#d6e3ff'
  tertiary-fixed-dim: '#adc7f7'
  on-tertiary-fixed: '#001b3c'
  on-tertiary-fixed-variant: '#2d476f'
  background: '#faf8ff'
  on-background: '#131b2e'
  surface-variant: '#dae2fd'
typography:
  headline-lg:
    fontFamily: Inter
    fontSize: 30px
    fontWeight: '600'
    lineHeight: 36px
    letterSpacing: -0.02em
  headline-md:
    fontFamily: Inter
    fontSize: 24px
    fontWeight: '600'
    lineHeight: 30px
    letterSpacing: -0.015em
  headline-sm:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 24px
    letterSpacing: -0.01em
  body-lg:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
    letterSpacing: -0.005em
  body-md:
    fontFamily: Inter
    fontSize: 15px
    fontWeight: '400'
    lineHeight: 22px
    letterSpacing: 0em
  body-sm:
    fontFamily: Inter
    fontSize: 13px
    fontWeight: '400'
    lineHeight: 18px
    letterSpacing: 0.005em
  label-lg:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 18px
    letterSpacing: 0.01em
  label-md:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
    letterSpacing: 0.015em
  label-sm:
    fontFamily: Inter
    fontSize: 11px
    fontWeight: '600'
    lineHeight: 14px
    letterSpacing: 0.02em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  space-xxs: 0.25rem
  space-xs: 0.5rem
  space-sm: 0.75rem
  space-md: 1rem
  space-lg: 1.25rem
  space-xl: 1.5rem
  space-2xl: 2rem
  space-3xl: 2.5rem
  gutter-mobile: 1rem
  margin-mobile: 1rem
---

## Brand & Style

This design system embodies a calm, precise, and human-centered posture tailored for high-stakes professional communication. It avoids the chaotic noise and hyper-saturated urgency typical of modern work tools, instead offering an intentional, serene workspace that fosters focus, reliability, and clarity.

The visual style blends **Corporate Modern** with **Tactile Minimalist** cues:
- **Calm Authority:** Deep architectural blues anchor the core hierarchy, providing weight and institutional trust without feeling bureaucratic.
- **Physical Softness:** Realistic, handcrafted tactile affordances are rendered through subtle ambient shadows, translucent surface dividers, and soft corner radii rather than harsh outlines.
- **Frictionless Reading:** Generous tap targets, clear vertical breathing room, and intentional message density ensure long sessions remain effortless.

## Colors

The palette relies on deep oceanic midnight tones paired with pure, breathable white and slate foundations.

- **Primary Anchor (`#0F2137`, `#1A365D`, gradient to `#0B1727`):** Represents structural focus and presence. Utilized for critical navigational states, dark canvas moments, and outgoing message bubbles.
- **Action Accent (`#2563EB`):** A bright royal blue strictly reserved for primary call-to-actions, active indicators, live status pills, and direct interaction targets.
- **Surfaces & Slates:**
    - Canvas / Surface Base: `#FFFFFF`
    - Subsurface / Chat Stream Canvas: `#F8FAFC`
    - Container / Neutral Message Bubble: `#F1F5F9`
    - Borders & Subtle Dividers: `#E2E8F0`
- **Typography & Tonal Contrast:**
    - Primary Text: Slate 900 (`#0F172A`) for effortless legibility.
    - Secondary / Timestamps / Status: Slate 500 (`#64748B`).
    - Subtle / Placeholder: Slate 400 (`#94A3B8`).
    - Inverted Text (on dark bubbles/buttons): Pure White (`#FFFFFF`) with secondary inverted slate (`#CBD5E1`).

## Typography

The type system uses `Inter` for exceptional vertical metrics and optical clarity on mobile displays.

- **Hierarchy Rules:**
    - `body-md` (15px/22px) serves as the default message bubble size, struck specifically to balance reading rhythm with viewport economy on mobile screens.
    - `label-md` and `label-sm` support metadata, read receipts, sender headers, and timestamps.
    - Headlines strictly utilize `-0.015em` to `-0.02em` tracking to keep titles crisp and cohesive.

## Layout & Spacing

The layout is built on a 4px/8px incremental rhythm tailored for mobile ergonomics:
- **Screen Margins:** Fixed 16px (`space-md`) horizontal gutters on phone viewports to maximize message payload width while ensuring comfortable thumb clearance.
- **Message List Layout:** A bottom-anchored, fluid vertical stack with dynamic safe area handling (`env(safe-area-inset-bottom)`).
- **Group Clumping:**
    - 4px (`space-xxs`) gap between contiguous bubbles from the same sender.
    - 12px (`space-sm`) gap between separate senders or message threads.
    - 24px (`space-xl`) separator for day markers and milestone interruptions.

## Elevation & Depth

Visual hierarchy uses **Ambient Shadows** and **Tonal Surfaces**, avoiding stark, artificial borders:

- **Level 0 (Flat Canvas):** `#F8FAFC` for base background; `#FFFFFF` for primary interaction cards.
- **Level 1 (Incoming Message / Soft Inputs):** Flat `#F1F5F9` or pure white with a microscopic edge trace: `0 1px 2px rgba(15, 23, 42, 0.04)`.
- **Level 2 (Outgoing Bubbles & Floating Actions):** Deep layered shadows with midnight blue undertones: `0 4px 12px -2px rgba(15, 33, 55, 0.16), 0 2px 4px -1px rgba(15, 33, 55, 0.08)`.
- **Level 3 (Modals, Action Sheets, Bottom Bars):** `0 12px 32px -4px rgba(15, 23, 42, 0.12)`, supported by `backdrop-filter: blur(12px)` on navigation headers and message composer bars.

## Shapes

The interface embraces organic, comfortable shapes that mirror fluid human conversation:

- **Base Radius:** 8px (`rounded-md`) for badges and small controls.
- **Component Radius:** 16px (`rounded-lg` / `rounded-2xl` equivalents) for cards, search bars, and floating panels.
- **Message Bubbles:** Asymmetric rounding:
    - **Outgoing:** 18px top-left, 18px top-right, 4px bottom-right, 18px bottom-left.
    - **Incoming:** 18px top-left, 18px top-right, 18px bottom-right, 4px bottom-left.
- **Full Radius (Pill):** Avatars, quick-reaction chips, and primary action FABs.

## Components

### Message Bubbles
- **Sent Message:** Background is a vertical gradient from `#1A365D` (top) to `#0F2137` (bottom). Text is `#FFFFFF` (`body-md`), with timestamps in `#CBD5E1` (`label-sm`).
- **Received Message:** Background is solid `#F1F5F9`. Border is subtle 1px `#E2E8F0`. Text is `#0F172A` (`body-md`), with timestamps in `#64748B` (`label-sm`).
- **Max Width:** 78% of viewport width to maintain structured whitespace.

### Buttons & Interactive Controls
- **Primary Button:** Royal Blue `#2563EB` background, white label (`label-lg`), height 48px, radius 16px. Active state transitions to `#1D4ED8` with a 0.98 scale transform.
- **Secondary Action:** Ghost surface `#F1F5F9` with `#0F2137` text, no border.
- **Floating Action Button (New Chat):** Deep `#0F2137` circle (56px) with pure white icon, elevated via Level 2 shadow.

### Input Composer
- Contained bar anchored above the keyboard. Background is `#FFFFFF` with a 1px border `#E2E8F0` and `backdrop-filter: blur(16px)`.
- Input field uses internal padding of 10px 16px, background `#F8FAFC`, radius 24px (pill), expanding dynamically up to 5 lines.

### Iconography & Chips
- **Icon Style:** Duo-tone 24px icon set featuring a 100% opacity stroke (`#0F2137` or `#2563EB`) with a secondary 20% opacity fill on secondary paths.
- **Filter & Channel Chips:** 32px height, pill radius, `#F1F5F9` background, `#64748B` label. Active chip swaps to `#0F2137` fill with `#FFFFFF` label.

### Lists & Thread Cells
- Thread rows feature 72px minimum tap target height. Separator lines are inset by the avatar margin (68px) and rendered using `#E2E8F0` at 0.5px.
- Unread threads feature a 600-weight title and an 8px `#2563EB` solid dot indicator on the trailing edge.