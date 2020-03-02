#!/bin/bash -x
PLAYER1=""
PLAYER2=""

declare -A matrix
number=1
toss=0;
end=1;
choice=""
tie=0
# Tic Tac To Board Position
for ((index=0; index<3; index++))
do
	for ((index1=0; index1<3; index1++))
	do
		matrix[$index,$index1]=$(( number++ ))
	done
	printf "\n"
done

read -p "Enter a First player name : " PLAYER1
read -p "Enter a Second player name : " PLAYER2

printf "\n$PLAYER1 play with 0 \n$PLAYER2 play with X \n"

toss=$(( RANDOM%3+1))
if [ $toss -eq 1 ]
then
	printf "\nplay first  $PLAYER1 \n"
else 
	printf "\nplay first $PLAYER2 \n" 
fi
#  Add position
function addPosition()
{
	if [ $(($toss%2)) -eq 0 ]
   then
		matrix[$1,$2]=0
   else
      matrix[$1,$2]=X
   fi
	winOrTie
}

