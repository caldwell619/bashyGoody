# Bash Settings and Initial Setup

This repository stores settings for local setups and contains a setup script to install relevant technologies

# Local Settings



# Setup Script

This script can be accessed by running the following commands:
```
curl -sf -L https://s3.amazonaws.com/installation-script/installation.sh -o installation.sh
sudo sh ./installation.sh
```

## Prerequisites
You need to have an AWS account ( requires credit card ) to finish the full script. 

This step starts after the Vue installation, so just enter `ctrl+c` to exit the script if you don't want to do those steps.

Have your *AWS Access Key ID* **and** your *AWS Secret Access Key* handy. The default region and output will be up to you, I use `us-east-1`, and `json` for the default format

## Content
This script installs the following:

- HomeBrew
- Node Version Manager
- NodeJS v8.10
- AWS CLI
- Vue CLI
- Generates and copies an SSH key to the clipboard to link to GitHub

It does not need to be ran as `sudo` but will invoke `sudo` when ran, prompting for a password.









