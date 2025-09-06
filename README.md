# Mac Stack

## What?

Mac Stack allows to `update`/setup a developer Mac with one command.

In principle, this covers the complete software stack, including command line tools, apps, VS Code extensions, fonts, dot files, programming languages, version managers and app/system settings.

The execution entry point is [`update.sh`](update.sh).

The setup is defined by these components:
* General input variables: `.env` file as examplified by [`.env.example`](.env.example)
* Software stack: mostly declared in [`Brewfile`](Brewfile)
* Shell customization (.zshrc): sourced scripts in [`sourced_in_zshrc/`](scripts/sourced_in_zshrc)
* Further software setup: [`update_other_software.sh`](scripts/update_other_software.sh)

## How?

### ✨ First Time System Setup

On a fresh system that may not even have GitHub authentication configured:

1. Make sure your [iCloud account is set up](https://support.apple.com/en-us/102314), so that Mac App Store apps can be installed automatically
2. [Download this repository](https://github.com/codeface-io/mac-stack/archive/refs/heads/master.zip)
3. Copy [`.env.example`](.env.example), name the copy `.env`, customize `.env`
   - "dot files" like `.env.example` are hidden by default
   - show/hide them by pressing `Command + Shift + .`
4. Technically Optional: Customize any of the [components listed above](#what)
   - you probably want to adapt or simply delete [`personalize_the_shell.sh`](scripts/sourced_in_zshrc/personalize_the_shell.sh)
5. Run [`./update.sh`](update.sh)

There may be some remaining manual steps to complete the setup:

* If Raycast is part of the setup (as with my default), [import Raycast settings from `.rayconfig` file](raycast/README.md#setup).

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
   - deleted orphaned dependencies, old package versions and cache
5. `~/.zshrc` loads (sources) various shell customizations from three files:
   - [`setup_cli_tools.sh`](scripts/sourced_in_zshrc/setup_cli_tools.sh): Necessary setup for CLI tools like `brew` and `pyenv`
   - [`customize_the_shell.sh`](scripts/sourced_in_zshrc/customize_the_shell.sh): General setup including prompt, aliases, functions
   - [`personalize_the_shell.sh`](scripts/sourced_in_zshrc/personalize_the_shell.sh): Highly individual setup, should be adapted or deleted
6. `update` alias
   - for triggering this whole update process from any directory
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

## To Do

* Default SSH key (for GitHub, GitLab etc.)
* install flutter - brewfile already contains fvm
* apply IDE settings: VS Code, Cursor, Xcode
* macOS keyboard shortcuts
* System (and app-) settings