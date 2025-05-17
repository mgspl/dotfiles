#! /bin/bash
set +e

dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
# The next line of command is not necessary. It is only to avoid some situations where it cannot start automatically
/usr/lib/xdg-desktop-portal-wlr &

swaybg -i ~/.config/maomao/wallpaper.png &
waybar &
swaync &
gammastep &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# KDE Connect replacement
valent --gapplication-service &
