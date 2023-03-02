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
echo "in main()"
echo $letters_f_ext
echo $letters_f_name
echo $file_size
echo $n_dirs

echo $(expr $n_dirs + 5)
echo end!
