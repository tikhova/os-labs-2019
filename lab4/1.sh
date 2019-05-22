#!/usr/bin/bash

time=$(date +"%F_%T")
rm -R ~/test
mkdir ~/test && {
                echo "catalog test was created successfully" >> ~/report
                touch ~/test/$time
                }
ping www.net_nikogo.run || echo "ERROR: host is unavailable" >> ~/report
