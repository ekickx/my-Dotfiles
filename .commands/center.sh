#!/bin/bash

xdotool getactivewindow windowsize 802 458

panelSize=$(xfconf-query -c xfce4-panel -p /panels/panel-1 -lv | grep size | grep -o '[0-9]*' | tail -1)

screenWidth=$(xdpyinfo | grep dimensions | grep -o '[0-9]*' | head -1)
screenHeight=$(xdpyinfo | grep dimensions | grep -o '[0-9]*' | head -2 | tail -1)

windowWidth=$(xdotool getactivewindow getwindowgeometry | grep Geometry | grep -o '[0-9]*' | head -1)
windowHeight=$(xdotool getactivewindow getwindowgeometry | grep Geometry | grep -o '[0-9]*' | tail -1)

PosX=$((screenWidth/2 - windowWidth/2))
PosY=$(((screenHeight-panelSize-23)/2 - windowHeight/2))

xdotool getactivewindow windowmove "$PosX" "$PosY" 