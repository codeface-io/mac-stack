#!/bin/zsh
# This script uninstalls 1) brew packages that are not (yet) declared in the Brewfile, and 2) brew packages that are orphaned dependencies (Orphaned means they were once installed as dependencies but are not depended upon anymore. Brew does not automatically remove such orphans.)

set -e  # Exit on any error
BREWFILE_PATH="$(realpath "$(dirname "$0")")/Brewfile"
echo "🧹 Uninstalling undeclared brew packages and orphaned dependencies ..."
brew bundle cleanup --force --file "$BREWFILE_PATH" # (1)
brew autoremove # (2)
echo "✅ Did uninstall undeclared brew packages and orphaned brew dependencies"