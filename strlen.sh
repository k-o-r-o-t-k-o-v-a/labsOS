#!/bin/bash
if ! [[ $# -eq 1 ]]; then
echo "wrong number of parameters"
exit 4
else
echo ${#1}
fi