#!/usr/bin/bash

source ./check_functions

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
echo $letters_f_name
echo $l_letters_f_name
	#Извлечь символ из строки:
	#${string:position:length}
	#Where this extracts $length substring from $string at $position
fname2=${letters_f_name:2:$((l_letters_f_name - 4))}
ext1=${letters_f_ext:1:$((l_letters_f_ext - 1))}

echo $fname2
echo $ext1
echo end!
