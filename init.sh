#! /bin/sh
pgrep wallch >/dev/null
result=$?
if [ "$result" = "0" ]; then
    # wallch already exists
    return 0
fi
ibus-daemon -d -r
nohup vrome >/dev/null 2>&1 &
nohup wallch --constant >/dev/null 2>&1 &
