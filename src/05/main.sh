#!/bin/bash

.	./awkFuncs

regExpr='^([1-4]|4)$'
if [[ $# -ne 1 || ! $1 =~ $regExpr ]]
	then echo "Скрипт запускается с одним аргументом:"
	echo -e "\t1: Все записи, отсортированные по коду ответа"
	echo -e "\t2: Все уникальные IP, встречающиеся в записях"
	echo -e "\t3: Все запросы с ошибками (код ответа - 4хх или 5хх)"
	echo -e "\t4: Все уникальные IP, которые встречаются среди ошибочных запросов"
	exit 1
fi

FilesForAwk=$(ftCheckExistingFiles)
case $1 in
	"1") ftSortByCode;;
	"2") ftUniqIP;;
	"3") ftErrorRequests;;
	"4") ftUniqIPinErrorRequests;;
	* ) echo "Error" ; exit 1;;
esac
