unsetopt global_rcs

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx
fi
