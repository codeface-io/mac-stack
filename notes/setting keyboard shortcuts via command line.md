# Setting keyboard shortcuts via command line

## 🎯 **Working Solution for Services Shortcuts**

### **The Correct Command (Tested & Working):**
```bash
# Set iTerm2 "New iTerm2 Tab Here" service shortcut to Ctrl+T
defaults write pbs NSServicesStatus -dict-add '"com.googlecode.iterm2 - New iTerm2 Tab Here - openTab"' '<dict><key>key_equivalent</key><string>^t</string></dict>'

# Mark shortcuts as present
defaults write pbs ServicesShortcutsPresent 1

# Restart services
killall Finder && killall SystemUIServer
```

## 📋 **What We Learned: Domains & Key Formats**

### **1. Domains Discovered:**
- **`pbs NSServicesStatus`** → Services shortcuts (Files and Folders → Services)
- **`NSGlobalDomain NSUserKeyEquivalents`** → App-specific menu shortcuts
- **`~/Library/Preferences/com.apple.ServicesMenu.Services.plist`** → Services registration

### **2. Key Formats:**
- **Services**: `"BundleID - MenuItem - Message"`
  - Example: `"com.googlecode.iterm2 - New iTerm2 Tab Here - openTab"`
- **App Shortcuts**: Just the menu item text
  - Example: `"New Folder"`

### **3. Shortcut Codes:**
- `^` = Control
- `@` = Command
- `~` = Option/Alt
- `$` = Shift
- Example: `^t` = Ctrl+T, `@$n` = Cmd+Shift+N

## 🔍 **Discovery Method (RECOMMENDED):**

**The most reliable way to discover domains and codes:**

1. **Set manually in System Settings** → Keyboard → Keyboard Shortcuts
2. **Capture the result:**
   ```bash
   # Check what changed
   defaults read pbs NSServicesStatus
   defaults read NSGlobalDomain NSUserKeyEquivalents
   ```
3. **Use the exact format** that System Settings creates

## 📚 **Resources:**
* https://www.reddit.com/r/MacOS/comments/qs8jc0/is_there_any_way_to_configure_mac_os_keyboard/
* https://apple.stackexchange.com/questions/398561/how-to-set-system-keyboard-shortcuts-via-command-line
* https://ryanmo.co/2017/01/05/setting-keyboard-shortcuts-from-terminal-in-macos/
* https://stackoverflow.com/questions/45601543/how-to-get-macos-keyboard-shortcuts-set-in-system-preferences-programmatically

## 🎯 **General Pattern:**
```bash
# For Services shortcuts:
defaults write pbs NSServicesStatus -dict-add '"BundleID - MenuItem - Message"' '<dict><key>key_equivalent</key><string>SHORTCUT</string></dict>'

# For App shortcuts:
defaults write com.app.bundle NSUserKeyEquivalents -dict-add "Menu Item" "SHORTCUT"
```

## 🔑 **Key Insights:**
- **No official documentation** - it's reverse-engineered
- **Best method**: Set manually, capture the result
- **Domains vary** by shortcut type (Services vs App menus)
- **Key format is critical** - must match System Settings exactly
