#!/usr/bin/bash
read a
while [[ $a != "q" ]]
do
    result="$result$a"
    read a
done
echo $result
