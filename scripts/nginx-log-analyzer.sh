#!/bin/bash

echo '======= Top IPs ======='
awk '{print $1}' ../data/sample-nginx-access.log | sort | uniq -c | sort -nr | head -n 10

echo -e "\n======= Top Paths ======"
awk '{print $7}' ../data/sample-nginx-access.log | sort | uniq -c | sort -nr | head -n 10

