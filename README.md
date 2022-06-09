# scripts4i3
# some scripts for i3wm

saveAllLayouts.sh
This script, when executed from terminal within i3, will export the current
position and name of running programs in any workspaces. If the windows are
moved to a particular area of the workspace or have been arranged in your
desired way in the workspace. 

This script will use the i3-save-tree command to capture the layout of ALL 
workspaces. The files saved in JOSN format and requires a little editing, 
mainly removing comments in the json file. 
Comments begin with // 
But the comments in the swallow section should not be deleted but
uncommented. 

You will need to edit the script and edit the line 15. 
It starts ws=("" You SHOULD leave the first elenment as "". 
Other elenments like ":Main" ":Web" ":C0de" ... 
should be edited to match EXACTLY as in you i3/config file,
as you have your own workspace names. I dont use icon font in workspace name, 
so i dont know if that will work or not. If it doesnt work, try renaming your 
workspace without the font icon name.

The .jason file created will be 1.json, 2.json etc...corresponding the 
workspace number. Unused workspace will not have a json file.

The file is well commented :) so it should be easy to use.


restoreWin.sh
Run this script file from the i3 config file. It basically reads the json file
and restores the windows layout. You could have a keybinding for it but i dont
have a need for that. 
