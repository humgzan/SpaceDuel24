# Software Architecture

The paths below are relative to the repository root. This page describes the target layout. The interface names and data types should be agreed in the corresponding headers as each module is implemented.

## 1. Application

| File | What goes here | Interface |
| --- | --- | --- |
| `code/app/main.c` | Program entry point, startup order, and main loop. Read input, update the game, pass events to audio, and pass the current state to the renderer. | Entry point and module calls |
| `code/app/game.c` | Match state, player and projectile movement, half-field limits, collisions, countdown, and win or draw rules. Keep rule constants here. | Implements game initialization and updates |
| `code/app/game.h` | Types for player commands, game state used by other modules, and game events. | Initialize or reset a match, update from input and time, and read state and events |

The game works in logical coordinates. For example, a hit changes the game state. The renderer uses that state to update the screen, and audio uses the hit event to play a sound.

## 2. Input and output

| File | What goes here | Interface |
| --- | --- | --- |
| `code/joystick/joystick.c` | Startup center calibration, dead zone, sensitivity curve, and button debounce. Keep separate state for each player. | Converts raw ADC values and button samples into player input |
| `code/joystick/joystick.h` | Raw sample and processed input types. | Initialize or calibrate a controller, update from a sample, and return X/Y direction and a fire event |
| `code/display/renderer.c` | Map game coordinates to screen pixels. Draw the field, ships, bullets, timer, bars, and result screen. Track areas that need to be redrawn. | Implements drawing from the current game state |
| `code/display/renderer.h` | Renderer entry points and any data needed by its caller. | Initialize the view and render a game update |
| `code/display/graphics_assets.h` | Display assets such as sprite bitmaps, character shapes, and color definitions. | Asset data for display code |
| `code/audio/audio.c` | Note sequences, sound selection, playback timing, and OC/PWM control while audio is its only user. | Implements background music and sound effects |
| `code/audio/audio.h` | Audio event types and public functions. | Initialize audio, request a sound, and update playback using time |

## 3. Screen and PIC24 drivers

| File | What goes here | Interface |
| --- | --- | --- |
| `code/display/display_st7796.c` | ST7796 reset and startup commands, address windows, and pixel transfers. | Implements basic drawing operations using SPI |
| `code/display/display_st7796.h` | Screen dimensions and public drawing operations. | Initialize the screen, fill a rectangle, and draw a sprite |
| `code/drivers/adc.c` and `adc.h` | ADC peripheral setup, channel selection, and sample reads. | Initialize the ADC and return raw readings for a requested channel |
| `code/drivers/spi.c` and `spi.h` | SPI peripheral setup and transfers. | Initialize the bus and send bytes or a block of data |

The supplied ST7796 code currently includes SPI setup and game drawing helpers. Keep it together for the first screen test. During integration, move field, timer, bar, and effect drawing into the renderer. Move shared pin and PPS setup to the board layer. Leave ST7796 commands in the screen driver.

## 4. Board setup

| File | What goes here | Interface |
| --- | --- | --- |
| `code/board/pinmap.h` | Named pins, ADC channels, and peripheral assignments for this board. | Shared pin and channel definitions |
| `code/board/board.c` and `board.h` | Startup clock, GPIO directions, analog and digital pin modes, PPS setup, and the shared time base. | Board initialization and a way to read elapsed time |
| `code/board/config_bits.c` | PIC24 configuration pragmas, defined in one place. | Build-time chip settings |

Keep the shared pin, timer, and interrupt assignments in [Hardware Resources](resources.md).

## Interface agreements

| Connection | Agree on before connecting the modules |
| --- | --- |
| Joystick → game | X/Y range, center value, positive directions, and player numbering. A fire event should represent one debounced press. |
| Game → renderer | Logical field size, coordinate origin, player numbering, and which state fields the renderer reads. |
| Game → audio | Event meanings, including shot, hit, and timeout. Decide how audio handles simultaneous requests. |
| Board time → game and audio | Time units and whether each update receives a timestamp or elapsed time. Use the same time base for both modules. |

Put public declarations in the module header and keep internal helpers in the source file. Write the agreed ranges, units, and event behavior next to the declarations so callers can use them directly.

## Development guides

See the [SpaceDuel24 Wiki](https://github.com/humgzan/SpaceDuel24/wiki) for setup, team workflow, and MPLAB X instructions. Keep module responsibilities and interface agreements in this document.
