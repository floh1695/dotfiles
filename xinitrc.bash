#!/bin/sh

if [ -f "${HOME}/.envir/etc/X11/xshared.bash" ]; then
    source "${HOME}/.envir/etc/X11/xshared.bash"
fi

if [ ! $# -eq 0 ]; then
  exec $@
elif type i3 > /dev/null; then
  exec i3 >> "$HOME/.i3/log.txt"
else
  echo -e "\n\n\n\n##### #####\n# Failed to load\n##### #####"
fi

