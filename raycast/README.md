# Raycast

[Raycast](https://raycast.com/) has emerged as THE productivity helper for macOS, being highly customizable, extensible and covering **all imaginable conveniences** that macOS glaringly lacks, including global hot keys, a functioning emoji picker, window management, and clipboard history.

## Setup

* To set up Raycast on a new machine without a paid Raycast Pro account, the easiest way is to export/import Raycast settings.
   - Raycast Settings → Advanced → Import / Export
* So whenever you changed Raycast settings, remember to export them. This creates a password protected `.rayconfig` file. Store the file somewhere independent (in the cloud). And store the password somewhere secure (password manager).
* Then on a new or additional machine, import your Raycast settings from your `.rayconfig` file using the corresponding password.

## Global Hot Keys

* These can be set up in Raycast
* If you have apps in non-standard locations, tell Raycast about it: Raycast Settings → Extension → + → Add Application Directory → select additional directory, for example the Desktop

### My Setup

It makes sense to build global navigation hot keys around the option key. The option key does typically not interfere with the short cuts of apps (which use the command and control keys) and it already is what brings up raycast (option + space).

#### Navigate to: Apps, Web Apps, Workspaces

⌥X for navigation:

| Destination (Intent) | Shortcut | App / Website / Raycast Action |
|--------|---------|-----|
| AI Assistant | ⌥A | Grok |
| Calendar | ⌥C | Calendar |
| Develop | ⌥D | Cursor |
| Email | ⌥E | Mail |
| Finder | ⌥F | Finder |
| Git Client | ⌥G | Fork |
| Hear | ⌥H | Podcasts |
| Internet | ⌥I | Brave Browser |
| Jot Down | ⌥J | Stickies |
| Listen | ⌥L | Music |
| Messenger | ⌥M | WhatsApp |
| News | ⌥N | X Pro |
| Outlook | ⌥O | Microsoft Outlook |
| Passwords | ⌥P | Passwords |
| Reminders | ⌥R | Reminders |
| System Settings | ⌥S | System Settings |
| Write | ⌥W | Typora |
| Xcode | ⌥X | Xcode |  
| YouTube | ⌥Y | YouTube Subscriptions |
| Zühlke | ⌥Z | Microsoft Teams |
| Terminal | ⌥⏎ | Warp |
| Trash | ⌥⌫ | Open Trash |

#### In Active Finder Folder

This requires setup: Copy the scripts from [`scripts`](./scripts) to `~/.config/raycast/scripts`.

⌥⇧X for navigation and actions in active Finder folder:

| Intent | Shortcut | Raycast Action |
|--------|---------|-----|
| Develop in folder | ⌥⇧D | Open folder in Cursor |
| Create new file in folder | ⌥⇧F | Create new file in folder |
| Write in folder | ⌥⇧W | Open folder in Typora |
| Terminal in folder | ⌥⇧⏎ | Open folder in Warp |

#### Control Settings and States

⌃X for controlling global settings and states:

| Intent | Shortcut | Raycast Action |
|--------|---------|-----|
| Switch Dark/Day Mode | ⌃D | Toggle System Appearance |
| Empty the Trash | ⌃⌫ | Empty Trash |