#!/bin/sh


if [ -f /home/home-cedric.key ]; then
    key="/home/keys/$2/my-key"
else
    exit 0
fi

shift

read password

echo $password | openssl aes256 -md sha512 -d -in /home/keys/$2/my-key | e4crypt add_key 2>&1

exit $?
