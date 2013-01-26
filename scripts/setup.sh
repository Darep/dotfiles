#!/bin/bash
#
# Dev environment setup
#

# Ask for sudo password
echo 'Checking credentials...'
sudo echo 'ok!'

# Install homebrew
if ! command -v brew >/dev/null 2>&1; then
    ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
fi
brew update
brew upgrade

# Install GNU core utilities
brew install git grc coreutils

# Install PHP 5.4
brew tap josegonzalez/homebrew-php
brew install php54

# Remove outdated versions from the cellar
brew cleanup


#
# NodeJS
#
brew install node

# Install Grunt
npm install -g grunt

# Install Bower
npm install -g bower

# Install CoffeeScript
npm install -g coffee-script

# Install YALR
npm install -g yalr


#
# Ruby
#
if ! command -v rvm >/dev/null 2>&1; then
    # Install RVM
    \curl -L https://get.rvm.io | bash -s stable
else
    # Update RVM to latest version
    rvm get stable
fi
rvm install 1.9.3
rvm use 1.9.3

# Install Bundler
gem install bundler

# Install Compass
gem install compass

# Install Foreman
gem install foreman

# Install Rails
gem install rails

# Install pow (as an Apache proxy)
echo 'export POW_DST_PORT=88' >> ~/.powconfig; source ~/.powconfig
sudo curl https://raw.github.com/gist/1058580/zzz_pow.conf -o /etc/apache2/other/zzz_pow.conf
sudo apachectl restart
curl get.pow.cx | sh

# Install powder
gem install powder


#
# Clojure
#
brew install clojure

# Install Leiningen
brew install leiningen


#
# Databases
#
#open http://postgresapp.com/download