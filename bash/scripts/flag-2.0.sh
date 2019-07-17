#!/bin/bash

quiet=''

while [ ! $# -eq 0 ]
do
	case "$1" in
		--quiet | -q)
			quiet='true'
			;;
	esac
	shift
done

