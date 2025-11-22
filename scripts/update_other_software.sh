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
    echo "⚙️  Restoring VS Code/Cursor/Antigravity settings and keybindings from backup ..."
    
    settings_source="$MAC_STACK_ROOT/vscode/settings.json"
    keybindings_source="$MAC_STACK_ROOT/vscode/keybindings.json"

    vscode_dir="$HOME/Library/Application Support/Code/User"
    mkdir -p "$vscode_dir"
    cp "$settings_source" "$vscode_dir/settings.json"
    cp "$keybindings_source" "$vscode_dir/keybindings.json"
    
    cursor_dir="$HOME/Library/Application Support/Cursor/User"
    mkdir -p "$cursor_dir"
    cp "$settings_source" "$cursor_dir/settings.json"
    cp "$keybindings_source" "$cursor_dir/keybindings.json"

    agy_dir="$HOME/Library/Application Support/Antigravity/User"
    mkdir -p "$agy_dir"
    cp "$settings_source" "$agy_dir/settings.json"
    cp "$keybindings_source" "$agy_dir/keybindings.json"
fi