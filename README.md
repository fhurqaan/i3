# some scripts for i3wm
NOTE:
	Output from scripts will not be visiable unless run from terminal.
	If keybinding or executed from within i3 config file, it 
	automatically becomes invisiable. :)
	
	Edit the vars.inc file to suit your file paths and settings.

	NO ERROR CHECKING IS DONE. ALL FOLDERS MUST EXIST PRIOR TO EXECUTING
	THESE SCRIPTS.

saveAllLayouts.sh
-----------------

This script, when executed from terminal within i3, will export the current
position of windows and it info; running in any workspaces. 

This script will use the i3-save-tree command to capture the layout of ALL 
workspaces. The files saved in JOSN format and requires a little editing, 
mainly removing comments in the json file not in the "swallow" section.
Comments begin with // in json
Comments in the "swallow" section should not be deleted but uncommented. 

You will need to edit the script. 
The line starts ws=("". You SHOULD leave the first element as "". 
Other elements like ":Main" ":Web" ":C0de" ... 
should be edited to match EXACTLY as in you i3/config file,
as you have your own workspace names. I dont use icon font in workspace name, 
so i dont know if that will work or not. If it doesnt work, try renaming your 
workspace without the font icon name.

The .json file created will be 1.json, 2.json etc...corresponding the 
workspace number. Unused workspace will not have a json file.

The file is well commented :) so it should be easy to use.

saveCurret.sh
-------------

Script will save the current workspace to the json file in the path set in the 
vars.inc file. You could use a keybinding for this, ie, F12, to capture the 
layout. For this script to work, you will need to download a program called jq.
Refer to your distribution on how to download.
I am using slackware, so there is no... apt yam or jam... :)

Remember to edit the .json file before restoring the workspaces.

restoreWin.sh
-------------

Run this script file from the i3 config file. It basically reads the json file
and restores ALL saved windows layout. You could have a keybinding for it but i 
don't have a need for that. 


About .json
-----------

I find it easier using vim to edit this file, as the comments are highlighted.
Just delete the comments not in the "swallow" section, those in the "swallow" 
section have to be uncommented and edited or deleted, if needed.


screenCapture.sh
----------------

Since i am using Slackware, i've used the program xcfe4-screenshooter for 
screen capture. If you use a diffrent program or want to tweak the setting, 
you can edit the script to suit your needs. 

Basically call the script with the option:-
-f for fullscreen capture
-w to capture active window (a 3 second delay before it captures)
-r use the mouse to select a region of the screen to capture.
-i to run the program interactively

ie. in my i3 config, i am using the print screen/system request key

bindsym $mod+Print exec screenCapture.sh -f

bindsym $mod+Shift+Print exec screenCapture.sh -r

bindsym $mod+Control+Print exec screenCapture.sh -i

bindsym $mod+Shift+Control+Print exec screenCapture.sh -w

All known bugs removed, unknown bugs still there, still unknown.

