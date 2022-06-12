#!/bin/bash

# include my global variable
source $HOME/scripts/i3/vars.inc
# a modification of a script i found online
# Script to export current i3wm layout to json file
# you need to download the program je for this script to work
# 
# You will only see the echo messages if this script is run from terminal
# if run from i3 you will not see them.
wsname=`i3-msg -t get_workspaces | jq -r ".[] | select(.focused==true).name"`
wsnum=`i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).num'`
jsonFile=$jsonPath$wsnum.json
i3-save-tree --workspace $wsname > $jsonFile

echo -e "\e[1;93m"
echo Saved current workspace $wsname to $jsonFile
echo Remember to edit the json file before applying restore workspace script!
echo --
echo Smash the \\n to continue and remember :-
echo Money is the root of all evil. Send \$10 for more info
echo -e "\e[0m"
