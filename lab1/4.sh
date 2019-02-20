#!/usr/bin/bash
read a
let res=$a%2
count=0
while [[ $res -ne 0 ]]
do
    let count=count+1
    read a
    let res=$a%2
done
echo $count
