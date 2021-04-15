#!/bin/sh

# echo $(uptime -p)
echo $(uptime | cut -d ',' -f1-2 | cut -d ' ' -f3-)

