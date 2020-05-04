#!/usr/bin/env bash

OS='Microsoft Ubuntu Darwin'
for os in $OS;do uname -r | grep $os >/dev/null && OS="$os";done

case $OS in
'Microsoft') . $(dirname $0)/lib/microsoft.sh && main ;;
'Ubuntu') . $(dirname $0)/lib/ubuntu.sh && main ;;
'Darwin') . $(dirname $0)/lib/ubuntu.sh && main ;;
esac
