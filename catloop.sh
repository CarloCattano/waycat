#!/bin/bash

CPU_USAGE_PERCENT=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
SPEED=0.5


# ANIM 1
# DRAW ANIMATION FRAMES ENCODED IN LETTERS B TO E

anim(){
	for i in {B..E};do
		echo $i
		sleep $SPEED 
	done
}

run(){

	SPEED=$(echo "scale=2; 1 / (2 + ($CPU_USAGE_PERCENT / 70))" | bc)
	anim
	run
}

run
