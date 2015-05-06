#!/bin/bash

source "colors.bash"

prompt_set() {
  PS1_EXIT_STATUS="${?}"
  if [ $UID -eq 0 ]; then
    PS1="${Red}"
  else
    PS1="${Yellow}"
  fi
  PS1+="\u${Cyan}@${Yellow}\h"
  if [ -f "${HOME}/.virtualname" ]; then
    PS1+="${Cyan}@${Yellow}$(cat ${HOME}/.virtualname)"
  fi
  PS1+=" ${White}[${Green}\W${White}] "
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

