#!/bin/bash

############## HELP ##############
Help()
{
   # Display Help
   echo "Display a specific day from calcurse"
   echo
   echo "Syntax: give date like day month year"
   echo ""
   echo "-t Show today"
   echo "-y Show yesterday"
   echo "-m Show tomorrow"
   echo "Example:"
   echo "19 Januari 2023 will look like 19 01 2023"
   echo ""Syntax: script [19 01 2023]

}


Yesterday()
{
yesterday=$(date -d "-1 days" +%m/%d/%Y)
calcurse -G --filter-end-range $yesterday,$yesterday      \
        --format-apt " - %S -> %E %m \n"                \
        --format-recur-apt " - %S -> %E\n\t%m\n"        \
        --format-event " * %m\n"                        \
        --format-recur-event " * %m\n"                  \
        --filter-type event,apt,recur-event,recur-apt

}



Today()
{
today=$(date +%m/%d/%Y)
yesterday=$(date -d "-0 days" +%m/%d/%Y)
calcurse -d $today      \
        --format-apt " - %S -> %E %m \n"                \
        --format-recur-apt " - %S -> %E\n\t%m\n"        \
        --format-event " * %m\n"                        \
        --format-recur-event " * %m\n"                  \
        --filter-type event,apt,recur-event,recur-apt | sed '1d'

}


Tomorrow()
{
today=$(date +%m/%d/%Y)
tomorrow=$(date -d "+1 days" +%m/%d/%Y)
calcurse -d   $tomorrow \
        --format-apt " - %S -> %E %m \n"                \
        --format-recur-apt " - %S -> %E\n\t%m\n"        \
        --format-event " * %m\n"                        \
        --format-recur-event " * %m\n"                  \
        --filter-type event,apt,recur-event,recur-apt  | sed  '1d'
 

}




while getopts "htym" option; do
   case $option in
      h) # display Help
         Help
	 exit;;
      t) # display today
         Today 
         exit;;
      y) # display yesterday
	 Yesterday
	 exit;;
      m) # display tomorrow
	 Tomorrow
	 exit;;
   esac
done


############## HELP ##############







# - Here i create ints of the day before -
beforeDay=$(date --date="$3$2$1  -d -0 days" +%m/%d/%Y)
calcurse -d  $2/$1/$3	\
        --format-apt "%S-%E %m \n"		\
        --format-recur-apt "%S-%E\n\t%m\n"	\
     	--format-event "%m\n"			\
        --format-recur-event "%m\n"			\
	--filter-type event,apt,recur-event,recur-apt | sed '1d' 
