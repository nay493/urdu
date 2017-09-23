#!/bin/bash

title(){
echo "=========== $@ ==========="
}

info(){
echo "INFO: $@"
}

usage(){
echo "USAGE: $0 -h -f<a|e|u> -t <adv|n.m|n.f|adj>"
echo "Example:
	${0} -f u -t ^aa
	${0} -f u -t aab$
	${0} -f a -t ^aa
	${0} -f a -t aa$
	${0} -f e -t ^aa
	${0} -f e -t aa$"
}

check_for_spaces(){
awk -F " " '{print $1}' | head -n 1
}

locate_urdu_database(){
check_for_spaces "$1"
}


find_all(){
words_list=$( locate Urdu_words_lists.txt | head -n 1 )
cat "${words_list}" | grep "$1" --color
}

find_eng(){
words_list=$( locate Urdu_words_lists.txt | head -n 1 )
#cat "${words_list}" | awk -F ":" '{print $2}' | grep "$1" --color
##FIXME
cat "${words_list}" | awk -F " " '{print $4}' | grep "$1" --color
}

find_urdu(){
words_list=$( locate Urdu_words_lists.txt | head -n 1 )
cat "${words_list}" | awk -F ":" '{print $1}' | grep "$1" --color
}
