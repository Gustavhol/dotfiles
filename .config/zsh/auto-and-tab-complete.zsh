#           ______                      __     __  _           
#          / ____/___  ____ ___  ____  / /__  / /_(_)___  ____ 
#         / /   / __ \/ __ `__ \/ __ \/ / _ \/ __/ / __ \/ __ \
#        / /___/ /_/ / / / / / / /_/ / /  __/ /_/ / /_/ / / / /
#        \____/\____/_/ /_/ /_/ .___/_/\___/\__/_/\____/_/ /_/ 
#                            /_/                               


# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
