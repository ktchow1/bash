#!/bin/bash
echo "test1 - on variables"


# This is based on https://ryanstutorials.net
#
# Specify interpreter in the first line
# No   space before  and after =
# Need space after [ and before ]
# Variables have global scope (within a file), unless specified as "local"
# Variables have no-type, basically all are string, treated as arithmetic on operators
# Variables are set by  VARNAME=VALUE, or by let VARNAME=1+2+3 for arithmetic
# Variables are get by $VARNAME, or by "$VARNAME" if there are spaces in VARNAME's value

# Remember to add "$0" below to handle space-problem
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
# ${#VAR_NAME} is length of value inside VAR_NAME


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


if [ $? -eq 0 ] # if [$? -eq 0] results in runtime error, there must be space
then
    echo "created folder status succeed"

    # Create files then ...
    cd "$FOLDER"
    for N in {1..5}
    do
        FILENAME="file$N"
        touch $FILENAME
        echo "created $FILENAME at second $SECONDS with serial $RANDOM"
    done
    cd ..
else
    echo "created folder status failed"
fi


# Scope of variable is global, unless declared local in fct (must be inside fct)
# local var can be accessed by one function in the same script
# global var can be accessed by all functions in the same script
# global var can be exported to be accessed by other scripts
# however, export is pass-by-value
echo
echo 'Lets test with variables with different scope'

fct () {
    local MY_LOCAL_VAR='This is local variable.'
    MY_GLOBAL_VAR='This is global variable.'
    MY_EXPORT_VAR='This is exported variable.'
    export MY_EXPORT_VAR

    echo "fct::MY_LOCAL_VAR  = $MY_LOCAL_VAR"
    echo "fct::MY_GLOBAL_VAR = $MY_GLOBAL_VAR"
    echo "fct::MY_EXPORT_VAR = $MY_EXPORT_VAR"
}

print() {
    echo "test0::MY_LOCAL_VAR  = $MY_LOCAL_VAR (length = ${#MY_LOCAL_VAR})"
    echo "test0::MY_GLOBAL_VAR = $MY_GLOBAL_VAR (length = ${#MY_GLOBAL_VAR})"
    echo "test0::MY_EXPORT_VAR = $MY_EXPORT_VAR (length = ${#MY_EXPORT_VAR})"
}

print
fct
MY_GLOBAL_VAR="$MY_GLOBAL_VAR"_append_something
MY_EXPORT_VAR="$MY_EXPORT_VAR"_append_something
print
./test0_impl.sh
print


# If "Unexpected end of file" error happens when running the script,
# it is probably due to an invalid but hidden character at the end,
# we can remove it in nvim by command ":set fileformat=unix".
