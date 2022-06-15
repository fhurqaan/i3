#!/bin/bash
# 
# set path to $HOME/Pictures/screenCap
scPath=$HOME/Pictures/screenCap/
if [[ -n $scPath ]]; then
	mkdir $scPath -p
fi

# set file name of capture file
scName="ScreenShot_"`date +%Y-%m-%d_%H:%M:%S`".png"
xfce4-screenshooter -s $scPath$scName -r 
