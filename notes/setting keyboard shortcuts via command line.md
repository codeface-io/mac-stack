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

#### **🎯 Core Shortcut Types:**
- **`pbs NSServicesStatus`** → Services shortcuts (Files and Folders → Services)
- **`NSGlobalDomain NSUserKeyEquivalents`** → App-specific menu shortcuts
- **`com.apple.symbolichotkeys AppleSymbolicHotKeys`** → System-wide shortcuts (Mission Control, Spotlight, etc.)

#### **📱 Specialized Domains:**
- **`~/Library/Preferences/com.apple.ServicesMenu.Services.plist`** → Services registration
- **`com.apple.universalaccess`** → Accessibility shortcuts
- **`com.apple.screencapture`** → Screenshot shortcuts
- **`com.apple.spotlight`** → Spotlight shortcuts
- **`com.apple.dock`** → Dock shortcuts

### **2. Key Formats by Type:**

#### **Services Shortcuts:**
```bash
defaults write pbs NSServicesStatus -dict-add '"BundleID - MenuItem - Message"' '<dict><key>key_equivalent</key><string>^t</string></dict>'
```
- Format: `"BundleID - MenuItem - Message"`
- Example: `"com.googlecode.iterm2 - New iTerm2 Tab Here - openTab"`

#### **App Menu Shortcuts:**
```bash
defaults write com.app.bundle NSUserKeyEquivalents -dict-add "Menu Item" "SHORTCUT"
```
- Format: Just the menu item text
- Example: `"New Folder"`

#### **System Symbolic Hotkeys:**
```bash
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 60 '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>32</integer><integer>49</integer><integer>262144</integer></array><key>type</key><string>standard</string></dict></dict>'
```
- Format: Numeric IDs with complex parameter arrays
- Example: Spotlight (ID 60), Mission Control (ID 32), etc.

### **3. Shortcut Codes:**
- `^` = Control
- `@` = Command
- `~` = Option/Alt
- `$` = Shift
- Example: `^t` = Ctrl+T, `@$n` = Cmd+Shift+N

### **4. System Shortcut IDs (Common Ones):**
- `60` = Spotlight
- `32` = Mission Control
- `33` = Show Desktop
- `36` = Launchpad
- `62` = Notification Center
- `64` = Do Not Disturb

### **5. System Settings Locations:**

#### **📍 Where to Find Each Shortcut Type:**
- **Services**: System Settings → Keyboard → Keyboard Shortcuts → Services
- **App Shortcuts**: System Settings → Keyboard → Keyboard Shortcuts → App Shortcuts
- **System Functions**: System Settings → Keyboard → Keyboard Shortcuts → (bottom section)
- **Accessibility**: System Settings → Accessibility → Keyboard → Hardware

#### **🎯 App Launching Shortcuts:**
Global app launching shortcuts have **significant limitations** in modern macOS:

**⚠️ Current Challenge:**
- **Automator**: Deprecated (being phased out)
- **Shortcuts App**: Modern replacement but **no command-line configuration**
- **Services**: Still work but ecosystem is shrinking

**Available Options:**

**Option A: Legacy Automator (Still Works)**
1. Open Automator → Create "Quick Action"
2. Add "Launch Application" action → Select your app
3. Save as service
4. Set shortcut:
```bash
defaults write pbs NSServicesStatus -dict-add '"Launch My App"' '<dict><key>key_equivalent</key><string>^l</string></dict>'
```

**Option B: Third-party Tools (Recommended for CLI)**

**Other Tools:**
- **Alfred**: Has CLI configuration
- **Keyboard Maestro**: Extensive scripting support
- **BetterTouchTool**: Advanced automation


**Option C: Manual Setup Only**
- Create Shortcuts manually in Shortcuts app
- Set keyboard shortcuts manually in System Settings
- **No programmatic automation possible**

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

## 🎯 **General Patterns by Shortcut Type:**

### **Services Shortcuts:**
```bash
defaults write pbs NSServicesStatus -dict-add '"BundleID - MenuItem - Message"' '<dict><key>key_equivalent</key><string>SHORTCUT</string></dict>'
```

### **App Menu Shortcuts:**
```bash
defaults write com.app.bundle NSUserKeyEquivalents -dict-add "Menu Item" "SHORTCUT"
```

### **Global App Launching Shortcuts (⚠️ UNVERIFIED):**
```bash
# This may not work - the mechanism needs verification
defaults write NSGlobalDomain NSUserKeyEquivalents -dict-add "Launch My App" "@~l"
```

### **System/Global Shortcuts (Mission Control, Spotlight, etc.):**
```bash
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add ID_NUMBER '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>KEYCODE</integer><integer>MODIFIERS</integer><integer>0</integer></array><key>type</key><string>standard</string></dict></dict>'
```

### **🚨 IMPORTANT: App Launching Shortcuts:**
**DO NOT use `com.apple.symbolichotkeys`** for launching apps!

**Why not?** Symbolic hotkeys are **predefined system functions** only:
- `60` = Spotlight
- `32` = Mission Control
- `36` = Launchpad
- `79-82` = Desktop switching
- etc.

They **cannot** be programmed to launch arbitrary apps or run scripts.

**For app launching, Services are the only programmatic option:**
```bash
# Create Automator service, then set shortcut:
defaults write pbs NSServicesStatus -dict-add '"Launch My App"' '<dict><key>key_equivalent</key><string>^l</string></dict>'
```

## 🔑 **Key Insights:**
- **Three main types**: Services, App menus, System shortcuts
- **No official documentation** - everything reverse-engineered
- **Best discovery method**: Set manually in System Settings, capture with `defaults read`
- **Domains vary** by shortcut type and location in System Settings
- **Key format is critical** - must match System Settings exactly
- **System shortcuts** use numeric IDs and complex parameter arrays
- **Symbolic hotkeys are predefined** - cannot launch arbitrary apps
- **🚨 App launching shortcuts**: Major limitation - Automator deprecated, Shortcuts has no CLI
