# Defined in - @ line 1
function ifconfig --wraps='ip address' --description 'alias ifconfig=ip address'
  ip address $argv;
end
