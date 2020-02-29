#!/bin/bash 

declare -A matrix
number=1
for ((index=0; index<3; index++))
do
	for ((index1=0; index1<3; index1++))
	do
		matrix[$index,$index1]=$(( number++ ))
		printf "[""${matrix[$index,$index1]}""]"	   
	done
	printf "\n"
done
