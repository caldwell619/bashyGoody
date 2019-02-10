# Forked Bash Settings
This is a repo for storing bash settings

## Features:
- git branch displayed if inside a repository
- ex: `{master} ~/IdeaProjects/foler-name/`
- color displays git status.
-- Green: clean branch, committed work
-- Red: uncommited work

## Installing:
- clone the repo into a subfolder outside of root
- copy the contents of your current `.bash_profile`, and paste into this `.bash_profile` as to not overwrite your current settings
- delete your root `.bash_profile`, and paste this `.bash_profile` into your `~` root
- From the `~` ( run `cd` to get to `~` ), run `source .bash_profile` to refresh changes