# Script for installing all of the necessary software

echo "Beginning installations..."

printf "Installing HomeBrew \n \n ... \n"
# HomeBrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

printf "\n Installing Node Version Manager \n \n ... \n"
# Installing the Node Version Manager
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash

# Refreshing the bash
source ~/.bash_profile



printf "\n Installing Node v8.10 \n \n ... \n"
nvm install 8.10

printf "\n\n Installing the AWS CLI \n\n ... \n\n"
# AWS CLI
brew install awscli


