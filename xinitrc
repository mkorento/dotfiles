#!/usr/bin/env sh
# xrandr --newmode "1920x1080_60.00"  172.80  1920 2040 2248 2576  1080 1081 1084 1118 -hsync +vsync
# xrandr --addmode VGA1 1920x1080_60.00
xcompmgr &
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
exec i3 -c /home/mika/.i3/config -V >> /tmp/i3log-$(date +'%F-%k-%M-%S') 2>&1
