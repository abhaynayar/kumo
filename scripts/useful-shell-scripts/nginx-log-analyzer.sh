#!/bin/bash
if [ $# -ne 1 ]; then
  echo "Usage: $0 <path-to-nginx-log-file>"
  exit 1
fi

LOGFILE=$1

echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' "$LOGFILE" \
  | sort | uniq -c | sort -rn | head -5 \
  | awk '{printf "%s - %s requests\n",$2,$1}'
echo

echo "Top 5 most requested paths:"
# Field 2 INSIDE the quoted request line = the path
awk -F'"' '{print $2}' "$LOGFILE" | awk '{print $2}' \
  | sort | uniq -c | sort -rn | head -5 \
  | awk '{printf "%s - %s requests\n",$2,$1}'
echo

echo "Top 5 response status codes:"
awk '{print $9}' "$LOGFILE" \
  | sort | uniq -c | sort -rn | head -5 \
  | awk '{printf "%s - %s requests\n",$2,$1}'
echo

echo "Top 5 user agents:"
# The user-agent is the penultimate quoted field → $(NF-1)
awk -F'"' '{print $(NF-1)}' "$LOGFILE" \
  | sort | uniq -c | sort -rn | head -5 \
  | awk '{count=$1; $1=""; sub(/^ /,""); printf "%s - %s requests\n",$0,count}'

