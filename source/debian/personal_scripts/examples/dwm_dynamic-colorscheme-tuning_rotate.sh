#!/usr/bin/sh

while true
do
    file=$(find /home/veprikov/Изображения/wallpapers -type -f | shuf -n1)
    wal -i $file
    /usr/bin/python3 /home/veprikov/.scripts/dwm_dynamic-colorscheme-tunning.py
    xrbd -merge /home/veprikov/.Xresouces
    xdotool key shift+Super+F5
    pywalfox update
    sleep 15m
done


