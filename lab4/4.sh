#!/usr/bin/bash

nice -n 19 ./cycle.sh &
pid1=$!
nice -n 0 ./cycle.sh &
pid2=$!

echo $pid1
top -n 1| grep $pid1
kill $pid1
kill $pid2
