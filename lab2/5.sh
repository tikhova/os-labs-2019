#!/usr/bin/bash
awk -F : '{print $1 "\t" $3}' /etc/passwd | sort -nk2
