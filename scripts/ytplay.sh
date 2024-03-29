#!/usr/bin/env bash

# ----------------------------------------------------------------------------
# ytplay: a command line program for displaying YouTube videos as ASCII output
# ----------------------------------------------------------------------------
# Dependencies:
# youtube-dl (https://github.com/ytdl-org/youtube-dl)
# streamlink (https://github.com/streamlink/streamlink)
# mplayer
# mpv

CLEAR='\033[0m'
RED='\033[0;31m'

function usage() {
  if [ -n "$1" ]; then
    echo -e "${RED}👉 $1${CLEAR}\n"
  fi

  cat << EOF
  Usage: $(basename $0) [REQUIRED -u url] [options]
    -h, --help     Show this message
    -u, --url      (Required) URL
    --classic      Classic mode, which plays in black and white using aalib instead
    -c, --caca     Uses libcaca to display output instead

  Examples: $(basename $0) --classic -u "https://www.youtube.com/watch?v=5qap5aO4i9A"
EOF
}

# parse params
while [[ "$#" > 0 ]]; do case $1 in
      -h|--help)   usage; exit 0 ;;
      -u|--url)    URL="$2"; shift; shift ;;
      --classic)   CLASSIC=1; shift ;;
      -c|--caca)   CACA=1; shift ;;
      *)           usage "Unknown parameter passed: $1"; exit 1 ;;
esac; done

if [ -z "$URL" ]; then
  usage "No URL specified"
  exit 1
fi

if [ -n "$CACA" ]; then
  # if caca is specified
  streamlink "$URL" best --player mpv -a "--vo=caca"
  exit 0
elif [ -n "$CLASSIC" ]; then
  # if classic is specified
  youtube-dl "$URL" -f best -o - | mplayer -vo aa -monitorpixelaspect 0.5 -
  exit 0
else
  # else, play the video inline directly in the terminal with colors
  youtube-dl --quiet --no-warnings "$URL" -f best -o - | mpv --vo=tct -
  exit 0
fi
