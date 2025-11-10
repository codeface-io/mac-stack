# Mac Stack

## What?

Mac Stack allows to update/setup a developer Mac with one command.

It currently covers:
  * 🐚 Extensive shell customizations (prompt, functions, aliases)
  * 🐙 Global git configuration
  * 📰 Fonts
  * ⌨️ Command line tools (like `brew`, `git`, `pyenv`, `python`, `claude-code`)
  * 🍏 Graphical apps (including Mac App Store apps)
  * ⚙️ Cursor settings
  * 🧩 VS Code extensions (for VS Code, Cursor ...)
  
### System Configuration

The Mac's automated configuration is determined by these components:
* General variables: [`.env`](.env) file as examplified by [`.env.example`](.env.example)
* Software stack: mostly declared in [`Brewfile`](Brewfile)
* Shell customizations: scripts in [`sourced_in_zshrc/`](scripts/sourced_in_zshrc) folder
* Further software setup: [`update_other_software.sh`](scripts/update_other_software.sh)
* If activated in [`.env`](.env): The [cursor/settings.json](settings.json). See [`cursor/README.md`](cursor/README.md).

## How?

### 🎯 TLDR

   1. Define your system configuration once by adapting [these components](#system-configuration)
   2. Apply that configuration (repeatedly) by running [`./update.sh`](update.sh) (directly or via global `update` alias)
   
It's irrelevant whether you've just installed macOS and need to set up this new machine or whether you want to repeatedly update your established machine. The update script is idempotent and works for both cases.

### ✨ First Time System Setup

On a fresh system that may not even have GitHub authentication configured:

1. Make sure your [iCloud account is set up](https://support.apple.com/en-us/102314), so that Mac App Store apps can be installed automatically
2. [Download this repository](https://github.com/codeface-io/mac-stack/archive/refs/heads/master.zip)
3. Copy [`.env.example`](.env.example), name the copy `.env`, customize [`.env`](.env)
   - "dot files" like `.env.example` are hidden by default
   - show/hide them by pressing `Command + Shift + .`
4. _Technically Optional_: Customize any of the other [components listed above](#system-configuration)
   - you probably want to at least adapt or simply delete [`personalize_the_shell.sh`](scripts/sourced_in_zshrc/personalize_the_shell.sh)
5. Run [`./update.sh`](update.sh)

There may be some remaining manual steps to complete your setup:

* If Raycast is part of your setup, [import Raycast settings](raycast/README.md#setup) from your `.rayconfig` file.

### 🧼 Subsequent System Updates

After you have successfully set up the system once:

1. Call the alias from anywhere: `update`

## Exact Default Setup

Without customizing anything, the resulting setup will be as follows.

🧼 Note: All included software (already installed or not) will get **UPDATED TO ITS LATEST VERSION**.

1. `brew` (Homebrew itself)
2. `brew` packages that were already installed
3. [`Brewfile`](Brewfile) contents (all software it declares)
   - 🎯 this is the central and largest part of the software stack
4. `brew` system cleaned up
   - deleted old package versions and cache
5. `~/.zshrc` loads (sources) various shell customizations from three files:
   - [`setup_cli_tools.sh`](scripts/sourced_in_zshrc/setup_cli_tools.sh): Necessary setup for CLI tools like `brew` and `pyenv`
   - [`customize_the_shell.sh`](scripts/sourced_in_zshrc/customize_the_shell.sh): General setup including prompt, aliases, functions
   - [`personalize_the_shell.sh`](scripts/sourced_in_zshrc/personalize_the_shell.sh): Highly individual setup, should be adapted or deleted
6. `update` and `brewfile-clip` aliases for use from any directory
   - `update` triggers this whole update process
   - `brewfile-clip` uninstalls all packages that are **not** (yet) in [`Brewfile`](Brewfile) as well as orphaned dependencies
7. `~/.gitconfig` (global git config)
   - necessary parameters plus some basic best-practice ones
   - other pre-existing parameters are preserved
   - default `~/.gitignore_global` created if none existed yet
8. `python`
   - installed via `pyenv` and set as global Python
   - updating global Python is fine because local Python projects should pin their required Python version anyways – either via `pyenv local` or by their virtual environment or both
9. `pip` for global Python
10. `markitdown`
    - installed via global `pip`
    - required by [`unveil`](scripts/sourced_in_zshrc/customize_the_shell.sh) function
11. Cursor settings restored (overwritten) from backup if `CURSOR_RESTORE_BACKUP` is set `true` in [`.env`](.env) file.

## To Do

* [Default SSH key](notes/ssh_key_setup_brainstorm.md) (for GitHub, GitLab etc.)
* Flutter and Dart (via fvm or mise)
* System (and app-) settings (likely via Ansible?)
* Command for checking out or pulling all repos in a given folder
* Feature requests:
   * mechanism for translating current setup as starting point to mac stack. for initial adoption and getting started (fresh baseline based on generated brewfile and ideally mostly clean scripts/zshrc as well)
   * integrate repo based password management