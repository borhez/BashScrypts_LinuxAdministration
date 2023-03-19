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

check_args
touch $logfile
foundDirs=$(sudo find ~/DO4_LinuxMonitoring_v2.0-0/src/testfolder -type d -perm -u=w 2>/dev/null -not \( -path "*/bin" -o -path "*/bin/*" -o -path "*/sbin" -o -path "*/sbin/*" \))
check_1Gb_freespace

for element in $foundDirs
do
    echo $element
    let "nFoldersToCreate=1+$RANDOM % 100"
    #echo -e "\nWill be created $nFoldersToCreate directories"
    for ((countDirs=1; countDirs <= $nFoldersToCreate; countDirs++))
    do
	makeNewFolder
        #echo "$countDirs directory is created"
	let "createdFolders=$createdFolders+1"

	let "nFilesToCreate=1+$createdFolders % $nFoldersToCreate"
	#echo "will be created $nFilesToCreate files"
	for ((countFiles=1; countFiles <= $nFilesToCreate; countFiles++))
	do
	    makeNewFile
	   # echo "File $countFiles is created"
	done
    done
    #create_folder (full_dName=$item/dirName_date); countFolders +=1
    #random: nFilesToCreate= 1+ (countFolders % nFoldersToCreate)
    #for ( i=0 ; i<nFilesToCreate; i++ )
    	#full_fName=full_dName/generatedName_date
    	#fallocate -l ${file_size}M ${full_fName} 2>/dev/null
done
workTime
