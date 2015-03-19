#!/bin/bash

srcdir="$HOME/.etcbash"
source "$srcdir/colors.bash"

export PS1="${Yellow}\u${Cyan}@${Yellow}\h ${White}[${Green}\W${White}] ${Red}\$${Yellow}-> ${Color_Off}"
export PS2="${Yellow}-> ${Color_Off}"

