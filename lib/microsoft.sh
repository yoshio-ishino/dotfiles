. $(dirname $0)/lib/func.sh


_create_symlinks() {
  func_msg title '[INFO]: Create symlinks for '$OS'.'
  ln -snf /mnt/c/Users/$(whoami)/desktop/ $HOME/desktop
  func_msg success 'Desktop'
}

main() {
  _create_symlinks
  func_install
  func_dotfiles
}
