#!/bin/bash

proc=$(ps -u user | tail -n +2 | awk '{print $1":"$4}')
lines=$(echo "$proc" | wc -l)

echo "count: $lines" > task1.txt
echo -e "\n$proc" » task1.txt
#!/bin/bash
#!/bin/bash
ps -Ao pid,command | tail -n +2 | grep -E "[0-9]+ /sbin/" > task2.txt

#!/bin/bash
ps o pid,start_time —sort=start_time | tail -n 2 | head -n 1 | awk '{print $1, $2}' >task3.txt

ps o pid,start_time —sort=start_time | tail -n 1 | awk '{print $1, $2}' >task3.txt

#!/bin/bash

for pid in $(ps -Ao pid | tail -n +2); do для каждого процесса кот получился в рез ps - все процессы 
tmp="/proc/"$pid  псевдо файловая система инфа о проц в папках с ном проц и ядре

if [[ -e $tmp"/status" ]] && [[ -e $tmp"/sched" ]] ; then если есть папки -e exists 

ppid=$(grep "PPid:*" $tmp"/status" | grep -oE "[0-9]+") получаем ppid род процесса из статуса строчка с начало ppid: проверка регуляркой
if [ -z $ppid ]; then если id пустое
ppid=0; 
fi

rtime=$(grep "se.sum_exec_runtime" $tmp"/sched" | grep -oE "[0-9]+(.)?[0-9]*") время когда работал проц , выбираем что подходит под регулярку, что ищем и где ищем
swtc=$(grep "nr_switches" $tmp"/sched" | grep -oE "[0-9]+(.)?[0-9]*") nr - колво переключений между процессами на данный процесс, 
if [ -z $rtime ] || [ -z $swtc ] || [ $swtc = "0" ] ; then нужно среднее время, рантайм делим на кол во переключений, если чето пустое
ART=0 ниче не полцучили
else
ART=$(echo "scale=5; $rtime/$swtc" | bc | awk '{printf "%f", $0}')  вывожу число арт с точность до 5 знаков bc утилита для дробных чисел, $0 число f - float
fi

echo "$pid $ppid $ART" 
fi

done | sort -nk2 | awk '{print "ProcessID="$1" : Parent_ProcessID="$2" : Average_Running_Time="$3}' >task4.txt //-nk2 - по второму столбцу ppid awk выводим через нужный формат 

#!/bin/bash

ppid_0="0" текущий проц
ARTSUM="0"
COUNT="0"
AVG="0"

if [[ ! -e task4.txt ]]; then //еслть ли файл ваще
echo -e "task4 not found"
exit 1
fi

echo -e "$(<task4.txt)\n" | //
while read str; do считываем построчно
pid=$(awk '{print $1}' «< $str | grep -oE "[0-9]+")
ppid=$(awk '{print $3}' «< $str | grep -oE "[0-9]+")
ART=$(awk '{print $5}' «< $str | grep -oE "[0-9]+(.)?[0-9]*") в каждой строке 
if [[ $ppid == $ppid_0 ]]; then
AVG=$(echo "scale=5; $ARTSUM+$ART" | bc | awk '{printf "%f", $0}') средннее время проц с одинаковым род проц
COUNT=$(($COUNT+1))
else переходим к новому род процессу
AVG=$(echo "scale=5; $ARTSUM/$COUNT" | bc | awk '{printf "%f", $0}') 
echo "Average_Children_Running_Time_of_ParentID="$ppid_0" is "$AVG
ARTSUM=$ART
COUNT=1
ppid_0=$ppid
fi
if [[ ! -z $pid ]]; then если пид сущ
echo "ProcessID="$pid" : Parent_ProcessID="$ppid" : Average_Running_Time="$ART
fi
done > task5.txt

#!/bin/bash проходимся по файлу статус у кажд проц  
mpid=-1
msize=-1
for pid in $(ls /proc/ | grep -E '[0-9]+'); do
tmp="/proc/"$pid"/status"
if [[ -e $tmp ]]; then если сущ берем размер памяти кот исп проц
cursize=$(grep "VmSize:" $tmp | awk '{print $2}')
if [[ "cursize" -gt "$msize" ]]; then если тек больше пред
mpid=$pid
msize=$cursize меняем все на тек
fi
fi
done
echo "$mpid: $msize" > task6.txt

#!/bin/bash
FindProc(){
for x in $(ps -eo pid,command| tail -n +2 | awk '{print $1 ":" $2}') получаю проц и ком
do желю по переменным
pid=$(echo $x | awk -F ":" '{print $1}')
command=$(echo $x| awk -F ":" '{print $2}') 
path="/proc/"$pid
if [[ -f $path/"io" ]] если файл сущ 
then
bytes=$(grep -h "read_bytes: " $path"/io" | grep -oE "[0-9]+") получаю кол во байт
echo "$pid $command $bytes" вывожу в формате 
fi
done | sort -nrk3 | head -n 3 сорт по 3 столбцу, самое большое кол памяти первые 3 проц
}
touch file1.txt
FindProc > file1.txt
sleep 1m
touch file2.txt
FindProc > file2.txt

cat file1.txt |
while read str
do
pid=$(awk '{print $1}' «< $str)
command=$(awk '{print $2}' «< $str)
read_bytes=$(awk '{print $3}' «< $str)


read_bytes1=$(cat file2.txt |awk -v id=$pid '{if ($1 == id) print $3}')// -v для соблюдения условия
difference=$(($read_bytes1-$read_bytes)) разница
echo $pid":"$command":"$difference вывожу разницу
done


#!/bin/bash
(for i in $(ls /proc | grep "[0-9]") для кажд про получаю кол во считанных байт
do
awk '$1 == "rchar:" {print "%d ", $2}' /proc/$i/io >> term1.info
cmd=$(ps -e -o pid,cmd | awk -v id=$i '$1 == id {print $2}') получаю команду которая 
echo $i $cmd >> term1.info
done
sleep 60
for i in $(ls /proc | grep "[0-9]")
do
awk '$1 == "rchar:" {print "%d ", $2}' /proc/$i/io >> term2.info
echo $i >> term2.info
done
while read str
do
pid=$(echo $str | awk '{print $2}')
mem=$(echo $str | awk '{print $1}')
awk -v id=$pid -v m=$mem '{if ($2 == id) {printf "PID %d : CMD %s : Memory %d ", $2, $3, m-$1; print "\n"}}' term1.info >> term3.info
done < term2.info
sort -n -k 8 | tail -n 3 | sort -n -k 8
rm *.info
) 2> /dev/null
если нужно посмотреть сколько байт считано за 60 секунд замените rchar: на read_bytes:



