#!/usr/bin/env bash

[ $(uname) == 'Darwin' ] && OS='mac'
[ -e /etc/lsb-release ] && OS='devian'

case $OS in
'mac' )
  brew install peco ;;
'devian' )
  sudo apt install peco ;;
esac
