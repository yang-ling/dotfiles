# Systemd Files

These are my systemd files

### User Units

Put the following units to $HOME/.config/systemd/user/

1. installed-packages-list.timer and installed-packages-list.service
    1. Require `/usr/local/bin/list-installed-packages`
    2. You need modify the service unit to specify output folder
    3. Enable it by `systemctl --user enable empty-trash@yangling.timer`
    4. Start it by `systemctl --user start empty-trash@yangling.timer`
2. empty-folders.timer and empty-folders.service
    1. Require `/usr/local/bin/empty-folders`
    2. Require `$HOME/.empty-foldersrc`
