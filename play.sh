#!/bin/bash

if [[ -z $(ps aux | grep mocp | grep -v grep) ]]; then
	mocp -S 2> /dev/null 1> /dev/null
fi

mocp -o=repeat
mocp -v 60 -l whitenoise/* 
echo "start play"



## with mpg123
#if [[ -z $(ps aux | grep "mpg123" | grep -v "grep") ]]; then 
#	#mpg123 -f -30000 --loop -1 whitenoise/$(ls whitenoise/ | shuf -n 1) 2> /dev/null > /dev/null &
#	mocp -f
#	echo "start play"
#else
#	#killall mpg123 ;
#	mocp -P
#	echo "stopp play"
#fi
