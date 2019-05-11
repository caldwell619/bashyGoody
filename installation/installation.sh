#!/usr/bin/env bash

# Defining helper function
function yes_no(){
	if [[ ! $1 =~ ^[Yy]$ ]]
then
    return 1 # handle exits from shell or function but don't exit interactive shell
fi
}

# Script for installing all of the necessary software
printf "\nBeginning installations..."

# HomeBrew
printf "\n\nInstalling HomeBrew \n\n ..."
printf "\n\n"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Node Version Manager
printf "\n\n Installing Node Version Manager \n \n ... \n"
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
	printf "\nNVM is installed properly, continuing.. \n\n"
else 
	printf "\nIt looks like NVM isnt installed\n\n Ensure that you can run 'command -v nvm' with the output being 'nvm', to continue.\n\n Exiting..\n\n"
	exit 1
fi

# NodeJS
printf "\n\n Installing Node v8.10 \n\n ..."
printf "\n"
nvm install 8.10

# Vue

# Asking for confimation
printf "\nDo you want to install Vue? [y/n] -> "
read vueAnswer

yes_no $vueAnswer

if [ $? == 0 ]
then
	printf "\nInstalling Vue CLI"
	printf "\n\n"
	npm install -g @vue/cli
else
	printf "\nOkay, skipping Vue"

fi

# AWS and SAM CLI
printf "\n\nThe following is the logged in user."
printf "\n\n"
logname
printf "\n\nInstalling the AWS and SAM CLI \n\n ..."
printf "\n\nEnter the local machine username that you wish the AWS CLI to be associated with -> "
read username
printf "\n\nInstalling as $username"
printf "\n\nWhile this is running, ensure you have your AWS Access Key ID and AWS Secret Access Key ready to go. \n\n"
sudo -u $username brew tap aws/tap
sudo -u $username brew install awscli aws-sam-cli

# Configure AWS CLI
printf "\n Configuring the AWS CLI"
printf "\n\n"
aws configure

######### Optional Configurations ##########

# GitHub SSH Key Gen

# Asking for confirmation
printf "\n\nThis step will generate and copy an ssh key to your clipboard.\n\nDo you want to continue? [y/n] -> "
read githubAnswer

yes_no $githubAnswer

if [ $? == 0 ]
then 

# Generating the SSH Key
printf "\n\nThis step wires the computer to your github account.."
printf "\n\nGenerating a new SSH key.. \n\n"
read -p "\nWhat is the email you want to associate with the key? ->  " email
printf "\n\nWhen you're prompted to 'Enter a file in which to save the key,' press Enter. This accepts the default file location.\n\n"
ssh-keygen -t rsa -b 4096 -C $email
echo
printf "\n Copying the SSH to your clipboard.. \n\n"
pbcopy < ~/.ssh/id_rsa.pub
printf "\nDone!\nThe SSH key is copied to the clipboard"
open https://github.com/settings/keys

else 
	printf "\n\nAlright, be that way. Moving on!"
fi


# React CLI

# Asking for confirmation
printf "\n\nDo you want to install the React CLI? [y/n] -> "
read reactAnswer

yes_no $reactAnswer

if [ $? == 0]
then 
printf "\n\nOkay, installing the React tools"
npm install -g create-react-app

else 
	printf "\n\nAlright, be that way. All done!"
	exit 0
fi


printf "\n\nAll done!"
printf "\n"
exit 0



