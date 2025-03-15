#!/usr/bin/env bash

# ------------------------------------------
# Set exact Dock apps in specified order
# ------------------------------------------

# Clear the Dock of all apps
defaults delete com.apple.dock persistent-apps
defaults delete com.apple.dock persistent-others

# Add desired apps in the specified order
add_app_to_dock() {
  defaults write com.apple.dock persistent-apps -array-add "<dict>
    <key>tile-data</key>
    <dict>
      <key>file-data</key>
      <dict>
        <key>_CFURLString</key>
        <string>$1</string>
        <key>_CFURLStringType</key>
        <integer>0</integer>
      </dict>
    </dict>
  </dict>"
}

defaults write com.apple.dock persistent-apps -array

# Now add apps in the specified order
# DO NOT add Finder here - macOS will add it automatically
# add_app_to_dock "/System/Library/CoreServices/Finder.app"  # Remove this line
# TODO: For some reason Safari shows up as some weird symlink in the Dock - adding manually for now
# add_app_to_dock "/Applications/Safari.app"
add_app_to_dock "/Applications/Ghostty.app"
add_app_to_dock "/Applications/Visual Studio Code.app"
add_app_to_dock "/Applications/Obsidian.app"
add_app_to_dock "/System/Applications/Calendar.app"
add_app_to_dock "/Applications/Things3.app"
add_app_to_dock "/Applications/Figma.app"
add_app_to_dock "/Applications/Blender.app"
add_app_to_dock "/Applications/DaVinci Resolve.app"
add_app_to_dock "/Applications/Signal.app"
add_app_to_dock "/Applications/Discord.app"

# Force Dock to restart to apply changes
killall Dock
