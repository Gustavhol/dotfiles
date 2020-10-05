# Defined in - @ line 1
function zconfig --wraps='emacs ~/.zshrc&' --description 'alias zconfig=emacs ~/.zshrc&'
  emacs ~/.zshrc& $argv;
end
