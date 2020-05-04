#!/usr/bin/env bash

[ $(uname) == 'Darwin' ] && OS='mac'
[ -e /etc/lsb-release ] && OS='devian'

case $OS in
'mac' )
  brew install tmux &&
  brew install reattach-to-user-namespace ;;
'devian' )
  apt install tmux xsel;;
esac

#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
