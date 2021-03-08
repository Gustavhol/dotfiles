#!/bin/sh


awk '{printf(" %d:%02d:%02d\n",($1/60/60/24),($1/60/60%24),($1/60%60))}' /proc/uptime > /tmp/uptime
