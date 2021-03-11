#!/usr/bin/env bash

grep -a "${PWD}   " ~/scripts/logs/.zsh_history_ext | cat | cut -f1 -d"|" | tail

