# Set iTerm2 "New iTerm2 Tab Here" service shortcut to Ctrl+T
defaults write pbs NSServicesStatus -dict-add '"com.googlecode.iterm2 - New iTerm2 Tab Here - openTab"' '<dict><key>key_equivalent</key><string>^t</string></dict>'

# Set shortcuts present flag
defaults write pbs ServicesShortcutsPresent 1

# Restart services
killall Finder && killall SystemUIServer