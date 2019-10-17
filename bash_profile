#xrdb ~/.Xresources
#~/.config/start_net.sh

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH="$PATH:$GOBIN:/home/maxim/Android/flutter/bin:/usr/local/texlive/2019/bin/x86_64-linux"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	startx
fi

export PATH="$PATH:$HOME/.cargo/bin:$HOME/Android/bin/flutter"
