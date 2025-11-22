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
eval "$(pyenv init -)" # ensures python is immediately available
python -m pip install --upgrade pip > /dev/null

# Install markitdown

echo "📝 Installing markitdown (https://github.com/microsoft/markitdown) ..."
(pipx upgrade markitdown || pipx install markitdown) > /dev/null

# Update VS Code/Cursor/Antigravity settings from settings.json backup

if [[ "$VSCODE_SETTINGS_RESTORE" == "true" ]]; then
    echo "⚙️  Restoring VS Code/Cursor/Antigravity settings from backup ..."
    
    settings_source="$MAC_STACK_ROOT/vscode/settings.json"

    vscode_target="$HOME/Library/Application Support/Code/User/settings.json"
    mkdir -p "$(dirname "$vscode_target")"
    cp "$settings_source" "$vscode_target"
    
    cursor_target="$HOME/Library/Application Support/Cursor/User/settings.json"
    mkdir -p "$(dirname "$cursor_target")"
    cp "$settings_source" "$cursor_target"

    agy_target="$HOME/Library/Application Support/Antigravity/User/settings.json"
    mkdir -p "$(dirname "$agy_target")"
    cp "$settings_source" "$agy_target"
fi