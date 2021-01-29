#!/bin/bash
echo "Test1a - 2 approaches to get input, read & stdin"


# Approach 1 : Read as argument (please refer to previous example)
# Approach 2 : Read from std::cin
echo "Enter number 0 : " 
read var0                             # approach 1a
read -p "Enter number 1 : " var1      # approach 1b : using option -p for prompt:w
echo


echo "Test1b - 3 approaches to declare numbers"
# Variables in bash have no type.
# Variables are treated as string for most of the cases, 
#            or treated as number for arithmetic operation.


varA=($var0+$var1)/2                  # varA = std::to_string(var0) + "+"s + std::to_string(var1) + "/2"s
let varB=($var0+$var1)/2              # approach 1a : using let,  no space is allowed
let "varC = ($var0 + $var1) / 2"      # approach 1b : using let,  space is allowed with double quote
varD=$(expr $var0 + $var1)            # approach 2  : using expr, space is allowed without double quote, but 1 operator only
varE=$(expr $varD / 2)        
varF=$(( ($var0 + $var1) / 2 ))       # approach 3  : using $(()), space is allowed, multi-operator supported
                                      

# Approach 3 is C-style, we can put C-language inside (())
# hence space is possible inside (())
# while $ is for dereference as variable
# we will use this syntax in loop too ...

echo average equals of $var0 and $var1 is $varA
echo average equals of $var0 and $var1 is $varB
echo average equals of $var0 and $var1 is $varC
echo average equals of $var0 and $var1 is $varE
echo average equals of $var0 and $var1 is $varF



