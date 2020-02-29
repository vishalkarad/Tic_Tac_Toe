#!/bin/bash 
PLAYER1=""
PLAYER2=""

declare -A matrix
number=1
Toss=0;
for ((index=0; index<3; index++))
do
	for ((index1=0; index1<3; index1++))
	do
		matrix[$index,$index1]=$(( number++ ))
		printf "[""${matrix[$index,$index1]}""]"	   
	done
	printf "\n"
done
read -p "Enter a First player name : " PLAYER1
read -p "Enter a Second player name : " PLAYER2
printf "$PLAYER1 play with X \n$PLAYER2 play with 0 \n"

toss=$(( RANDOM%3 + 1))
if [ $toss -eq 1 ]
then
	printf "play first  $PLAYER1 \n"
else 
	printf "play first $PLAYER2 \n" 
fi
