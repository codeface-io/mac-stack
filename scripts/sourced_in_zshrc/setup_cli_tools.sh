#!/usr/bin/env zsh

# You may use this script as a template to do necessary setup for CLI tools. Most prominently these will be exports of environment variables and similar.

# Setup Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Setup pyenv
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Setup pipx
export PATH="$PATH:$HOME/.local/bin"

# Setup antigravity
export PATH="$PATH:$HOME/.antigravity/antigravity/bin"
