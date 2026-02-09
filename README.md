# labs

## Install

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/noxtgm/labs/main/boot.sh)
```

## Shell commands

### List (eza)

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
- `gph`: Push to remote.
- `gpl`: Pull from remote.
- `gplr`: Pull with rebase.
- `gf`: Fetch from remote.
- `gr`: Rebase.
