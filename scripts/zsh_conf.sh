#!/bin/sh
fn_assert () {
while true; do
        read -r -p "Select $PART for editing [Y/n] " input
        if [[ -z "$input" ]]; then
            nvim $PART; exit 1
        fi
        case "$input" in
            [Yy][Ee][Ss]|[Yy]|[-z]*)
        nvim $PART; break;;
            [Nn][Oo]|[Nn]*)
        echo "No editing will take place. Exiting."; exit 1;;
            *)
        echo "Invalid input, answer y or n."; fn_assert; break ;;
        esac
done       
}

echo 'Select file to edit:'

for part in ~/.config/zsh/*
do n=$((n+1))
    printf "[%s] %s\n" "$n" "$part"
    eval "part${n}=\$part"
done

if [ "$n" -eq 0 ]
then
    echo >&2 No files found
    exit
fi

printf 'Enter file index ID (1 to %s): ' "$n"
read -r num
num=$(printf '%s\n' "$num" | tr -dc '[:digit:]')

if [ "$num" -le 0 ] || [ "$num"  -gt "$n" ]
then 
    echo >&2 Invalid selection
    exit 1
else
    eval "PART=\$part${num}"
    fn_assert
fi


