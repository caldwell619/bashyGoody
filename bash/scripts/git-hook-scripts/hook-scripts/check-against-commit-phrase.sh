#!/bin/sh
# An hook script to verify changes to be committed do not contain
# any 'FIXME:' comments. Called by "git commit" with no arguments.
#
# The hook should exit with non-zero status after issuing an appropriate
# message if it stops the commit.
#
# To bypass this hook, use the "--no-verify" parameter when committing.
# Redirect output to stderr.
exec 1>&2
# Define colors
RED='\033[0;31m'
NC='\033[0m'
# Define what term will be searched for.
SEARCH_TERM="FIXME:"
# Check for the presence of the SEARCH_TERM in updated files.
if [[ $(git diff --cached | grep -E "^\+" | grep -v '+++ b/' | cut -c 2-) == *$SEARCH_TERM* ]]
then
printf "${RED}Error:${NC} Found ${SEARCH_TERM} in attempted commit.\n"
printf "Please remove all occurances of ${SEARCH_TERM} before committing.\n"
exit 1
fi