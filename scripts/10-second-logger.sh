#!/bin/bash

# Making this a systemd service..
while true; do
  echo "dummy dum dum service is running.." >> /var/log/10-second-logger.log
  sleep 10
done
