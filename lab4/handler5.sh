#!/usr/bin/bash

A=1
OPERATION="+"
ID=$$
(tail -n 0 -f 5.in) |
while true
do
    read LINE
    case $LINE in
        +) OPERATION=$LINE
        ;;
        "*") OPERATION=$LINE
        ;;
        [0-9]*) let A=A$OPERATION$LINE
        ;;
        *)
        echo $A
        pkill -P $ID
        break 
        ;;
    esac
done
 
