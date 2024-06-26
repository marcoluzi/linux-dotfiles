#!/usr/bin/env bash

set -ue

source $(dirname "${BASH_SOURCE[0]:-$0}")/utilfuncs.sh

function install_hyprland() {
	local distro
	distro=$(whichdistro)
	if [[ $distro == "debian" ]]; then
		:
	elif [[ $distro == "redhat" ]]; then
		:
	elif [[ $distro == "arch" ]]; then
		# sudo pacman -S --noconfirm --needed hyprland hyprpaper waybar \
		# 	hypridle hyprlock hyprcursor hyprlang \
		# 	xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
		sudo pacman -S --noconfirm --needed hyprland hyprpaper waybar hypridle hyprcursor hyprlang xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
	elif [[ $distro == "alpine" ]]; then
		:
	fi
}

install_hyprland
