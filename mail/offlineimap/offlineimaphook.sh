#!/usr/bin/env bash

MAIL_ROOT="$HOME/Mails"
message=""

generate_md5file() {
    [[ -f "$2" ]] && { rm -f "$2"; }
    touch "$2"
    while read -r -d $'\0' oneFile
    do
        echo $oneFile
        md5sum $oneFile >> $2
    done < <(find "$1" -type f -print0)
}

isNewOrOld() {
    isNew=1
    while IFS='' read -r oldMD5 || [[ -n "$oldMD5" ]]
    do
        echo "oldMD5 is $oldMD5"
        [[ "${oldMD5}" = "$1" ]] && { isNew=0; return; }
    done < $2
}

compare_md5files() {
    while IFS='' read -r oneMD5 || [[ -n "$oneMD5" ]]
    do
        isNew=1
        echo "New MD5 is $oneMD5"
        isNewOrOld "$oneMD5" "$2"
        [[ $isNew -eq 1 ]] && { newmail_count=$(( newmail_count + 1 )); }
    done < $1
}

while read -r -d $'\0' oneFolder
do
    NEW="new"
    newmail_count=0
    if  test "x${oneFolder##*/}" = "x$NEW" ; then
        mailbox="${oneFolder%/new}"
        account="${mailbox%/*}"
        mailbox="${mailbox##*/}"
        account="${account##*/}"
        [[ -d "/tmp/mail_count" ]] || { mkdir /tmp/mail_count; }
        count_file="/tmp/mail_count/$account-$mailbox"
        [[ -f "/tmp/mail_count/$account-$mailbox" ]] || { touch "$count_file"; }
        count_file_temp="/tmp/mail_count/$account-$mailbox-temp"
        generate_md5file "$oneFolder" "$count_file_temp"
        compare_md5files "$count_file_temp" "$count_file"
        mv -f "$count_file_temp" "$count_file"
        [[ $newmail_count -gt 0 ]] && \
            notify-send "$newmail_count New Mail(s) in $account/$mailbox " "$message" -t 5000 &
    fi
done < <(find "$MAIL_ROOT" -type d -path "$MAIL_ROOT/.notmuch" -prune -o -type d -print0)

notmuch new &
