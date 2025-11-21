#!/bin/zsh
# This script installs/updates Homebrew and everything in Brewfile

set -e  # Exit on any error
set -u  # Treat unset variables as error
source "$MAC_STACK_ROOT/scripts/helpers.sh" # Load helpers

# Install/update Homebrew

if ! command -v brew >/dev/null 2>&1; then
    echo "🍺 Installing Homebrew ..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    # side stepping the install script avoids entering password and other interactive hand holding
    # that means when brew is already installed, the whole script can run unattended 
    echo "🍺 Updating Homebrew ..."
    brew update
fi

# Update pre-existing Homebrew packages (even outside Brewfile)

echo "🧼 Updating pre-existing Homebrew packages ..."
/opt/homebrew/bin/brew upgrade

# Install additional packages declared in Brewfile

echo "✨ Installing additional packages declared in Brewfile ..."
brewfile="$MAC_STACK_ROOT/Brewfile"
assert_file_exists "$brewfile"
/opt/homebrew/bin/brew bundle install --upgrade --file "$brewfile"

# Clean up Homebrew: cache, old package versions, Cask installers

echo "🧹 Cleaning up Homebrew cache, old package versions and Cask installers ..."
/opt/homebrew/bin/brew cleanup
find /opt/homebrew/Caskroom -type d -name '.metadata' -prune -o -type f -delete