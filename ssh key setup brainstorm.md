# SSH Key Setup Strategy

## Authentication Method Decision
- **Use SSH keys instead of HTTPS PATs**
  - PATs expire and require renewal
  - SSH keys don't expire, less maintenance
  - More secure long-term approach

## Key Strategy  
- **Focus on default SSH key** (`~/.ssh/id_ed25519`)
  - No SSH config needed for GitHub
  - Single identity across services
  - Works out-of-the-box for `git@github.com:` URLs

## Security & Storage
- **Generate key with strong passphrase** (encrypted private key)
- **Store encrypted private key** safely in iCloud Drive
- **Store public key** alongside for verification
- **Upload public key to GitHub** (one-time manual step)

## Automation Strategy
- **Idempotent verification**: Compare current vs expected public key
- **Skip restore** if correct key already installed
- **Only prompt for passphrase** when restoration needed
- **Derive public from private** to verify key pair integrity

## Implementation Flow
1. Check if `~/.ssh/id_ed25519` exists and matches expected public key
2. If match: skip restoration (no passphrase prompt)  
3. If no match: restore from iCloud backup + verify + add to ssh-agent
4. User manages passphrase however they prefer (keychain, 1Password, etc.)

## Files Involved
- Backup: `~/iCloud/backup/ssh/id_ed25519` (encrypted private)
- Backup: `~/iCloud/backup/ssh/id_ed25519.pub` (public for verification)
- Target: `~/.ssh/id_ed25519` (restored private key)

## Benefits
- ✅ Simple: No external tools required
- ✅ Secure: Encrypted keys safe in cloud storage  
- ✅ Automated: Copy + verify + prompt workflow
- ✅ Flexible: User controls passphrase management
- ✅ Idempotent: Safe to run multiple times