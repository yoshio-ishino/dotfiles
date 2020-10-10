#!/usr/bin/env bash

OS='Microsoft microsoft Ubuntu Darwin'
for os in $OS;do uname -r | grep $os >/dev/null && OS="$os";done

case $OS in
'Microsoft'|'microsoft') . $(dirname $0)/lib/microsoft.sh && main ;;
'Ubuntu') . $(dirname $0)/lib/ubuntu.sh && main ;;
'Darwin') . $(dirname $0)/lib/ubuntu.sh && main ;;
esac
