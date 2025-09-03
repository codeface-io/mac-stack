#!/bin/zsh
# This script installs/updates software outside the homebrew stack

set -e  # Exit on any error
source ~/.zshrc  # Make aliases/functions available

# Configure Git

echo "🐙 Configuring Git ..."

git config --global user.name "$GIT_USER_NAME"
git config --global user.email "$GIT_USER_EMAIL"
git config --global credential.helper osxkeychain
git config --global core.excludesfile "~/.gitignore_global"
git config --global core.editor "cursor --wait"
git config --global init.defaultBranch main
git config --global pull.ff only
git config --global push.default simple

gitignore_global="$HOME/.gitignore_global"

if [[ ! -f "$gitignore_global" ]]; then
    echo "📝 Creating global gitignore file since none exists ..."
    scripts_dir="$(realpath "$(dirname "$0")")"
    cp "$scripts_dir/.gitignore_global" "$gitignore_global"
fi

# Install the latest python version and update its pip

latest_python_version="$(python-latest)"
echo "🐍 Installing latest python ($latest_python_version) ..."
pyenv install --skip-existing "$latest_python_version"
pyenv global "$latest_python_version"
python -m pip install --upgrade pip

# Install markitdown

echo "📝 Installing markitdown (https://github.com/microsoft/markitdown) ..."
pip install 'markitdown[all]' > /dev/null