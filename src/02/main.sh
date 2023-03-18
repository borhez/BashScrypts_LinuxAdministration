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


foundDirs=$(sudo find /home/sshield/projects/intra/cub3D -type d -perm -u=w 2>/dev/null -not \( -path "*/bin" -o -path "*/bin/*" -o -path "*/sbin" -o -path "*/sbin/*" \))
# countFolders=0
# countFiles=0
# for ((d=1; d <= $n_dirs; d++))
# do
# 	countFiles=0
# 	create_newfolder
# 	    let "countFolders=countFolders+1"
# 	    echo "[$countFolders]Folder is created"
# 	for ((f=1; f <= $n_files; f++))
# 	do
# 		check_1Gb_freespace
# 		create_newfile
# 		    let "countFiles=countFiles+1"
# 		    echo "[$countFolders][$countFiles] File is created"
# 	done
# done
check_1Gb_freespace
for item in $foundDirs
do
    echo "item=$item"
done
workTime
