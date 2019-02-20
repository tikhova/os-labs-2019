#!/usr/bin/bash
echo "Options:"
echo "(1) nano"
echo "(2) vi"
echo "(3) firefox"
echo "(4) exit"
echo "Please insert option"
read option
case $option in
    1)
        nano
        ;;
    2)
        vi
        ;;
    3)
        firefox
        ;;
    4)
        exit
        ;;
esac
