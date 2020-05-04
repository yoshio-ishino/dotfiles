#!/usr/bin/env bash

[ $(uname) == 'Darwin' ] && OS='mac'
[ -e /etc/lsb-release ] && OS='devian'

case $OS in
'mac' )
  echo "[ERROR] sorry this OS is in preparation." ;;
'devian' )
  git clone https://github.com/powerline/fonts.git --depth=1 &&
  ./fonts/install.sh
  which pip 2>&1 >/dev/null && pip install --user powerline-shell ||
  apt install -y python-pip && pip install --user powerline-shell ;;
esac
