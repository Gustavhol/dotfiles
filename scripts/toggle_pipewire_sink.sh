#!/bin/bash
aac=`pactl list | grep Active | grep aac`
card=`pactl list | grep "Name: bluez_card." | cut -d ' ' -f 2`
if [ -n "$aac" ]; then
    pactl set-card-profile $card headset-head-unit-msbc
    dunstify "Switched $card to msbc"
else 
    pactl set-card-profile $card a2dp-sink-aac
    dunstify "Switched $card to A2DP"
fi
