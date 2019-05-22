#!/usr/bin/bash

while true
do
    read LINE
    case $LINE in
        +)
            echo $LINE >> 5.in
        ;;
        '*')
            echo $LINE >> 5.in
        ;;
        [0-9]*) 
            echo $LINE >> 5.in
        ;;
        QUIT) 
            echo $LINE >> 5.in
            echo "SCHEDULED STOP"
            break
        ;;
        *) 
            echo $LINE >> 5.in
            echo "ERROR"
            break
        ;;
    esac
done
