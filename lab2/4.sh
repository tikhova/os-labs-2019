#!/usr/bin/bash
for filename in $(file /bin/* | grep ' script' | cut -d : -f 1)
do grep -E -h -s -a "^#!" $filename | cut -d : -f 1
done | sort | uniq -c | sort | tail -1| sed -e "s/#!//" | awk '{ print $2 }'
