#################
## KEYBINDINGS ##
#################

bindkey -s '^o' 'rangercd\n'  # Navigate with ranger
bindkey -s '^f' 'fh\n'  # Fuzzy search command history

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

