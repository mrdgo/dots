#!/bin/sh
xbacklight -inc 5
kill -46 `ps -aux | awk '/dwmblocks/ && !/awk/ {print $2}'`
