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

#export BROWSER="librewolf"
export PAGER="nvimpager"
export BAT_THEME="gruvbox"
export EDITOR="nvim"
export TERMINAL="alacritty"
export LANG=en_US.UTF-8
export SHELL=/bin/zsh
export _JAVA_AWT_WM_NONREPARENTING=1
export PF_SOURCE=/home/maxim/dokumente/proj/pfetch/addon.sh

export ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
export ZVM_VI_VISUAL_ESCAPE_BINDKEY=jk
export ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_USER_DEFAULT
#export ZVM_INSERT_MODE_CURSOR="\E]50;CursorShape=2\C-G"
export ZVM_TERM=alacritty-256color
