#!/usr/bin/env bash

OS='microsoft Ubuntu Darwin'
for os in $OS;do uname -r | grep $os >/dev/null && OS="$os";done

case $OS in
'microsoft' )
  sudo apt install -y neovim ;;
'Darwin' )
  brew install neovim ;;
'Ubuntu' )
  sudo apt install -y neovim && sudo apt install -y python3-neovim ;;
esac

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -snf $HOME/dotfiles/etc/.vimrc $HOME/.config/nvim/init.vim
ln -snf $HOME/dotfiles/etc/vim/colors $HOME/.config/nvim/colors
