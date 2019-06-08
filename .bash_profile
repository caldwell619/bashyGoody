echo "Skynet is active"

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH=${PATH}:~/development/adt-bundle-mac-x86_64-20140321/sdk/tools:~/development/adt-bundle-mac-x86_64-20140321/sdk/platform-tools


function gitlog() {
    if [ -z "$1" ]
    then
        HOURS=24
    else
        HOURS=$1
    fi

    clear;
    git log --reverse --author="`git config user.name`" --format="%h (%s)" --since="`date -v-${HOURS}H`"
}

# accessing the bash
alias edit-bash="code ~/.bash_profile"

# Checking temp
alias temp="~/Documents/osx-cpu-temp/osx-cpu-temp"

# git shortcuts
alias gs="git status"
alias ga="git add ."
alias gp="git push"
alias gc="git commit -m"

# AWS
alias user-pools="aws cognito-idp list-user-pools --max-results 10"
alias id-pools="aws cognito-identity list-identity-pools --max-results 10"

# Vue
alias activate-skynet="npm run serve"
alias v-unit-test="npm run test:unit"

# source in bash git syntax aware colors into bash profile
source ~/.bash_git_autocomplete
source ~/.bash_git_prompt
export PS1=' >>(__git_ps1 "(%s)") > '
source ~/.bash_git_syntax_aware
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion