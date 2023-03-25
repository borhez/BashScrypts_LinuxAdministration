#!/bin/bash

source collectingMetrics

while true
do
	#echo "Memmory total - $(free|awk 'NR==2 {print $2}')
	echo "
	# HELP CPU used for %Cpu
	# TYPE CPU gauge
	CPU $(ft_cpu)
	# HELP MEM_USED_PERCENT is (usedMem / totalMem)%
        # TYPE MEM_USED_PERCENT gauge
	MEM_USED_PERCENT $(ft_mem)
		" > /var/www/html/metrics.html
	echo "metrics are updated"
	sleep 7
done
