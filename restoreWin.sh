#!/bin/bash

# My worksapce names
# first elenment is null becaue bash starts from elenment 0
# json filename 1.json for workspace 1, 2.json for workspace 2, etc....
#
# ws=(""  ":Main" ":Web" ":C0de" "MT" ":VLC" ":LibreOffice" ":Inkscape" ":Gimp" "MT" "MT")
# the above line is store in a different file. i can call with other scripts.
# it is loaded below!!
source $HOME/scripts/i3/vars.inc

# check if json file exists, then load saved workspace
for i in ${!ws[@]}; do
	wsname=$i${ws[$i]}
	if  [[ -f "$jsonPath$i.json" ]]
	then
		echo -e "\e[1;93mLoading layout for $wsname\e[0m"
		i3-msg "workspace $wsname; append_layout $jsonPath/$i.json"
	fi
done
echo When all is one and one is all
echo You\'ll be a rock and not roll

# execute the list of programs to be loaded
# in the layout with the &, 1 per line
# regardless of workspace
urxvt &
dolphin &
firefox &
atom &
xpad &
# vlc &
# ftp &
