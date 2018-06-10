#!/bin/bash
if  ps -u rafif | grep quodlibet -q 
then
	quodlibet --play

else
	quodlibet --run --hide-window --stop --play
fi