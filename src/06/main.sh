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
sudo goaccess $FilesForGoaccess --log-format=COMBINED -o /var/www/html/report.html
#HTTP-запросы, содержащие тот же IP, ту же дату и тот же пользовательский агент, считаются уникальным посетителем.
