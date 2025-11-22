# 🍺 All available homebrew packages can be searched here: https://formulae.brew.sh

# 🍏 Mac App Store apps (and their IDs) can be searched via `mas search <search-term>`

# ❗ Prefer casks (🍺) over MAS (🍏) when both exist:
# - install/update without extra auth
# - no Apple ID session that can expire mid-`mas` install
# - avoids MAS region/terms changes that can silently fail

# communication
cask "Telegram"
cask "WhatsApp"
cask "microsoft-outlook"
cask "microsoft-teams"

# writing, diagramming, office
cask "typora"
mas "Pages", id: 409201541
mas "Numbers", id: 409203825
mas "Keynote", id: 409183694
cask "omnigraffle"
cask "miro"
cask "brave-browser"
cask "eqmac" # equalizer because: 1) display speakers are boomy, 2) music

# basic developer tools
brew "git"            # just so it gets updated frequently
cask "fork"           # graphical git client
cask "raycast"        # THE macOS swiss army knife for productivity
cask "focus"          # limit distractions
cask "font-fira-code" # monospaced font with coding ligatures
cask "omnidisksweeper" # simple free disk usage inspection (give it full disk access in System Settings > Privacy & Security)
#cask "docker-desktop" # "Docker Desktop" app plus `docker` CLI
#cask "radio-silence"  # firewall & network monitor (currently outdated SHA-256)

# IDEs and coding agents
cask "warp" # serves as terminal, coding agent and IDE
cask "cursor"
cask "antigravity"
cask "claude-code" # CLI tool but comes as cask because it's a binary
vscode "anthropic.claude-code"
vscode "mathematic.vscode-pdf" # fast maintained PDF viewer for Cursor

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
brew "pipx" # python application manager
vscode "ms-python.python" # Central extension for python

# Flutter development
# core issue: fvm is broken: latest fvm could under some circumstances NOT be installed via brew at all, because it expected to be bundled with a dart version with which it is not bundled 🤡
# alternative to explore: mise https://mise.jdx.dev/dev-tools/
tap "leoafarias/fvm" # Required for installing fvm
brew "fvm" # flutter version manager
brew "cocoapods" # necessary for building iOS apps with Flutter

# Screen recording (for demos and lectures)
mas "Hand Mirror", id: 1502839586 # video overlay in lecture recordings
cask "keycastr" # key strokes overlay in lecture recordings
cask "obs" # screen recording that can capture system audio
cask "handbrake-app" # video transcoder for compressing screen recordings

# CLI tools for working with content file formats (for scripts/agents)
brew "imagemagick" # working with images (scale, crop, convert format ...)
brew "ghostscript" # pdf support for imagemagick (which does not install gs)
brew "pandoc" # universal document converter (markdown, HTML, LaTeX, docx, PDF ...)
brew "weasyprint" # specialized HTML/CSS to PDF converter, preserves styling
brew "ffmpeg" # industry-standard CLI video/audio converter/compressor/processor

# ⚠️ Required dependencies for Brewfile (do not remove)
brew "mas" # for declaring mac app store apps
cask "visual-studio-code" # for declaring vs code extensions