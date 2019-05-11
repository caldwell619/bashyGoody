#!/usr/bin/env bash

###############
# Script to update the old bash without overriding it, 
# and to add git status' / path to prompt
###############

printf "Welcome!\n\nThis script updates your bash profile with some shortcuts, and a syntax git prompt."
printf "\n\nWould you like to overwrite your current bash settings, or just append to the end? [o/a] -> "
read formatAnswer

# Add a new line to the bottom of the bash_profile
printf "\n\n# break - repo bash below -" >> ~/.bash_profile

# Move the other bash helpers to the root
mv ./.bash_git_syntax_aware ~/
mv ./.bash_git_autocomplete ~/
mv ./.bash_git_prompt ~/

if [ $formatAnswer == "o" ]
then
  # Overwrite the old bash with the new
  printf "\n\nOverwriting old bash.."
  cp ./.bash_profile ~/.bash_profile
  printf "\n\nDone!"
else
  # Copy the contents of the repo bash profile to the new one
  printf "\n\Appending to the old bash.."
  cat ./.bash_profile >> ~/.bash_profile
  printf "\n\nDone!"
fi

# Source the bash profile
source ~/.bash_profile

########## Installing Sublime ############

# Curl the download
printf "\n\nDownloading Sublime.."
printf "\n\n"
curl -sf -L https://download.sublimetext.com/Sublime%20Text%20Build%203207.dmg -o sublime.dmg

# Mount the .dmg
printf "\n\nMounting the disk image.."
printf "\n\n"
hdiutil attach ~/sublime.dmg

# Cp the .app to /Applications
printf "\n\nInstalling to Applications/.."
printf "\n\n"
cp -R Sublime\ Text/ /Applications/
rm sublime.dmg

# Unmount
printf "\n\nUnmounting the disk.."
printf "\n\n"
hdiutil detach /Volumes/Sublime\ Text/ -force

# Create Symlink
printf "\n\nCreating the symlink to launch Sublime from the command line. \n\nDo you want the command to be 'subl' or 'sublime'? [1/2] -> "
read sublAnswer
printf "\n\nOkay, working..."
printf "\n\n"
if [ $sublAnswer == "1"]
then
  ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
  printf "\n\nDone! You can now use subl `FILENAME` to open the file in Sublime"
else 
  ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sublime
  printf "\n\nDone! You can now use sublime `FILENAME` to open the file in Sublime"
fi

###################### VS Code ######################

# Curl
curl -sf -L https://go.microsoft.com/fwlink/?LinkID=620882 -o VSCode-darwin-stable.zip

#  Unzip
unzip VSCode-darwin-stable.zip

# Installing
printf "\n\nMaking a temp folder.."
mkdir temp
mv Visual\ Studio\ Code.app/ temp/
printf "\n\nCopying to Applications/.."
cp -R temp/ /Applications/
printf "\n\nCleaning up.."
rm -rf temp/
rm VSCode-darwin-stable.zip

printf "\n\nDone!"

# Symlink
printf "\n\nCreating Symlink for VS Code.."
printf "\n\nThe default is `code`.\n\nDo you want a different command to open VS Code? [y/n] -> "
read vsCodeAnswer

if [ $vsCodeAnswer == "y" ]
then 
  printf "\n\nWhat do you want the command to be? -> "
  read vsCommand
  printf "\n\nOkay, creating symlink.\n\nUse `$vsCommand FILENAME` to open the file in VS Code"
  sudo ln -s /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code /usr/local/bin/$vsCommand
else
  printf "\n\nOkay, creating symlink.\n\nUse `code FILENAME` to open the file in VS Code"
  sudo ln -s /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code /usr/local/bin/code
fi

printf "\n\nDone!"