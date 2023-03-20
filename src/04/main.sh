#!/bin/bash
source ./createStringForLog

for (( i=1; i<=2; i++))
do
	#Если в текущей папке уже есть файл log$i.txt, то сначала его удалю:
	rm -f log$i.txt
	touch log$i.txt
	nbrItem=$(($RANDOM % 901 +100))
	echo -n "Random=$nbrItem; "
	while [ $nbrItem -gt 0 ]
	do
		echo  "$(createStringForLog)"  >> log"$i".txt
		nbrItem=$(($nbrItem - 1))
	done
	echo "Создано $(awk 'END {print NR}' log"$i".txt) записей в log"$i".txt"
		
done


