#!/bin/bash

source main.sh

Menu(){

echo "
Enter the letter corresponding to the command:
ch - check;
c - calc;
s - search;
r - reverse;
str - strlen;
l - log;
h - help;
e - exit;
q - quit menu "

read letter

case $letter in
c)
echo "Enter the desired operation (sum/sub/div/nul)"
read op

echo "Enter the first number";
read num1;
echo "Enter the second number";
read num2;

./calc.sh "$op" "$num1" "$num2"
;;

s)

echo "Enter the regular expression";
read reg
echo "Enter the directory";
read dir;
./search.sh "$reg" "$dir"
;;

r)
echo "Enter the output file"; read output
echo "Enter the input file"; read input

./reverse.sh "$out" "$in"
;;

str)
echo "Enter a line"; read line

./strlen.sh "$line"
;;

l)

./log.sh
;;

h)

./help.sh
;;

e)
echo "Enter the code number or left the line empty"; read code
./exit.sh "$code"
;;

q)
exit 0
;;

*)
echo "wrong command. try again? (y/n)"
read ans
if ! [[ $ans = "y" ]]; then
exit 0
fi
esac

}
while true
do
Menu
done