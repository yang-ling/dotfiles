#! /bin/bash
# Put this in ~/.kde/Autostart/ssh-agent.sh
export SSH_ASKPASS=/usr/bin/ksshaskpass
/usr/bin/ssh-add
#nohup oneko -position +30 > /dev/null 2>&1 &
nohup wmsystemtray --fill-rows --non-wmaker --bgcolor white --arrows horizontal > /dev/null 2>&1 &
