#!/usr/bin/env bash

[ $(uname) == 'Darwin' ] && OS='mac'
[ -e /etc/lsb-release ] && OS='devian'

case $OS in
'mac' )
    ;;
'devian' )
    sudo sh -c  "curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
    chmod +x /usr/local/bin/docker-compose
esac

