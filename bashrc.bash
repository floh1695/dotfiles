#!/bin/bash

bash_dir="${HOME}/.envir/selected/etc/bash"
if [ -d "${bash_dir}" ]; then
    pushd "${bash_dir}" >> /dev/null
    source bashrc.bash
    popd >> /dev/null
else
    PS1="\u@\h \W \$ "
fi
