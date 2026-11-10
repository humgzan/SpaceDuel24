# Testing

Use this document to define repeatable tests and record their results.

Run module tests first, then test the modules together. Use the same test ID when repeating a test after a fix.

The test list below is planned coverage. All actual results remain `Not run` until tested.

## 1. Test rules

- Test the commit or working revision described in the record.
- Record the compiler, device pack, clock, and relevant wiring.
- Separate a successful build from a successful hardware test.
- Compare actual behavior with the expected result.
- Keep failed results and add a retest record after the fix.
- Link screenshots, videos, logs, or measurements when they help verify the result.
- State which tests were run in the PR.

For code that changes pins, clocks, timers, or shared interfaces, repeat tests for every affected module.

## 2. Status values

| Status | Meaning |
| --- | --- |
| Not run | The test has not been executed |
| Pass | The observed result meets the expected result |
| Fail | The observed result does not meet the expected result |
| Blocked | Missing hardware, code, or another issue prevents execution |

Write the blocking reason for a `Blocked` result.

## 3. Test record template

Copy this section for each test run.

### TEST-ID — Short test name

| Item | Value |
| --- | --- |
| Date | YYYY-MM-DD |
| Branch | Branch name |
| Commit | Commit hash, with local changes noted if present |
| MPLAB X | Version |
| XC16 | Version |
| Device pack | Name and version |
| Hardware | Board, display, and relevant connections |
| Clock | Confirmed or assumed FCY |
| Status | Not run |

#### Purpose

Describe the behavior being checked.

#### Setup

List the starting state, wiring, and test inputs.

#### Steps

1. Describe an action.
2. Describe the next action.
3. Describe what to measure or observe.

#### Expected result

State the required behavior and any numerical tolerance.

#### Actual result

Not run.

#### Evidence

Add a repository-relative link to the log, image, video, or measurement.

#### Follow-up

Record the issue, fix, and retest reference if needed.

## 4. Build and board tests

| ID | Test | Expected result |
| --- | --- | --- |
| BUILD-01 | Clone into a new directory and open `SpaceDuel24.X/` | Sources and logical folders resolve through relative paths |
| BUILD-02 | Clean and Build with the agreed tool versions | Build completes and warnings are reviewed |
| BOARD-01 | Check clock and shared time base | Measured timing agrees with the configured values within the agreed tolerance |
| BOARD-02 | Check pin modes and PPS | Analog inputs and peripheral routes match `resources.md` |
| BOARD-03 | Initialize the display after ADC setup | Joystick channels remain configured as analog inputs |

## 5. Joystick tests

| ID | Test | Expected result |
| --- | --- | --- |
| JOY-01 | Start with both joysticks released | Each axis calibrates to its own center |
| JOY-02 | Leave both joysticks released | Processed movement remains zero within the dead zone |
| JOY-03 | Move each axis in both directions | Output sign and range match the header agreement |
| JOY-04 | Compare small and large deflections | Sensitivity follows the selected curve |
| JOY-05 | Move both players simultaneously | Both input states update independently |
| JOY-06 | Press, hold, release, and press a fire button again | One event per debounced press, with the next press detected after release |
| JOY-07 | Repeat JOY-06 for both players | Each button keeps independent debounce state |

Use injected samples for repeatable logic tests when possible. Repeat the relevant checks with physical joysticks.

## 6. Game tests

| ID | Test | Expected result |
| --- | --- | --- |
| GAME-01 | Start or reset a match | Positions, health, projectiles, timer, and result state reset |
| GAME-02 | Move players toward all boundaries | Players stay within their allowed area |
| GAME-03 | Fire with a free projectile slot | A projectile appears with the correct position and direction |
| GAME-04 | Fill the projectile pool and fire again | The documented full-pool behavior occurs without writing outside the pool |
| GAME-05 | Move a projectile into and past a target | Hits and misses follow the collision rule |
| GAME-06 | Remove a player's remaining health | The correct win/loss result occurs and the match ends once |
| GAME-07 | Let the 60-second countdown finish | The documented timeout result occurs |
| GAME-08 | Restart after a finished match | No stale bullets, results, or input events carry into the new match |

Test the game with known inputs and time values before depending on the screen.

## 7. Display and audio tests

| ID | Test | Expected result |
| --- | --- | --- |
| DISP-01 | Initialize and draw basic colors | Orientation, color order, and dimensions are correct |
| DISP-02 | Draw sprites and rectangles near edges | Clipping or rejection matches the function contract |
| DISP-03 | Move both ships and several bullets | Moving objects leave no unwanted trails or erased neighboring objects |
| DISP-04 | Update timer, health, and result banners | Both player views show the game state correctly |
| DISP-05 | Request a zero-sized rectangle or invalid scale | The operation follows the documented input handling |
| AUDIO-01 | Play a known note | Frequency and duration agree with the configured values |
| AUDIO-02 | Play music while moving and firing | Input and game updates continue |
| AUDIO-03 | Request overlapping sound events | Playback follows the agreed sound priority |
| AUDIO-04 | End and restart a match | Music and effects return to the correct state |

## 8. Integration and performance tests

| ID | Test | Expected result |
| --- | --- | --- |
| INT-01 | Move and fire with both players while music plays | Inputs, graphics, collisions, and audio work together |
| INT-02 | Run a full 60-second match | Countdown follows elapsed time despite changing rendering load |
| INT-03 | Run at maximum projectile count with effects | Timing stays within the agreed budget, or missed targets are recorded |
| INT-04 | Run at least ten consecutive matches | No unexpected reset, stuck input, or stale game state |
| MEM-01 | Inspect the build output and map file | Static memory usage fits the budget |
| MEM-02 | Check stack demand under the heaviest tested load | Stack use fits the allowance with margin |
| PERF-01 | Measure input, game, and display update intervals | Results meet the targets in `resources.md` or document required changes |

Measure performance on the full integrated build. Record typical and worst observed intervals and the measurement method.

## 9. Result summary

Add a row after each recorded test run.

| Date | Test ID | Commit | Status | Evidence or record |
| --- | --- | --- | --- | --- |
| — | — | — | Not run | — |

Keep evidence under `docs/test-results/` when needed. Use filenames that include the test ID and date.

A hardware test marked `Not run` or `Blocked` remains pending. Include that status in the PR so the team can decide what is ready to merge.
