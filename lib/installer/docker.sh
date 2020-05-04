#!/usr/bin/env bash

[ $(uname) == 'Darwin' ] && OS='mac'
[ -e /etc/lsb-release ] && OS='devian'

case $OS in
'mac' )
  ;;
'devian' )
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo -E add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
     $(lsb_release -cs) \
     stable"
  sudo apt install -y docker-ce
  ;;
esac

