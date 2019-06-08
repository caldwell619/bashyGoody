#!/usr/bin/env bash

printf "Welcome!\n\nThis script updates your bash profile with some shortcuts, and a syntax git prompt."
printf "\n\nInstalling X-Code tools.\nThis includes git."
printf "\n\n"
xcode-select --install

# cloning the project to access files

printf "\n\nWould you like to overwrite your current bash settings, or just append to the end? [o/a] -> "
read formatAnswer

# Add a new line to the bottom of the bash_profile
printf "\n\n# break - repo bash below - " >> ~/.bash_profile

# Move the other bash helpers to the root
cp ./.bash_git_syntax_aware ~/
cp ./.bash_git_autocomplete ~/
cp ./.bash_git_prompt ~/

if [ $formatAnswer == "o" ]
then
  # Overwrite the old bash with the new
  printf "\n\nOverwriting old bash.."
  cp ./.bash_profile ~/.bash_profile
  printf "\n\nDone!"
else
  # Copy the contents of the repo bash profile to the new one
  printf "\n\nAppending to the old bash.."
  cat ./.bash_profile >> ~/.bash_profile
  printf "\n\nDone!"
fi
printf "\n\n"
# Source the bash profile
source ~/.bash_profile

########## Installing Sublime ############

# Curl the download
printf "\n\nDownloading Sublime.."
printf "\n\n"
mkdir ~/temp
curl -sf -L https://download.sublimetext.com/Sublime%20Text%20Build%203207.dmg -o ~/sublime.dmg

# Mount the .dmg
printf "\n\nMounting the disk image.."
printf "\n\n"
hdiutil attach ~/sublime.dmg

# Cp the .app to /Applications
printf "\n\nInstalling to Applications/.."
printf "\n\n"
cp -R /Volumes/Sublime\ Text /Applications/
printf "\n\nDone! Moving on.."

# Unmount
printf "\n\nUnmounting the disk.."
printf "\n\n"
hdiutil detach /Volumes/Sublime\ Text/ -force
printf "\n\nDone!"

# Create Symlink
printf "\n\nCreating the symlink to launch Sublime from the command line. \n\nDo you want the command to be 'subl' or 'sublime'? [1/2] -> "
read sublAnswer
printf "\n\nOkay, working..."
printf "\n\n"
if [ $sublAnswer == "1" ]
then
  subCommand="subl"
  ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
  printf "\n\nDone! You can now use subl FILENAME to open the file in Sublime"
else 
  subCommand="sublime"
  ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sublime
  printf "\n\nDone! You can now use sublime FILENAME to open the file in Sublime"
fi

###################### VS Code ######################

printf "\n\nDownloading VS Code.."
# Curl
curl -sf -L https://go.microsoft.com/fwlink/?LinkID=620882 -o ~/temp/VSCode-darwin-stable.zip

printf "\n\nDone!"
printf "\n\nUnzipping it.."
#  Unzip
unzip ~/temp/VSCode-darwin-stable.zip
printf "\n\nDone!"

# Installing 

############################ closer look needed ##################

printf "\n\nMaking a temp folder.."
mkdir ~/temp/VS_Code
mv Visual\ Studio\ Code.app/ ~/temp/VS_Code
printf "\n\nCopying to Applications/.."
cp -R temp/ /Applications/
printf "\n\nCleaning up.."
rm -rf temp/
rm VSCode-darwin-stable.zip

printf "\n\nDone!"

############################ closer look needed ##################

# Symlink
printf "\n\nCreating Symlink for VS Code.."
printf "\n\nThe default is 'code'.\n\nDo you want a different command to open VS Code? [y/n] -> "
read vsCodeAnswer

if [ $vsCodeAnswer == "y" ]
then 
  printf "\n\nWhat do you want the command to be? -> "
  read vsCommand
  printf "\n\nOkay, creating symlink.\n\nUse `$vsCommand FILENAME` to open the file in VS Code"
  sudo ln -s /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code /usr/local/bin/$vsCommand
else
  vsCommand="code"
  printf "\n\nOkay, creating symlink.\n\nUse `code FILENAME` to open the file in VS Code"
  sudo ln -s /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code /usr/local/bin/code
fi

printf "\n\nDone!"

# Setting default editor

printf "\n\nDo you want to set a default editor? [y/n] -> "
read defaultEditorAnswer

if [ $defaultEditorAnswer == "y" ]
then
  printf "\n\nSublime or VS Code? [1/2] -> "
  read defaultEditor
  if [ $defaultEditor == "1" ]
  then
    export EDITOR=$subCommand
  else 
    export EDITOR=$vsCommand
  fi
else 
printf "\n\nNo problem.\n\nUse\n\nexport EDITOR='SYMLINK_NAME'\n\nto add it later"
fi 




