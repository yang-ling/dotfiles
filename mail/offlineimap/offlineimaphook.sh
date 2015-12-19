#!/usr/bin/env bash

MAIL_ROOT="$HOME/Mails"
message=""

while read -r -d $'\0' oneFolder
do
    NEW="new"
    if  test "x${oneFolder##*/}" = "x$NEW" ; then
        newmail_count=$(find "$oneFolder" -type f | wc -l)
        mailbox="${oneFolder%/new}"
        account="${mailbox%/*}"
        mailbox="${mailbox##*/}"
        account="${account##*/}"
        [[ $newmail_count -gt 0 ]] && \
            notify-send "$newmail_count New Mail(s) in $account/$mailbox " "$message" -t 5000 &
    fi
done < <(find "$MAIL_ROOT" -type d -path "$MAIL_ROOT/.notmuch" -prune -o -type d -print0)

notmuch new &
