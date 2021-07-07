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
option8="Create new report"

options="$option0\n$option1\n$option2\n$option3\n$option4\n$option5\n$option6\n$option7\n$option8"

chosen="$(echo -e "$options" | rofi -lines 9 -dmenu -p "Butler Burton - select option")"
case $chosen in
        $option0)
        butler-burton r d && butler-burton ci && butler-burton r u;;
        $option1)
        butler-burton r d && butler-burton co && butler-burton r u;;
        $option2)
        butler-burton r d && butler-burton co -o && butler-burton r u;;
	$option3)
        butler-burton r d && butler-burton co -c && butler-burton r u;;
	$option4)
        butler-burton r d && butler-burton co -c -o && butler-burton r u;;
	$option5)
        butler-burton ct;;
	$option6)
        butler-burton -v;;
	$option7)
        butler-burton rg;;
        $option8)
	butler-burton r c && butler-burton r u;;
esac
