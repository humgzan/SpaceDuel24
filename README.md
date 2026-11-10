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
| `hardware/` | Schematics, wiring diagrams, and hardware notes |

Open the repository root in VS Code. Open `SpaceDuel24.X/` in MPLAB X.

## 3. Install Git and configure your identity

### Install Git for Windows

Download Git for your Windows architecture and run the installer.

[Git downloads](https://git-scm.com/downloads)

Use the following settings when the installer shows them. Keep the defaults for the other options.

| Installer option | Selection |
| --- | --- |
| Default editor | Visual Studio Code, if it is installed |
| Initial branch name | Override the default with `main` |
| PATH environment | Git from the command line and also from third-party software |
| Line ending conversions | Checkout Windows-style, commit Unix-style line endings |
| Credential helper | Git Credential Manager |

Restart VS Code after installation.

Open **Terminal → New Terminal** and check that Git is available.

```powershell
git --version
```

### Join the GitHub repository

1. Create a GitHub account if you do not have one.
2. Send your GitHub username to the repository administrator.
3. Accept the repository invitation.
4. Confirm that you can open the repository page.

[GitHub](https://github.com/)

### Choose your commit email

Use an email address that is added and verified in your GitHub account.

- A personal email is a good choice for long-term use.
- A university email also works if it is linked to your GitHub account.
- For privacy, copy your GitHub-provided `noreply` address from **Settings → Emails**.

Set your identity in the VS Code terminal. Replace the example email with your chosen address.

```bash
git config --global user.name "Your_Name"
git config --global user.email "your_verified_email@example.com"
```

Check the saved values.

```bash
git config --global --get user.name
git config --global --get user.email
```

If Git reports "Please tell me who you are", complete these settings and retry the commit.

The `--global` option applies this identity to all repositories on this computer.

## 4. Set up VS Code

VS Code includes Git support. The following extensions add the GUI features used by this team.

Open Extensions with `Ctrl+Shift+X` and search by extension ID.

| Extension | Extension ID | Use |
| --- | --- | --- |
| Conventional Commits | `vivaxy.vscode-conventional-commits` | Build a consistent commit message |
| Git Graph | `mhutchie.git-graph` | View branches, commits, and file changes |
| GitHub Pull Requests | `GitHub.vscode-pull-request-github` | Create and review pull requests |
| Better Git Line Blame | `mk12.better-git-line-blame` | View the commit associated with the current line |
| Markdown Preview Enhanced | `shd101wyy.markdown-preview-enhanced` | Preview Markdown documents |

You can also preview Markdown with VS Code's built-in preview using `Ctrl+Shift+V`.

### Configure Conventional Commits

We use the extension to prepare a message, then review and commit it ourselves.

Open Settings with `Ctrl+,` and use these values.

| Setting | Value |
| --- | --- |
| `conventionalCommits.autoCommit` | `false` |
| `conventionalCommits.gitmoji` | `true` |
| `conventionalCommits.promptBody` | `false` |
| `conventionalCommits.promptFooter` | `false` |
| `conventionalCommits.showEditor` | `false` |
| `git.enableSmartCommit` | `false` |
| `git.postCommitCommand` | `none` |

The available prompts can vary with extension settings and version. Use the type, scope, optional emoji, and short description prompts to build the title.

## 5. Clone and open the project

1. On the GitHub repository page, select **Code → HTTPS** and copy the URL.
2. In VS Code, press `Ctrl+Shift+P`.
3. Run **Git: Clone**.
4. Paste the repository URL.
5. Select a parent directory, such as `D:\Projects\MPLABXProjects`.
6. Follow the browser sign-in prompt if one appears.
7. Open the cloned repository in VS Code.

Git creates the repository folder inside the directory you select.

### Open the MPLAB X project

1. Install MPLAB X, XC16, and the device pack required by the project.
2. In MPLAB X, select **File → Open Project**.
3. Open `SpaceDuel24.X/`.
4. Check the target device, compiler, and device pack in Project Properties.
5. Run **Clean and Build**.

The target device is `PIC24FJ64GA002`. Use the same XC16 and device pack versions agreed by the team.

The whole repository must be present because the project references source files in the neighboring `code/` directory.

### Add a new source file

1. Create the file in the correct directory under `code/`.
2. In MPLAB X, add it to the matching logical folder under **Source Files**.
3. Add its header under **Header Files**.
4. Use relative paths and keep the source in its original location.
5. Add any required XC16 header search paths.
6. Commit the source and updated shared project configuration together.

For example, the path from `SpaceDuel24.X/` to the game source is `../code/app/game.c`.

Keep one logical folder level for each module.

## 6. Daily development workflow

Use a separate branch for each feature or fix. Keep `main` ready for the rest of the team to use.

### Step 1. Update main

Before switching branches, save your work and check Source Control. Commit it on your feature branch or stash unfinished changes.

1. Click the branch name in the lower-left corner of VS Code.
2. Switch to `main`.
3. Run **Git: Pull** from the Command Palette.

The terminal equivalent is:

```powershell
git switch main
git pull --ff-only origin main
```

If the fast-forward pull fails, inspect the local commits before continuing.

Use **Pull** when you want to download changes. **Sync Changes** pulls and then pushes, so check the branch and outgoing commits before using it.

### Step 2. Create a feature branch

Click the current branch name and select **Create new branch...**.

Use a name such as:

```text
feature/joystick-calibration
feature/display-renderer
feature/game-collision
feature/audio-pwm
fix/display-clipping
docs/testing-guide
```

Create the branch from the updated `main`. After making the first commit, use **Publish Branch** to push it to GitHub.

### Step 3. Write and test the change

Follow `docs/architecture.md` when deciding where code belongs.

Before changing shared pins, timers, PPS, configuration bits, or public interfaces, discuss the change with the team. Update the resource table and affected callers in the same change.

For firmware changes:

1. Save the source files in VS Code.
2. Build the project in MPLAB X.
3. Run the relevant module and integration tests.
4. Record the result in `docs/testing.md`.

If hardware is unavailable, record the build result and mark the hardware test as `Not run`. An unfinished change can be shared through a draft PR.

### Step 4. Review and stage files

Open Source Control with `Ctrl+Shift+G`.

1. Click each changed file to inspect its diff.
2. Check that all changes belong to the current task.
3. Stage the intended files using the `+` button.
4. Check **Staged Changes** before committing.

Include shared MPLAB project changes when files were added or moved. Build outputs and machine-specific settings should be covered by `.gitignore`.

### Step 5. Prepare the commit message

Press `Ctrl+Shift+P` and run **Conventional Commits**.

1. Select the type.
2. Select the scope.
3. Select an emoji if you want one.
4. Enter a short English description.

Review the generated title in the Source Control message box. For more detail, add a blank line and a short list.

```text
feat(joystick): ✨ add startup calibration and dead zone

- average the startup samples for each axis
- return one fire event per debounced press
- update the controller test cases
```

Click **Commit**, then use **Git: Push**. For a new branch, select **Publish Branch**.

A commit saves a local checkpoint. Push uploads it to GitHub.

### Step 6. Open a pull request

After pushing the branch:

1. On GitHub, select **Compare & pull request**, or open **Pull requests → New pull request**.
2. Set the base branch to `main`.
3. Set the compare branch to your feature branch.
4. Review the changed files.
5. Fill in the description and create the PR.
6. Ask another team member to review it.

You can also run **GitHub Pull Requests: Create Pull Request** in VS Code.

Use this PR description format.

```markdown
## Changes

- Describe the behavior added or fixed.

## Validation

- Build result
- Relevant test IDs and results
- Hardware tests still needed

## Shared changes

- Public interfaces, pins, timers, or project settings changed
- Write "None" if there are no shared changes
```

If the branch has conflicts with `main`, update the feature branch, resolve the conflicts, and repeat the affected tests before merging.

### Step 7. Merge and clean up

After review and the required checks:

1. Merge the PR using the team's agreed merge method.
2. Delete the remote feature branch after it has been merged and no one needs it for further work.
3. Switch your local checkout to `main`.
4. Pull the merged code.
5. Delete the finished local branch.

```powershell
git switch main
git pull --ff-only origin main
git branch -d feature/joystick-calibration
git fetch --prune
```

Replace the example branch name with your own.

A normal merge commit preserves the branch's commits in `main`. With squash or rebase merging, `git branch -d` may report that the branch is not merged. Check the PR and local work before deleting it another way.

Start the next task from the updated `main`.

## 7. Commit message reference

Use the format `type(scope): short description`. Emoji is optional.

### Types

| Type | Use |
| --- | --- |
| `feat` | Add a feature, driver operation, or game behavior |
| `fix` | Correct a bug |
| `docs` | Change documentation |
| `test` | Add or update executable tests or test fixtures |
| `refactor` | Reorganize code while preserving behavior |
| `chore` | Change project settings, ignore rules, or development configuration |

### Scopes

| Scope | Files or behavior |
| --- | --- |
| `app` | `code/app/` |
| `joystick` | `code/joystick/` |
| `renderer` | Game drawing and layout in `code/display/renderer.*` |
| `display` | ST7796 operations and graphics assets |
| `audio` | `code/audio/` |
| `adc` | `code/drivers/adc.*` |
| `spi` | `code/drivers/spi.*` |
| `board` | Pins, clock, PPS, configuration bits, and shared time base |
| `docs` | README and `docs/` |
| `project` | Shared MPLAB X project configuration |

Choose the type and scope based on the main purpose of the change.

For example, a new joystick feature and its documentation can be one `feat(joystick)` commit. Unrelated changes should be staged and committed separately.

If a public interface changes, update its callers and document the change in the PR. Use a breaking-change marker when an existing caller must change.

## 8. View history with Git Graph

Run **Git Graph: View Git Graph** from the Command Palette.

- Select a commit to see its changed files.
- Select a file to compare its contents.
- Use the branch labels to find `main` and published feature branches.
- Fetch before checking remote progress.

Git Graph shows committed work that your checkout has received. A teammate's uncommitted or unpushed work will not appear.

## References

- [VS Code source control](https://code.visualstudio.com/docs/sourcecontrol/overview)
- [VS Code repositories and remotes](https://code.visualstudio.com/docs/sourcecontrol/repos-remotes)
- [GitHub in VS Code](https://code.visualstudio.com/docs/sourcecontrol/github)
- [Conventional Commits extension](https://marketplace.visualstudio.com/items?itemName=vivaxy.vscode-conventional-commits)
- [GitHub authentication with Git Credential Manager](https://docs.github.com/en/get-started/git-basics/caching-your-github-credentials-in-git)
