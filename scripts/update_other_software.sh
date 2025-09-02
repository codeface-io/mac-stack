#!/bin/zsh
# This script installs/updates software outside the homebrew stack

set -e  # Exit on any error
source ~/.zshrc  # Make aliases/functions available

# Install the latest python version and update its pip

latest_python_version="$(python-latest)"
echo "🐍 Installing latest python ($latest_python_version) ..."
pyenv install --skip-existing "$latest_python_version"
pyenv global "$latest_python_version"
python -m pip install --upgrade pip

# Install markitdown

echo "📝 Installing markitdown (https://github.com/microsoft/markitdown) ..."
pip install 'markitdown[all]' > /dev/null