# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# ZSH theme
~/scripts/theme.sh doom-one

    # Set fzf installation directory path
# export FZF_BASE=/path/to/fzf/install/dir
export FZF_CTRL_T_COMMAND='rg --files --hidden --follow'
export FZF_DEFAULT_OPTS='--height 50% --reverse --extended --preview "head -100 {}"'

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
zsh-z
npm
sudo
nvm
git
fzf
zsh-autosuggestions
# syntax highlighting must be sourced last
zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

########################
## USER CONFIGURATION ##
########################
# 
# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

 # ZSH-autosuggestions overrides
 ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5b6268,bg=#272c34"
 ZSH_AUTOSUGGEST_STRATEGY=(history completion)

 # Adds every command per working directory in ./zsh_history_ext for later referencing
function zshaddhistory() {
	echo "${1%%$'\n'}|${PWD}   " >> ~/scripts/logs/.zsh_history_ext
}

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.


#######################
## TEMPORARY BUG FIX ##
#######################

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}

zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

#################
###  VI MODE  ###
#################

bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# ci"
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# ci{, ci(, di{ etc..
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line


####################
###  NAVIGATION  ###
####################

# Use lf to switch directories and bind it to ctrl-o
#lfcd () {
#    tmp="$(mktemp)"
#    lf -last-dir-path="$tmp" "$@"
#    if [ -f "$tmp" ]; then
#        dir="$(cat "$tmp")"
#        rm -f "$tmp"
#        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
#    fi
#}

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
bindkey -s '^o' 'rangercd\n'

# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac --height "50%" | sed -r 's/ *[0-9]*\*? *//' | sed -r 's/\\/\\\\/g')
}
bindkey -s '^f' 'fh\n'

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


######################
###  HOUSEKEEPING  ###
######################

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"
path+=(
    '/home/gustav/.emacs.d/bin/'
    '/home/gustav/go/bin'
    '/usr/local/sbin'
    '/usr/local/bin'
    '/usr/sbin'
    '/usr/bin'
    '/sbin'
    '/bin'
    '/snap/bin'
)
export PATH

# source /usr/share/nvm/init-nvm.sh
