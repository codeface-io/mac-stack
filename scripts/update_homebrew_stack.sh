#!/usr/bin/env zsh
# This script installs/updates Homebrew and everything in Brewfile

# Prepare

set -e  # Exit on any error
set -u  # Treat unset variables as error
source "$MAC_STACK_ROOT/scripts/helpers.sh" # Load helpers

# Install/update Homebrew

if ! command -v brew >/dev/null 2>&1; then
    echo "🍺 Installing Homebrew ..."
    silent /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    # side stepping the install script avoids entering password and other interactive hand holding
    # that means when brew is already installed, the whole script can run unattended 
    echo "🍺 Updating Homebrew ..."
    silent brew update
fi

# Update pre-existing Homebrew packages (even outside Brewfile)

echo "🍺 Updating installed Homebrew packages ..."
/opt/homebrew/bin/brew upgrade

# Install additional packages declared in Brewfile

echo "🍺 Installing missing Homebrew packages listed in Brewfile ..."
brewfile="$MAC_STACK_ROOT/Brewfile"
assert_file_exists "$brewfile"
/opt/homebrew/bin/brew bundle install --upgrade --file "$brewfile"

# Clean up Homebrew: cache, old package versions, cask installers

echo "🍺 Cleaning up Homebrew cache, old package versions and cask installers ..."
silent /opt/homebrew/bin/brew cleanup
silent find /opt/homebrew/Caskroom -type d -name '.metadata' -prune -o -type f -delete