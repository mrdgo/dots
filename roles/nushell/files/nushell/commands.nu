def set_bg [light: string] {
    let base = $nu.home-path/.config/alacritty/alacritty_base.yml
    let res = $nu.home-path/.config/alacritty/alacritty.yml
    open $base | from yaml | append (open $nu.home-path/.config/alacritty/gruvbox_"$light".yml | from yaml) | save $res
}

def tryb [] {
    let sess = tryb
    tmux new-session -d -s $sess -c ~/tryb

    # create windows
    tmux rename-window -t "$sess":0 dev
    tmux neww -t "$sess":1 -n docker -c ~/tryb/docker
    tmux neww -t "$sess":2 -n back   -c ~/tryb

    tmux send-keys -t "$sess":1 "docker compose start" C-m
    tmux send-keys -t "$sess":2 "lazygit" C-m

    tmux select-window -t "$sess":0 \; attach -t $sess
}

### ARCHIVE EXTRACTION
# usage: ex <file>
# def ex [1: string] {
#     if [ -f $1  ] ; then
#         case $1 in
#             *.tar.bz2)   tar xjf $1   ;;
#             *.tar.gz)    tar xzf $1   ;;
#             *.bz2)       bunzip2 $1   ;;
#             *.rar)       unrar x $1   ;;
#             *.gz)        gunzip $1    ;;
#             *.tar)       tar xf $1    ;;
#             *.tbz2)      tar xjf $1   ;;
#             *.tgz)       tar xzf $1   ;;
#             *.zip)       unzip $1     ;;
#             *.Z)         uncompress $1;;
#             *.7z)        7z x $1      ;;
#             *.deb)       ar x $1      ;;
#             *.tar.xz)    tar xf $1    ;;
#             *.tar.zst)   unzstd $1    ;;
#             *)           echo "'$1' cannot be extracted via ex()" ;;
#         esac
#     else
#         echo "'$1' is not a valid file"
#     fi
# }


# lsgrok() {
#   url=$(curl http://localhost:4040/api/tunnels 2>/dev/null | jq -r '.tunnels[0].public_url')
#
#   if [ "$url" = "" ] || [ "$url" = "null" ]; then
#    echo No tunnels running?
#   else
#    host=$(echo "$url" | cut -d / -f 3 | cut -d : -f 1)
#    port=$(echo "$url" | cut -d / -f 3 | cut -d : -f 2)
#
#    echo ssh -p "$port" "$(whoami)"@"$host"
#   fi
# }

def ngrok_init [] {
  let sess = ngrok
  tmux new-session -s $sess -d
  tmux send -t "$sess":0 "ngrok tcp --region=eu 22" ENTER
  tmux neww -t "$sess":1
  tmux send -t "$sess":1 "ngrok tcp --region=eu 4200" ENTER
}

alias myip = "wget -qO- https://ipecho.net/plain ; echo"
