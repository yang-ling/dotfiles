#! /bin/bash
# Put this in ~/.kde/Autostart/ssh-agent.sh
export SSH_ASKPASS=/usr/bin/ksshaskpass
/usr/bin/ssh-add
nohup oneko > /dev/null 2>&1 &
