# SinStats — WoW 3.3.5a Backport

SinStats is an on-screen character statistics addon originally created by **Sinba**.

This repository contains the **World of Warcraft 3.3.5a (build 12340)** backport and compatibility work maintained by **Disruption01**.

## Status

**Disruption01 release:** 1.0.0  
**Upstream base:** SinStats 5.902  
**Target:** World of Warcraft 3.3.5a — build 12340 / Interface 30300

The backport is functional and has received multiple compatibility passes for the original 3.3.5a client. Public redistribution must not proceed until permission from the upstream author is confirmed and recorded, because the upstream CurseForge project is currently marked **All Rights Reserved**.

## Features

- Configurable on-screen character statistics HUD.
- Melee, defense, ranged, spell, pet, resistance, currency, and miscellaneous statistics.
- Configurable fonts, colors, spacing, alignment, icons, and display order.
- Profile support.
- Event-based HUD visibility.
- Minimap access and `/sinstats` / `/ss` configuration commands.

## Disruption01 Additions

- Backported SinStats 5.902 to the original WoW 3.3.5a client.
- Added compatibility for the 3.3.5a combat-log payload and aura APIs.
- Added Wrath-era glyph, bag, currency, class, timer, UI, and widget compatibility.
- Added 3.3.5a-safe CallbackHandler dispatch and minimap behavior.
- Added compatibility for legacy `SetEnabled`, EditBox, Slider, and layout behavior.
- Fixed Settings child-page construction and unsupported hyperlink script registration.
- Hardened icon resolution so missing spell, item, or currency data cannot abort the Settings UI.
- Removed reliance on the modern `BackdropTemplate` from the 3.3.5a UI path.
- Added an in-addon **Credits** section identifying the original author and the backport maintainer.

## Compatibility

- **World of Warcraft 3.3.5a**
- **Build 12340**
- **Interface 30300**

This repository does not claim support for Retail or official Classic clients.

## Requirements

No external addon dependency is required. Required libraries are embedded in the `SinStats` addon folder.

## Installation

1. Download the release archive.
2. Extract it.
3. Copy the included `SinStats` folder into `World of Warcraft\Interface\AddOns`.
4. Start or restart World of Warcraft.
5. Confirm that **SinStats v1.0.0** appears in the AddOns list.

The expected layout is:

```text
Interface\AddOns\SinStats\SinStats.toc
```

## Configuration / Usage

Open the SinStats configuration using the minimap button or one of the slash commands below.

## Commands

```text
/sinstats
/ss
```

## Known Issues

- Some flat, racial, or talent-based hit modifiers may require additional calibration beyond combat rating on the original 3.3.5a client.
- Wrath Classic-only currencies such as Sidereal Essence and Defiler's Scourgestone do not exist in original 3.3.5a and are intentionally not supported.
- Some rarely used upstream edge features may still expose differences between modern Classic APIs and the original 3.3.5a client.

Please report the **first** Lua error after `/reload`; later errors may only be cascades.

## Version

- Disruption01 release: **1.0.0**
- Upstream base: **5.902**

The Disruption01 release version is the version displayed in the WoW AddOns list.

## Updating

Replace the existing `Interface\AddOns\SinStats` folder with the folder from the new release.

Do not delete your `WTF` folder or SavedVariables unless a specific release note explicitly requires a reset.

## Credits

Original addon by **Sinba**.  
Original project: https://www.curseforge.com/wow/addons/sinstats  
Original license: **All Rights Reserved**

World of Warcraft 3.3.5a backport and compatibility work by **Disruption01**.

GitHub: https://github.com/disruption01  
Discord: https://discord.gg/eJ5MaVNnBm

## License

The upstream SinStats project is currently distributed as **All Rights Reserved**. This repository does not replace or override the upstream author's rights.

Before making this derived project or a release archive public, obtain and retain explicit permission from the upstream author for modification and redistribution.

See [LICENSE](LICENSE) for the repository notice.

## Bug Reports

Please report issues through GitHub Issues:
https://github.com/disruption01/Sinstats_335a_backport/issues

When reporting a bug, include:

- SinStats / Disruption01 version;
- WoW client version/build;
- full Lua error, starting with the first error after `/reload`;
- reproduction steps;
- screenshots when relevant;
- server/core when relevant.

Discord is suitable for discussion and general help; GitHub Issues are preferred for tracked bugs.

## Contributing

Compatibility fixes and well-documented bug reports are welcome. Changes must preserve upstream attribution and remain scoped to the real target client documented by this repository.

## Support

If you enjoy my addons and would like to support continued development, maintenance, ports, and backports:

https://linktr.ee/disruption01

Support is completely optional and does not unlock addon functionality.
