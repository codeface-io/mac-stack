#!/bin/zsh

# Get the directory where this script is located
SCRIPT_DIR="$(dirname "${(%):-%x}")"

source "$SCRIPT_DIR/make-the-shell-great-again.sh"
source "$SCRIPT_DIR/personalize-the-shell.sh"
source "$SCRIPT_DIR/setup_cli_tools.sh"