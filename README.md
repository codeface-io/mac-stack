# Mac Stack

## What?

This project allows me to `update`/setup a developer Mac with one command.

In principle, this covers the complete software stack, including command line tools, apps, VS Code extensions, fonts, dot files, programming languages, version managers and app/system settings.

The execution entry point is [`update.sh`](update.sh).

The setup is defined by these components:
* General input variables: `.env` file as examplified in [`.env.example`](.env.example)
* Software stack: mostly declared in [`Brewfile`](Brewfile)
* Shell customization: sourced scripts in [`sourced_in_zshrc`](scripts/sourced_in_zshrc)
* Further setup: [`update_other_software.sh`](scripts/update_other_software.sh)

## How?

### First Time Setup

On a fresh system that may not even have git authentication configured:

1. Download this repository
2. Copy [`.env.example`](.env.example), name the copy `.env`, customize `.env`
3. Optional: Customize any of the components [listed above](#what)
3. Run [`./update.sh`](update.sh)

### Subsequent Updates

After you have successfully set up the system once:

1. Call the alias from anywhere: `update`

## To Do

* Default SSH key (for GitHub, GitLab etc.)
* install flutter - brewfile already contains fvm
* apply IDE settings for VS Code and Cursor, including custom model instructions
* System (and app-) settings