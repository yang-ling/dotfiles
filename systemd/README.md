# Systemd Files

These are my systemd files

### System-wide service

Put the following services to /etc/systemd/system/

1. devmon@.service
    1. It requires `/usr/local/bin/clean-umounted`
    2. Enable it by `sudo systemctl enable devmon@yangling.service`
    3. Start it by `sudo systemctl start devmon@yangling.service`
2. empty-trash@.timer and empty-trash@.service
    1. Require `/usr/local/bin/empty-trash`
    2. A daily job which is cleaning $HOME/.Trash. Delete all files which are older than 7 days.
