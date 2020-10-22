#!/bin/bash
if ! [[ $# -eq 2 ]]; then
echo "wrong number of parametrs"
exit 4
fi

if ! [[ -d "$1" ]] || ! [[ -e $1 ]]; then
echo "there is no such derictory"
exit 3
fi

if [[ -z $2 ]];
then
echo "wrong parameter"
exit 7
fi

if ! [[ -r $1 ]]
then
echo "can not read from this directory"
exit 6
fi

grep -r $2 $1 2>/dev/null
exit 0


