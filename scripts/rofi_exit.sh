#!/bin/bash

# options to be displayed
option0="lock"
option1="logout"
option2="suspend"
option3="scheduled suspend (10min)"
option4="hibernate"
option5="reboot"
option6="shutdown"

# options passed into variable
options="$option0\n$option1\n$option2\n$option3\n$option4\n$option5\n$option6"

chosen="$(echo -e "$options" | rofi -lines 8 -dmenu -p "power")"
case $chosen in
    $option0)
        betterlockscreen -l blur -t "Här är det låst" --off 300;;
    $option1)
        herbstclient quit;;
    $option2)
        betterlockscreen -s dimblur -t "Här är det låst" --off 300;;
	$option3)
		sleep 600 && betterlockscreen -s dimblur -t "Här är det låst" --off 300;;
	$option4)
        betterlockscreen -l dimblur -t "Här är det låst" && systemctl hibernate;;
	$option5)
        systemctl reboot;;
    $option6)
        systemctl poweroff;;
esac

