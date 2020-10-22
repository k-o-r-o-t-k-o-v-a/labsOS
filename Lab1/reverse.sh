#!/bin/bash

checkfile(){
if ! [[ -r $1 ]]; then
echo
if ! [[ $# -eq 2 ]]; then
echo "error: wrong number of parametrs"
exit 4;
fi;
if ! [ -f "$1" ]; then
echo "error: such file does not exists"
exit 3;
fi;
if ! [ -r $1 ];
then
echo "error: can not read this file"
exit 8;
fi;

tac $1 | rev >$2




