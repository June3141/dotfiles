#!/bin/bash

#st_prev=$(cat /sys/class/drm/card0-HDMI-A-1/status)
st_prev="disconnected"


# ==== for thinkpad X280 =====================================================
# hdmi connector
while :
do
    st_hdmi2=$(cat /sys/class/drm/card0-HDMI-A-2/status)
    if [ $st_prev != $st_hdmi2 ]; then
        st_prev=$st_hdmi2
        if [ $st_hdmi2 = "connected" ]; then
            xrandr --output eDP1 --auto --output HDMI2 --auto --left-of eDP1
        else
            xrandr --output eDP1 --auto --output HDMI2 --off
        fi
        ~/.fehbg
    fi
    sleep 1
done
