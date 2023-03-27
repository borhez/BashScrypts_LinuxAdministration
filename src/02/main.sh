#!/usr/bin/bash

source ./utils
source ./makeFilesFolders

timeStart=$(date +%T)
secStart=$(date +%s)

n_inParams=$#
must_n=3
d_letters=$1
f_letters=$2
file_size=$3
add_date=$(date +%d%m%y)
dateLog=$(date)
logfile="./log.txt"
nFoldersToCreate=1

check_args
echo -e "Arguments are valid\nPreparing to clogging up\n"
touch $logfile
foundDirs=$(sudo find / -type d -perm -u=w -not \( -path "*/bin" -o -path     "*/bin/*" -o -path "*/sbin" -o -path "*/sbin/*" \))
check_1Gb_freespace
for element in $foundDirs
do
    echo "Clogging up $element"
    for ((countDirs=1; countDirs <= $nFoldersToCreate; countDirs++))
    do
	makeNewFolder
	let "createdFolders=$createdFolders+1"
	let "nFilesToCreate=1+$RANDOM % $createdFolders"
	for ((countFiles=1; countFiles <= $nFilesToCreate; countFiles++))
	do
	    check_1Gb_freespace
	    makeNewFile
	done
    done
done
printWorkTime
