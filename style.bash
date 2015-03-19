#!/bin/bash

srcdir="$HOME/.etcbash"
source "$srcdir/colors.bash"
prompt_set() {
  export PS1="${Yellow}\u${Cyan}@${Yellow}\h ${White}[${Green}\W${White}] ${Red}\$${Yellow}-> ${Color_Off}"
  export PS2="${Yellow}-> ${Color_Off}"
}
export PROMPT_COMMAND="prompt_set"

