#!/bin/bash

# Polybar
for pid in $(pgrep 'polybar' | awk '{print $1}'); do kill -9 $pid; done
polybar &> /dev/null & disown

# Nitrogen
nitrogen --restore &> /dev/null & disown

# Change key repeat speed
xset r rate 275 25

# map Capslock to super
setxkbmap -option "caps:super"
