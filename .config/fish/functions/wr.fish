# Defined in - @ line 1
function wr --wraps='wormhole receive' --description 'alias wr=wormhole receive'
  wormhole receive $argv;
end
