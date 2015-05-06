#!/bin/bash

bash_dir="${HOME}/.envir/selected/etc/bash"
if [ -d "${bash_dir}" ]; then
    pushd "${bash_dir}" >> /dev/null
    source "bash_profile.bash"
    popd >> /dev/null
else
    source "${HOME}/.bashrc"
fi

