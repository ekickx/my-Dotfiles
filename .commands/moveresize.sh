#!/bin/bash

  eval $(xdotool getwindowfocus getwindowgeometry --shell)
  xdotool getwindowfocus windowmove $(( $X+$1-4 )) $(( $Y-44+$2 ))\
    windowsize $(( $WIDTH+$3 )) $(( $HEIGHT+$4 ))
