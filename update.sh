#!/bin/zsh
# This script updates (sets up) this Mac

# Prepare
set -e  # Exit on any error
root_dir="$(realpath "$(dirname "$0")")"
source "$root_dir/scripts/set_permissions_and_load_env.sh"

# Run the scripts
"$root_dir/scripts/update_homebrew_stack.sh"
"$root_dir/scripts/update_zshrc_file.sh"
"$root_dir/scripts/update_other_software.sh"

echo "✅ Did update (set up) this Mac"