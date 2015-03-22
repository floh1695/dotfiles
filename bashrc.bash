#!/bin/bash

# includes
srcdir="$HOME/.envir/etc/bash"
source "$srcdir/style.bash"

# environment variables
export PATH="${PATH}:${HOME}/bin"
pick_visual() {
  if type vim &> /dev/null; then
    VISUAL="vim"
  elif type emacs &> /dev/null; then
    VISUAL="emacs -nw"
  elif type vi &> /dev/null; then
    VISUAL="vi"
  elif type nano &> /dev/null; then
    VISUAL="nano"
  fi
  export VISUAL
  export EDITOR="${VISUAL}"
  unset -f pick_visual
}
pick_pager() {
  if type less &> /dev/null; then
    export LESS="-R"
    PAGER="less"
  elif type more &> /dev/null; then
    PAGER="more"
  fi
  export PAGER
  unset -f pick_pager
}
pick_browser() {
  if type firefox &> /dev/null; then
    BROWSER="firefox"
  elif type chromium &> /dev/null; then
    BROWSER="chromium"
  elif type opera &> /dev/null; then
    BROWSER="opera"
  elif type midori &> /dev/null; then
    BROWSER="midori"
  fi
  export BROWSER
  unset -f pick_browser
}
pick_visual
pick_pager
pick_browser
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

