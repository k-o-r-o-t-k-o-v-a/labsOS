#!/bin/bash
if [[ $# -eq 0 ]]; then
echo "wrong number of parameters"
exit 4
fi

echo "${#1}"
exit 0
