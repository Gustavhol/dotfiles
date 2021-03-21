
#################
###  ALIASES  ###
#################

# Emacs & Vim
alias v='nvim'
alias doomrefresh='~/.emacs.d/bin/doom refresh'
alias doomdoctor='~/.emacs.d/bin/doom doctor'
alias doomsync='~/.emacs.d/bin/doom sync'
alias doomupgrade='~/.emacs.d/bin/doom upgrade'
alias doombuild='~/.emacs.d/bin/doom build'
alias et='emacsclient -t'
 
# Common apps with flags
alias reddit="tuir --enable-media"
alias etcher="~/Documents/appimages/balenaEtcher-1.5.81-x64.AppImage&"
alias vtop='vtop --theme gruvbox'

# Bare git repo for dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Easy config of common dotfiles
alias zconf="nvim ~/.zshrc"
alias i3conf="nvim ~/.config/regolith/i3/config"
alias nvimconf="nvim ~/.config/nvim/init.vim"
alias reload='exec $SHELL'
alias restart='exec $SHELL'

# Nav and listing
alias la='exa -alh --color=auto --group-directories-first'
alias ls='exa -lh --color=auto --group-directories-first'
alias lt='exa -alhT --sort=.name --color=auto --group-directories-first'

# Scripts to make life easier
alias mm="~/.screenlayout/multimonitor.sh" # My xrandr script to set my docked view
alias jp='~/scripts/json_prettify.sh' # Takes JSON from the clipboard and puts it back formattet. Requires jq and xclip
alias ws='wormhole send' # Requires Magic Wormhole
alias wr='wormhole recieve'
alias ifconfig='ip address' # For those that live in the past
alias theme='~/scripts/theme.sh -i' # Interactive script to change the theme in the terminal
alias jog='~/scripts/jog.sh' # To list the last 10 commands in working directory
alias vpn='sudo openfortivpn'

#butler-burton
alias bb='butler-burton'
alias bbi='butler-burton ci'
alias bbo='butler-burton co'
alias bboc='butler-burton co -c'

# Git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias status='git status'
alias tag='git tag'
alias newtag='git tag -a'

# switch between shells
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Log out for changes to take effect.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Log out for changes to take effect.'"

# Other
alias grep="grep --color=auto"
