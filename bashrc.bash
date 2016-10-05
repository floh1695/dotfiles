#####
# ~/.bashrc
#
# NOTE: This is a simple bashrc script
#####

[[ $- != *i* ]] && return

#####
# PS Variables
# Broke the PS1 into multiple lines since I care about line length.
# Example output:
#   [user@host ~]$ echo high \
#   ...$ dare
#   high dare
#####
PS1=""
PS1+="\[\e[36m\]["
PS1+="\[\e[33m\]\u"
PS1+="\[\e[34m\]@"
PS1+="\[\e[33m\]\h"
PS1+="\[\e[0m\] "
PS1+="\[\e[32m\]\W"
PS1+="\[\e[36m\]]"
PS1+="\[\e[33m\]\$"
PS1+="\[\e[0m\] "
PS2=""
PS2+="\[\e[36m\]..."
PS2+="\[\e[33m\]\$"
PS2+="\[\e[0m\] "
export PS1
export PS2

#####
# Aliases
#####
# --color=auto :  Turn on color mode.
# -A           :  Do not list the files '.' and '..' .
# -B           :  Do not list file fitting '*~' .
# -C           :  Force entries to align to columns.
# -F           :  Add one of '*/=@|' to special files.
# -b           :  Print nonprinting charactures as octal escapes
# -h           :  Print file sizes in terms of K, M, G, etc. .
alias ls="ls --color=auto -ABCFbh"

#####
# Ruby related stuffs
#####
if which ruby >/dev/null && \
    which gem >/dev/null; then
    [[ ":$PATH:" != \
       *":$(ruby -rubygems -e 'puts Gem.user_dir')/bin:"* ]] && \
       PATH+=":$(ruby -rubygems -e 'puts Gem.user_dir')/bin"
    export PATH
fi

#####
# Standard export variables
#####
export VISUAL=vim

#####
# NOTE: This will load a system specific bashrc that will clobber
#   anything done here
#####
[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

#####
# NOTE: This should load auto completion stuffs
#####
[ -r /usr/share/bash-completion/bash_completion   ] && \
    . /usr/share/bash-completion/bash_completion

