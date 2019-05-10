#!/usr/bin/env bash

###############
# Script to update the old bash without overriding it, 
# and to add git status' / path to prompt
###############

# Add a new line to the bottom of the bash_profile
printf "\n# break - repo bash below -" >> ~/.bash_profile

# Copy the contents of the repo bash profile to the new one
cat ./.bash_profile >> ~/.bash_profile

# Move the other bash helpers to the root
mv ./.bash_git_syntax_aware ~/
# 
# 

# Source the bash profile
source ~/.bash_profile


# Find the files, not sure if this is needed
# find ~/.bash_profile

