# History
HISTFILE=~/.zshist
HISTSIZE=10000
SAVEHIST=10000

# Shell options
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
zstyle :compinstall filename '/home/maxim/.zshrc'

autoload -Uz compinit
compinit

source $HOME/.aliases

eval "$(starship init zsh)"
#eval "$(fasd --init zsh-hook posix-alias)"

export PF_INFO="ascii title os kernel uptime pkgs init shell wm editor keymap memory palette"
#pfetch

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

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

if [ -f "/usr/share/zsh/scripts/zplug/init.zsh" ] ; then
    source /usr/share/zsh/scripts/zplug/init.zsh

    zplug "jeffreytse/zsh-vi-mode"
    zplug "zsh-users/zsh-syntax-highlighting"

    # Install plugins if there are plugins that have not been installed
    if ! zplug check; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi

    # Then, source plugins and add commands to $PATH
    zplug load
 fi
