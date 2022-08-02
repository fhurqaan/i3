#!/bin/bash
# only allow one instance of sxiv to run
pidof /usr/bin/sxiv > /dev/null && {
	kdialog --error  "Sxiv instance already running..." --title "SXIV error"
	exit
}
case $1 in
    new) sxiv -qtrg 480x320 ~/Pictures/* ;;
    set) ~/.fehbg & ;;
esac
