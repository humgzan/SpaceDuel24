# Hardware Resources

This document records the pin map, peripheral assignments, and resource budgets for the PIC24FJ64GA002 in the 28-pin SPDIP package.

| Status | Meaning |
| --- | --- |
| Current code | Present in the supplied ST7796 source. Check against the wiring. |
| Proposed | Suggested assignment for integration. Confirm before use. |
| Confirmed | Wiring and configuration have been checked and tested. |
| TBD | A decision or measurement is still needed. |

The assignments below are a proposed integration plan. Update their status when the team confirms them.

## 1. Chip pin allocation

Pin numbers are physical SPDIP package numbers.

| Pin | Signal | Project use | Status |
| --- | --- | --- | --- |
| 1 | MCLR | Reset and programming | Reserved |
| 2 | RA0 / AN0 | P1 joystick X | Proposed |
| 3 | RA1 / AN1 | P1 joystick Y | Proposed |
| 4 | RB0 / RP0 / AN2 / PGED1 | ICSP data | Proposed reserve |
| 5 | RB1 / RP1 / AN3 / PGEC1 | ICSP clock | Proposed reserve |
| 6 | RB2 / RP2 / AN4 | P2 joystick X | Proposed |
| 7 | RB3 / RP3 / AN5 | P2 joystick Y | Proposed |
| 8 | VSS | Ground | Reserved |
| 9 | RA2 / OSCI | Clock connection if needed | Reserved pending clock choice |
| 10 | RA3 / OSCO | Clock connection if needed | Reserved pending clock choice |
| 11 | RB4 / RP4 | P1 fire button | Proposed |
| 12 | RA4 | P2 fire button | Proposed |
| 13 | VDD | Supply | Reserved |
| 14 | RB5 / RP5 | Spare | Unassigned |
| 15 | RB6 / RP6 | Spare | Unassigned |
| 16 | RB7 / RP7 | OC1 audio output | Proposed |
| 17 | RB8 / RP8 | SPI1 SCK output to TFT | Current code |
| 18 | RB9 / RP9 | SPI1 SDO output to TFT | Current code |
| 19 | DISVREG | Regulator control | Reserved |
| 20 | VCAP / VDDCORE | Core regulator capacitor | Reserved |
| 21 | RB10 / RP10 / PGED2 | TFT CS | Current code |
| 22 | RB11 / RP11 / PGEC2 | TFT DC | Current code |
| 23 | RB12 / RP12 / AN12 | TFT RESET | Current code |
| 24 | RB13 / RP13 / AN11 | Spare | Unassigned |
| 25 | RB14 / RP14 / AN10 | Optional UART1 TX | Proposed reserve |
| 26 | RB15 / RP15 / AN9 | Optional UART1 RX | Proposed reserve |
| 27 | AVSS | Analog ground | Reserved |
| 28 | AVDD | Analog supply | Reserved |

For the proposed regulator-enabled setup, connect DISVREG to ground and use the VCAP capacitor specified in the device data sheet. Keep the supply and reset wiring in `hardware/`.

The proposed debug pair is PGEC1/PGED1. PGEC2/PGED2 share pins with the current TFT connections.

## 2. On-chip resource allocation

The device provides 8 KB SRAM, five 16-bit timers, five output compare channels, five input capture channels, two SPI modules, two UART modules, and two I2C modules. Ten external ADC channels are available in the 28-pin package.

| Resource | Project use | Configuration location | Status |
| --- | --- | --- | --- |
| ADC1 | Sample the four joystick axes | `code/drivers/adc.c` | Proposed |
| SPI1 | TFT communication | `code/drivers/spi.c` | Current code, planned extraction |
| SPI2 | Spare | TBD if used | Unassigned |
| UART1 | Optional serial debug output | Add `code/drivers/uart.c/.h` if needed | Proposed reserve |
| UART2 | Spare | TBD if used | Unassigned |
| I2C1 / I2C2 | Spare | TBD if used | Unassigned |
| OC1 | Audio square wave | `code/audio/audio.c` | Proposed |
| OC2–OC5 | Spare | TBD if used | Unassigned |
| IC1–IC5 | Spare | TBD if used | Unassigned |
| External / change notification interrupts | Buttons will initially use polling | TBD if needed | Unassigned |

The proposed fire buttons use active-low inputs with pull-ups. Confirm the wiring and pull-up method before implementation.

Keep pin and channel names in `code/board/pinmap.h`.

## 3. Clock and configuration bits

| Setting | Agreement | Location |
| --- | --- | --- |
| Instruction frequency, `FCY` | Existing display code assumes 16 MHz. Confirm the actual clock. | Shared definition in `code/board/board.h` |
| Oscillator setup | Configure once during startup | `code/board/board.c` and configuration bits |
| Analog and digital pin modes | Configure from the agreed pin map | `code/board/board.c` |
| PPS mapping | Configure all selected peripheral routes together | `code/board/board.c` |
| PIC configuration pragmas | Define once | `code/board/config_bits.c` |
| Debug channel | Proposed PGx1 | `code/board/config_bits.c` and programming connection |
| JTAG | Disable when using the current TFT pin allocation | `code/board/config_bits.c` |

When `FCY` changes, recalculate timer periods, SPI speed, PWM settings, and software delays.

The supplied `Display_Init()` writes `AD1PCFG = 0xFFFF`. Move analog and digital pin setup into board initialization during integration so screen startup preserves the joystick analog inputs.

## 4. Timer allocation

The following allocation is proposed.

| Timer | Use | Setup location | Interrupt |
| --- | --- | --- | --- |
| Timer1 | Shared 1 ms time base | `code/board/board.c` | Enabled |
| Timer2 | Audio PWM period for OC1 | `code/audio/audio.c` | Disabled for normal PWM operation |
| Timer3 | Spare | TBD if used | Disabled |
| Timer4 | Spare | TBD if used | Disabled |
| Timer5 | Spare | TBD if used | Disabled |

The game countdown, joystick debounce, and audio sequence timing use the same shared timestamp.

Audio changes the Timer2 period to generate different notes. Other modules must not use Timer2 as a fixed time base.

For a confirmed `FCY = 16 MHz`, one possible Timer1 setup is:

```text
Prescaler = 1:8
Tick rate = 1,000 Hz
PR1 = 16,000,000 / 8 / 1,000 - 1 = 1,999
```

This is a proposed setup. Check its timing on hardware.

If a 32-bit timer pair is needed later, reserve both timers before configuring the pair.

## 5. Interrupt rules

| Interrupt | Initial use | Code location | Proposed priority |
| --- | --- | --- | --- |
| Timer1 | Advance the shared timestamp | `code/board/board.c` | 4 |
| ADC1 | Polling initially | `code/drivers/adc.c` | Disabled |
| SPI1 | Polling initially | `code/drivers/spi.c` | Disabled |
| Timer2 / OC1 | Hardware PWM | `code/audio/audio.c` | Disabled |
| UART1 RX/TX | Decide if serial logging is added | Future UART driver | TBD |

Apply these rules when enabling an interrupt:

- Give each vector one ISR definition.
- Record its priority and purpose here.
- Keep ISRs short. Update counters, capture data, or set flags.
- Run game logic, rendering, and sound selection in the main loop.
- Avoid delays, screen transfers, and formatted logging inside ISRs.
- Clear the interrupt flag as required by the peripheral.
- Mark ISR-shared variables appropriately and protect multi-step access.

A 32-bit timestamp needs a protected read on this 16-bit MCU. The shared time function should provide that protection for its callers.

## 6. SRAM budget

The PIC24FJ64GA002 has 8,192 bytes of SRAM.

The following values are planning limits. Measure the linked build and runtime stack use before treating them as confirmed.

| Use | Proposed budget |
| --- | --- |
| Game state, players, and fixed projectile pool | 1,536 bytes |
| Joystick samples, calibration, and debounce state | 256 bytes |
| Audio playback state and event storage | 256 bytes |
| Display working buffers | 1,024 bytes |
| Other mutable globals and optional debug buffers | 512 bytes |
| Runtime stack allowance | 2,048 bytes |
| Unassigned margin | 2,560 bytes |
| **Total** | **8,192 bytes** |

### Storage rules

- Use a fixed maximum number of projectiles.
- Reuse small display buffers.
- Keep large temporary arrays out of function-local storage.
- Avoid dynamic allocation in the initial implementation.
- Define shared bitmap and music tables once.
- Prefer declarations in headers and definitions in one source file.
- Check where XC16 places constant assets in the final build.

With the appropriate XC16 constant-memory model, initialized static-duration `const` assets can be stored in program memory. Verify placement in the map file.

A 320 × 480 RGB565 full-screen buffer would require 307,200 bytes. Use the TFT's display memory and local updates.

The OLED fallback requires 1,024 bytes for a 128 × 64 monochrome framebuffer.

### Memory checks

After changing game storage, graphics assets, or buffers:

1. Run Clean and Build.
2. Check SRAM and program memory usage in the build output and map file.
3. Inspect large globals and local arrays.
4. Include interrupt nesting when checking stack demand.
5. Record the build revision and measured usage in `testing.md`.

Link-time global usage alone does not establish the runtime stack peak.

## 7. Performance budget

These are initial targets to check on hardware.

| Operation | Proposed target |
| --- | --- |
| Sample and process both joysticks | Every 5–10 ms |
| Update game state | Every 10 ms using elapsed time |
| Refresh moving graphics | About 20 frames/s initially |
| Update displayed countdown | When the displayed second changes |
| Advance audio sequence | From the shared timestamp |
| Continuous work between input/game checks | Aim for 5 ms or less |

Display transfers must fit the input and game timing. Split long updates into smaller work units if needed.

For an example SPI rate of 8 Mbit/s:

```text
Full screen = 320 × 480 × 2 = 307,200 bytes
Minimum data transfer time = 307,200 × 8 / 8,000,000
                           = 307.2 ms

32 × 32 region = 32 × 32 × 2 = 2,048 bytes
Minimum data transfer time = 2,048 × 8 / 8,000,000
                           = 2.048 ms
```

These are calculated data-only times. Commands, software overhead, and the actual SPI rate increase the measured time.

Use full-screen fills mainly for scene changes. During play, update changed areas.

Move the supplied explosion function's blocking delay into a timed effect state when integrating continuous gameplay.

## 8. Changes to shared resources

Before changing a shared resource:

1. Check its current assignment.
2. Discuss the change with affected modules.
3. Update this document and `pinmap.h`.
4. Update the wiring diagram if a connection changes.
5. Rebuild and repeat the affected integration tests.
6. Include the result in the PR.

## References

- [PIC24FJ64GA002 product page](https://www.microchip.com/en-us/product/pic24fj64ga002)
- [PIC24FJ64GA004 family data sheet, including PIC24FJ64GA002](https://ww1.microchip.com/downloads/en/DeviceDoc/39881e.pdf)
- [XC16 program-space variables](https://onlinedocs.microchip.com/oxy/GUID-C4E60FF5-3DAB-44F1-BA61-4BD962D8F469-en-US-2/GUID-E20F6DF2-EEDE-45E1-8165-C47886927D6A.html)
