#!/bin/bash
ram_ () {
    used_ram=$(free -h|awk 'FNR == 2 {print $3}'|sed 's/i//')
    echo "RAM $used_ram"
}

volume_icon () {
    mute_state=$(amixer sget Master|grep %|awk '{print $NF}'|tr -d '[]')
    case $mute_state in
        "on")  echo "🔊";;
        "off") echo "🔇";;
    esac
}

volume_value () {
    amixer sget Master|grep %|awk '{print $4}'|tr -d '[]'
}

date_ () {
    date '+%a %b %d %r %Y'
}

while :
do
    echo " • $(ram_) • $(volume_icon) $(volume_value) • $(date_)"
    sleep 1
done
