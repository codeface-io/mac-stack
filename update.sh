#!/bin/zsh
# This script updates (sets up) this Mac

set -e  # Exit on any error

./scripts/update_homebrew_stack.sh
./scripts/update_zshrc_file.sh
./scripts/update_other_software.sh

echo "✅ Did update (set up) this Mac"