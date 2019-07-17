#!/bin/bash
# pre-commit.sh


# Save unconfirmed changes
STASH_NAME="pre-commit-$(date +%s)"
git stash save -q --keep-index $STASH_NAME

# Checks and tests
jslint my_application.js || exit 1

# Recover saved changes
STASHES=$(git stash list)
if [[ $STASHES == "$STASH_NAME" ]]; then
  git stash pop -q
fi