#!/bin/zsh
# This script installs/updates software outside the homebrew stack

set -e  # Exit on any error
set -u  # Treat unset variables as error

# Update python and its pip

source "$MAC_STACK_ROOT/scripts/sourced_in_zshrc/customize_the_shell.sh" # load `python-latest` alias
latest_python_version="$(python-latest)"
if ! pyenv versions | grep -q "$latest_python_version"; then
    echo "🐍 Installing Python $latest_python_version ..."
    pyenv install --skip-existing "$latest_python_version"
fi

echo "🐍 Updating pip for Python $latest_python_version ..."
pyenv global "$latest_python_version"
eval "$(pyenv init -)" # ensures python is immediately available
python -m pip install --upgrade pip > /dev/null

# Update markitdown

echo "📝 Updating markitdown (https://github.com/microsoft/markitdown) ..."
(pipx upgrade --quiet markitdown || pipx install --quiet markitdown) > /dev/null

# Update IDE settings and keybindings

if [[ "$VSCODE_SETTINGS_RESTORE" == "true" ]]; then
    source "$MAC_STACK_ROOT/scripts/helpers.sh"

    settings="$MAC_STACK_ROOT/vscode/settings.json"
    assert_file_exists "$settings"
    
    keybindings="$MAC_STACK_ROOT/vscode/keybindings.json"
    assert_file_exists "$keybindings"

    app_names=("Visual Studio Code" "Cursor" "Antigravity" "Kiro" "Windsurf" "VSCodium")
    app_support_folders=("Code" "Cursor" "Antigravity" "Kiro" "Windsurf" "VSCodium")
    
    number_of_apps=${#app_names[@]}

    for ((i=1; i<=number_of_apps; i++)); do
        restore_ide_settings \
            "${app_names[$i]}" \
            "${app_support_folders[$i]}" \
            "$settings" \
            "$keybindings"
    done
fi