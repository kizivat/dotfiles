#!/usr/bin/env bash

# Script to apply macOS default settings
# These settings will be applied on each installation/update of dotfiles

echo "Applying macOS default settings..."

# ------------------------------------------
# Desktop & Dock
# ------------------------------------------

# Group windows by application in Mission Control
defaults write com.apple.dock expose-group-apps -bool true

# Don't automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Auto-hide the Dock
defaults write com.apple.dock autohide -bool true

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 48

# Don't show recents in Dock
defaults write com.apple.dock show-recents -bool false

# Set the order of apps in the Dock
SCRIPT_DIR=$(dirname "$0")
$SCRIPT_DIR/dock-apps.sh

# ------------------------------------------
# Finder
# ------------------------------------------

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Column view as default for all windows
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Hide iCloud section
defaults write com.apple.finder ShowCloudDesktop -bool false
defaults write com.apple.finder SidebarShowingiCloudDesktop -bool false
defaults write com.apple.finder ShowRecentTags -bool false
defaults write com.apple.finder SidebarShowingSignedIntoiCloud -bool false

# Expand the "Open with" and "Sharing & Permissions" file info panes by default
defaults write com.apple.finder FXInfoPanesExpanded -dict \
  OpenWith -bool true \
  Privileges -bool true

# New Finder windows show Home folder
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Disable warning when changing file extensions
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false 

# ------------------------------------------
# Keyboard & Input
# ------------------------------------------

# Set a fast key repeat rate, desable press-and-hold for keys
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2

# ------------------------------------------
# Trackpad
# ------------------------------------------

# Enable tap to click for the current user
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Enable tap to click for the login screen
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Enable three-finger drag
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# Make sure three-finger drag is applied system-wide
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerDragGesture -bool true
defaults write NSGlobalDomain com.apple.trackpad.threeFingerDragGesture -bool true

# Enable accessibility drag feature (backup approach)
defaults write com.apple.AppleMultitouchTrackpad DragLock -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad DragLock -bool false
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool true

# ------------------------------------------
# System Appearance
# ------------------------------------------

# Enable Dark Mode
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Enable Dark Mode in Desktop wallpaper (optional)
defaults write NSGlobalDomain AppleInterfaceStyleSwitchesAutomatically -bool false

# Set the accent color to blue (options: Blue, Purple, Pink, Red, Orange, Yellow, Green, Graphite)
defaults write NSGlobalDomain AppleAccentColor -int 4

# Set highlight color to accent color
defaults write NSGlobalDomain AppleHighlightColor -string "0.968627 0.831373 1.000000 Purple"

# ------------------------------------------
# Apply changes
# ------------------------------------------

# Restart affected applications
killall SystemUIServer
killall Dock
killall Finder
killall Safari

echo "macOS defaults applied successfully!"
