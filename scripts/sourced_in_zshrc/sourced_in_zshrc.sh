#!/bin/zsh

# Get script directory (in a way that works when sourced rather than executed)
SCRIPT_DIR="$(dirname "${(%):-%x}")"

source "$SCRIPT_DIR/setup_cli_tools.sh"
source "$SCRIPT_DIR/customize_the_shell.sh"

if [[ -f "$SCRIPT_DIR/personalize_the_shell.sh" ]]; then
    source "$SCRIPT_DIR/personalize_the_shell.sh"
fi