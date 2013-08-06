#! /bin/bash
# Put this in ~/.kde/Autostart/ssh-agent.sh
export SSH_ASKPASS=/usr/bin/ksshaskpass
/usr/bin/ssh-add
#nohup oneko -position +30 > /dev/null 2>&1 &
