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

# Committing function
function gc(){
	git commit -m '$1'
}

# accessing the bash
alias bash="subl ~/.bash_profile"

# git shortcuts
alias gs="git status"
alias ga="git add ."
alias gp="git push"

# JS
alias activate-skynet="npm run serve"
alias v-start="npm run serve"

# source in bash git syntax aware colors into bash profile
source ~/.bash_git_autocomplete
source ~/.bash_git_prompt
export PS1=' >>(__git_ps1 "(%s)") > '
source ~/.bash_git_syntax_aware

# Default Editor
export EDITOR="subl"

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH
