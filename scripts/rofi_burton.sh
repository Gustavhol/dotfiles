#!/usr/bin/env bash


PATH=~/.go/bin:$PATH

option0="Check in"
option1="Check out"
option2="Check out and write OT"
option3="Check out with lunch"
option4="Check out with lunch and write OT"
option5="Check time"
option6="Check version"
option7="Verify report"

options="$option0\n$option1\n$option2\n$option3\n$option4\n$option5\n$option6\n$option7"

chosen="$(echo -e "$options" | rofi -lines 8 -dmenu -p "Butler Burton - select option")"
case $chosen in
    $option0)
        butler-burton ci;;
    $option1)
        butler-burton co;;
    $option2)
        butler-burton co -o;;
	$option3)
        butler-burton co -c;;
	$option4)
        butler-burton co -c -o;;
	$option5)
        butler-burton ct;;
	$option6)
        butler-burton -v;;
	$option7)
        butler-burton rg;;
esac
