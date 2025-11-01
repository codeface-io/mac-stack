#!/bin/zsh
# This script updates the ~/.zshrc file with necessary configurations

# Prepare

set -e  # Exit on any error
set -u  # Treat unset variables as error
source "$MAC_STACK_ROOT/scripts/helpers.sh" # Load helpers

# Ensure the custom setup is loaded in ~/.zshrc

echo "🔧 Ensuring custom setup is loaded in ~/.zshrc ..."

zshrc_setup_script="$MAC_STACK_ROOT/scripts/sourced_in_zshrc/sourced_in_zshrc.sh"
assert_file_exists "$zshrc_setup_script"

script_call="# Custom .zshrc setup
source \"$zshrc_setup_script\""

ensure_zshrc_content "$script_call"

# Ensure the "update" alias is in ~/.zshrc

echo "🔧 Ensuring \`update\` alias is in .zshrc ..."

update_script="$MAC_STACK_ROOT/update.sh"
assert_file_exists "$update_script"

update_alias_definition="# Alias for setting up or updating the whole system
alias update='\"$update_script\"'"

ensure_zshrc_content "$update_alias_definition"

# Ensure the "brew-cleanup" alias is in ~/.zshrc

echo "🔧 Ensuring \`brew-cleanup\` alias is in .zshrc ..."

brew_cleanup_script="$MAC_STACK_ROOT/brew_cleanup.sh"
assert_file_exists "$brew_cleanup_script"

brew_cleanup_alias_definition="# Alias for uninstalling all undeclared brew packages
alias brew-cleanup='\"$brew_cleanup_script\"'"

ensure_zshrc_content "$brew_cleanup_alias_definition"