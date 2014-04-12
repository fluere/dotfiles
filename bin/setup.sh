#!/bin/sh

# Create folders
folders=(Design Icons Output Projects Resources Screenshots Shortcut Temp Templates Texts Wallpapers Workspace)
for folder in ${folders[@]}
do
  mkdir -p ~/$folder
done

# Copy setting files
cd ./settingfiles/root/
for file in `ls -A`; do
  if echo "$file" | grep -q '.local'
  then
    cp $file ~/$file
  else
    ln -s $(pwd)/$file ~/$file
  fi
done
cd ../../
wait

# Install applications
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
brew bundle
wait

# Setup sublime text
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ~/bin/subl

# Copy ricty font
cp -f /usr/local/Cellar/ricty/3.2.2/share/fonts/Ricty*.ttf /Library/Fonts/
fc-cache -vf

# Change shell to zsh
chsh -s /usr/local/bin/zsh