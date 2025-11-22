# VS Code (VS Code, Cursor, Antigravity ...)

* The [settings.json](settings.json) and [keybindings.json](keybindings.json) files in this folder are backups for VS Code based IDEs. They normally locate at `~/Library/Application Support/<IDE>/User/*.json`.
* So whenever you change your user settings or user keybindings in VS Code, Cursor or Antigravity, remember to back them up to [settings.json](settings.json) or [keybindings.json](keybindings.json).
* The `update` command of Mac Stack will restore (overwrite) your VS Code-, Cursor- and Antigravity user settings and keybindings from the backup if `VSCODE_SETTINGS_RESTORE` is set `true` in the [`.env`](../.env) file.