#!/usr/bin/env bash

set -ue

function set_default_app() {
	mkdir -p "$HOME"/.local/bin
	local list=$1
	local dist=$2
	for target in $list; do
		local target_path
		target_path=$(command -v "$target" 2>/dev/null || true)
		if [[ -n "$target_path" ]]; then
			ln -snf "$target_path" "$HOME"/.local/bin/"$dist"
			break
		fi
		target_path=$(compgen -c | \grep "$target" | sort | head -n 1 | xargs which 2>/dev/null || true)
		if [[ -n "$target_path" ]]; then
			ln -snf "$target_path" "$HOME"/.local/bin/"$dist"
			break
		fi
	done
}

set_default_app "brave-bin firefox" x-www-browser # TODO: Check if this is correct
set_default_app "wezterm alacritty urxvt gnome-terminal" x-terminal-emulator
