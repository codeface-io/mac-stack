# Mac Stack

## What?

This project allows me to update/setup a developer Mac with one command.

In principle, this covers the complete software stack, including command line tools, apps, vs code extensions, fonts, dot files, programming languages, version managers and app settings.

The stack is mostly defined declaratively in the [`Brewfile`](Brewfile). A few aspects that can't be captured in Brewfiles are additionally set up by the script.

The main entry point to the update/setup script is [`update.sh`](update.sh).

## How?

* Define the main stack in the [`Brewfile`](Brewfile)
* Do additional installations in [`scripts/update_other_software.sh`](scripts/update_other_software.sh)
* Configure shell setup in [`scripts/sourced_in_zshrc`](scripts/sourced_in_zshrc)
* Run the script in its folder: [`./update.sh`](update.sh)
* After you ran `./update.sh` once, you can also use the alias from anywhere: `update`

## To Do

* Git configuration - User name, email, SSH keys for GitHub/GitLab
* install `brew xcodes` / `cask xcodes-app`
* install flutter - brewfile already contains fvm
* apply IDE settings for VS Code and Cursor, including custom model instructions