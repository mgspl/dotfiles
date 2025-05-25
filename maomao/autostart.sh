#! /bin/bash
set +e

dbus-update-activation-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
# The next line of command is not necessary. It is only to avoid some situations where it cannot start automatically
/usr/lib/xdg-desktop-portal-wlr &

pipewire &
swaybg -i ~/.config/maomao/wallpaper.png &
waybar &
swaync &
gammastep &

/usr/libexec/polkit-gnome-authentication-agent-1 &

# KDE Connect replacement
flatpak run ca.andyholmes.Valent --gapplication-service &


# Idle
swayidle \
	timeout 1800 'swaylock -f' \
	timeout 1805 'wlopm --off eDP-1 --off HDMI-A-1 ' \
	resume 'wlopm --on eDP-1 --on HDMI-A-1' \
	timeout 300 ' brightnessctl s 65%' \
	resume 'brightnessctl s 100%' &

sway-audio-idle-inhibit &

swayosd-libinput-backend &
