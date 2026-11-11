# Space Duel 24

Space Duel 24 is a two-player arcade game running on the PIC24FJ64GA002. Each player uses a joystick to move within their half of the field and fires projectiles at the other player.

The firmware handles player input, movement, collisions, the match timer, graphics, and audio.

## 1. Project documents

Read these documents before adding or changing a module.

| Document | What it explains | When to use it |
| --- | --- | --- |
| [Software Architecture](docs/architecture.md) | The purpose of each directory and file, the boundaries between modules, and the categories of interfaces they provide. | Before writing code or deciding where a function belongs. |
| [Hardware Resources](docs/resources.md) | Chip pins, peripheral assignments, timers, interrupts, and memory and timing budgets. | Before changing wiring, peripheral settings, or hardware resources. |
| [Testing](docs/testing.md) | Test steps, expected results, and the template for recording actual results. | Before integration and when preparing a pull request. |

Public function declarations belong in the corresponding `.h` files. Document parameter ranges, units, return values, and event behavior next to those declarations.

When the first module interfaces are agreed, we can add `docs/interfaces.md` for cross-module calling examples.

## 2. Repository structure

All paths below are relative to the repository root.

| Path | Contents |
| --- | --- |
| `code/app/` | Program entry point and game rules |
| `code/joystick/` | Joystick calibration, dead zone, sensitivity, and button debounce |
| `code/display/` | Game rendering, ST7796 operations, and graphics assets |
| `code/audio/` | Music, sound effects, and playback timing |
| `code/drivers/` | PIC24 ADC and SPI operations |
| `code/board/` | Pin definitions, clock, PPS, configuration bits, and shared time base |
| `SpaceDuel24.X/` | MPLAB X project and shared build settings |
| `docs/` | Architecture, resource assignments, and test records |
| `hardware/` | Schematics, wiring diagrams, and hardware notes when added |

Open the repository root in VS Code. Open `SpaceDuel24.X/` in MPLAB X.

## 3. Setup and team guides

All setup guides, team policies, and environment documentation are hosted directly on the [Project Wiki](https://github.com/humgzan/SpaceDuel24/wiki).

| Guide | Description | Online Wiki Link |
| --- | --- | --- |
| **Home** | Overview, reading order, and document hierarchy | [Wiki Home](https://github.com/humgzan/SpaceDuel24/wiki) |
| **Development Setup** | Git, identity, VS Code extensions, and repository cloning | [Development Setup](https://github.com/humgzan/SpaceDuel24/wiki/Development-Setup) |
| **Team Workflow** | Branching model, Conventional Commits, PRs, and review rules | [Team Workflow](https://github.com/humgzan/SpaceDuel24/wiki/Team-Workflow) |
| **Build and Program** | MPLAB X configuration, toolchains, build targets, and flashing | [Build and Program](https://github.com/humgzan/SpaceDuel24/wiki/Build-and-Program) |
| **FAQ** | Common development troubleshooting and hardware questions | [FAQ](https://github.com/humgzan/SpaceDuel24/wiki/FAQ) |

## 4. Quick start

1. Clone the whole repository.
2. Install XC16 v2.10 and Microchip PIC24F-GA-GB_DFP v1.11.479, which are selected by the current project.
3. Open the repository root in VS Code.
4. In MPLAB X, use **File → Open Project** and select `SpaceDuel24.X/`.
5. Implement the required modules, then use **Clean and Build**.
6. For hardware testing, select the connected programmer and use **Make and Program Device**.

The current repository contains empty C source placeholders. The shared project selects Simulator. Hardware behavior and a complete firmware build still need implementation and testing.

When adding or moving a source file, update the MPLAB project using relative paths. Commit the source and shared project configuration together.
