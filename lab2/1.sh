#!/usr/bin/bash
grep -E -s -h -r "^ACPI"  /var/log/ > errors.log
grep -E -s -h -r "^([[:alnum:]]+\/*)+\.[[:alpha:]]+" errors.log

