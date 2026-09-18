# Changelog

## 1.0.0 — 2026-09-18

First formal Disruption01 release prepared for **World of Warcraft 3.3.5a — build 12340**.

### Backport and compatibility

- Backported upstream SinStats 5.902 to Interface 30300.
- Added compatibility for original 3.3.5a combat-log and aura payloads.
- Added Wrath-era glyph, bag, currency, class, timer, UI, and widget compatibility.
- Added 3.3.5a-safe CallbackHandler dispatch and minimap behavior.
- Added legacy `SetEnabled` compatibility.
- Fixed legacy EditBox and Slider construction.
- Fixed 3.3.5a `SetPoint` and options-layout behavior.
- Deferred automatic child-tab opening until parent layout is complete.
- Removed unsupported hyperlink handlers from generic separator frames.

### Release hardening

- Fixed a Settings crash in `HUD.lua:GetSpellIcon()` when currency information returned no icon object.
- Missing spell, item, or currency icons now safely fall back to the bundled `NoIcon` texture.
- The dedicated 3.3.5a path is preferred even if another addon exposes modern-style globals.
- Removed `BackdropTemplate` inheritance from the backport UI path.
- Added a visible **Credits** tab inside SinStats.
- Added Disruption01 release metadata and the visible `v1.0.0` suffix to the AddOns list.

### Upstream base

- SinStats 5.902 by Sinba.
