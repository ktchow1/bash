#!/bin/bash
echo "Test2 - IF and LOOP"


# Condition inside [ COND ] with spaces at the front and at the back
# Condition for STRING, INTEGER and FILE includes :
#
#   if [ STRING_0 = STRING1 ]
#   if [ STRING_0 != STRING1 ]
#   if [ -n STRING ]                   length of string is non-zero
#   if [ -z STRING ]                   length of string equals to zero
#   if [ INTEGER0 -eq INTEGER1]        equals to 
#   if [ INTEGER0 -lt INTEGER1]        less than
#   if [ INTEGER0 -gt INTEGER1]        greater than
#   if [ -e FILE]                      file exists 
#   if [ -d FILE]                      file exists and its a directory
#   if [ -s FILE]                      file exists and its size is greater than zero
#   if [ -r FILE]                      file exists and its read-able
#   if [ -w FILE]                      file exists and its write-able
#   if [ -x FILE]                      file exists and its exe-able
#
# Remark 1 : unlike C, 0 means TRUE, 1 means FALSE
# Remark 2 : We can also run if-condition in terminal using "test" command and echo $? Such as ...
#
# >> test 0001  =  1; echo $?          compare 0001 and 1 as string, return FALSE 1 (its free to add space in terminal)
# >> test 0001 -eq 1; echo $?          compare 0001 and 1 as integer, return TRUE 0
# >> test 0001 -lt 1; echo $?          compare 0001 and 1 as integer, return FALSE 1


if [ $# -lt 2 ] 
then 
    echo please enter more arguments 
elif [ $# -eq 2 ]
then
    if [ $1 = ABC ] && [ $2 = 123 ]
    then
        echo starts checking ... succeed
    else
        echo starts checking ... failed
    fi
else
    echo please enter less arguments
fi

# Or ... to be more C-style : 
if [ $# -lt 2 ]; then 
    echo please enter more arguments 
elif [ $# -eq 2 ]; then
    echo starts checking
else
    echo please enter less arguments
fi
echo


# ****************
# *** for loop ***
# ****************
front=10
back=20
inc=2


for n in peter paul mary david; do 
    echo "for-loop0 : $n"
done
echo


for n in 3 5 7 9 11; do # Does not support variable 
    echo "for-loop1 : $n"
done
echo


for n in {3..11..2}; do # Does not support variable
    echo "for-loop2 : $n"
done
echo


for n in $(ls ~/dev); do 
    echo "for-loop3 : $n"
done
echo


sum=0
for n in $(seq $front $inc $back); do
    echo "for-loop4 : $n"
    sum=$(( $sum + $n ))
done
echo "sum = $sum"
echo


sum=0
for ((n=front; n<=back; n+=inc)); do
    echo "for-loop5 : $n"
    sum=$(( $sum + $n ))
done
echo "sum = $sum"
echo


# *******************************
# *** while loop / until loop ***
# *******************************
# we can add "break" or "continue", which work like C.

sum=0
n=$front
while [ $n -le $back ]; do
    echo "while-loop0 : $n"
    sum=$(( $sum + $n ))
    n=$(( $n + $inc ))
done
echo "sum = $sum"
echo


sum=0
n=$front
until [ $n -gt $back ]; do
    echo "while-loop1 : $n"
    sum=$(( $sum + $n ))
    n=$(( $n + $inc ))
done
echo "sum = $sum"
echo


sum=0
while read -p "Enter number (or ctrlD for EOF) : " n; do
    echo "while-loop2 : $n"
    sum=$(( $sum + $n ))
done 
echo
echo "sum = $sum"
echo


