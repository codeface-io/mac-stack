# Cursor Settings

* The [settings.json](settings.json) file in this folder is a backup of your Cursor user settings that normally locate at `~/Library/Application Support/Cursor/User/settings.json`.
* So whenever you change your Cursor user settings, remember to back them up to [settings.json](settings.json).
* The `update` command of Mac Stack will restore (overwrite) your Cursor settings from the backup if `CURSOR_RESTORE_BACKUP` is set `true` in the [`.env`](../.env) file.