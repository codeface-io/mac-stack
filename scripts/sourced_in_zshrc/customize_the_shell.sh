#!/bin/zsh

# You may use this script as a template to customize the shell in general. It should not reference or set up anything personal or user-specific.

# nice prompt
export PROMPT='🍏%1~: '

# working directory as tab title
DISABLE_AUTO_TITLE="true" # specifically for iTerm2 (https://iterm2.com)

# working directory as tab title
precmd() {
  # sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/}\a"
}

# Disable shell history file (~/.zsh_history) to keep home folder clean but also for privacy and security reasons
HISTSIZE=10000  # allow in-memory history for current session
SAVEHIST=0      # don't save any commands to ~/.zsh_history
unset HISTFILE  # remove history file variable entirely

# list folder content with useful options 
alias l="ls -Fahl"

# print the paths in the $PATH variable as a readable list
alias paths="echo $PATH | tr : '\n'"

# aliases that allow omitting "git " with git commands
alias status="git status"
alias diff="git diff" # this masks /usr/bin/diff
alias restore="git restore"
alias add="git add"
alias commit="git commit"
alias push="git push"
alias branch="git branch"
alias clone="git clone"
alias merge="git merge"
alias rebase="git rebase"
alias reflog="git reflog"
alias tag="git tag"
alias switch="git switch"
alias checkout="git checkout"
alias fetch="git fetch"
alias pull="git pull"
alias revert="git revert"
alias reset="git reset" # this masks /usr/bin/reset
alias remote="git remote"
alias log="git log" # this masks /usr/bin/log
alias config="git config"
alias init="git init"

# gitty: A "Save & Sync" Command for Your Code
#
# This script automates the most common Git workflow: adding all changes,
# committing them with a message, and pushing them to the remote repository.
#
# WHY IT'S USEFUL:
# It's designed for a rapid development cycle where you commit frequently
# and push immediately for backup and collaboration. This streamlines the
# 98% of Git usage that is "add all -> commit -> push", removing repetitive
# steps while still requiring a thoughtful commit message.
#
# USAGE:
# gitty "Your commit message here"
#
# For the 2% of cases requiring more granular control (like selective
# staging or complex branch operations), the standard Git commands can
# still be used directly.
gitty () {
    changes=$(status --porcelain)

    if [ -z "$changes" ]; then
        echo "🛑 No changes to commit"
    else
        # Generate commit message
        if [ -z "$1" ]; then
            # Count changed files
            file_count=$(echo "$changes" | wc -l)
            
            if [ "$file_count" -lt 4 ]; then
                # Include file names if less than 4 files were changed
                files=$(echo "$changes" | awk '{print $2}' | xargs basename | tr '\n' ', ' | sed 's/, *$//')
                commit_msg="Edit files: $files"
            else
                # Generic message if more than 4 files were changed
                commit_msg="Edit $file_count files"
            fi
        else
            commit_msg="$1"
        fi
        
        # Stage, commit and push changes
        add .
        commit -m "$commit_msg"
        push
        lastCommit=$(log --oneline -1)
        echo "✅ Pushed $lastCommit"
    fi

    echo "🤪 https://www.urbandictionary.com/define.php?term=gitty"
}

# unveil: Turns all PDFs in the current folder into Markdown files, using markitdown (https://github.com/microsoft/markitdown). Super useful for working with AI on local context.
unveil() {
    if ! command -v markitdown &> /dev/null; then
        echo "markitdown not found (yet)."
        echo "markitdown (by Microsoft) helps making all kinds of content readable to AI."
        echo "Install it with: pip install 'markitdown[all]'"
        echo "Or visit: https://github.com/microsoft/markitdown"
        return 1
    fi
    
    for pdf in *.pdf; do
        base="${pdf%.pdf}"
        PYTHONWARNINGS=ignore markitdown "$pdf" -o "$base.md" > /dev/null
        echo "✅ $base.md"
    done
}

# d: Opens folder in IDE, opens current folder if none is provided
# "d" stands for: Development environment, Develop, Debug, Display, Dive into, Dig into, Discuss (with AI)
d() {
    local target_dir="${1:-$(pwd)}"

    if [[ -d "$target_dir" ]]; then
        cursor "$target_dir"
    else
        echo "🛑 Directory '$target_dir' does not exist"
        return 1
    fi
}

# Alias for installing the latest Xcode version
alias update-xcode="xcodes install --latest"

# Alias for getting the latest Python version
alias python-latest="pyenv install --list | grep -E '^\s*[0-9]+\.[0-9]+\.[0-9]+$' | tail -1 | xargs"