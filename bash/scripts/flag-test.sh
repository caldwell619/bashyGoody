#!/bin/bash

quiet=''

while getopts "aq:" OPTION
do
	case $OPTION in
		q)
			echo "The value of -f is $OPTARG"
			quiet=$OPTARG
			echo $quiet
			exit
			;;
		*)
			echo "Used for the help menu"
			exit
			;;
	esac
done