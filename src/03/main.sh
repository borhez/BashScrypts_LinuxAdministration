#!/usr/bin/bash

source ./logArg
source ./maskArg
source ./dateArg

if [ $# -ne 1 ]
    then echo -e 'Launch w 1 argument!\nClear by logfile: arg=1;\nClear by date: arg=2;\nClear by mask: arg=3';
    exit 1
fi

if [ $1 == 1 ]
    then clearByLog

    elif [ $1 == 2 ]
        then clearByDate


    elif [ $1 == 3 ]
        then clearByMask

    else echo "Error. Wrong Argument!"; exit 1
fi


echo "Cleared!"
