#           _____  _____ __  __   ______            _____      
#          /__  / / ___// / / /  / ____/___  ____  / __(_)___ _
#            / /  \__ \/ /_/ /  / /   / __ \/ __ \/ /_/ / __ `/
#           / /_____/ / __  /  / /___/ /_/ / / / / __/ / /_/ / 
#          /____/____/_/ /_/   \____/\____/_/ /_/_/ /_/\__, /  
#                                                     /____/   


# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Path to dotfiles directory
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


# ZSH theme
~/scripts/theme.sh doom-one

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Source starship proppt
eval "$(starship init zsh)"

export PATH

if [ -e /home/gustav/.nix-profile/etc/profile.d/nix.sh ]; then . /home/gustav/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
