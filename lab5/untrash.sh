#!/usr/bin/bash

logPath=$HOME/.trash.log

# Check usage
if [[ $# -ne 1 ]]
then
    echo "Please specify filename"
    exit 1
fi

# Find hard link to the file
for i in $(grep $1 $logPath)
do
    fullPath=$(echo $i | awk -F : '{ print $1 }')
    hardLink=$(echo $i | awk -F : '{ print $2 }')
    echo "Do you want to restore file '$fullPath'? [Y\N] ($hardLink)"
    read answer
    if [[ $answer == "Y" ]]
    then 
        directory=$(dirname $fullPath)
        if [[ -d $directory ]]
        then
            ln $hardLink $fullPath
        else
            echo "$directory no longer exists; file was created in home directory"
            ln $hardLink $HOME/$1
        fi
        rm $hardLink
        sed -i '/$hardLink/d' $logPath
        echo "Done"
    fi
done
