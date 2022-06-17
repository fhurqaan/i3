#!/bin/bash
# 
# set path to $HOME/Pictures/screenCap
scPath=$HOME/Pictures/screenCap/
[[ -n $scPath ]] && mkdir $scPath -p

if [[ $1 == "" ]] ; then
	# set file name of capture file
	scName="ScreenShot_"`date +%Y-%m-%d_%H:%M:%S`".png"
	xfce4-screenshooter -s $scPath$scName -r
	[[ -e $scPath$scName ]] && kdialog --msgbox "Image saved to \n$scPath\n as $scName"
else
	xfce4-screenshooter
fi
