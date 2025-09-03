#!/bin/zsh
# This script updates (sets up) this Mac

set -e  # Exit on any error
absolute_dir="$(realpath "$(dirname "$0")")"

# Secure project directory
echo "🔒 Securing project directory ..."
chmod 700 "$absolute_dir" # Only owner can access project

# Secure .env file and load environment variables from it
echo "🔒 Securing and loading .env file ..."

env_file="$absolute_dir/.env"

if [[ -f "$env_file" ]]; then
    chmod 600 "$env_file" # Only owner can read/write .env file
    set -a                # Automatically export all variables
    source "$env_file"    # Load environment variables from .env file
    set +a                # Turn off auto-export
else
    echo "⚠️  No .env file found. Copy .env.example to .env and customize it."
    exit 1
fi

# Run the actual scripts
"$absolute_dir/scripts/update_homebrew_stack.sh"
"$absolute_dir/scripts/update_zshrc_file.sh"
"$absolute_dir/scripts/update_other_software.sh"

echo "✅ Did update (set up) this Mac"