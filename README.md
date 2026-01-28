# labs

## Install

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/noxtgm/labs/main/boot.sh)
```

## Shell commands

### Files (eza)

- `ls`: List files with icons.
- `lsa`: List files, including hidden, with icons.
- `lsx`: List files with permissions, size, date, and icons.
- `lsxa`: List files, including hidden, with extra info.

### Tree (eza)

- `tree`: Show directory tree 2 levels deep.
- `treea`: Show directory tree, including hidden, 2 levels deep.
- `treex`: Show directory tree with permissions, size, and date.
- `treexa`: Show directory tree, including hidden, with extra info.

### Navigation (zoxide)

- `cd [path]`: Change directory with smart matching.
- `..`: Go up one directory.
- `...`: Go up two directories.
- `....`: Go up three directories.

### Search (fzf)

- `ff`: Fuzzy find files.

### Version control (git)

- `gaa`: Stage all changes.
- `gcm [message]`: Commit with message.
- `gca`: Amend last commit.
- `gcan`: Amend last commit without editing message.
- `gt`: List or create tags.
- `gwip`: Stage all and commit as WIP.
- `gp`: Push to remote.
- `gpf`: Safe force push.
- `gpl`: Pull from remote.
- `gplr`: Pull with rebase.
- `grb [branch]`: Rebase onto branch.
- `gf`: Fetch from remote.
- `gfa`: Fetch from all remotes.

### Functions

- `compress [file.tar.gz]` / `decompress [file.tar.gz]`: Create or expand a tar.gz file.
- `iso2sd [image.iso] [/path/to/sdcard]`: Create a bootable drive on an SD card using the referenced iso file.
- `format-drive [/dev/drive]`: Format an entire disk with a single exFAT partition.
- `img2jpg [image]`: Convert any image to near-full quality JPG.
- `img2jpg-small [image]`: Convert any image to near-full quality 1080p-wide JPG.
- `img2png [image]`: Convert any image to lossily-compressed PNG.
