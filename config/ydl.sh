#!/bin/bash

if [[ $# < 2 ]]; then
    echo "Usage: ydl.sh <filename> <URL>"
    echo -e "\n\tNote: don't care about extension"
else
    pushd ~/musik
    youtube-dl -x --audio-format mp3 -o "$1.%(ext)s" $2
    popd
fi

