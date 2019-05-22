#!/usr/bin/bash

> 3.tmp
for i in $(ls /proc/ | grep "[[:digit:]]\+")
do 
    str=$(readlink /proc/$i/exe | grep "/bin") #grep "/sbin") I do not have sbin ones
    if [[ $str != "" ]] 
        then echo $i >> 3.tmp
    fi
done
