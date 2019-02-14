#!/usr/bin/bash
a=0 
if [[ $1 -lt  $2 ]]
then
    a=$2
else
    a=$1
fi
if [[ $a -lt $3 ]]
then
    a=$3
fi
echo "$a"
