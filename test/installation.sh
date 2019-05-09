#!/usr/bin/env bash

# Defining helper function
function yes_no(){
	if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    return 1 # handle exits from shell or function but don't exit interactive shell
fi
}

# Script for installing all of the necessary software
printf "\nBeginning installations..."

# HomeBrew
printf "\n\nInstalling HomeBrew \n\n ..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Node Version Manager
printf "\n Installing Node Version Manager \n \n ... \n"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash
echo
# Refreshing the bash
source ~/.bash_profile
echo

# Sourcing the file to allow usage
. ~/.nvm/nvm.sh
command -v nvm 
if [ $? == 0 ]
then 
	printf "\n\nNVM is installed properly, continuing.. \n\n"
else 
	printf "\n\nIt looks like NVM isnt installed\n\n Ensure that you can run 'command -v nvm' with the output being 'nvm', to continue.\n\n Exiting..\n\n"
	exit 1
fi

# NodeJS
printf "\n\n Installing Node v8.10 \n\n ..."
printf "\n"
nvm install 8.10


# AWS CLI
printf "\n\nEnter your username -> "
read username
printf "\n\nInstalling the AWS CLI \n\n ..."
printf "\n\nWhile this is running, ensure you have your AWS Access Key ID and AWS Secret Access Key ready to go. \n\n"

sudo -u $username brew install awscli

# Configure AWS CLI
printf "\n Configuring the AWS CLI \n\n"
aws configure


# Vue
printf "\nInstalling Vue CLI\n\n"

npm install -g @vue/cli


# GitHub SSH Key Gen

# Asking for confirmation
printf "\n\nThis is the last step and is optional. \nPress control+C to exit the script"
printf "\n\nThis step wires the computer to your github account.."
printf "\n\nGenerating a new SSH key.. \n\n"
read -p "\nWhat is the email you want to associate with the key? ->  " email
printf "\n\nWhen you're prompted to 'Enter a file in which to save the key,' press Enter. This accepts the default file location.\n\n"
ssh-keygen -t rsa -b 4096 -C $email
echo
printf "\n Copying the SSH to your clipboard.. \n\n"
pbcopy < ~/.ssh/id_rsa.pub
printf "\nDone!\nThe SSH key is copied to the clipboard"






