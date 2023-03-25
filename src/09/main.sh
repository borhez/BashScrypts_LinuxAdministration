#!/bin/bash

source collectingMetrics

while true
do
	#echo "Memmory total - $(free|awk 'NR==2 {print $2}')
	echo "
	CPU $(ft_cpu)
	MEM_USAGE $(ft_mem)
		" > /var/www/html/metrics.html
	echo "metrics are updated"
	sleep 7
done
