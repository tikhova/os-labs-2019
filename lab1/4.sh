#!/usr/bin/bash
count=0
res=1
while [[ $res -ne 0 ]]
do
    read a
    let res=$a%2
    let count=count+1
done
echo $count
