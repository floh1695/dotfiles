#!/bin/bash

# includes
srcdir="$HOME/.etcbash"
source "$srcdir/colors.bash"

# PS Variables

C1=$BIWhite
C2=$BYellow
C3=$BBlue
C4=$BYellow
C5=$BGreen
C6=$BRed
export PS1="$C1[$C2\u$C3@$C4\H$C1]$C1[$C5\W$C1]$C1[$C6\$$C1]$C4-> $Color_Off"
export PS2="$C4-> $Color_Off"

