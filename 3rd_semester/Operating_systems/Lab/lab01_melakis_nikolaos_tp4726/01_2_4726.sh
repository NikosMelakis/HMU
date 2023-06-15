#!/bin/bash
echo "Give size of an array" 
read n
mesooro=0
for ((i=0;i<$n;i++))
do
   read m
   if (($m>0)) 
   then 
   mesooro=$(($mesooro+$m))
   fi
   done
mesooro=$(($mesooro/$n))
echo "O mesos oros einai: $mesooro"