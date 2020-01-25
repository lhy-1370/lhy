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
{ if ( $0 ~ /SVGNAME/ && index($1,"#")==0 )
	{ok++; SVCNAME[ok]=$1; SVGNAME[ok]=$2;}
  else if ( $0 ~ /OBJECTNAME/ && index($1,"#")==0 ) 
	  { OBJECTNAME[ok]=$1 }
}
END{
for (i=1; i<ok; i++)
	if ( OBJECTNAME[i] != "" )
		print SVCNAME[i] " | " SVGNAME[i] " | " OBJECTNAME[i]
	else
		print SVCNAME[i] " | " SVGNAME[i] " | OBJECTNAME=" SVCNAME[i]
}
' /home/lhy/shellstudy/tpcfg.m

echo "Test Shell End"
