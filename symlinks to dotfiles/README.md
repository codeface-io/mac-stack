# Symlinks to Dotfiles

🚨 The "dotfiles" in this directory are symlinks **to** important dotfiles on this machine. The symlinks here exist only for reading/monitoring the real files conveniently in context of this repo. This is not to be confused with the typical setup of a "dotfile repo" where it's the other way around with the repo containing the actual files and the machine only having symlinks to them.

The reason we do it this way is simple: If we had the real dotfiles in the repo, we would break Mac Stack's promise of being idempotent. Mac Stack would overwrite changes to dotfiles that were made by other processes or manually, and Mac Stack could not be introduced to an already running and established Mac, greatly limiting its audience and raising its barrier of entry.