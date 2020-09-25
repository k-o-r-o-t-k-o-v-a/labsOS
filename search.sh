#!/bin/bash
if ! [[ $# -eq 2 ]]; then
echo "error: wrong number of parameters"
exit 4;
fi;
if ! [[ -d "$1" ]]; then
echo "there is no such derictory"
exit 3;
fi;
grep -r $2 $1 2>/dev/null
exit 0