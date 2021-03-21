
 # ZSH-autosuggestions overrides
 ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5b6268,bg=#272c34"
 ZSH_AUTOSUGGEST_STRATEGY=(history)
 # Disabeling completion until i find a way to speed it up
 # ZSH_AUTOSUGGEST_STRATEGY=(history completion)

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

