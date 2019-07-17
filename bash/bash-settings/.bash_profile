echo "Skynet is active"

##################################### 
###########   AWS       ############# 
##################################### 

# Start local DynamoDB
alias dynamo-start="docker run -p 8000:8000 amazon/dynamodb-local"

# View local tables
alias dynamo-local-tables="aws dynamodb list-tables --endpoint-url http://localhost:8000"

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
###  Bootstrapping Express / React ##
##################################### 

function express-init() {
    echo 'hello'
    source ~/.git_bash_express
}


##################################### 
##########   Babel       ############
##################################### 

function webpack-config() {
    npm install --save-dev \
        webpack \
        @babel/core \
        @babel/preset-env \
        babel-loader \
        babel-polyfill \
        webpack-cli \
        @babel/preset-stage-0
}

alias electron-babel="babel-preset-electron@1.4.15"

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
alias activate-skynet="npm run serve"
alias v-test="npm run test:unit"
alias mkt-ui="cd ~/Documents/job-code/mkt-web-ui/ && activate-skynet"
alias add-tests="vue add @vue/cli-plugin-unit-jest"

# React
alias cra="npx create-react-app"


##################################### 
########      Util          #########
##################################### 

# Move markdown to docx
function convert-docx() {
    pandoc -o output.docx -f markdown -t docx $1.md
}

# Edit Bash
alias edit-bash="code ~/.bash_profile"

# Refresh Bash
alias refresh="source ~/.bash_profile"

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