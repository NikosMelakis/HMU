#!/bin/bash
echo -n "Dwse orisma (file h dir): "
read filename
if [[ $filename == 'file' ]]
then
find *.txt -type f -printf '%s %f\n' | sort -r
elif [[ $filename == 'dir' ]] 
then
ls dir/ | wc -l
else
echo " Wrong input"
fi