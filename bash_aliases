alias screencast="ffmpeg -f x11grab -s 1920x1080 -i :0.0 out.mkv"
alias webcast="ffmpeg -i /dev/video1 -c:v libx264 out.mkv"

alias uni="ssh ty82xile@faui0sr0.cs.fau.de"

alias pi1='ssh -J ty82xile@i4lab1.cs.fau.de pi@10.188.42.164'
alias pi2='ssh -J ty82xile@i4lab1.cs.fau.de pi@10.188.42.174'

alias vpn='/opt/cisco/anyconnect/bin/vpnui'

alias mp="cd ~/dokumente/uni/masterprojekt/pi_files/experiment/"

# enable second monitor
# alias pres="xrandr --output HDMI-1 --mode 1920x1080 --left-of eDP-1 && feh --bg-fill $HOME/bilder/wallpaper/liebe.jpg --bg-fill $HOME/bilder/wallpaper/liebe.jpg"
# alias proff="xrandr --output HDMI-1 --off && feh --bg-fill $HOME/bilder/wallpaper/liebe.jpg"

# only second monitor
alias big="xrandr --output eDP-1 --off --output HDMI-1 --auto && feh --bg-fill $HOME/bilder/wallpaper/liebe.jpg"
alias sml="xrandr --output HDMI-1 --off --output eDP-1 --auto && feh --bg-fill $HOME/bilder/wallpaper/liebe.jpg"

alias ud="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y"

alias tv="vim +LLPStartPreview"
alias ctv="~/.config/tv.sh"
alias mdv="vim +MarkdownPreview"

# Convenience
alias r="lfcd"
alias i="devour sxiv -rfb"
alias z="devour zathura"
alias ydl="~/.config/ydl.sh"

# youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "

# Dev
alias v="vim"
alias sv="sudoedit"
alias m="make"
alias g="git"
alias ga="git add"
alias gu="git pull"
alias gp="git push"
alias gc="git commit"
alias gs="git status"
alias gpc="git push -u custom"

# Configs
alias vba="vim ~/.bash_aliases; . ~/.bash_aliases"
alias vrc="vim ~/.bashrc; . ~/.bashrc"
alias vvrc="vim ~/.vim/vimrc"
alias va="vim ~/.config/alacritty/alacritty.yml"

## XMonad
alias vx="vim ~/.xmonad/xmonad.hs"
alias vxb="vim ~/.config/xmobar/xmobarrc"
# alias vi3="vim ~/.config/i3/config"

alias :q="exit"
alias ..="cd .."
alias ...="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias de='setxkbmap de'
alias us='setxkbmap us -variant intl'
