#!/bin/bash

# Create Variables
nums=$(seq 0 9)
states=('California' 'Hawaii' 'New York' 'Washington' 'Colorado')
ls_out=$(ls)
execs=$(find /home -type f -perm 777 2> /dev/null)

# Create For Loops
# Create a Loop that prints 3, 5, or 7
for num in ${nums[@]}
do
  if [ $num = 3 ] || [ $num = 5 ] || [ $num = 7 ]
  then
    echo $num
  fi
done

