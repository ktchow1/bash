#!/bin/bash
echo "Test3 - Function and Filesystem"


fct0()
{
    local x='1qaz@WSX'
    output=$1_$x    # This is input argument. 
    echo $output    # This is return value.
}

var=$(fct0 password)
echo "The return value is $var"
echo


fct1()
{
    echo "dataline_1"
    echo "dataline_2"
    echo "dataline_3"
}

for x in $(fct1); do
    echo "This is $x."
done


# Demonstration of :
# pushd
# popd
# dirname
# basename

fn=$(pwd)
echo "pwd      = $fn"
echo "dirname  = $( dirname $fn )"
echo "basename = $( basename $fn )"

# For every "pushd", it will auto invoke "dirs"
# we can disable the print by redirecting std::out[1] and std::err[2] to /dev/null
pushd ~/dev/algo/src &> /dev/null
pushd ~/dev/bash     &> /dev/null 
pushd ~/dev/YExperimental/YLibrary/include &> /dev/null
pushd ~/dev/YExperimental/YLibrary/src     &> /dev/null

for x in $(dirs); do
    echo "directory inside stack is $x."
done


popd &> /dev/null
echo "pop once ... pwd = $(pwd)"
popd &> /dev/null
echo "pop once ... pwd = $(pwd)"
popd &> /dev/null
echo "pop once ... pwd = $(pwd)"





