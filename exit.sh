#!/bin/bash
re='^-?[0-9]+$'
if [[ -n "$1" ]]; then
if ! [[ "$1" =~ $re ]]; then
echo ""error: not a number"
exit -1;
else

if [[ $1 -lt -255 || $1 -gt 255 ]]; then
echo "error: code must be from -255 to 255"
exit 1;
else
exit "$1";
fi;
fi;
else
exit 0;
fi;