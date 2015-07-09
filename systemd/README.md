### System-wide service

Put the following services to /etc/systemd/system/

1. devmon-mine@.service
    1. It requires `/usr/local/bin/clean-umounted`
    2. Enable it by `sudo systemctl enable devmon-mine@yangling.service`
    3. Start it by `sudo systemctl start devmon-mine@yangling.service`
