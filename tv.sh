#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: tv.sh <filename>"
    exit 1
fi

F=$1
cp ~/.config/sample.tex $F
vim +LLPStartPreview $F
