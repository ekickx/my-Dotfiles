#!/bin/sh/

if [ $1 = '-f' ]
then 
	figlet -f "$2" "$3" | lolcat
else
	figlet -f 3d "$1" | lolcat
fi
