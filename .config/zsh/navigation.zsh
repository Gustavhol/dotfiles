#           _   __            _             __  _           
#          / | / /___ __   __(_)___ _____ _/ /_(_)___  ____ 
#         /  |/ / __ `/ | / / / __ `/ __ `/ __/ / __ \/ __ \
#        / /|  / /_/ /| |/ / / /_/ / /_/ / /_/ / /_/ / / / /
#       /_/ |_/\__,_/ |___/_/\__, /\__,_/\__/_/\____/_/ /_/ 
#                           /____/                          


#Use ranger to switch directories and bind it to ctrl-o
rangercd () {
    tmp="$(mktemp)"
    ranger --choosedir="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"                                               
    fi
}

# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac --height "50%" | sed -r 's/ *[0-9]*\*? *//' | sed -r 's/\\/\\\\/g')
}
