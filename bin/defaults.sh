#!/bin/sh

# Unhide library folder
chflags nohidden ~/Library

# Expand save panel by default.
defaults write -g NSNavPanelExpandedStateForSaveMode -boolean true

# Enable text selection in Quick Look.
defaults write com.apple.finder QLEnableTextSelection -bool true

# Disable warning when changing extension.
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Disable dashboard.
defaults write com.apple.dashboard mcx-disabled -boolean true

# Disable crash reporter.
defaults write com.apple.CrashReporter DialogType none

# Disable animations.
defaults write com.apple.dock expose-animation-duration -float 0
defaults write com.apple.finder AnimateWindowZoom -bool false
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g NSWindowResizeTime 0.1

# Restart.
killall Finder
killall Dock