#           ____  ___  ________  __
#          / __ \/   |/_  __/ / / /
#         / /_/ / /| | / / / /_/ / 
#        / ____/ ___ |/ / / __  /  
#       /_/   /_/  |_/_/ /_/ /_/   
#                                  


# Prepend to path if entry does not exist.
# This version from: https://superuser.com/questions/39751/add-directory-to-path-if-its-not-already-there
path_prepend() {
    if [ -d $1 ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$1${PATH:+":$PATH"}"
    fi
}

# Doom emacs
DOOM_PATH=$HOME/.emacs.d/bin
path_prepend $DOOM_PATH



#python3
PYTHON3_PATH=/usr/local/opt/python/libexec/bin
path_prepend $PYTHON3_PATH


# Go
export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin
path_prepend $GOBIN

# User path
path_prepend $HOME/.local/bin
path_prepend /usr/bin
path_prepend /usr/sbin
path_prepend /usr/local/bin
path_prepend /usr/local/sbin

# export PATH

