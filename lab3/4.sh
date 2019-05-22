#!/usr/bin/bash
# -e selects all processes
ps -eo pid | tail -n +2 | awk '{file="/proc/"$1"/statm"; getline str<file; split(str, a); print $1 ":" a[2]-a[3]}' | sort -r -n -t ":" -k2 > 4.tmp

