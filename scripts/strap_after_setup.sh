#!/bin/bash
set -e

# This script is designed to be run as part of the strap bootstrapping process.
# Assume that git and brew are installed. Assume that dotfiles repo is in ~.

# Install location of system configuration repos
CONFIG_REPO_PREFIX = "~/src/pocket"
# DOTFILES_REPO_PATH = "$CONFIG_REPO_PREFIX/dotfiles"

ITERM2_PREFS_FILE = "$CONFIG_REPO_PREFIX/dotfiles/extras/com.googlecode.iterm2.plist"

# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$ITERM2_PREFS_FILE"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
