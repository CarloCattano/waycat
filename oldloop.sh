#!/bin/bash

run(){

COUNT=0
while true; do

	CPU_USAGE_PERCENT=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
	SPEED=$(echo "scale=2; 1 / (4 + ($CPU_USAGE_PERCENT / 100))" | bc)


	### MAKE THE CAT SLEEP IF CPU USAGE IS LOW ###
	if (( $(echo "$CPU_USAGE_PERCENT < 7" | bc -l) )); then
		COUNT=$((COUNT + 1))
        if (( $(bc <<< "$CPU_USAGE_PERCENT <= 1") )); then
            CPU_USAGE_PERCENT=1
        fi

	else
		COUNT=0
	fi

	if [ $COUNT -ge 8 ]; then
		for i in {G..J};do
			echo $i
			sleep $SPEED 
		done

	### CAT IS AWAKE ###
	else
		for i in {B..F};do
			echo $i
			sleep $SPEED 
		done

	fi

done
}

run

# vim: set ts=2 sw=2
