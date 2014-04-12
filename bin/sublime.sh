#!/bin/sh

# Copy setting files
cd $(pwd)/settingfiles/SublimeText/
for file in *; do
  ln -s $(pwd)/$file ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/$file
done