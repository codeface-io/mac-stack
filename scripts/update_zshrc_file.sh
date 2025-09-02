#!/bin/zsh
# This script updates the ~/.zshrc file with necessary configurations

# Prepare

set -e  # Exit on any error
mac_root="$(realpath "$(dirname "$0")/..")"
source "$mac_root/scripts/helpers.sh" # Load helpers

# Ensure the custom setup is loaded in ~/.zshrc

echo "🔧 Ensuring custom setup is loaded in ~/.zshrc ..."

zshrc_setup_script="$mac_root/scripts/sourced_in_zshrc/sourced_in_zshrc.sh"
assert_file_exists "$zshrc_setup_script"

script_call="# Custom .zshrc setup
source \"$zshrc_setup_script\""

ensure_zshrc_content "$script_call"

# Ensure the global update command is in ~/.zshrc

echo "✨ Ensuring \`update\` alias is in .zshrc ..."

update_script="$mac_root/update.sh"
assert_file_exists "$update_script"

update_alias_definition="# Alias for setting up or updating the whole system
alias update='\"$update_script\"'"

ensure_zshrc_content "$update_alias_definition"