#!/bin/bash

INTERFACE=wlp7s0
FORMAT="%Y-%m-%d %a %H:%M"

while true
do
    cpu=$(printf "%4s" $(top -bn1 | awk '/Cpu/{printf("%.1f"), $2}'))
    mem=$(printf "%4s" $(free | awk '/Mem/{printf("%.1f"), $3/$2*100}'))
    now=$(date +"$FORMAT")
    wifi=$(nmcli -t -f name,device conn show --active | grep wl* | cut -d\: -f1)
    signal=$(awk '/wl/{printf("%d%%", $3/70*100)}' /proc/net/wireless)

    net=$([ -z "$wifi" ] && echo "󰖪" || echo "$wifi  $signal")

    ROOT="$net | CPU $cpu% | RAM $mem% | $now "

    xsetroot -name "$ROOT"

    sleep 3
done
