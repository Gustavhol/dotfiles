#!/usr/bin/env bash
picom -b
xrandr --auto;
$HOME/.screenlayout/dualmonitor.sh;
sleep 2 && $HOME/.screenlayout/multimonitor.sh;
sleep 2 && source $HOME/.fehbg;
herbstclient reload;

