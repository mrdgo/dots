#!/bin/sh
tmux list-windows | awk "{print $2}" | sed 's/-//g' | paste -s -d $' '
