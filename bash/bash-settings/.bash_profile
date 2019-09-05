echo "Skynet is active"

# Colors

Color_Off="\033[0m"       # Text Reset
# Bold High Intensty
BIBlack="\033[1;90m"      # Black
BIRed="\033[1;91m"        # Red
BIGreen="\033[1;92m"       # Green
BIYellow="\033[1;93m"     # Yellow
BIBlue="\033[1;94m"       # Blue
BIPurple="\033[1;95m"     # Purple
BICyan="\033[1;96m"       # Cyan
BIWhite="\033[1;97m"      # White


# Template to color something: 
# printf "$BIRed$( echo hello there )$Color_Off"

##################################### 
############   AWS    ############### 
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
alias gr="git remote -v"
alias gb="git branch -v"
alias gf="git fetch"


alias auth="chmod +x"

##################################### 
###########  Python #################
##################################### 

alias python="python3"
alias py="python3"
alias pip="pip3"

##################################### 
###  Bootstrapping Express / React ##
##################################### 

function express_init() {
    echo 'hello'
    source ~/.git_bash_express
}


##################################### 
##########   Babel       ############
##################################### 

function webpack_config() {
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

# Check browser compatibility
alias browser="npx browserslist"

##################################### 
########   Navigating       #########
##################################### 

# creates a folder, then goes into it
function goto() {
    mkdir $1 && cd $1
}

function cd(){
    builtin cd "$@" && ls;
}

# Buy Now
alias ui="cd ~/Code/buy-now/buy-now/source/web"
alias api="cd ~/Code/buy-now/buy-now/source/api"

# list aliases
function list() {
    # JS
    printf "\n\n$BIGreen$( echo 'add-tests:' )$Color_Off Install the Vue test utils"
    printf "\n\n$BIYellow$( echo webpack-config: )$Color_Off Saves all dev dependencies needed for inclusion of webpack"
    printf "\n\n$BICyan$( echo cra: )$Color_Off Create-react-app alias"
    printf "\n\n$BIRed$( echo express-init: )$Color_Off Creates a bootstrapped Express server"
    # Utility
    printf "\n\n$BIYellow$( echo zip-update )$Color_Off 1st arg is the folder to be updated, 2nd is the file(s) being added"
    printf "\n\n$BIPurple$( echo zip-del: )$Color_Off zips and deletes the files zipped, 2 args - same as update"
    printf "\n\n$BIYellow$( echo jcurl: )$Color_Off curls url and prints it pretty"
    printf "\n\n$BIBlue$( echo convert-docx: )$Color_Off Converts markdown to docx"
    # AWS
    printf "\n\n$BICyan$( echo dynamo-start: )$Color_Off Starts DynamoDB running locally in a docker container"
    printf "\n\n$BICyan$( echo dynamo-local-tables: )$Color_Off Lists local DynamoDB tables"
    printf "\n\n$BIRed$( echo user-pools: )$Color_Off Lists AWS Cognito user pools"
    printf "\n\n"
}


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
alias v-rollup="npx vue-sfc-rollup"

# React
alias cra="npx create-react-app"


##################################### 
########      Util          #########
##################################### 

# Move markdown to docx
function convert_docx() {
    pandoc -o output.docx -f markdown -t docx $1.md
}

# Edit Bash
alias edit-bash="code ~/.bash_profile"

# Refresh Bash
alias refresh="source ~/.bash_profile"

# Zipping
function zip_del() {
    zip -m $1 $@
}
function zip_update() {
    zip -u -m $1 $2
}

# Curl
function jcurl() {
    curl "$@" | json | pygmentize -l json
}

##################################### 
#######   Exports       ############# 
##################################### 

PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$PATH"
export PATH
export EDITOR=nano

# source in bash git syntax aware colors into bash profile
source ~/.bash_git_autocomplete
source ~/.bash_git_prompt
export PS1=' >>(__git_ps1 "(%s)") > '
source ~/.bash_git_syntax_aware
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH
