#!/bin/bash

# NOTE:
# No error checking is done for file paths;
# assuming user points to existing directory path!!!! :)
# note to self: for thunar delete WM_WINDOW_ROLE line

# Save layout positions in json file.
# json filename 1.json for workspace 1, 2.json for workspace 2, etc.... 
#

clear

# Fill in your workspace name as set in the i3 config file.
# first elenment is null because bash starts from elenment 0
# if you have any unused workspaces leave the field as ""
# My worksapce names
# ws=("" ":Main" ":Web" ":C0de" ":MT" ":VLC" ":LibreOffice" ":Inkscape" ":Gimp" ":MT" ":MT")
source $HOME/scripts/i3/vars.inc
# Path to where my .json files saved
# layoutPath=$HOME/<directory path to save the layout files>
# ie: layoutPath="$HOME/.config/i3/"
layoutPath="$HOME/.config/i3/layouts/"

# This will creater the json file, if any exists, 
# they will be overwritten!
echo I suggest set all you layouts in the workspaces, then run this script
echo i dont have a script to save just one workspace.....yet :\)
echo -e "\e[1;95m"Checking workspaces"\e[0m"
echo -e "\e[1;93m"JSON file will be saved in"\e[1;95m" $layoutPath"\e[0m"
for i in ${!ws[@]}; do
	# skip elenment 0
	if (( $i == 0 )); then
		continue
	fi
	wsname=$i${ws[$i]}
	jsonFile=$layoutPath$i.json
	i3-save-tree --workspace $wsname > $jsonFile

	# Check if json file actually contains data
	lines=$(wc -l $jsonFile|awk '{print $1}') 
	if [ $lines -gt 1 ]; then
		echo -e "\e[1;97m"$wsname saved layout as $i.json"\e[0m"
	else
		# workspace empty, remove json file
		echo "   $wsname not found....skipped"
		rm $jsonFile
	fi
done

echo -e "\e[1;96m"
echo Remember to edit the json file before use. 
echo Remove comment lines and uncomment the lines in swallow section.
echo Also check that the values in json file in swallow section
echo are correct and corresponds to windows setting \(use xprop to check\).
echo "WM_WINDOW_ROLE(STRING), WM_CLASS(STRING) WM_NAME(UTF8_STRING)"
echo Refer to https://i3wm.org/docs/layout-saving.html
echo under the \"Editing layout file\" section.
echo -en "\e[1;93m"
echo 
echo Smash the \\n to continue and remember :-
echo There is no place like 127.0.0.1
echo -en "\e[0m"
read
# Might write a script to remove comments later.
