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

exec i3 >> "$HOME/.i3/log.txt"

