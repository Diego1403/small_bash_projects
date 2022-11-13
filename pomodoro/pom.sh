#!/bin/bash

s_break=${1:-5}
l_break=${2:-10}
work=${3:-25}
rounds=${4:-3}
min_display=0

pass_min(){
    min_display=$(( min_display-1 ))
    sleep 0.2s
    clear >$(tty)
}

start_pomodoro(){
i=$rounds 

while [ "$i" -gt 0 ]
do
    min_display=$work

    while [ "$min_display" -gt 0 ]
    do
        echo "Work remaining: ${min_display}"
        pass_min
    done

    min_display=$s_break

    while [ "$min_display" -gt 0 ]
    do 
        echo "short break remaning: ${min_display}"
        pass_min
    done
    i=$(( i-1 ))
done
    min_display=$l_break
    while [ "$min_display" -gt 0 ]
    do 
        echo "long break remaning: ${min_display}"
        pass_min
    done

    read -p "Would you like to do another round?" yn

case $yn in 
	[yY] ) echo "Lets go !" ;start_pomodoro;;
	[nN] ) echo Hasta luego;;
	* ) error;;
esac


}


start_pomodoro



