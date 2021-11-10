#!/usr/bin/env bash


func_msg() {
  case $1 in
  'title') tput smul; tput setaf 5 && echo -e "\n${2}\n"; tput rmul ;;
  'success') tput setaf 2 && echo "   ✓ $2" ;;
  esac
}

func_dotfiles() {
  _ln() {
    ln -snf $HOME/dotfiles/etc/$1 $2
  }

  func_msg title '[INFO]: Setup dotfiles for '$OS'.'
  for f in $(find $HOME/dotfiles/etc -name '.*' | xargs -n1 basename); do
    [ $f = '.vimrc' ] && _ln $f $HOME/.config/nvim/init.vim || _ln $f $HOME/$f
    func_msg success $f
  done
  printf '\n'

  func_msg title '[INFO]: Setup other config files.'
  cp -r $HOME/dotfiles/etc/vim/colors $HOME/.config/nvim
	func_msg success "$(ls $HOME/.config/nvim/colors)"
}

func_install() {
  PACKAGES='nvim tmux peco docker docker-compose'

  _exec_install() {
    which $1 >/dev/null && func_msg success $1 || . $HOME/dotfiles/lib/installer/$1.sh
  }

  func_msg title '[INFO]: Install packages for '$OS'.'
  for i in $PACKAGES;do _exec_install $i;done
  printf '\n'
}
