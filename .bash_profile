
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

# Global
echo "Skynet is Active"

# DB wiring
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/Users/chriscaldwell/mongodb"/bin:$PATH

# project shorcuts
alias activate-skynet="npm run dev"
alias pound-the-alarm="npm start"
alias apple="react-native run-ios"
alias bash="subl .bash_profile"
alias armada="cd ~/IdeaProjects/armada-builder-react/"

# git shortcuts
alias ga="git add ."
alias gs="git status"
alias gc="git commit -v"
alias gp="git push"

# artisan generate shortcuts
alias g:m="php artisan generate:model"
alias g:c="php artisan generate:controller"
alias g:v="php artisan generate:view"
alias g:s="php artisan generate:seed"
alias g:mig="php artisan generate:migration"
alias g:r="php artisan generate:resource"

# source in bash git syntax aware colors into bash profile
source ~/.bash_git_autocomplete
source ~/.bash_git_prompt
export PS1='(__git_ps1 "(%s)") > >>'
source ~/.bash_git_syntax_aware
