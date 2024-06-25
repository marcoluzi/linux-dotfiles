#!/usr/bin/env bash

set -ue

source $(dirname "${BASH_SOURCE[0]:-$0}")/utilfuncs.sh

function install_extra() {
	local distro
	distro=$(whichdistro)
	if [[ $distro == "debian" ]]; then
		:
	elif [[ $distro == "redhat" ]]; then
		:
	elif [[ $distro == "arch" ]]; then
		sudo pacman -S --noconfirm --needed noto-fonts-cjk firefox-developer-edition brave-bin
		sudo pacman -S --noconfirm --needed sysstat alsa-utils
		sudo pacman -S --noconfirm --needed fcitx5-mozc fcitx5-configtool fcitx5-qt fcitx5-gtk fcitx5-lua
		# sudo pacman -S --noconfirm --needed fcitx-mozc fcitx-configtool fcitx-gtk3 fcitx-qt5
		sudo pacman -S --noconfirm --needed ttf-dejavu noto-fonts-emoji ttf-font-awesome
		source $(dirname "${BASH_SOURCE[0]:-$0}")/setup-fcitx.sh
	elif [[ $distro == "alpine" ]]; then
		:
	else
		:
	fi
}

install_extra
