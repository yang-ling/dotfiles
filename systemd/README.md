# Systemd Files

These are my systemd files

### System-wide Units

Put the following services to /etc/systemd/system/

1. devmon@.service
    1. It requires `/usr/local/bin/clean-umounted`
    2. Enable it by `sudo systemctl enable devmon@yangling.service`
    3. Start it by `sudo systemctl start devmon@yangling.service`
2. empty-trash@.timer and empty-trash@.service
    1. Require `/usr/local/bin/empty-trash`
    2. A daily job which is cleaning $HOME/.Trash. Delete all files which are older than 7 days.

### User Units

Put the following units to $HOME/.config/systemd/user/

1. check-failed.timer and check-failed.service
    1. Require `/usr/local/bin/check-failed-units`
    2. Enable it by `systemctl --user enable empty-trash@yangling.timer`
    3. Start it by `systemctl --user start empty-trash@yangling.timer`
2. installed-packages-list.timer and installed-packages-list.service
    1. Require `/usr/local/bin/list-installed-packages`
    2. You need modify the service unit to specify output folder
