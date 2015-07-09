### System-wide service

Put the following services to /etc/systemd/system/

1. devmon@.service
    1. It requires `/usr/local/bin/clean-umounted`
    2. Enable it by `sudo systemctl enable devmon@yangling.service`
    3. Start it by `sudo systemctl start devmon@yangling.service`
