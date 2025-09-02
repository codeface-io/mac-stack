#!/bin/zsh

# You may use this script as a template to setup CLI tooling. Most prominently these will be exports of environment variables and similar.

# Setup Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Setup pyenv
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Alias for getting the latest Python version
alias python-latest="pyenv install --list | grep -E '^\s*[0-9]+\.[0-9]+\.[0-9]+$' | tail -1 | xargs"