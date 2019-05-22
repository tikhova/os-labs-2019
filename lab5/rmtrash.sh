#!/usr/bin/bash

trashPath=$HOME/.trash
logPath=$HOME/.trash.log

# Check usage
if [[ $# -ne 1 ]]
then
    echo "Please specify filename"
    exit 1
fi

# Check that file exists
if [[ ! -e $1 ]]
then    
    echo "File does not exist"
    exit 1
fi

# If .trash does not exist - create it
if [[ ! -d $trashPath ]]
then
    mkdir $trashPath
fi

# Create hard link
filename=$trashPath/$(date +%s)
ln $1 $filename
rm $1

# Check if log file exists, if not - create it 
if [[ ! -e $logPath ]]
then 
    touch $logPath
fi
echo "$PWD/$1:$filename" >> $logPath
