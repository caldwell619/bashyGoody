# Scripts for Git Hooks

The purpose of this is to collect scripts for potential use cases with git hooks

## Making Git Hooks Version Controlled

To enable git hooks to be versioned and tracked with the repository, we need to edit the config of the repo.

### Config

**Run:**
`git config core.hooksPath git-hooks` anywhere in the repository

This makes git look in the the `git-hooks/` dir for the necessary files.

### Building a Happy Home

We now need to make the folder for the hooks to live in.

**Run:**
`mkdir git-hooks && cd git-hooks` to get into the folder.

### Filling the Home with Little Baby Files

Now that the folder exists and we at its root, we can start the proccess of adding hooks

`touch post-commit` to make a file ( no extension ) that will happen after a commit has gotten through.

A full list of git lifecycle hooks can be found [here](https://githooks.com/)

### Authorizing the Baby Files to Run

In order for the hooks to be executed, we need to authorize them.

**Run:**
`chmod +x FILE_NAME` to auth the file.

I personally can never remember that, so I made an alias in the `.bash_profile` that does it, `alias auth="chmod +x"`

### Adding the script

There are lots of options to choose from. This base is what I have found ( please feel free to add to it ).

After creating and authorizing the file, paste or write a bash script to be executed.

## Husky
