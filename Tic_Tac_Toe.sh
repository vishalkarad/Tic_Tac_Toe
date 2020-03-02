#!/bin/bash 
PLAYER1=""
PLAYER2=""

declare -A matrix
number=1
toss=0;
end=1;
choice=""
tie=0
# insert positions on  Board
for ((index=0; index<3; index++))
do
	for ((index1=0; index1<3; index1++))
	do
		matrix[$index,$index1]=$(( number++ ))
	done
	printf "\n"
done

read -p "you play with single player press 1), Two player press 2)" playerChoice

if [ $playerChoice -eq 1 ]
then
	read -p "Enter a player name : " PLAYER1
	PLAYER2="Computer"
else
	read -p "Enter a First player name : " PLAYER1
	read -p "Enter a Second player name : " PLAYER2
fi
printf "\n$PLAYER1 play with X \n$PLAYER2 play with 0 \n"

toss=$(( RANDOM%2+1))
if [ $toss -eq 1 ]
then
	printf "\nplay first  $PLAYER1 \n"
else 
	printf "\nplay first $PLAYER2 \n" 
fi
#  Add position
function addPosition()
{
	if [[ ${matrix[$1,$2]} == 0 || ${matrix[$1,$2]} == X ]]
	then
		printf "This position allready enterd \n"
	else
		if [ $(($toss%2)) -eq 0 ]
   	then
			matrix[$1,$2]=0
   	else
      	matrix[$1,$2]=X
   	fi
		winOrTie
		(( toss++ ))
	fi
}
# win or tie
function winOrTie(){

	# Row
   if [[ ${matrix[0,0]} == ${matrix[0,1]} && ${matrix[0,1]} == ${matrix[0,2]} || ${matrix[1,0]} == ${matrix[1,1]} && ${matrix[1,1]} == ${matrix[1,2]} || ${matrix[2,0]} == ${matrix[2,1]} && ${matrix[2,1]} == ${matrix[2,2]} ]]
	then
		whoIsWin
	# crox
	elif [[ ${matrix[0,0]} == ${matrix[1,1]} && ${matrix[1,1]} == ${matrix[2,2]} || ${matrix[0,2]} == ${matrix[1,1]} && ${matrix[1,1]} == ${matrix[2,0]} ]]
   then 
		whoIsWin
	#colom
	elif [[ ${matrix[0,0]} == ${matrix[1,0]} && ${matrix[1,0]} == ${matrix[2,0]} || ${matrix[0,1]} == ${matrix[1,1]} && ${matrix[1,1]} == ${matrix[2,1]} || ${matrix[0,2]} == ${matrix[1,2]} && ${matrix[1,2]} == ${matrix[2,2]} ]]
	then
		whoIsWin
   fi
	# Tie match
	(( tie++ ))
   if [ $tie -eq 9 ]
   then
		board
      printf "Match is Tie..\n"
      end=0
   fi
}
# who is win
function whoIsWin()
{
	board
   if [ $(($toss%2)) -eq 0 ]
   then
      printf "$PLAYER2 you are win..\n"
	   end=0 
		exit
	else
      printf "$PLAYER1 you are win..\n"
	   end=0
		exit
   fi
}
# print Tic Tac To Board
function  board(){
	for ((index=0; index<3; index++))
   do
      for ((index1=0; index1<3; index1++))
      do
         printf "[""${matrix[$index,$index1]}""]"    
      done
   printf "\n"
   done

}
# Computer Logic
function computer(){
	if [[ ${matrix[1,0]} == ${matrix[2,0]} || ${matrix[0,1]} == ${matrix[0,2]} || ${matrix[1,1]} == ${matrix[2,2]} ]]
	then
		addPosition 0 0
	elif [[ ${matrix[0,0]} == ${matrix[0,2]} || ${matrix[1,1]} == ${matrix[2,1]} ]]
	then
		addPosition 0 1
	elif [[ ${matrix[0,0]} == ${matrix[0,1]} || ${matrix[1,2]} == ${matrix[2,2]} || ${matrix[1,1]} == ${matrix[2,0]} ]]
   then
      addPosition 0 2
	elif [[ ${matrix[0,0]} == ${matrix[2,0]} || ${matrix[1,1]} == ${matrix[1,2]} ]]
   then
      addPosition 1 0
	elif [[ ${matrix[1,0]} == ${matrix[1,2]} || ${matrix[0,1]} == ${matrix[2,1]} || ${matrix[0,0]} == ${matrix[2,2]} || ${matrix[0,2]} == ${matrix[2,0]} ]]
   then
      addPosition 1 1
	elif [[ ${matrix[1,0]} == ${matrix[1,1]} || ${matrix[0,2]} == ${matrix[2,2]} ]]
   then
      addPosition 1 2
	elif [[ ${matrix[0,0]} == ${matrix[1,0]} || ${matrix[2,1]} == ${matrix[2,2]} || ${matrix[0,2]} == ${matrix[1,1]} ]]
   then
      addPosition 2 0
	elif [[ ${matrix[2,0]} == ${matrix[2,2]} || ${matrix[1,1]} == ${matrix[0,1]} ]]
   then
      addPosition 2 1
	elif [[ ${matrix[2,0]} == ${matrix[2,1]} || ${matrix[0,2]} == ${matrix[1,2]} || ${matrix[0,0]} == ${matrix[1,1]} ]]
   then
      addPosition 2 2
	else 
		#randomposition1=0
		#randomposition2=0
		#while [[ ${matrix[$randomposition1,$randomposition2]} == 0 || ${matrix[$randomposition1,$randomposition2]} == x ]]
		#do
			randomposition1=$((RANDOM%3))
         randomposition2=$((RANDOM%3))
		#done
	   addPosition $randomposition1 $randomposition2
	fi
}
# Run loop up to win or tie
while [ $end -ne 0 ]
do
	board
	if [ $(($toss%2)) -eq 0 ]
	then
		if [ $playerChoice -eq 1 ]
		then
			computer
			printf "\n"
			board
		else
			read -p "$PLAYER2 Enter A Position" choice
		fi
	fi
	if [ $(($toss%2)) -eq 1 ]
	then
		read -p "$PLAYER1 Enter A Position" choice
	fi
	case $choice in
		1) 
				addPosition 0 0 ;;
		2) 
            addPosition 0 1 ;;
		3) 
            addPosition 0 2 ;;
		4)
            addPosition 1 0 ;;
		5)
            addPosition 1 1 ;;
		6)
            addPosition 1 2  ;;
		7)
            addPosition 2 0 ;;
		8)
            addPosition 2 1 ;;
		9)
            addPosition 2 2 ;;
		*)printf "Enter a valied choice \n"	;;
	esac
done
