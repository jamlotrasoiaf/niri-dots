#!/bin/sh
killall waybar
waybar -c $HOME/.config/waybar/config1.jsonc &
waybar -c $HOME/.config/waybar/config2.jsonc
