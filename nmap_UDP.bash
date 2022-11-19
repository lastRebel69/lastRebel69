#!/bin/bash
if [[ -f /tmp/add.var ]]; #looks for previously used address
	then
		add='/tmp/add.var'
		echo "Using last address."
else if [ -z "$1" ] #checks for null value in first argument
  then
	echo "No address argument supplied. Script halting."
	exit 1  #cleanly exits
else
add=$1 #stores or reassigns first string in arguments as address variable ?
fi
fi
dir=/home/nmap_logs #stores nmap log directory as variable
log=$add.nmap
if [[ -d "$dir" ]]; #check if log directory exists, create if not
then
    echo "$dir directory exists."
else
	echo "$dir directory does not exist, creating..."
	mkdir -v $dir
fi
echo "Nmap scan running against $add. Check logs..." #prints target address
if [[ -f "log" ]];	#checks whether to append log file or create one
then
	echo nmap $add -sU -oN $dir/$add.nmap --append-output
else
	echo nmap $add -sU -oN $dir/$add.nmap #runs nmap basic UDP using target address
fi