# Bash Settings and Initial Setup

This repository stores settings for local setups and contains a setup script to install relevant technologies

# Local Settings

This `bash-migration` script adds several convenient short cuts as well as a syntax aware prompt.

## Migrating Bash
The `bash-migration` script will add the following files to root:
- `.bash_git_autocomplete`
- `.bash_git_prompt`
- `.bash_git_syntax_aware`

These files allow for the features below

It will prompt you to see if you'd like to overwrite your bash, or append to the end. If you have previous configurations, append. If it's a new computer with no configurations, overwriting is fine.

## Syntax Highlighting

- The prompt will be `>>` when not in a git repository.
- The prompt will be `(BRANCH) ~/FILE/PATH >>` when in a git repository, with a clean working tree.
  - `(BRANCH)` will be green
- The prompt will be `{BRANCH} ~/FILE/PATH >>` when in a git repository, and the working tree is **not** clean.
  - `{BRANCH}` will be red

## Shortcuts

### Functions

- `gitlog`
  - Function that shows your previous git activity.
  - Accepts argument: hours.
  - ex: `gitlog 72` shows activity in the past 3 days

### Aliases

- `edit-bash`
  - Opens the `bash_profile` in Sublime
  - If you appended the settings to the bash, use this to clean up any changes you don't want.
- `gs`
  - `git status`
- `ga`
  - `git add .`
- `gp`
  - `git push`
  - Requires an upstream branch
- `gc`
  - `git commit -c`
  - Opens your default editor to write a commit message
  - This script creates 2 symlinks for Sublime and VS Code. There is an option to set your default editor when the script is ran.
- `activate-skynet`
  - `npm run serve`
  - Starts a Vue server, when setup by the Vue CLI

## Symlinks

Symlinks are shortcuts that allow you to open programs from the command line

### Sublime

You have the option for it to be `subl` or `sublime`

- To use, enter `subl FILE_NAME`
- Can also be a `dir/`, will open the folder in Sublime

### VS Code

You have the option for it to be `code` or `WHATEVER_YOU_ENTER`

- To use, enter `code FILE_NAME`
- Can also be a `dir/`, will open the folder in VC Code






















# Setup Script

This script can be accessed by running the following commands:

```
curl -sf -L https://s3.amazonaws.com/installation-script/installation.sh -o installation.sh
sudo sh ./installation.sh
```

or by simply cloning this repository, and running the file locally.

## Prerequisites

You need to have an AWS account ( requires credit card ) to finish the full script.

This step starts after the Vue installation, so just enter `ctrl+c` to exit the script if you don't want to do those steps.

Have your _AWS Access Key ID_ **and** your _AWS Secret Access Key_ handy. The default region and output will be up to you, I use `us-east-1`, and `json` for the default format

## Content

This script installs / does the following:

- HomeBrew
- Node Version Manager
- NodeJS v8.10
- AWS & SAM CLI
- Python
- Xcode Developer Tools
- Vue CLI
- React CLI
- Generates and copies an SSH key to the clipboard to link to GitHub
