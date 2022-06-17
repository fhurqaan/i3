#!/bin/bash
#
# set path to $HOME/Pictures/screenCap
scPath=$HOME/Pictures/screenCap/

# copy the click.mp3 to your favourite directory and change the path below.
shutterSnd=$HOME/scripts/i3/click.mp3

# check if path exists, if no, create the path
[[ -n $scPath ]] && mkdir $scPath -p


# -w to capture current active window
# -f to capture entire screen
# -r to capture a selected reigon of screen
# -i interactive mode ie run the program
#
# in i3 config use this method
# bindsym $mod+Print exec <path to script>/screenCapture -w
# bindsym $mod+Shift+Print exec <path to script>/screenCapture -f
# bindsym $mod+Control+Print exec <path to script>/screenCapture -r
# bindsym $mod+Shift+Control+Print exec <path to script>/screenCapture -i
# if you dont want to use the interactive mode then ignore that line
#
# Why use xcfe4-screenshooter, well it came install in the system
# no point using scrot or anything else if it get the job done.

# i am using mplayer to play the
# --
# Get stoned!....Drink wet cement!

case $1 in
	-r)
		scName="regionShot"`date +%Y-%m-%d_%H:%M:%S`".png"
		xfce4-screenshooter $1 -s $scPath$scName
		# display to user of path and filename saved
		# if Escape is pressed, dont save, no shutter sound
		[[ -e $scPath$scName ]] && mplayer $shutterSnd && kdialog --msgbox "Image saved in \n$scPath\n as $scName"
		;;

	-w)
#		-d 2 is 2 second delay before active window is captured
#		this allows the user to select the windows before the shot
		scName="activeWindowShot"`date +%Y-%m-%d_%H:%M:%S`".png"
		xfce4-screenshooter $1 -d 2 -s $scPath$scName
		mplayer $shutterSnd ; kdialog --msgbox "Image saved in \n$scPath\n as $scName"
		;;
	-f)
		scName="fullscreenShot"`date +%Y-%m-%d_%H:%M:%S`".png"
		xfce4-screenshooter $1 -s $scPath$scName
		mplayer $shutterSnd ; kdialog --msgbox "Image saved in \n$scPath\n as $scName"
		;;
	-i)
		xfce4-screenshooter
			;;
	*)
		;;
esac
