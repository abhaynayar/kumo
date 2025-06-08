#!/bin/bash

echo "========== CPU USAGE =========="
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Load: " $2 + $4 "%"}'


echo -e "\n========== MEMORY USAGE =========="
free -h | awk '/^Mem:/ {
    used = $3;
    total = $2;
    percent = (used/total)*100;
    printf("Used: %s / %s (%.2f%%)\n", used, total, percent);
}'

echo -e "\n========== DISK USAGE =========="
df -h / | awk 'NR==2 {
    printf("Used: %s / %s (%s used)\n", $3, $2, $5);
}'

echo -e "\n========== TOP 5 PROCESSES BY CPU =========="
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6

echo -e "\n========== TOP 5 PROCESSES BY MEMORY =========="
ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -n 6

echo -e "\n========== SYSTEM INFO =========="
echo "Hostname: $(hostname)"
echo "OS Version: $(lsb_release -d | cut -f2- 2>/dev/null || cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2)"
echo "Uptime: $(uptime -p)"
echo "Load Average (1m, 5m, 15m): $(uptime | awk -F'load average:' '{ print $2 }' | sed 's/^ *//')"
echo "CPU Cores: $(nproc)"
echo "Logged in users: $(who | wc -l)"
echo "Failed Login Attempts (last 24h): $(journalctl _COMM=sshd --since '24 hours ago' 2>/dev/null | grep 'Failed password' | wc -l)"


