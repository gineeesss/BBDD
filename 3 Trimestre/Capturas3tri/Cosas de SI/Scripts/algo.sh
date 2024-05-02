#!/usr/bin/env bash

IFS=: 
# internal line separation
while read nombre equis uid gid desc home nshell
do
    echo $nombre "-" $uid
done < /etc/passwd
IFS=\n