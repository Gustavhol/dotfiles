
 # Adds every command per working directory in ./zsh_history_ext for later referencing
function zshaddhistory() {
	echo "${1%%$'\n'}|${PWD}   " >> ~/scripts/logs/.zsh_history_ext
}
