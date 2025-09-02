#!/bin/zsh
# This script installs/updates Homebrew and everything in Brewfile

set -e  # Exit on any error
project_root="$(realpath "$(dirname "$0")/..")"
source "$project_root/scripts/helpers.sh" # Load helpers

# Install/update Homebrew

echo "🍺 Installing/updating Homebrew ..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install/update software declared in Brewfile

echo "📦 Installing/updating software declared in Brewfile ..."
brewfile="$project_root/Brewfile"
assert_file_exists "$brewfile"
/opt/homebrew/bin/brew bundle install --upgrade --file "$brewfile"
