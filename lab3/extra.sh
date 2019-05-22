#!/usr/bin/bash

for i in $(ls /proc/ | grep "[[:digit:]]\+")
do 
    str=$(readlink /proc/$i/exe)
    if [[ $str != "" ]] 
        then echo $i $str
    fi
done
