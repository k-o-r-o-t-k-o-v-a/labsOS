#!/bin/bash
if ! [[ $# -eq 0 ]]; then
echo "wrong number of parameters"
exit 4
if ! [[ $1 -eq $2 ]]; then
echo "test"
fi
str="$@"
echo "${#str}"
exit 0
fi