#!/bin/bash

source collectingMetrics

while true
do
	#echo "Memmory total - $(free|awk 'NR==2 {print $2}')
	echo "
	# HELP cpu CPU usage.
	# TYPE cpu gauge
	cpu $(ft_cpu)
		" > /var/www/html/metrics.html
	echo "metrics are updated"
	sleep 7
done
