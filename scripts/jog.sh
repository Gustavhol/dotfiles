#!/usr/bin/env bash

grep -a "${PWD}   " ~/.zsh_history_ext | cat | cut -f1 -d"|" | tail -n 20

