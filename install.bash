#!/bin/bash

# Global variables
envir_dir="${HOME}/.envir"                       # Place where environments
                                                 #     and configs live
selected_dir="${envir_dir}/selected"             # A symlink to the currently
                                                 #     selected environment

# Set up directories/files that are static
mkdir -p "${envir_dir}"
ln -srf "${selected_dir}/bin" "${HOME}/bin"

# Install universal tools
cp -f "bashrc.bash"       "${HOME}/.bashrc"
cp -f "bash_profile.bash" "${HOME}/.bash_profile"

# Install environments
#     TODO: Make it so the user can choose which environments to install.
#           For now I'll just install all environments
cp -rf "general" "${envir_dir}"

# Select an environment
#     TODO: Make this a user selected choice.
#           For now it should be fine to hard code the general environment
ln -sri "${envir_dir}/general" "${selected_dir}"

