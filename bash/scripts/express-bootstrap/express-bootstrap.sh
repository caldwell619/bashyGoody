#!/bin/sh
Black="\033[0;30m"        # Black
Red="\033[0;31m"          # Red
Green="\033[0;32m"        # Green
Yellow="\033[0;33m"       # Yellow
Blue="\033[0;34m"         # Blue
Purple="\033[0;35m"       # Purple
Cyan="\033[0;36m"         # Cyan
BICyan="\033[1;96m"       # Bold Cyan
White="\033[0;37m"        # White
# Reset
Color_Off="\033[0m"       # Text Reset
# Bold High Intensty
BIBlack="\033[1;90m"      # Black
BIRed="\033[1;91m"        # Red
BIGreen="\033[1;92m"      # Green
BIYellow="\033[1;93m"     # Yellow
BIBlue="\033[1;94m"       # Blue
BIPurple="\033[1;95m"     # Purple
BICyan="\033[1;96m"       # Cyan
BIWhite="\033[1;97m"      # White

printf "\nMaking an Express server with a React front end in $BICyan$(echo "$1")$Color_Off"

# making the output folder
mkdir $1 && cd $1

if [ $? == 1 ]
then 
  exit 1
fi

printf "\n\nMaking an empty $Purple$(echo "git repository")$Color_Off.."
git init -q

printf "\n\nMaking a global $Purple$(echo ".gitignore")$Color_Off"
touch .gitignore && printf "node_modules\nDS_Store\n.vscode" >> .gitignore

printf "\n\nMaking a $Red$(echo "package.json")$Color_Off.."
touch package.json
curl -s https://express-bootstrap.s3.amazonaws.com/package.json >> package.json

printf "\n\nMaking the $Purple$(echo "server directory")$Color_Off.."
mkdir server


# printf "\nPlaceholer for cra"
# printf "\n\n"
printf "\n\nMaking the $Blue$(echo "React")$Color_Off front end.."
mkdir ui && cd ui
# npx create-react-app ui


printf "\n\nRemoving the git repository in the $Blue$(echo "ui/")$Color_Off"
# cd ui && rm -rf .git

cd ../server

printf "\n\nAdding .gitignore to the $Purple$(echo "server/")$Color_Off"
touch .gitignore && printf "node_modules\nDS_Store\n.vscode" >> .gitignore

printf "\n\nMaking the server's $Red$(echo "package.json")$Color_Off.."
touch package.json
curl -s https://express-bootstrap.s3.amazonaws.com/server/package.json >> package.json

printf "\n\nMaking $BICyan$(echo "webpack common config")$Color_Off.."
touch webpack.common.js
curl -s https://express-bootstrap.s3.amazonaws.com/server/webpack.common.js >> webpack.common.js

printf "\n\nMaking $BICyan$(echo "webpack dev config")$Color_Off.."
touch webpack.dev.js
curl -s https://express-bootstrap.s3.amazonaws.com/server/webpack.dev.js >> webpack.dev.js

printf "\n\nMaking $BICyan$(echo "webpack prod config")$Color_Off.."
touch webpack.prod.js
curl -s https://express-bootstrap.s3.amazonaws.com/server/webpack.prod.js >> webpack.prod.js

printf "\n\nMaking $Yellow$(echo "index.js")$Color_Off.."
mkdir src
cd src/ && touch index.js
curl -s https://express-bootstrap.s3.amazonaws.com/index.js >> index.js

printf "\n\nInstalling $Green$(echo "node_nodules")$Color_Off.."
printf "\n\n"
cd ../

cd ../

printf "\n\nAll done!"
printf "\n\nUse $Red$(echo "npm run dev-both")$Color_Off to get started"
printf "\n\n"