#!/bin/bash

ft_cpu()
{
	echo $(top -b -n 1 | awk 'NR>7 {cpu=cpu+$9} END {printf("%.1f", cpu)}')
}

ft_memUsed()
{
	echo $(free -m | awk 'NR==2 {print $3}')
}

ft_memAvail()
{
	echo $(free -m | awk 'NR==2 {print $7}')
}

ft_memTotal()
{
        echo $(top -b -n 1 | awk 'NR==4 {printf("%.1f", $4)}')
}


ft_diskUsed()
{
	echo $(df -m / | awk 'NR==2 {print $3}')
}

ft_diskAvailable()
{
	echo $(df -m / | awk 'NR==2 {print $4}')
}

ft_diskTotal()
{
	echo $(df -m / | awk 'NR==2 {print$2}')
}

echo \# HELP CPU_my
echo \# TYPE CPU_my gauge
echo CPU_my $(ft_cpu)

echo \# HELP MEM_USED_my
echo \# TYPE MEM_USED_my gauge
echo MEM_USED_my $(ft_memUsed)

echo \# HELP MEM_AVAIL_my
echo \# TYPE MEM_AVAIL_my gauge
echo MEM_AVAIL_my $(ft_memAvail)


echo \# HELP MEM_TOTAL_my
echo \# TYPE MEM_TOTAL_my gauge
echo MEM_TOTAL_my $(ft_memTotal)

echo \# HELP DISK_USED_my
echo \# TYPE DISK_USED_my gauge
echo DISK_USED_my $(ft_diskUsed)

echo \# HELP DISK_AVAILABLE_my
echo \# TYPE DISK_AVAILABLE_my gauge
echo DISK_AVAILABLE_my $(ft_diskAvailable)

echo \# HELP DISK_TOTAL_my
echo \# TYPE DISK_TOTAL_my gauge
echo DISK_TOTAL_my $(ft_diskTotal)

echo \# HELP DISK_READ_my
echo \# TYPE DISK_READ_my gauge
echo DISK_READ_my $(sudo iotop -b -n 1 |awk 'NR==1 {print $4}')

echo \# HELP DISK_WRITTEN_my
echo \# TYPE DISK_WRITTEN_my gauge
echo DISK_WRITTEN_my $(sudo iotop -b -n 1 |awk 'NR==1 {print $10}')

