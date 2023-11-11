# How to setup

## setup zinit
1. bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

## linking
1. ln -s $(pwd)home/.zshrc ~/.zshrc
1. ln -s $(pwd)home/.tmux.conf ~/.tmux.conf
1. ln -s $(pwd)nvim ~/.config/nvim
1. ln -s $(psd)alacritty ~/.config/alacritty

# Install foundations
1. brew install rg
1. brew install fd
1. brew install jq
1. brew install fzf
1. brew install ghq

# anyenv
1. brew install anyenv
1. anyenv install nodenv (required by copilot)

# build alacritty
1. brew install rustup

# setup vim-startuptime
1. brew install go 
2. go install github.com/rhysd/vim-startuptime@latest

# build nvim
WIP
1. brew install nvim


# Install font
1. [JetBrainsMono Nerd Font Complete](https://github.com/ryanoasis/nerd-fonts/tree/v2.2.1)


# Touch ID for sudo command
ln -s $(pwd)/etc/pam.d/sudo_local /etc/pam.d/sudo_local
