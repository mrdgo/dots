# vim life
alias v = nvim

# Convenience
alias i = devour sxiv -rfb
alias d = devour display
alias dz = devour zathura
alias vlc = cvlc --key-quit q
alias minecraft = JAVA_HOME=/usr/lib/jvm/java-17-openjdk/ devour ~/.minecraft/launcher/minecraft-launcher

# youtube-dl
alias yta-aac = youtube-dl --extract-audio --audio-format aac
alias yta-best = youtube-dl --extract-audio --audio-format best
alias yta-flac = youtube-dl --extract-audio --audio-format flac
alias yta-m4a = youtube-dl --extract-audio --audio-format m4a
alias yta-mp3 = youtube-dl --extract-audio --audio-format mp3
alias yta-opus = youtube-dl --extract-audio --audio-format opus
alias yta-vorbis = youtube-dl --extract-audio --audio-format vorbis
alias yta-wav = youtube-dl --extract-audio --audio-format wav
alias ytv-best = youtube-dl -f bestvideo+bestaudio

# Dev
alias g = git
alias ci = glab ci view (git branch | awk '/\*/{print $2}')
alias lg = lazygit
alias tmux = tmux -f ~/.config/tmux.conf

alias ... = cd ../..
alias .t = cd ../../..
alias .f = cd ../../../..

# pretty ls
alias ll = ls -l
alias la = ls -a
alias l = ls

alias ezac = eza --icons --group-directories-first
alias lx = ezac -lbhHma@ --time-style=default --color-scale
alias lall = ezac -lbhHigUmuSa --time-style=long-iso
alias lt = ezac --tree --level=2

alias de = setxkbmap de
alias us = setxkbmap us -variant intl
alias dv = setxkbmap us -variant dvorak-intl

alias x = cd (xplr)
alias p = paru
alias psc = paru -Sc --noconfirm
alias dk = lazydocker
