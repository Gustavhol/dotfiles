#!/usr/bin/env bash

xclip -selection c -o | jq "." | xclip -sel c
