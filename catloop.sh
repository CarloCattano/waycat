#!/bin/bash

run(){

	while true; do

		CPU_USAGE_PERCENT=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
		
		SPEED=$(echo "scale=2; 1 / (4 + ($CPU_USAGE_PERCENT / 100))" | bc)
		
		for i in {B..F};do
			echo $i
			sleep $SPEED 
		done
	done
}

run
