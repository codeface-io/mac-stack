#!/bin/zsh
# This script enforces the philosophy that every Homebrew package used must be declared explicitly in the Brewfile.
# It uninstalls 1) brew packages that are not (yet) declared in the Brewfile, and 2) brew packages that are orphaned dependencies (Orphaned means they were once installed as dependencies but are not depended upon anymore. Brew intentionally tracks and keeps such orphans.)

# Prepare
set -e  # Exit on any error
BREWFILE_PATH="$(realpath "$(dirname "$0")")/Brewfile"

# Ask for confirmation
echo "⚠️  This will uninstall all brew packages that are not declared in this Brewfile:\n   file://${BREWFILE_PATH// /%20}"
read "response?❓ Continue? (y/N): "
if [[ "$response" != [yY] ]]; then
    exit 0
fi

# Proceed with uninstallations
echo "🧹 Uninstalling ..."
brew bundle cleanup --force --file "$BREWFILE_PATH" # (1)
brew autoremove # (2)
echo "✅ Did uninstall all brew packages that are not declared in the Brewfile"