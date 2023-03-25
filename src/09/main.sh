#!/bin/bash

sudo echo Start
while true
do
	sudo echo "Memmory total - $(free|awk 'NR==2 {print $2}')" > /var/www/html/metrics/index.html
	sleep 3
done
