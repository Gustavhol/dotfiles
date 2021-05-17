#!/bin/sh
ssh -t $1 "export TERM=xterm-256color;/bin/bash"
