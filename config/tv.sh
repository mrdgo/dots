#!/bin/sh

if [ $# -eq 0 ]; then
    echo "Usage: tv.sh <filename> # no '.tex'!!"
    exit 1
fi

F=$1
cp ~/.config/sample.tex $F.tex
zathura $F.pdf &
nvim +NeoTexOn $F.tex
