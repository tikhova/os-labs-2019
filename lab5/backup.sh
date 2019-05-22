#!/usr/bin/bash

sourceDir="$HOME/src"
reportPath="$HOME/backup-report"
regex="[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}"
currentDate=$(date +%F)
lastBackupDate=$(ls -1 $HOME | sort | grep -x "Backup-$regex" | tail -n 1 | grep -o $regex)
if [[ $lastBackupDate != "" ]]
then 
    let diffInDays=$(($(date -d $currentDate +%s) - $(date -d $lastBackupDate +%s)))/86400
    if [[ $diffInDays -ge 7 ]]
    then
        MODE="create"
    else
        MODE="refresh"
    fi
else
    MODE="create"
fi

if [[ $MODE == "create" ]]
then
    currentDir=$HOME/"Backup-"$currentDate
    mkdir $currentDir
    echo "$currentDate: $currentDir was created" >> $reportPath
    for file in $(ls $sourceDir -1)
    do
        cp $sourceDir/$file $currentDir/$file
        echo "$file copied" >> $reportPath
    done
else
    currentDir=$HOME/"Backup-"$lastBackupDate
    for file in $(ls -1 $sourceDir)
    do
        sourceName=$sourceDir/$file
        destName=$currentDir/$file
        if [[ -e $destName ]]
        then
            # Check size
            sourceSize=$(stat $sourceName -c%s)
            destSize=$(stat $destName -c%s)
            if [[ $sourceSize -ne $destSize ]]
            then
                mv $destName "$destName.$currentDate"
                cp $sourceName $destName
                echo "2:$file -> $file.$currentDate" >> $HOME/.report
            fi
        else
            cp $sourceName $destName
            echo "1:$file copied" >> $HOME/.report
        fi
    done
    
    if [[ -e $HOME/.report ]]
    then
        echo "Refreshed $currentDate: $currentDir" >> $reportPath
        cat $HOME/.report | sort -t : -k 1 | awk -F : '{ print $2 }' >> $reportPath
        rm -f $HOME/.report
    fi    
    
fi
