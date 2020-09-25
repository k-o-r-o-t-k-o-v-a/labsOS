#!/bin/bash
if ! [[ $# -eq 2 ]]; then
echo "error: wrong number of parameters"
exit 4;
fi;
if ! [ -f "$1" ]; then
echo "error: such file does not exists"
exit 3;
fi;
tac $1 >$2
touch $2