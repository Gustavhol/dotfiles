# Defined in - @ line 1
function reddit --wraps='tuir --enable-media' --description 'alias reddit=tuir --enable-media'
  tuir --enable-media $argv;
end
