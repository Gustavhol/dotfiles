#           ____       ____            ____     ______    ___ __            
#          / __ \___  / __/___ ___  __/ / /_   / ____/___/ (_) /_____  _____
#         / / / / _ \/ /_/ __ `/ / / / / __/  / __/ / __  / / __/ __ \/ ___/
#        / /_/ /  __/ __/ /_/ / /_/ / / /_   / /___/ /_/ / / /_/ /_/ / /    
#       /_____/\___/_/  \__,_/\__,_/_/\__/  /_____/\__,_/_/\__/\____/_/     
#                                                                           


 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

 export PAGER='most'
