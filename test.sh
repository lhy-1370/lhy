#!/bin/sh

#export LANG=ko_KR.eucKR
#export LANG=ko_KR.utf8

while read line
do
	#SVCNAME=$(awk '/SVGNAME/ { print $1, $2 }' $line)
	#BINNAME=$(awk '/OBJECT/ { print }' $line)

	echo $line

	SVCNAME=$(awk '{
	if(/SVGNAME/) {print $1, $2}
	else if(/OBJECTNAME/) {print}
	}' $line)

	if [[ $SVCNAME == *"SVGNAME"* ]] ; then
		#echo $SVCNAME
		echo
	elif [[ $SVCNAME == *"OBJECTNAME"* ]] ; then
		#echo $SVCNAME
		echo
	fi

done < /home/lhy/shellstudy/tpcfg.m

