#!/usr/bin/bash

result=""
 
for i in $(ps -eo pid | tail -n +2)
do 
    status="/proc/$i/status"  
    
    pid=$(grep -E -s "^Pid" $status  | grep -o "[[:digit:]]\+")
    ppid=$(grep -E -s "^PPid" $status | grep -o "[[:digit:]]\+")
    
      
    sched="/proc/$pid/sched"
    sum_exec_runtime=$(grep -E -s "sum_exec_runtime" $sched | awk '{print $NF}')
    nr_switches=$(grep -E -s "nr_switches" $sched | awk '{print $NF}')
    if [[ $nr_switches -ne 0 ]]
        then sleepavg=$(bc -l <<<  $sum_exec_runtime/$nr_switches)
             if [[ ${sleepavg:0:1} == "." ]] 
                then sleepavg=0$sleepavg
             fi
        else sleepavg=-1
    fi
    
    if [[ $pid == "" ]]
        then continue
    fi
    
    
    if [[ $ppid == "" ]]
        then ppid=0
    fi
    
result=$result"$ppid ProcessID=$pid : Parent_ProcessID=$ppid : Average_Sleeping_Time=$sleepavg\n"
done
 
echo -ne $result | sort -nk1 | cut -d\  -f2-  > 5.tmp 
