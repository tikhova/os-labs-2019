#!/usr/bin/bash
#-o to select columns
ps -U mariya -o pid,command | tail -n +2 | awk '{ print $1 ":" $2 }' > 1.tmp #mariya instead of user
wc -l 1.tmp | awk '{ print $1 }' #crop filename
