#!/bin/bash

# includes
srcdir="$HOME/.etcbash"
source "$srcdir/style.bash"

export PATH="${PATH}:${HOME}/bin"

pick_visual() {
  if type vim &> /dev/null; then
    echo "vim"
  elif type emacs &> /dev/null; then
    echo "emacs -nw"
  elif type vi &> /dev/null; then
    echo "vi"
  elif type nano &> /dev/null; then
    echo "nano"
  else
    echo ""
   fi
}
pick_pager() {
  if type less &> /dev/null; then
    export LESS="-R"
    echo "less"
  elif type more &> /dev/null; then
    echo "more"
  else
    echo ""
  fi
}
pick_browser() {
  if type firefox &> /dev/null; then
    echo "firefox"
  elif type chromium &> /dev/null; then
    echo "chromium"
  elif type opera &> /dev/null; then
    echo "opera"
  elif type midori &> /dev/null; then
    echo "midori"
  else
    echo ""
  fi
}
export BROWSER="$(pick_browser)"
export VISUAL="$(pick_visual)"
export EDITOR="$(pick_visual)"
export PAGER="$(pick_pager)"
export TERMINAL="" #TODO: Find a good list of terminal emulators to default to
unset -f pick_browser
unset -f pick_visual
unset -f pick_pager
printvars() {
  echo "PATH:    $PATH"
  echo "EDITOR:  $EDITOR"
  echo "VISUAL:  $VISUAL"
  echo "PAGER:   $PAGER"
  echo "BROWSER: $BROWSER"
}

# Aliases
alias ls='ls --color=auto -Fh'
alias ll='ls -l'
alias la='ll -a'
alias lr='ll -R'
alias l='ls -C'
alias c='clear'
alias clear="source $HOME/.bashrc; command clear"
pushd() {
  if [ $# -eq 0 ]; then
    DIR="${HOME}"
  else
    DIR="$1"
  fi
  if [ -d "${DIR}" ]; then
    builtin pushd "${DIR}" &> /dev/null
  else
    echo "no directory: \"${DIR}\""
  fi
}
pushd_builtin() {
  builtin pushd &> /dev/null
}
popd() {
  builtin popd &> /dev/null
}
alias cd='pushd'
alias back='popd'
alias flip='pushd_builtin'
alias dirs='dirs -v'

# shopt
shopt -s checkwinsize

