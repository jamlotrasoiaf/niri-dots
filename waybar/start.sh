#!/bin/sh
killall waybar
waybar -c ~/.config/waybar/config1.jsonc &
waybar -c ~/.config/waybar/config2.jsonc
