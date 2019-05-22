#!/usr/bin/bash

destinationDir="$HOME/restore"
regex="[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}"
backupDir=$HOME/$(ls -1 $HOME |  grep -x "Backup-$regex" | tail -n 1)
reportPath="$HOME/backup-report"

if [[ ! -d $backupDir ]]
then
    echo "No backup directories found"
    exit 1
fi

if [[ ! -d $destinationDir ]]
then
    mkdir $destinationDir
fi

for file in $(ls -1 $backupDir)
do
    suffix=$(echo $file | grep -o ".[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}" | tail -n 1)
    cp $backupDir/$(basename $file $suffix) $destinationDir/$(basename $file $suffix)
done
