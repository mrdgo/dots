# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

GREEN="\[$(tput setaf 2)\]"
#RED="\[$(tput setaf 1)\]"
#DGRAY="\[$(tput setaf 0)\]"
#ORANGE="\[$(tput setaf 3)\]"
#BLUE="\[$(tput setaf 4)\]"
#PURPLE="\[$(tput setaf 5)\]"
#TURKISB="\[$(tput setaf 14)\]"
#WHITE="\[$(tput setaf 7)\]"
LGRAY="\[$(tput setaf 7)\]"
LRED="\[$(tput setaf 9)\]"
RESET="\[$(tput sgr0)\]"

BOLD="\[$(tput bold)\]"

export PS1="${LGRAY}[${GREEN}${BOLD}\u${RESET}${LGRAY}] [${BOLD}${LRED}\w${RESET}${LGRAY}] \n> ${RESET}"
export MPD_HOST="/home/maxim/.mpd/socket"

export PATH="$PATH:/home/maxim/Android/flutter/bin"

rmd () {
    pandoc $1 | lynx -stdin
}

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}


ic () {
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/home/maxim/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/maxim/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/home/maxim/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/maxim/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
}

tf () {
    ic
    conda activate tfgpu
}
