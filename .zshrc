# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# ZSH theme
~/scripts/theme.sh one-half-black

# Display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

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
nvm
git
fzf
zsh-autosuggestions
# syntax highlighting must be sourced last
zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration
# 
# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
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

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Aliases
alias reddit="tuir --enable-media"
alias zconfig="emacsclient -c ~/.zshrc&"
alias etcher="~/Documents/appimages/balenaEtcher-1.5.81-x64.AppImage&"
alias pagraph="~/Downloads/pagraphcontrol/dist/pagraphcontrol-linux-x64/pagraphcontrol&"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias reload='source ~/.zshrc'
alias doomrefresh='~/.emacs.d/bin/doom refresh'
alias doomdoctor='~/.emacs.d/bin/doom doctor'
alias lsa='ls -a'
alias ls='ls -F -lh --color=auto'
alias mm="~/.screenlayout/multimonitor.sh"
alias vtop='vtop --theme gruvbox'
alias jp='~/scripts/json_prettify.sh'
alias v='nvim'
alias ws='wormhole send'
alias wr='wormhole recieve'
alias ifconfig='ip address'
alias theme='~/scripts/theme.sh -i'
alias exa='exa -F -lh'
alias exaa='exa -F -lh -a'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"
path+=(
    '/home/gustav/.emacs.d/'
    '/usr/local/sbin'
    '/usr/local/bin'
    '/usr/sbin'
    '/usr/bin'
    '/sbin'
    '/bin'
    '/snap/bin'
)
export PATH

