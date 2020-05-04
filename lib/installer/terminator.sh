#!/usr/bin/env bash

[ $(uname) == 'Darwin' ] && OS='mac'
[ -e /etc/lsb-release ] && OS='devian'

case $OS in
'mac' )
  echo "[ERROR] sorry this OS is in preparation." ;;
'devian' )
  apt install terminator ;;
esac
