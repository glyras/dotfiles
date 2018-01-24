#!/bin/bash

cleanup()
{
	echo "cleaning up"
	pkill -9 dzen2
	pkill -9 redshift
	pkill -9 conky
	rm -f ~/.Xauthority
}

cleanup



#xrdb -merge ~/.Xresources &
#xset +fp ~/.fonts &
#xset +fp /usr/share/fonts/ &
#fc-cache -fv &
#compton -CGb --vsync opengl-swc --backend glx &
compton &
xset fp rehash &
xfce4-power-manager &
xfce4-volumed &
#exec xsetroot -solid '#002b36' -cursor_name left_ptr &
#feh --bg-scale ~/Pictures/wallhaven-607375.jpg &
feh --bg-scale ~/Pictures/jason-wong-351890.jpg &
redshift -c ~/.redshift.conf &
conky |  dzen2  -geometry 1366x20 -bg "#f3f3f3" -fg "#707070" -fn "DejaVu Sans Book:pixelsize=10" &

#exec /usr/bin/ratpoison
exec /usr/local/bin/cwm

