#!/bin/zsh
# This script uninstalls all brew packages that are not (yet) declared in the Brewfile

set -e  # Exit on any error
BREWFILE_PATH="$(realpath "$(dirname "$0")")/Brewfile"
echo "🧹 Will uninstall all brew packages that are not (yet) declared in $BREWFILE_PATH"
brew bundle cleanup --force --file "$BREWFILE_PATH"
echo "✅ Did uninstall all brew packages that are not (yet) declared in $BREWFILE_PATH"