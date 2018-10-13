#!/bin/bash

res=$(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/')
folder="$HOME/.cache/i3lock/current"
resized="$folder/resized.png"
convert "$1" -resize "$res""^" -gravity center -extent "$res" "$resized"
command(){
cat <<EOF
#! /bin/bash
i3lock -i $resized -c '#000000' -o '#191d0f' -w '#572020' -l '#ffffff' -e

EOF
} > ~/.cache/i3lock/current/command.sh

command
