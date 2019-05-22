#!/usr/bin/bash

echo $$ > .pid
A=0
MODE="WORK"
stop() {
    MODE="TERM"
}
trap 'stop' SIGTERM
while true
do
    case $MODE in
        WORK)
            let A=$A+1
            echo $A
        ;;
        TERM)
            echo "Stopped by SIGTERM"
            exit
        ;;
    esac
    sleep 1
done
 
