. $(dirname $0)/lib/func.sh

_setup_terminator_conf() {
   mkdir -p $HOME/.config/terminator
   slink terminator/config $HOME/.config/terminator/config
   func_msg success '.config/terminator/conf'
}

main() {
  func_dotfiles
  _setup_terminator_conf
  func_install
}
