# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# ZSH theme
~/scripts/theme.sh doom-one

# Dotfiles directory
DOTFILES=$HOME/.config

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

#######################
## OH MY ZSH PLUGINS ##
#######################

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
zsh-z
npm
sudo
nvm
git
# fzf
zsh-autosuggestions
# syntax highlighting must be sourced last
zsh-syntax-highlighting
)


source $ZSH/oh-my-zsh.sh
###########################
## LOAD ZSH CONFIG FILES ##
###########################

# Adapted from https://github.com/holman/dotfiles/
typeset -U config_files
config_files=($DOTFILES/zsh/*.zsh)
# load config files
for file in ${config_files}
do
  source $file
done

######################
###  HOUSEKEEPING  ###
######################

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"
export PATH

