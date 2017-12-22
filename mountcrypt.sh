#!/bin/sh


if [ -f /home/keys/$2/my-key ]; then
    key=`echo /home/keys/$2/my-key`
else
    echo "Can not find /home/keys/$2/my-key."
    exit 1
fi

shift

read password

echo $password | openssl aes256 -md sha512 -d -in $key 2>/dev/null | e4crypt add_key 2>/dev/null 

exit $?
