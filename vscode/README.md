# VS Code Settings (VS Code, Cursor, Antigravity ...)

* The [settings.json](settings.json) file in this folder is a backup of your user settings for VS Code based IDEs. They normally locate at `~/Library/Application Support/<IDE>/User/settings.json`.
* So whenever you change your user settings in VS Code, Cursor or Antigravity, remember to back them up to [settings.json](settings.json).
* The `update` command of Mac Stack will restore (overwrite) your VS Code-, Cursor- and Antigravity user settings from the backup if `VSCODE_SETTINGS_RESTORE` is set `true` in the [`.env`](../.env) file.