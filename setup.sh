#!/bin/sh


# echo "$(hash rvm 2>/dev/null)"

# detect whether ruby,rubygems are used via version manager: rvm, rbenv
if [ rvm >/dev/null ] || [ rbenv >/dev/null ];then
  echo "detected rvm or rbenv"
  gem install bundle
else
  echo "neither rvm or rbenv detected"
  sudo gem install bundle
fi

bundle install

# detect whether node.js,npm are used via version manager: nvm, nodebrew
if [ nvm >/dev/null ] || [ nodebrew >/dev/null ];then
  echo "detected nvm or nodebrew "
  npm install -g grunt-cli bower
else
  echo "neither nvm or nodebrew"
  sudo npm install -g grunt-cli bower
fi
npm install --dev
ln -s config-vagrant config-debug
phrase pull
