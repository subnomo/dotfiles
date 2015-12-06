#!/bin/sh

unread_mail=/tmp/unread_mail

if [ -e $unread_mail ]; then
    rm $unread_mail
fi

get_unread () {
    curl -u $EMAIL_USERNAME:$EMAIL_PASSWORD --silent "https://mail.google.com/mail/feed/atom" |
    grep -oPm1 "(?<=<title>)[^<]+" |
    sed '1d' |
    wc -l
}

# Check every 5 minutes for mail
while true; do
    echo $(get_unread) > $unread_mail
    sleep 300
done &
