#!/bin/bash
BATTINFO=`acpi -b`
CRITICAL_PERCENTAGE=10
LOW_PERCENTAGE=20
FILE_LOCATION="/home/rafif/LOW_BATTERY" #change this to correct username!

while [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -c 25-26 ` -gt $CRITICAL_PERCENTAGE ]]
do
	if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -c 25-26 ` -lt $LOW_PERCENTAGE ]]
	then
		echo `date` >> $FILE_LOCATION 
		echo "Was forced to hibernate, due to low battery status">>$FILE_LOCATION       
		echo $BATTINFO >> $FILE_LOCATION
		echo " " >> $FILE_LOCATION
		sudo shutdown now 
	fi
	BATTINFO=`acpi -b`
done
