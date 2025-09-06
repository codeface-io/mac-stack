#!/bin/zsh
# This script installs/updates software outside the homebrew stack

set -e  # Exit on any error
set -u  # Treat unset variables as error

# Install the latest python version and update its pip

source "$MAC_STACK_ROOT/scripts/sourced_in_zshrc/customize_the_shell.sh" # load `python-latest` alias
latest_python_version="$(python-latest)"
echo "🐍 Installing latest python ($latest_python_version) and updating pip ..."
pyenv install --skip-existing "$latest_python_version"
pyenv global "$latest_python_version"
python -m pip install --upgrade pip

# Install markitdown

echo "📝 Installing markitdown (https://github.com/microsoft/markitdown) ..."
pip install 'markitdown[all]' > /dev/null