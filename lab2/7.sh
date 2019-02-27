#!/usr/bin/bash
man bash | grep -E -o "\w{4,}" | sort | uniq -c -i| sort -n | tail -3 | awk '{print $2}'
