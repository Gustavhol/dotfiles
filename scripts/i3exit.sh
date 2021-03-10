#!/bin/sh
# /usr/bin/i3exit

# with openrc use loginctl
[ "$(cat /proc/1/comm)" = "systemd" ] && logind=systemctl || logind=loginctl

case "$1" in
    lock)
        betterlockscreen -l blur -t "Här var det låst!" --off 300
        ;;
    logout)
        i3-msg exit
        ;;
    switch_user)
        dm-tool switch-to-greeter
        ;;
    suspend)
        betterlockscreen -s dimblur -t "Här var det låst!" 
        ;;
    hibernate)
        betterlockscreen -l dimblur && $logind hibernate
        ;;
    reboot)
        $logind reboot
        ;;
    shutdown)
        $logind poweroff
        ;;
    *)
        echo "== ! i3exit: missing or invalid argument ! =="
        echo "Try again with: lock | logout | switch_user | suspend | hibernate | reboot | shutdown"
        exit 2
esac

exit 0