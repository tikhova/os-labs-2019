#!/usr/bin/bash
touch emails.lst
email="[[:alnum:]]+@[[:alpha:]]+\.[[:alpha:]]+"
grep -E -r -s -h -o -a $email /etc/ | awk '{ printf("%s", NR == 1 ? $0 : ", " $0) }'> emails.lst
