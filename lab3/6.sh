#!/usr/bin/bash 

> 6.tmp
n=0
m=0
count=0
while read i 
do 
    ppid=$(echo $i | grep -o "Parent_ProcessID=[[:digit:]]\+" | grep -o "[[:digit:]]\+")
    avg=$(echo $i | grep -o "Average_Sleeping_Time=[[:digit:]]\+" | grep -o "[[:digit:]]\+")
    
    if [[ (ppid -ne n) && (count -ne 0) ]]
    then
        m=$(bc -l <<< $m/$count)
        if [[ ${m:0:1} == "." ]] 
                then m=0$m
             fi
        echo "Average_Sleeping_Children_of_ParentID=$n is $m" >> 6.tmp
        n=$ppid
        m=0
        count=0
    fi
    
    let count=count+1
    m=$(bc -l <<< $m+$avg)
    echo $i >> 6.tmp
done < 5.tmp
