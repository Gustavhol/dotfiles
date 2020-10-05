# Defined in - @ line 1
function doomrefresh --wraps='~/.emacs.d/bin/doom refresh' --description 'alias doomrefresh=~/.emacs.d/bin/doom refresh'
  ~/.emacs.d/bin/doom refresh $argv;
end
