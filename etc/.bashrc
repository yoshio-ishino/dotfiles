. $HOME/dotfiles/etc/bash/common_cmd
. $HOME/dotfiles/etc/bash/env
. $HOME/dotfiles/etc/bash/alias


OS='Microsoft microsoft Ubuntu Darwin'
for os in $OS;do uname -r | grep $os >/dev/null && OS="$os";done

case $OS in
'Microsoft'|'microsoft')
  . $HOME/dotfiles/etc/bash/microsoft_cmd
  env_microsoft_only
  alias_microsoft_only
  ;;
'Ubuntu')
  alias_ubuntu_only
  ;;
'Darwin')
  ;;
esac
