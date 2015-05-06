#!/bin/bash

# Global variables
envir_dir="${HOME}/.envir"                       # Place where environments
                                                 #     and configs live
selected_dir="${envir_dir}/selected"             # A symlink to the currently
                                                 #     selected environment

# Set up directories/files that are static
mkdir -p "${envir_dir}"
ln -sr "${selected_dir}/bin" "${HOME}/bin"

# Install environments
#     TODO: Make it so the user can choose which environments to install.
#           For now I'll just install all environments
cp -rf "general"

# Select an environment
#     TODO: Make this a user selected choice.
#           For now it should be fine to hard code the general environment
ln -sr "${selected_dir}" "general"

