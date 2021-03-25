#           ___       __    __   __    _      __                  
#          /   | ____/ /___/ /  / /_  (_)____/ /_____  _______  __
#         / /| |/ __  / __  /  / __ \/ / ___/ __/ __ \/ ___/ / / /
#        / ___ / /_/ / /_/ /  / / / / (__  ) /_/ /_/ / /  / /_/ / 
#       /_/  |_\__,_/\__,_/  /_/ /_/_/____/\__/\____/_/   \__, /  
#                                                        /____/   


 # Adds every command per working directory in ./zsh_history_ext for later referencing
function zshaddhistory() {
	echo "${1%%$'\n'}|${PWD}   " >> ~/scripts/logs/.zsh_history_ext
}
