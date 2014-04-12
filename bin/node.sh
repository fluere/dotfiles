#!/bin/sh

# Install Nodebrew
curl -L git.io/nodebrew | perl - setup
wait

# Install node.js (stable version)
nodebrew install-binary stable
nodebrew use stable
wait

# Install node module
sudo npm install -g autoprefixer
sudo npm install -g bower
sudo npm install -g coffee-script
sudo npm install -g grunt-cli
sudo npm install -g gulp