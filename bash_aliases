alias screencast="ffmpeg -f x11grab -s 1920x1080 -i :0.0"
alias webcast="ffmpeg -i /dev/video1 -c:v libx264 out.mkv"

set_bg ()
{
    base="$HOME/.config/alacritty/alacritty_base.yml"
    res="$HOME/.config/alacritty/alacritty.yml"
    cat $base $HOME/.config/alacritty/gruvbox_$1.yml > $res
}

alias bl="set_bg light"
alias bd="set_bg dark"

alias uni="ssh ty82xile@faui0sr0.cs.fau.de"
alias woody="ssh iwso024h@woody.rrze.fau.de"

alias pi1='ssh -J ty82xile@i4lab1.cs.fau.de pi@maximPi1'
alias pi2='ssh -J ty82xile@i4lab1.cs.fau.de pi@maximPi2'
alias bello="ssh -t -J ty82xile@i4lab1.cs.fau.de ty82xile@faui49bello3 'bash'"

# master thesis
alias cma="cd ~/dokumente/isento/gps"
alias pma="cd ~/dokumente/isento/gps && source venv_gps/bin/activate"
alias the="cd ~/dokumente/isento/thesis"

alias gstart="gcloud compute instances start eval-compute-3"
alias gstop="gcloud compute instances stop eval-compute-3"
alias gls="gcloud compute instances list"
alias gssh="gcloud compute ssh eval-compute-3"
alias gscp='gcloud compute scp'
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
alias ctv="~/.config/tv.sh"

# Convenience
alias i="devour sxiv -rfb"
alias z="devour zathura"
alias o="devour okular"
alias d="devour display"
alias ydl="~/.config/ydl.sh"
alias vlc="cvlc --key-quit q"
alias minecraft="devour ~/.minecraft/launcher/minecraft-launcher"

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
alias ytr="/opt/youtube_rss/youtube_rss.py"

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
alias tmux="TERM=xterm-256color tmux -f ~/.config/tmux.conf"

#alias ..="cd .." # bash legacy
alias ...="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."

alias ls='exa'
alias ll='exa -alF'
alias la='exa -a'
alias l='exa -F'
#
# general use
alias lg='exa -lbF --git'                                               # list, size, type, git
alias llg='exa -lbGF --git'                                             # long list
alias llm='exa -lbGF --git --sort=modified'                            # long list, modified date sort
alias lag='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list

# speciality views
alias lS='exa -1'			                                            # one column, just names
alias lt='exa --tree --level=2'                                         # tree

alias grep='rg'
alias ps='procs'

alias de='setxkbmap de'
alias us='setxkbmap us -variant intl'
alias dv='setxkbmap us -variant dvorak-intl'

# debian legacy
# alias ud="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y"

alias x='xplr'
alias p='paru'

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

alias 66-all='doas 66-all -z'
alias 66-dbctl='doas 66-dbctl -z'
alias 66-disable='doas 66-disable -z'
alias 66-enable='doas 66-enable -z'
alias 66-env='doas 66-env -z'
alias 66-hpr='doas 66-hpr -z'
alias 66-init='doas 66-init -z'
alias 66-inresolve='doas 66-inresolve -z'
alias 66-inservice='doas 66-inservice -z'
alias 66-instate='doas 66-instate -z'
alias 66-intree='doas 66-intree -z'
alias 66-ns='doas 66-ns -z'
alias 66-nuke='doas 66-nuke -z'
alias 66-parser='doas 66-parser -z'
alias 66-scanctl='doas 66-scanctl -z'
alias 66-scandir='doas 66-scandir -z'
alias 66-start='doas 66-start -z'
alias 66-stop='doas 66-stop -z'
alias 66-svctl='doas 66-svctl -z'
alias 66-tree='doas 66-tree -z'
alias 66-update='doas 66-update -z'
