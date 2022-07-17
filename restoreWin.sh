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
for i in {10..1}; do
    :b2

:"


"
:
	if  [[ -f "$jsonPath$i.json" ]]
	then
		echo -e "\e[1;93m$wsname found...loading.\e[0m"
		i3-msg "workspace $wsname; append_layout $jsonPath$i.json" 2>&1 > /dev/null
	else
		echo -e "\e[1;91m$wsname not found ... skipping.\e[0m"
	fi
done
echo \nWhen all is one and one is all
echo You\'ll be a rock and not roll

# execute the list of programs to be loaded
# in the layout with the &, 1 per line
# regardless of workspace
#xpad &
urxvt &
dolphin &
firefox &
atom &
# vlc &
# ftp &
