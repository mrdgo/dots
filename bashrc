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

eval "$(starship init bash)"

export PATH="$PATH:/home/maxim/flutter/bin:/home/maxim/.local/bin"

export EDITOR="nvim"
export TERMINAL="alacritty"

# Configure pfetch
export PF_INFO="ascii title os kernel uptime pkgs shell wm editor memory palette"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Alias definitions.
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
