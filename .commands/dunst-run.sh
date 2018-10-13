#!/bin/bash

config="/home/rafif/.config/dunst/dunst-dark"
pkill dunst

dunst -config $config&

