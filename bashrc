## History
HISTCONTROL=ignoreboth # don't put duplicate lines or space led into hist.
HISTSIZE=1000
HISTFILESIZE=2000

## SHOPT
shopt -s expand_aliases # expand aliases
shopt -s histappend # don't override
shopt -s checkwinsize # after each command
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

GREEN="\[$(tput setaf 2)\]"
#RED="\[$(tput setaf 1)\]"
#DGRAY="\[$(tput setaf 0)\]"
ORANGE="\[$(tput setaf 3)\]"
#BLUE="\[$(tput setaf 4)\]"
#PURPLE="\[$(tput setaf 5)\]"
#TURKISB="\[$(tput setaf 14)\]"
#WHITE="\[$(tput setaf 7)\]"
LGRAY="\[$(tput setaf 7)\]"
LRED="\[$(tput setaf 9)\]"

RESET="\[$(tput sgr0)\]"
BOLD="\[$(tput bold)\]"

# Shell Prompt
export PS1="${LGRAY}[${GREEN}${BOLD}\w${RESET}${LGRAY}]\n ${ORANGE}λ${RESET} "

export PATH="$PATH:/home/maxim/flutter/bin:/home/maxim/.local/bin"
export EDITOR="vim"
export TERMINAL="alacritty"

# Configure pfetch
export PF_INFO="ascii title os kernel uptime pkgs shell wm editor memory palette"

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

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
    if [ -f $1  ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1   ;;
            *.tar.gz)    tar xzf $1   ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1   ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xf $1    ;;
            *.tbz2)      tar xjf $1   ;;
            *.tgz)       tar xzf $1   ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1      ;;
            *.deb)       ar x $1      ;;
            *.tar.xz)    tar xf $1    ;;
            *.tar.zst)   unzstd $1    ;;      
            *)           echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

