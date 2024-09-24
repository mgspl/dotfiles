#!/usr/bin/env bash

echo 'Installing hyprland'
# Hyprenv
paru -S --needed hyprland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk hypridle hyprlock hyprshot

echo 'Installing needed programs'
# Basic programs
paru -S --needed nemo nemo-fileroller file-roller firefox starship kdeconnect gammastep brightnessctl pamixer playerctl  kitty polkit-gnome gnome-keyring cachyos-armcord nwg-look nwg-displays wl-clipboard  ttf-ubuntu-mono-nerd zed
echo 'Install and configuring nwg-hello'
# Display Manager
paru -S --needed greetd nwg-hello
sudo systemctl enable greetd
cat > /tmp/greetd.conf <<EOF
[terminal]
vt = 1
[default_session]
command = "Hyprland -c /etc/nwg-hello/hyprland.conf"
user = "greeter"
EOF
sudo mv /tmp/greetd.conf /etc/greetd/

echo 'Installing AGS and dependecies'
# AGS
paru -S --needed aylurs-gtk-shell gnome-bluetooth-3.0 libdbusmenu-gtk3 libnotify libsoup3 networkmanager power-profiles-daemon bunjs-bin dart-sass fd swww

echo 'Installing hblock'
# hblock
paru -S --needed hblock
sudo systemctl enable hblock.timer

echo 'Installing Steam and proton(cachyos ver)'
# Gaming
paru -S --needed steam proton-cachyos

echo 'Installing GTK theme, Icon Theme and Cursor Theme'
# GTK Theme
paru -S --needed gnome-themes-extra gtk-engine-murrine sassc
git clone https://github.com/vinceliuice/Colloid-gtk-theme /tmp/gtk
sh /tmp/gtk/install.sh -c dark -l fixed --tweaks catppuccin rimless

# Icon Theme
git clone https://github.com/vinceliuice/Colloid-icon-theme /tmp/icon
sh /tmp/icon/install.sh -s catppuccin -notint

# Cursor Theme
paru -S --needed bibata-cursor-theme-bin

echo 'Installing dotfiles'
# Dotfiles
git clone https://github.com/mgspl/dotfiles /tmp/dotfiles
rm -rf ~/.config/hypr
rm -rf ~/.config/kitty
mv /tmp/dotfiles/hypr ~/.config
mv /tmp/dotfiles/ags  ~/.config
mv /tmp/dotfiles/kitty ~/.config
mv /tmp/dotfiles/starship.toml ~/.config
echo 'eval "$(starship init bash)"' >> ~/.bashrc

echo 'All done!!'
