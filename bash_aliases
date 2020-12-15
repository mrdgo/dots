alias screencast="ffmpeg -f x11grab -s 1920x1080 -i :0.0 out.mkv"
alias webcast="ffmpeg -i /dev/video1 -c:v libx264 out.mkv"
alias bat="cat /sys/class/power_supply/BAT0/capacity"

alias uni="ssh ty82xile@faui0sr0.cs.fau.de"
alias bello="ssh -t -J ty82xile@i4lab1.cs.fau.de ty82xile@faui49bello3 'bash'"

alias pi1='ssh -J ty82xile@i4lab1.cs.fau.de pi@10.188.42.175'
alias pi2='ssh -J ty82xile@i4lab1.cs.fau.de pi@maximPi2'

# master thesis
alias cma="cd ~/dokumente/isento/gps"
alias pma="cd ~/dokumente/isento/gps && source venv_gps/bin/activate"
# in XMonad press "M-S-b"
# alias pq="devour zathura ~/dokumente/isento/gps/pybullet_quickstartguide.pdf"

# master project
alias mp="cd ~/dokumente/uni/masterprojekt/pi_files/experiment/"

# enable second monitor
# alias pres="xrandr --output HDMI-1 --mode 1920x1080 --left-of eDP-1 && feh --bg-fill $HOME/bilder/wallpaper/liebe.jpg --bg-fill $HOME/bilder/wallpaper/liebe.jpg"
# alias proff="xrandr --output HDMI-1 --off && /home/maxim/.fehbg"

# only second monitor
alias big="xrandr --output eDP-1 --off --output HDMI-1 --auto && /home/maxim/.fehbg"
alias sml="xrandr --output HDMI-1 --off --output eDP-1 --auto && /home/maxim/.fehbg"

# vim life
alias v="nvim"
alias se="doas nvim"
alias ctv="~/.config/tv.sh"

# Convenience
alias r="lfcd"
alias i="devour sxiv -rfb"
alias z="devour zathura"
alias ydl="~/.config/ydl.sh"
alias fix="echo 218.8"
alias vlc="devour cvlc --key-quit q"

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
alias m="make"
alias g="git"
alias ga="git add"
alias gu="git pull"
alias gp="git push"
alias gc="git commit"
alias gs="git status"
alias gd="git diff"
alias gpc="git push -u custom"

## XMonad
alias vx="nvim ~/.xmonad/xmonad.hs"
alias vxb="nvim ~/.config/xmobar/xmobarrc"
# alias vi3="nvim ~/.config/i3/config"

alias ..="cd .."
alias ...="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."

alias ls='lsd'
alias ll='lsd -alF'
alias la='lsd -A'
alias l='lsd -F'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias de='setxkbmap de'
alias us='setxkbmap us -variant intl'

# debian legacy
# alias ud="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y"

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
