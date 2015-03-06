#!/bin/bash

install() {
  src="$1"
  env="$2"
  nam="$3"
  mkdir -p "$env"
  cp -f "$src" "$env"
  if [ "$nam" != "" ]; then
    ln -sf "$env/$src" $nam
  fi
}

install_dir() {
  env="$1"
  dir="$2"
  mkdir -p "$env"
  ln -sf "$env" "$dir"
}

#.bashrc
bashdir="$HOME/envir/etc/bashrc"
install_dir "$bashdir" "$HOME/.etcbash"
install "bash_profile.bash" "$bashdir" "$HOME/.bash_profile"
install "bashrc.bash"       "$bashdir" "$HOME/.bashrc"
install "colors.bash"       "$bashdir" ""

#.vimrc
vimdir="$HOME/envir/etc/vimrc"
install_dir "$vimdir" "$HOME/.etcvim"
install "vimrc.vim" "$vimdir" "$HOME/.vimrc"

#.gitconfig
gitdir="$HOME/envir/etc/git"
install_dir "$gitdir" "$HOME/.etcgit"
install "gitconfig.git" "$gitdir" "$HOME/.gitconfig"
install "gitignore.git" "$gitdir" "$HOME/.gitignore"

