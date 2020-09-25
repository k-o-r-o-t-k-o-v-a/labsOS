#!/bin/bash
if ! [[ $# -eq 3 ]]; then
echo "error: wrong number of parameters"
exit 4;
fi;

if [[ $1 != "sum" && $1 != "sub" && $1 != "div" && $1 != "mul" ]]; then
echo "wrong operation"
exit -5;
fi;

re='^-?[0-9]+$'
if ! [[ "$2" =~ $re && "$3" =~ $re ]]; then
echo "error: you have entered not integers"
exit -1;
fi;

case $1 in
sum) echo "$2 + $3 =" $(expr $2 + $3);;
sub) echo "$2 - $3 =" $(expr $2 - $3);;
mul) echo "$2 * $3 =" $(expr $2 * $3);;
div) if [ $3 -eq 0 ]; then
echo "error: delimeter by zero";
exit 5;
fi;
echo "$2 / $3 =" $(expr $2 / $3);;

esac