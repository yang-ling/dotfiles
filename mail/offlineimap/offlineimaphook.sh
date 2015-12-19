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
        [[ -d "/tmp/mail_count" ]] || { mkdir /tmp/mail_count; }
        count_file="/tmp/mail_count/$account-$mailbox"
        [[ -f "/tmp/mail_count/$account-$mailbox" ]] || { touch "$count_file"; }
        old_count=$(cat "/tmp/mail_count/$account-$mailbox");
        echo "$newmail_count" > "/tmp/mail_count/$account-$mailbox";
        newmail_count=$(( newmail_count - old_count ));
        [[ $newmail_count -gt 0 ]] && \
            notify-send "$newmail_count New Mail(s) in $account/$mailbox " "$message" -t 5000 &
    fi
done < <(find "$MAIL_ROOT" -type d -path "$MAIL_ROOT/.notmuch" -prune -o -type d -print0)

notmuch new &
