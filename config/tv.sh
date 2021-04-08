#!/bin/sh

if [ $# -eq 0 ]; then
    echo "Usage: tv.sh <filename> # no '.tex'!!"
    exit 1
fi

cp ~/.config/sample.tex $1.tex
nvim +VimtexCompile $1.tex
