#!/bin/bash
# Polybar
# only kill the current poly bar if exists
for pid in $(pgrep 'polybar' | awk '{print $1}'); do kill -9 $pid; done
polybar &> /dev/null & disown

# Nitrogen
nitrogen --restore &> /dev/null & disown
