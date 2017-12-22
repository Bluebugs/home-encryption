#!/bin/sh

key=`e4crypt get_policy $1 | cut -d " " -f 2`

id=`keyctl show|grep $key|cat -n|sed 's/[ \t]* / /g'|cut -d " " -f 3`

keyctl unlink $id

# The file will continue to be visible until the cache is cleared
echo 3 > /proc/sys/vm/drop_caches

exit 0
