# Systemd Files

These are my systemd files

### System-wide Units

Put the following services to /etc/systemd/system/

1. empty-trash@.timer and empty-trash@.service
    1. Require `/usr/local/bin/empty-trash`
    2. A daily job which is cleaning $HOME/.Trash. Delete all files which are older than 7 days.
2. arch-optimize.timer and arch-optimize.service
    1. Require `/usr/local/bin/arch-optimizer`

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
