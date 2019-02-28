#!/usr/bin/bash
find /var/log/ -name '*.log' -print0 2> >(grep -v 'find' >&2) | wc -l --files0-from=-
