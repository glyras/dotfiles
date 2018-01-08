#!/bin/bash

cleanup() {
	echo "cleaning up"
	killall  redshift compton conky
	rm -f ~/.Xauthority
}

/usr/bin/ratpoison

cleanup

compton &
xfce4-power-manager
