# History
HISTFILE=~/.zshist
HISTSIZE=1000
SAVEHIST=1000

# Shell options
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
zstyle :compinstall filename '/home/maxim/.zshrc'

autoload -Uz compinit
compinit

# Aliases
source $HOME/.aliases

# Prompt
eval "$(starship init zsh)"

# Configure pfetch
export PF_INFO="ascii title os kernel uptime pkgs shell wm editor memory palette"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# set cursor shapes
function zle-keymap-select zle-line-init zle-line-finish {
  case $KEYMAP in
    vicmd)      print -n -- "\E]50;CursorShape=0\C-G";; # block cursor
    viins|main) print -n -- "\E]50;CursorShape=2\C-G";; # underscore cursor
  esac

  zle reset-prompt
  zle -R
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
# set cursor shapes END
