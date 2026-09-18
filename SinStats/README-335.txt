SinStats 5.902 -> WoW 3.3.5a backport (test build 0.1)

Target:
  WoW 3.3.5a build 12340 / Interface 30300

Install:
  1. Remove or rename any existing SinStats folder.
  2. Put this SinStats folder in Interface\AddOns\
  3. In game: /console scriptErrors 1
  4. /reload
  5. Open with /sinstats or /ss

This is a first-pass compatibility build and has not been executed inside a 3.3.5a client in this environment.

Backported areas include:
  - 3.3.5a TOC/interface target
  - old combat-log event payload compatibility
  - old aura return layouts
  - old glyph API / Wrath glyph IDs
  - C_Timer compatibility
  - legacy bag/currency/class compatibility wrappers
  - 3.3.5a-safe UI/widget calls
  - 3.3.5a-safe CallbackHandler dispatch
  - minimap button compatibility

Known limitations in 0.1:
  - Some flat/talent/racial hit modifiers may need calibration beyond combat rating.
  - Wrath Classic-only currencies (e.g. Sidereal Essence / Defiler's Scourgestone) are disabled.
  - Optional/edge features may still expose client API differences and need a follow-up patch.

If an error occurs, copy the FIRST Lua error after /reload; later errors may only be cascades.

IMPORTANT WHEN UPGRADING
------------------------
Delete the old Interface\AddOns\SinStats folder before copying this build.
After /reload, the bottom-left of the SinStats settings window must show:
5.902-335.0.3

