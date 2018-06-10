#!/bin/bash

if [ -e ~/.quodlibet/current ]
then
	notify-send "$(echo -e "$(quodlibet --print-playing "<title>")\n$(quodlibet --print-playing "<artist|<artist>|Unknown Artist>")")" "$(quodlibet --print-playing "<~rating>")" 
	if [[ -e ~/.quodlibet/art/"$(echo "`(quodlibet --print-playing "<title>")`.png")" ]]; then
		n30f -x 27 -y 573 ~/.quodlibet/art/"$(echo "`(quodlibet --print-playing "<title>")`.png")"&
		sleep 5
		pkill n30f
		exit;
	else
		if [[ -e ~/.quodlibet/current.cover ]]; then
			convert -resize 140x140 -border 5x5 -bordercolor "#E8EAF9" ~/.quodlibet/current.cover "$(echo "`(quodlibet --print-playing "<title>")`.png")"
			mv "$(echo "`(quodlibet --print-playing "<title>")`.png")" ~/.quodlibet/art/
			n30f -x 27 -y 573 ~/.quodlibet/art/"$(echo "`(quodlibet --print-playing "<title>")`.png")"&
			sleep 5
			pkill n30f	
			exit;		
		else
			n30f -x 27 -y 573 ~/.quodlibet/art/unknown.png&
			sleep 5
			pkill n30f
			exit;
		fi
	fi


fi