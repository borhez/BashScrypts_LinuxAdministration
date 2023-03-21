#!/usr/bin/bash
source ./createStringForLog 2>/dev/null

#Функция проверяет наличие требуемых файлов. При их отсутствии,
#используя сигнал TERM, в главный процесс передаётся "exit 1"
#Можно вызвать kill -s TERM $TOP_PID,без объявления обработчика trap "exit 1" TERM
trap "exit 1" TERM
TOP_PID=$$
ftCheckExistingFiles()
{
	if [[ ! -f "./userAgents" || ! -f "./createStringForLog" ]] ;then
		echo -e "There is not all files! (createsStringForLog, userAgents)\nExit"
		kill -s TERM $TOP_PID
	fi
}

ftCheckExistingFiles
rm -f log*.txt
for (( i=1; i<=2; i++))
do
	#Если в текущей папке уже есть файл log$i.txt, то сначала его удалю:
	#rm -f log.txt
	touch log$i.txt
	nbrItem=$(($RANDOM % 901 +100))
	echo -n "Random=$nbrItem; Creating notes in log"$i".txt; "
	HOURS=0; MINUTES=0; SEC=0;
	while [ $nbrItem -gt 0 ]
	do
		echo  "$(createStringForLog)"  >> log"$i".txt
		nbrItem=$(($nbrItem - 1))
	done
	echo "Created $(awk 'END {print NR}' log"$i".txt) notes!"
		
done


