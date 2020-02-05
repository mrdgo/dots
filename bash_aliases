alias screencast="ffmpeg -f x11grab -s 1920x1080 -i :0.0 out.mkv"
alias webcast="ffmpeg -i /dev/video1 -c:v libx264 out.mkv"

alias uni="ssh ty82xile@faui0sr0.cs.fau.de"

alias pi1='ssh -J ty82xile@i4lab1.cs.fau.de pi@10.188.42.164'
alias pi2='ssh -J ty82xile@i4lab1.cs.fau.de pi@10.188.42.172'

alias vpn='/opt/cisco/anyconnect/bin/vpnui'

alias spic="cd ~/dokumente/hiwi/i4/unittests/uebungen"
alias sü="cd ~/dokumente/hiwi/i4/SPIC_WS19/folien"
alias mp="cd ~/dokumente/uni/masterprojekt/pi_files/polar_rs/"
alias ma="cd ~/dokumente/uni/marbeit"
alias moc="cd ~/dokumente/uni/WS19/modcrypt"
alias ru="cd ~/dokumente/uni/misc/rust/learn"
alias hs="cd ~/dokumente/uni/haskell"

# non uni shortcut
alias yt="cd ~/videos/youtube"
alias dl="cd ~/github/dl_course/Deep_Learning_A_Z"

# enable second monitor
alias pres="xrandr --output HDMI1 --mode 1024x768 --same-as eDP1"

# only second monitor
alias big="xrandr --output eDP1 --off --output HDMI1 --auto && feh --bg-fill $HOME/bilder/wallpaper/liebe.jpg"

alias sml="xrandr --output HDMI1 --off --output eDP1 --auto && feh --bg-fill $HOME/bilder/wallpaper/liebe.jpg"

alias rst="cd ~/github/learnRest"
alias dfs="cd ~/github/dfs"

alias ud="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y"

alias mail="neomutt"

alias tv="vim +LLPStartPreview"
alias ctv="~/.config/tv.sh"
alias mdv="vim +MarkdownPreview"

alias tor="~/util/tor-browser_en-US/Browser/start-tor-browser --detach"

alias v="vim"
alias sv="sudo vim"
alias r="lfcd"
alias i="sxiv -rf"
alias z="zathura"
alias w="pwd"
alias m="make"

alias g="git"
alias ga="git add"
alias gu="git pull"
alias gp="git push"
alias gc="git commit"
alias gs="git status"
alias gpc="git push -u custom"

alias ydl="~/.config/ydl.sh"
alias vba="vim ~/.bash_aliases; . ~/.bash_aliases"
alias vrc="vim ~/.bashrc; . ~/.bashrc"
alias clean_file='sed -i.bak "/^s*[#;]/d;/^$/d"'

alias :q="exit"
alias fup="sudo updatedb"
alias f="locate"
alias lo="locate"

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
