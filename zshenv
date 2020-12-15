# only include what is present
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "/usr/lib/dart/bin" ] ; then
    export PATH="$PATH:/usr/lib/dart/bin"
fi

if [ -d "$HOME/flutter/bin" ] ; then
    export PATH="$PATH:$HOME/flutter/bin"
fi

export PAGER="less"
export EDITOR="nvim"
export TERMINAL="alacritty"
export SHELL=/bin/zsh
export _JAVA_AWT_WM_NONREPARENTING=1

