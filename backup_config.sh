#! /bin/sh

set -e
set -x

cp -r ~/.config/i3 .config
cp -r ~/.config/i3status .config
cp -r ~/.config/i3status-rust .config
cp -r ~/.config/nvim .config
cp ~/.zshrc .
cp ~/.alacritty.yml .

