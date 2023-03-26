#!/bin/bash

while true
do
	
	./collectingMetrics.sh > /var/www/html/metrics.html
	echo "metrics are updated"
	sleep 7
done
