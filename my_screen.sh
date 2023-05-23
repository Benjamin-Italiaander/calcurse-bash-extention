#!/bin/bash


printLine () {
  echo "##############################################"
}



printLinen () {
  echo "##############################################"
  echo ""
}


#clear
#date "+%A %d %B %Y %H:%M"
#printLine
#echo " Vandaag"
datafile="apts"
datadir="~/.calcurse"
declare -a tmp #declaring a array here 

#tomorrow=$(/usr/bin/calcurse -d tomorrow)
#echo $tomorrow
#calcurse [-D datadir] [-C confdir] [-c calendar-file]

tstvar="/usr/bin/calcurse -d tomorrow -c ~/.calcurse/apts | sed 1d"
TomorrowDates=$(eval $tstvar)
echo $datadir/$datafile
echo $tstvar



#for currentLine in $a;do
#	tmp=("${tmp[@]}" $currentLine)
#	 echo ${tmp[@]}
#done


#var=$(calcurse -d today)
#arr=( ${var} )

#echo $arr

#calcurse -d today
#printLinen
#echo " "

#printLine
#echo "Morgen "
#calcurse -d tomorrow
#printLine
