# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"
SOLARIZED_THEME="light"

# Uncomment the following line to display red dots whilst waiting for completion.
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
plugins=(git
zsh-z
git
fzf
zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Aliases
alias reddit="tuir --enable-media"
alias zconfig="emacs ~/.zshrc&"
alias etcher="~/Documents/appimages/balenaEtcher-1.5.81-x64.AppImage&"
alias pagraph="~/Downloads/pagraphcontrol/dist/pagraphcontrol-linux-x64/pagraphcontrol&"
alias omzconfig="emacs ~/.oh-my-zsh&"
alias config='/usr/bin/git --git-dir=$HOME/@HOME/.cfg/ --work-tree=$HOME'
alias reload='source ~/.zshrc'
alias doomrefresh='~/.emacs.d/bin/doom refresh'
alias lsa='ls -a -thor'
alias ls='ls -thor'
alias mm='xrandr --output HDMI-0 --off --output DP-2.1 --primary --mode 2560x1440 --pos 1920x152 --rotate normal --output DP-2.2 --mode 2560x1440 --pos 4480x0 --rotate left --output DP-2 --off --output DP-1 --mode 1920x1080 --pos 0x512 --rotate normal --output DP-0 --off'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
