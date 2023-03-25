#!/bin/bash

source collectingMetrics

while true
do
	echo "
	# HELP CPU
	# TYPE CPU gauge
	CPU $(ft_cpu)

	#|---------------| HELP MEM_USED_PERCENT
        # TYPE MEM_USED_PERCENT gauge
	MEM_USED_PERCENT $(ft_mem)

        #|---------------| HELP MEM_TOTAL_MiB
        # TYPE MEM_TOTAL_MiB gauge
        MEM_TOTAL_MiB $(ft_memTotal)

	#|---------------| HELP DISK_USED_PERCENT
	# TYPE DISK_USED_PERCENT gauge
	DISK_USED_PERCENT $(ft_diskUsed)

	#|---------------| HELP DISK_AVAILABLE_MiB
	# TYPE DISK_AVAILABLE_MiB gauge
	DISK_AVAILABLE_MiB $(ft_diskAvailable)

		" > /var/www/html/metrics.html
	echo "metrics are updated"
	sleep 7
done
