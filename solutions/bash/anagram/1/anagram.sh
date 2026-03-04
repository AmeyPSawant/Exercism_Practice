#!/usr/bin/env bash

sorted() {
    inp="$1" 
    echo "${inp,,}" | grep -o . | sort |  tr -d '\n'
}

input1="$1"
input2="$2"
sorted_input1=$(sorted "$input1")
# echo "$sorted_input1"

answer=""
for i in $input2
do
    sorted_i=$(sorted "$i")
    if [[ "$sorted_i" == "$sorted_input1" && "${input1,,}" != "${i,,}" ]];  
    then
        answer+="$i "
    fi
done


echo "$answer" | awk '{$1=$1; print}'