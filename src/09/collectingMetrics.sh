#!/bin/bash

ft_cpu()
{
	echo $(top -b -n 1 | awk 'NR>7 {cpu=cpu+$9} END {printf("%.1f", cpu)}')
}

ft_mem()
{
	echo $(free -m | awk 'NR==2 {printf("%.1f", $3/$2*100)}')
}

ft_memTotal()
{
        echo $(top -b -n 1 | awk 'NR==4 {printf("%.1f", $4)}')
}


ft_diskUsed()
{
	echo $(df -m / | awk 'NR==2 {print $5}' | awk -F '%' '{printf "%0.1f", $1}')
}

ft_diskAvailable()
{
	echo $(df -m / | awk 'NR==2 {print $4}')
}

echo \# HELP CPU_my
echo \# TYPE CPU_my gauge
echo CPU_my $(ft_cpu)

echo \# HELP MEM_USED_my
echo \# TYPE MEM_USED_my gauge
echo MEM_USED_my $(ft_mem)

echo \# HELP MEM_TOTAL_my
echo \# TYPE MEM_TOTAL_my gauge
echo MEM_TOTAL_my $(ft_memTotal)

echo \# HELP DISK_USED_my
echo \# TYPE DISK_USED_my gauge
echo DISK_USED_my $(ft_diskUsed)

echo \# HELP DISK_AVAILABLE_my
echo \# TYPE DISK_AVAILABLE_my gauge
echo DISK_AVAILABLE_my $(ft_diskAvailable)


