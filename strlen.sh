#!/bin/bash
if ! [[ $# -eq 0 ]]; then
echo "wrong number of parameters"
exit 4

echo "${#1}"
exit 0
fi