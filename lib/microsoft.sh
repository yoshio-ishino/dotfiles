. $(dirname $0)/lib/func.sh

ROOT_PATH="/c/Users/$(whoami)"
HOME_DIR=$ROOT_PATH/home

_create_home() {
  func_msg title '[INFO]: Create HOME directory for '$OS'.'
  mkdir $HOME_DIR
  func_msg success 'Created '$HOME_DIR''
  tmpfile=$(mktemp)
  sudo cp /etc/passwd /etc/passwd.org
  sudo cat /etc/passwd > $tmpfile
  cat $tmpfile | sudo sh -c "sed -e 's|\('$user'.*.,:\)/.*.\(/bin/bash\)|\1'$HOME_DIR':\2|' >/etc/passwd"
  rm $tmpfile
  func_msg success 'Setuped /etc/passwd. Please execute this script again.'
  exit 1
}

_create_symlinks() {
  func_msg title '[INFO]: Create symlinks for '$OS'.'
  ln -snf $ROOT_PATH/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup $HOME/startup &&
  func_msg success 'Startup'
  ln -snf $ROOT_PATH/Desktop $HOME/desktop &&
  func_msg success 'Desktop'
  ln -snf $ROOT_PATH/Downloads $HOME/downloads &&
  func_msg success 'Downloads'
  [ ! -e $ROOT_PATH/Documents/work ] && mkdir $ROOT_PATH/Documents/work
  ln -snf $ROOT_PATH/Documents/work $HOME/work &&
  func_msg success 'Documents/work'
}

_setup_windows_terminal_conf() {
  W_PATH=$ROOT_PATH/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState
  [ -e $W_PATH ] && ln -nf $HOME/dotfiles/etc/windows_terminal/settings.json $W_PATH
  func_msg success profiles.json
}

_setup_wsl_conf() {
  sudo \cp -f $HOME/dotfiles/etc/wsl.conf /etc/wsl.conf
  func_msg success wsl.conf
}

_setup_sendto_conf() {
  sudo \cp -f $HOME/dotfiles/etc/unc_path_converter.vbs $ROOT_PATH/AppData/Roaming/Microsoft/Windows/SendTo
  func_msg success unc_path_converter.vbs
}

main() {
  [ ! -d $HOME_DIR ] && _create_home || _create_symlinks
  func_dotfiles
  _setup_windows_terminal_conf
  _setup_wsl_conf
  _setup_sendto_conf
  func_install
}
