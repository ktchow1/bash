#!/bin/bash
echo "Test0 - on variables"


# Specify interpreter in the first line.
# No space in bash script.
# Variables have global scope, unless specified as "local".
# Variables have no-type, basically all are string, treated as arithmetic on operators.
# Variables are set by  VARNAME=VALUE, or by let VARNAME=1+2+3 for arithmetic.
# Variables are get by $VARNAME, or by "$VARNAME" if there are spaces in VARNAME's value.

# Remember to add "$0" below to handle space-problem.
# $#           is number of argument
# $0           is script name
# $1           is 1st argument
# $2           is 2nd argument             
# $@           is list of arguments from $1 $2 $3 ...
# $$           is current pid
# $?           is return value of previous command
# $USER 
# $HOSTNAME    
# $RANDOM      is random number 
# $LINENO      is current line number
# $SECONDS     is number of seconds since the script is started
# $(command)   is command substitution, which capture command output into a variable


echo "num of arg is $#"
echo "arg0 is $0"
echo "arg1 is $1"
echo "arg2 is $2"
echo "arg3 is $3"
echo "arg4 is $4"


# Double quote "#@" to ensure space-containing-arg to be operated as single argument.
# Otherwise >> ./script.sh arg1 "arg2a arg2b arg2c" arg3 is considered as 5 arguments.
for ARG in "$@"
do
    echo "$ARG"
done


FILENAME="$(basename $0)"
FOLDER="folder for $FILENAME"
rm -rf "$FOLDER"
mkdir  "$FOLDER"
echo "created folder status $?"
cd "#FOLDER"

for N in {1..5}
do
    FILENAME="file$N"
    touch FILENAME
    echo "created $FILENAME at second $SECONDS with serial $RANDOM"
done




# If "Unexpected end of file" error happens when running the script, 
# it is probably due to an invalid but hidden character at the end,
# we can remove it in nvim by command ":set fileformat=unix".
