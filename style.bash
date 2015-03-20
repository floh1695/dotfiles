#!/bin/bash

srcdir="$HOME/.etcbash"
source "$srcdir/colors.bash"
prompt_set() {
  PS1_EXIT_STATUS="${?}"
  PS1="${Yellow}\u${Cyan}@${Yellow}\h ${White}[${Green}\W${White}] "
  if [ ${PS1_EXIT_STATUS} -eq 0 ]; then
    PS1+="${Green}"
  else
    PS1+="${Red}"
  fi
  PS1+="\$${Yellow}-> ${Color_Off}"
  export PS1
  export PS2="${Yellow}-> ${Color_Off}"
}
export PROMPT_COMMAND="prompt_set"

