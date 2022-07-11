#!/bin/bash
#ext="${wpf:(-4)}"
case $1 in
    new) sxiv -qtrg 480x320 ~/Pictures/* ;;
    set) feh --bg-center $HOME/.wallpaper.png ;;
esac
