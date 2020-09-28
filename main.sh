#!/bin/bash

checkfile(){
if ! [[ -r $1 ]]; then
echo "error: no permission"
exit 2;
fi
}
no(){
echo "no access"
exit 1
}

case $1 in
calc)
checkfile "calc.sh"
if ! [[ -e ./calc.sh ]]; then
no
fi

if ! [ -f "calc.sh" ]; then exit -3
fi
 ./calc.sh $2 $3 $4;;

search)
checkfile "search.sh"

if ! [ -f "search.sh" ]; then exit -3
fi
./search.sh $2 $3;;

reverse)

check=$(reverse_check_args $2 $3)
		if [[ $check -eq 0 ]]
		then
			reverse $2 $3
		else
			print_error $check
			exit $check
		fi ;;

strlen)
checkfile "strlen.sh"

if ! [ -f "strlen.sh" ]; then exit -3
fi
./strlen.sh "$2";;

log)
checkfile "log.sh"

if ! [ -f "log.sh" ]; then exit -3
fi
./log.sh;;

exit)
checkfile "exit.sh"

if ! [ -f "exit.sh" ]; then exit -3
fi
./exit.sh $2;;

help)
checkfile "help.sh"

if ! [ -f "help.sh" ]; then exit -3
fi
./help.sh;;

interactive)
checkfile "interactive.sh"

if ! [ -f "interactive.sh" ]; then exit -3
fi
./interactive.sh;;

* )
echo "WRONG command"
esac









