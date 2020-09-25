#!/bin/bash

case $1 in

calc)
if ! [ -f "calc.sh" ]; then exit -3
fi
 ./calc.sh $2 $3 $4;;

search)
if ! [ -f "search.sh" ]; then exit -3
fi
./search.sh $2 $3;;

reverse)
if ! [ -f "reverse.sh" ]; then exit -3
fi
./reverse.sh $2 $3;;

strlen)
if ! [ -f "strlen.sh" ]; then exit -3
fi
./strlen.sh "$2";;

log)
if ! [ -f "log.sh" ]; then exit -3
fi
./log.sh;;

exit)
if ! [ -f "exit.sh" ]; then exit -3
fi
./exit.sh $2;;

help)
if ! [ -f "help.sh" ]; then exit -3
fi
./help.sh;;

interactive)
if ! [ -f "interactive.sh" ]; then exit -3
fi
./interactive.sh
esac









