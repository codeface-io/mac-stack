# Mac Stack

## What?

This project allows me to `update`/setup a developer Mac with one command.

In principle, this covers the complete software stack, including command line tools, apps, VS Code extensions, fonts, dot files, programming languages, version managers and app/system settings.

The execution entry point is [`update.sh`](update.sh).

The setup is defined by these components:
* General input variables: `.env` file as examplified by [`.env.example`](.env.example)
* Software stack: mostly declared in [`Brewfile`](Brewfile)
* Shell customization (.zshrc): sourced scripts in [`sourced_in_zshrc`](scripts/sourced_in_zshrc)
* Further setup: [`update_other_software.sh`](scripts/update_other_software.sh)

## How?

### First Time Setup

On a fresh system that may not even have GitHub authentication configured:

1. [Download this repository](https://github.com/codeface-io/mac-stack/archive/refs/heads/master.zip)
2. Copy [`.env.example`](.env.example), name the copy `.env`, customize `.env`
   - ⚠️ "Dot files" like `.env.example` are hidden by default.
   - Show/hide them by pressing `Command + Shift + .`
3. Optional: Customize any of the [components listed above](#what)
4. Run [`./update.sh`](update.sh)

### Subsequent Updates

After you have successfully set up the system once:

1. Call the alias from anywhere: `update`

## Exact Default Setup

Without customizing anything, the resulting setup has the **latest** versions of:

1. `brew` (Homebrew)
2. Everything declared in [`Brewfile`](Brewfile)
3. Shell customizations from `.zshrc` loading three files:
   - [`setup_cli_tools.sh`](scripts/sourced_in_zshrc/setup_cli_tools.sh): Necessary setup for CLI tools like `brew` and `pyenv`
   - [`customize_the_shell.sh`](scripts/sourced_in_zshrc/customize_the_shell.sh): Includes aliases/functions: `gitty`, `unveil`, `update-xcode`, `paths` ...
   - [`personalize_the_shell.sh`](scripts/sourced_in_zshrc/personalize_the_shell.sh): Highly individual customizations, you should delete or customize this file
4. `update` alias
5. `~/.gitconfig` (global git config)
   - with all necessary parameters plus basic best practice defaults
6. `python`
   - installed via `pyenv` and set as global Python
   - Local projects pin their required python version anyways – either via `pyenv local` or by their virtual environments or both.
7. `pip` for global Python
8. `markitdown`
   - installed via global `pip`
   - needed for [`unveil` function](scripts/sourced_in_zshrc/customize_the_shell.sh)

## To Do

* Default SSH key (for GitHub, GitLab etc.)
* install flutter - brewfile already contains fvm
* apply IDE settings for VS Code and Cursor, including custom model instructions
* System (and app-) settings