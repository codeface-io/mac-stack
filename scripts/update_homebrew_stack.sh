#!/bin/zsh
# This script installs/updates Homebrew and everything in Brewfile

set -e  # Exit on any error
set -u  # Treat unset variables as error
source "$MAC_STACK_ROOT/scripts/helpers.sh" # Load helpers

# Install/update Homebrew

echo "🍺 Installing/updating Homebrew ..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Update pre-installed Homebrew packages (outside Brewfile)

echo "🧼 Updating pre-installed Homebrew packages ..."
/opt/homebrew/bin/brew upgrade

# Install additional packages declared in Brewfile

echo "✨ Installing additional packages declared in Brewfile ..."
brewfile="$MAC_STACK_ROOT/Brewfile"
assert_file_exists "$brewfile"
/opt/homebrew/bin/brew bundle install --upgrade --file "$brewfile"

# Clean up Homebrew: cache, orphaned dependencies, old package versions

echo "🧹 Cleaning up Homebrew: cache, orphaned dependencies, old package versions ..."
/opt/homebrew/bin/brew cleanup