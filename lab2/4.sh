#!/usr/bin/bash
for filename in $(find /bin/ -readable -type f -print 2> >(grep -v 'find' >&2))
do grep -E -h -s -a "^#!\ *" $filename |  sed -e "s/#!\ *//" | cut -d ' ' -f 1 
done | sort | uniq -c | sort -nk1| tail -1| awk '{ print $2 }'
