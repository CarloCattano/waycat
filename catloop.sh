#!/usr/bin/env bash
set -euo pipefail

interval="${1:-1}"
CPU_USAGE=0.0

read_cpu() {
  # Read the "cpu " line and compute active and total as integers.
  awk '/^cpu /{
    user=$2; nice=$3; sys=$4; idle=$5;
    active = user + nice + sys;
    total = active + idle;
    printf "%d %d\n", active, total;
    exit
  }' /proc/stat
}

# prime the previous counters
read prev_active prev_total < <(read_cpu)

while true; do

  read active total < <(read_cpu)

  delta_active=$((active - prev_active))
  delta_total=$((total - prev_total))

  if [ "$delta_total" -le 0 ] || [ "$delta_active" -lt 0 ]; then
    utilization="0.0000"
  else
    utilization=$(awk -v a="$delta_active" -v t="$delta_total" 'BEGIN { printf "%.4f", (a / t) }')
  fi

  # print fraction; to print percent multiply by 100: awk ... { printf "%.2f%%", (a/t*100) }
  # printf "%s\n" "$utilization"
  CPU_USAGE=$utilization	


	# slow cpu usage means SPEED is higher, but cant be too low or the animation will be too fast, 
	# so clip the minimum speed to 0.05s
	SPEED=$(awk -v u="$CPU_USAGE" 'BEGIN { printf "%.2f", 1 / (4 + (u * 100)) }')
	# clip minimum speed
	if (( $(echo "$SPEED < 0.05" | bc -l) )); then
		SPEED=0.05
	fi
	### MAKE THE CAT SLEEP IF CPU USAGE IS LOW ###

	if [ $CPU_USAGE -ge 0.2 ]; then
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


  prev_active=$active
  prev_total=$total
done
