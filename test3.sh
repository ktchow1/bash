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





# pushd
# popd
# dirname
# basename





