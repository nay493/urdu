#!/bin/bash
. files/functions.sh
title "Welcome to the world of finding right words"
while true
do
case $1 in
-h|--help) usage; exit 0 ;;
-f|--find) 
	case $2 in
	a|all)func=find_all; shift; shift ;;
	e|eng)func=find_eng; shift; shift ;;
	u|urdu)func=find_urdu; shift; shift ;;
	*)usage;;
	esac
;;
-t|--type) "${func}" "$2" ; break ;;
*) usage; exit 255 ;;
esac
done
title "Thank you, do visit again for more exciting words :)"
