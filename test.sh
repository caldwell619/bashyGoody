#!/usr/bin/env bash

function yes_no(){
	if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    return 1
fi
}

read -p "Hello>? [y/n]" 
yes_no
echo $?