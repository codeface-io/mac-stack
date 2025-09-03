#!/bin/zsh
# This script updates (sets up) this Mac

set -e  # Exit on any error

absolute_dir="$(realpath "$(dirname "$0")")"

"$absolute_dir/scripts/update_homebrew_stack.sh"
"$absolute_dir/scripts/update_zshrc_file.sh"
"$absolute_dir/scripts/update_other_software.sh"

echo "✅ Did update (set up) this Mac"