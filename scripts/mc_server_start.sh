#!/bin/sh
# ssh -t pi@192.168.1.202 "export TERM=xterm;echo '$USER';/bin/bash"
ssh -t pi@192.168.1.95 "export TERM=xterm;./mc;/bin/bash"
