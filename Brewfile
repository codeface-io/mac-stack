# All software available via homebrew can be searched here: https://formulae.brew.sh

# communication
mas "Telegram", id: 747648890
mas "WhatsApp", id: 310633997
mas "Microsoft Outlook", id: 985367838
cask "microsoft-teams"

# writing, diagramming, office
cask "typora"
mas "Pages", id: 409201541
mas "Keynote", id: 409183694
mas "Numbers", id: 409203825
cask "omnigraffle"
cask "brave-browser"

# basic developer tools
brew "git"
cask "docker-desktop" # "Docker Desktop" app plus `docker` CLI
cask "focus"
cask "font-fira-code" # monospaced font with coding ligatures
cask "fork"
cask "raycast"

# IDEs and coding agents
cask "warp" # serves as terminal, coding agent and IDE
cask "cursor"
cask "claude-code" # (is a cask because it is a binary)
vscode "anthropic.claude-code"
vscode "mathematic.vscode-pdf" # fast maintained PDF viewer

# Apple development
brew "xcodes"
cask "xcodes-app"
mas "Developer", id: 640199958
mas "Icon Generator", id: 1631880470 # for scaling macOS app icons

# Apple fonts: https://developer.apple.com/fonts
cask "font-sf-pro" 
cask "font-sf-compact"  
cask "font-sf-mono"
cask "font-new-york"

# Python development
brew "xz" # Required for installing certain Python versions via pyenv
brew "pyenv" # python version manager
vscode "ms-python.python" # Central extension for python

# Flutter development
tap "leoafarias/fvm" # Required for installing fvm
brew "fvm" # flutter version manager

# Screen recording (for demos and lectures)
mas "Hand Mirror", id: 1502839586 # video overlay in lecture recordings https://handmirror.app
cask "keycastr" # key strokes overlay in lecture recordings https://github.com/keycastr/keycastr
cask "obs" # screen recording that can capture system audio
cask "handbrake-app" # video transcoder for compressing screen recordings

# CLI tools for working with content file formats (for scripts/agents)
brew "imagemagick" # working with images (scale, crop, convert format ...)
brew "ghostscript" # pdf support for imagemagick (which does not install ghostscript by itself)
brew "pandoc" # universal document converter (markdown, HTML, LaTeX, docx, PDF ...)
brew "weasyprint" # specialized HTML/CSS to PDF converter, preserves styling
brew "ffmpeg" # industry-standard CLI video/audio converter/compressor/processor

# ⚠️ Required dependencies for Brewfile (do not remove)
brew "mas" # for declaring mac app store apps
cask "visual-studio-code" # for declaring vs code extensions