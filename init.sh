#!/bin/sh

base=`pwd`

# install zinit
# sh -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# linking
mkdir -p ~/.hammerspoon
ln -s "$base/home/.zshrc" ~/.zshrc
ln -s "$base/home/.tmux.conf" ~/.tmux.conf
ln -s "$base/home/.gitconfig" ~/.gitconfig
ln -s "$(pwd)/nvim" ~/.config
ln -s "$base/alacritty" ~/.config/alacritty
ln -s "$base/hammerspoon/init.lua" ~/.hammerspoon/init.lua

# check requirement
which rg
which fd
which jq
which fzf
which ghq
