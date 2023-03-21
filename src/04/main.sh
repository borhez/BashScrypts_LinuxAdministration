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
for (( i=1; i<=5; i++))
do
	touch log$i.txt
	nbrItem=$(($RANDOM % 901 +100))
	echo -n "Random=$nbrItem; Creating notes in log"$i".txt; "
       	Interval=$(((60 * 60 * 24) / $nbrItem))
	ssLog=0; mmLog=0; hhLog=0
	while [ $nbrItem -gt 0 ]
	do
		ssLog=$(($ssLog + ($Interval % 60)))
		mmLog=$(($mmLog + ($Interval / 60)))
		if [[ $ssLog -ge 60 ]] ; then
	                mmLog=$(($mmLog + 1))
        	        ssLog=$(($ssLog - 60))
        	fi
        	if [[ $mmLog -ge 60 ]] ; then
                	hhLog=$(($hhLog + 1))
                	mmLog=$(($mmLog - 60))
        	fi

		echo  "$(createStringForLog)"  >> log"$i".txt
		nbrItem=$(($nbrItem - 1))
	done
	echo "Created $(awk 'END {print NR}' log"$i".txt) notes!"		
done


