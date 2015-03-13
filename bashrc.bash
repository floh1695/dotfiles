#!/bin/bash

# includes
srcdir="$HOME/.etcbash"
source "$srcdir/colors.bash"

# Environment Variables
export PATH="$PATH:$HOME/bin"
pick_editor() {
  if type nano &> /dev/null; then
    echo "nano"
  elif type ed &> /dev/null; then
    echo "ed"
  else
    echo ""
  fi
}
export EDITOR="$(pick_editor)"
unset -f pick_editor
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
export VISUAL="$(pick_visual)"
unset -f pick_visual
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
export PAGER="$(pick_pager)"
unset -f pick_pager
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
unset -f pick_browser
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

pushd() {
  if [ $# -eq 0 ]; then
    DIR="${HOME}"
  else
    DIR="$1"
  fi
  builtin pushd "${DIR}" &> /dev/null
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

# PS Variables
C1=$BIWhite
C2=""
if [[ $EUID -ne 0 ]]; then
  C2=$BYellow
else
  C2=$BRed
fi
C3=$BBlue
C4=$BYellow
C5=$BGreen
C6=$BRed
export PS1="$C1[$C2\u$C3@$C4\h$C1]$C1[$C5\W$C1]$C1[$C6\$$C1]$C4-> $Color_Off"
export PS2="$C4-> $Color_Off"

