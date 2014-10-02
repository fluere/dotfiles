#!/bin/sh

# Copy setting files
cd $(pwd)/settingfiles/SublimeText/
for file in *; do
  ln -s $(pwd)/$file ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/$file
done

# Install CSScomb (v1.4)
cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
git clone git://github.com/csscomb/sublime-csscomb.git CSScomb && cd $_
git checkout 370d76c1f85f0376f874b0cc2a554e39fa81fac4