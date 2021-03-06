#!/bin/sh
git log --format='%aN' | sort -u | while read name; do echo -en "'$name',"; git log --author="$name" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "%d,%d,%d\n", add, subs, loc }' -; done
