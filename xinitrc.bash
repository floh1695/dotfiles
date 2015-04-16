#!/bin/sh
if [ -f "$HOME/.Xresources" ]; then
    xrdb -merge "$HOME/.Xresources"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

if [ -f "${HOME}/.localxinitrc" ]; then
  source "${HOME}/.localxinitrc"
fi

if [ ! $# -eq 0 ]; then
  exec $@
elif type i3 > /dev/null; then
  exec i3 >> "$HOME/.i3/log.txt"
else
  echo -e "\n\n\n\n##### #####\n# Failed to load\n##### #####"
fi

