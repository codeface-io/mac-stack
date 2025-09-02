#!/bin/zsh

# function to ensure content exists in ~/.zshrc
ensure_zshrc_content() {
    local content="$1"
    local zshrc_file="$HOME/.zshrc"

    # Check if the content already exists in .zshrc (exact character match)
    local file_content="$(cat "$zshrc_file" 2>/dev/null || echo "")"
    
    if [[ "$file_content" == *"$content"* ]]; then
        return 0
    fi

    # Append the content with a blank line before it
    echo "" >> "$zshrc_file"
    echo "$content" >> "$zshrc_file"
    echo "📝 Added to .zshrc:"
    echo "$content"
}

# function to check that a required file exists
assert_file_exists() {
    local file_path="$1"
    
    if [[ ! -f "$file_path" ]]; then
        echo "❌ Required file not found: $file_path"
        exit 1
    fi
}