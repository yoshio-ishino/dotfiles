#!/usr/bin/env bash

[ $(uname) == 'Darwin' ] && OS='mac'
[ -e /etc/lsb-release ] && OS='devian'

case $OS in
'mac' )
  brew install neovim ;;
'devian' )
  sudo apt install -y neovim && sudo apt install -y python3-neovim ;;
esac

git clone https://github.com/Shougo/dein.vim.git ~/.config/nvim/.vim/dein/repos/github.com/Shougo/dein.vim
ln -snf $HOME/dotfiles/etc/.vimrc $HOME/.config/nvim/init.vim
