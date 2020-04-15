#!/bin/sh
amixer -q sset Master 5%-
kill -47 `ps -aux | awk '/dwmblocks/ && !/awk/ {print $2}'`
