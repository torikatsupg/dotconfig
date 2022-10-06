#!/bin/sh

base=`pwd`
echo $base

# install zinit
# sh -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# linking
ln -s "$base/home/.zshrc ~/.zshrc"
ln -s "$base/home/.zshrc ~/.zshrc"
ln -s "$base/home/.tmux.conf ~/.tmux.conf"
ln -s "$base/nvim ~/.config/nvim"
ln -s "$base/alacritty ~/.config/alacritty"

# check requirement
which rg
which fd
which jq
which fzf
which ghq
