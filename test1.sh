#!/bin/sh

echo "Test Shell Start"

#while read line
#do
#	echo $line | awk '
#	BEGIN{print "START"} 
#	/SVGNAME/ {print} {CNT++} 
#	END{print '$CNT'}'
#
#done < /home/lhy/shellstudy/tpcfg.m

awk '
BEGIN{print "START"; ok=0}
/SVGNAME/ {print; ok++}
END{print ok}
' /home/lhy/shellstudy/tpcfg.m

echo "Test Shell End"
