#!/bin/bash
ip=$(ifconfig | grep -1 enx | grep inet | awk {'print $2'} | cut -d'/' -f1)
echo $ip
