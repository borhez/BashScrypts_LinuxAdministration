#!/bin/bash

nFiles=5

trap "echo -e 'Not all Logs in ../04/.\nExit Error'; exit 1" TERM
ftCheckExistingFiles()
{
        local ret=""
        for (( i=1; i<=$nFiles; i++ ))
        do
                if [[ ! -f "../04/log$i.txt" ]]
                then kill -s TERM $$
                fi
                ret=$ret" ../04/log$i.txt"
        done
        echo $ret
}

FilesForGoaccess=$(ftCheckExistingFiles)
echo $FilesForGoAccess
#команда для вывода отчета в терминале:
goaccess $FilesForGoaccess --log-format=COMBINED

#команда для вывода отчета в html файл
sudo goaccess $FilesForGoaccess --log-format=COMBINED -o /var/www/html/goaccess_report.html
