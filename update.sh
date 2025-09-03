#!/bin/zsh
# This script updates (sets up) this Mac

# Prepare
set -e  # Exit on any error
set -u  # Treat unset variables as error
export MAC_STACK_ROOT="$(realpath "$(dirname "$0")")"
source "$MAC_STACK_ROOT/scripts/set_permissions_and_load_env.sh"

# Run the scripts
"$MAC_STACK_ROOT/scripts/update_homebrew_stack.sh"
"$MAC_STACK_ROOT/scripts/update_zshrc_file.sh"
"$MAC_STACK_ROOT/scripts/update_other_software.sh"

echo "✅ Did update (set up) this Mac"