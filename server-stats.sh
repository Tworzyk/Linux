#!/bin/bash

cpu=$(top -bn1 | grep "%Cpu(s)" | cut -d ',' -f 4 | awk '{print "Total Usage Cpu: " 100-$1 "%"}')
memory=$(free -h | grep "Mem" | awk '{print $2,$3, $3/$2 }')
drive=$(df -h |grep "/" -w | awk '{print $2, $3, $4, $5}')

ps_cpu=$(ps -aux --sort -%cpu | head | awk '{printf "%-8s %-8s %-8s %-8s %s\n", $1, $2, $3, $4, $11}')
ps_mem=$(ps -aux --sort -%mem | head | awk '{printf "%-8s %-8s %-8s %-8s %s\n", $1, $2, $3, $4, $11}')
echo "#-----------#"
echo "# Cpu usage #"
echo ""
echo $cpu
echo ""
echo "# Memory Usage #"
echo $memory
echo ""
echo "# Hard Drive Usage #"
echo ""
echo $drive
echo ""
echo "# Cpu Process #"
echo ""
echo "$ps_cpu"
echo ""
echo "# Memoey Process #"
echo ""
echo "$ps_mem"

