echo "Skynet is active"

##################################### 
###########   GIT       ############# 
##################################### 

# shortcuts
alias gs="git status"
alias ga="git add ."
alias gp="git push"
alias gc="git commit -m"
alias auth="chmod +x"

##################################### 
########   Navigating       #########
##################################### 

# creates a folder, then goes into it
function goto() {
    mkdir $1 && cd $1
}

# list aliases
function list() {
    printf "\n\nadd-tests: Install the Vue test utils"
    printf "\n\nv-test: runs unit tests"
    printf "\n\nzip-update: 1st arg is the folder to be updated, 2nd is the file(s) being added"
    printf "\n\nzip-del: zips and deletes the files zipped, 2 args - same as update"
    printf "\n\njcurl: curls url and prints it pretty"
}

# Getting to projects
alias mk-api="cd ~/Documents/job-code/mkt-web-api"
alias mk-ui="cd ~/Documents/job-code/mkt-web-ui"

##################################### 
########   Development       ########
##################################### 

# cors server
alias cors="corsproxy"

# AWS
alias user-pools="aws cognito-idp list-user-pools --max-results 10"
alias id-pools="aws cognito-identity list-identity-pools --max-results 10"

# Vue
alias add-tests="vue add @vue/cli-plugin-unit-jest"
alias bootrap-vue-dependencies="npm i -D pug pug-plain-loader sass sass-loader"


##################################### 
########      Util          #########
##################################### 

# Zipping
function zip-del() {
    zip -m $1 $@
}
function zip-update() {
    zip -u -m $1 $2
}

# Curl
function jcurl() {
    curl "$@" | json | pygmentize -l json
}


##################################### 
#######   Exports       ############# 
##################################### 

export PATH=${PATH}:~/development/adt-bundle-mac-x86_64-20140321/sdk/tools:~/development/adt-bundle-mac-x86_64-20140321/sdk/platform-tools
export EDITOR=nano

# source in bash git syntax aware colors into bash profile
source ~/.bash_git_autocomplete
source ~/.bash_git_prompt
export PS1=' >>(__git_ps1 "(%s)") > '
source ~/.bash_git_syntax_aware
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion