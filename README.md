# Mac Stack

## What is this?

This project allows me to set up or update a developer Mac with one command.

In principle, this covers the complete software stack, including command line tools, apps, vs code extensions, fonts, dot files, programming languages, version managers and app settings.

This stack is mostly defined declaratively in the `Brewfile`. A few aspects that can't be captured in Brewfiles are additionally set up by the script.

The main entry point to the setup/update script is `update.sh`.

## How to

* Define the main stack in the `Brewfile`
* Define additional installations in `scripts/update_other_software.sh`
* Define shell personalizations in `scripts/sourced_in_zshrc/`
* Run the script in its folder: `./update.sh`
* Then you can use the alias from anywhere: `update`

## To Do:

* Git configuration - User name, email, SSH keys for GitHub/GitLab
* install `brew xcodes` / `cask xcodes-app`
* install flutter - brewfile already contains fvm
* apply IDE settings for VS Code and Cursor, including custom model instructions