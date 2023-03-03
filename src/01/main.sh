#!/usr/bin/bash

source ./check_functions
source ./creating

n_inParams=$#
must_n=6
abs_way=$1
n_dirs=$2
d_letters=$3
n_files=$4
f_letters=$5
file_size=$6
check_args
#in function "check_args" are creating variables:
    #"letters_f_ext" - list of letters for file_names
    #"letters_f_name" - list of letters for file-extensions
    #"l_letters_f_ext" -length of letters for extensions
    #"l_letters_f_name" - length for filename

	#Извлечь символ из строки:
	#${string:position:length}
	#Where this extracts $length substring from $string at $position

for ((i=1; i <= $n_dirs; i++))
do
	echo $i
	create_newfolder
	for ((n=1; n <= $n_files; n++))
	do
		check_1Gb_freespace
		create_newfile
	done
done
echo end!
