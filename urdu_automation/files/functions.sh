#!/bin/bash

title(){
echo "=========== $@ ==========="
}

info(){
echo "INFO: $@"
}

usage(){
echo "USAGE: urd -h -f<a|e|u> -t <adv|n.m|n.f|adj>"
echo "Example:
	urd -f u -t ^aa
	urd -f u -t aab$
	urd -f a -t ^aa
	urd -f a -t aa$
	urd -f e -t ^aa
	urd -f e -t aa$"
}

check_for_spaces(){
awk -F " " '{print $1}' | head -n 1
}

locate_urdu_database(){
check_for_spaces "$1"
}


find_all(){
words_list=$( locate Urdu_words_lists.txt | head -n 1 )
if [ -z "$var" ]
then
        words_list=$( find ~ -name Urdu_words_lists.txt )
fi
cat "${words_list}" | grep "$1" --color
}

find_eng(){
words_list=$( locate Urdu_words_lists.txt | head -n 1 )
if [ -z "$var" ]
then
	words_list=$( find ~ -name Urdu_words_lists.txt )
fi
#cat "${words_list}" | awk -F ":" '{print $2}' | grep "$1" --color
##FIXME
cat "${words_list}" | awk -F " " '{print $4}' | grep "$1" --color
}

find_urdu(){
words_list=$( locate Urdu_words_lists.txt | head -n 1 )
if [ -z "$var" ]
then
        words_list=$( find ~ -name Urdu_words_lists.txt )
fi
cat "${words_list}" | awk -F ":" '{print $1}' | grep "$1" --color
}
