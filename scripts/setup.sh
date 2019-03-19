#!/bin/bash
set -e

# This script is designed to be run as part of the strap bootstrapping process.
# Assume that git and brew are installed. Assume that dotfiles repo is in ~.

# GitHub user repos to download
USER_CONFIG_REPOS=("prezto" "spacemacs")

# Install location of system configuration repos
CONFIG_REPO_PREFIX = "~/src/pocket"
DOTFILES_REPO_PATH = "$CONFIG_REPO_PREFIX/dotfiles"

# Get all of our config related repos in one place
mkdir -p "$CONFIG_REPO_PREFIX"

if [ ! -L "~/.dotfiles" ]; then
  mv ~/.dotfiles "$DOTFILES_REPO_PATH"
  ln -sf "$DOTFILES_REPO_PATH" ~/.dotfiles
  echo "Moved dotfiles repo to '$DOTFILES_REPO_PATH'"
fi

if [ -n "$STRAP_GITHUB_USER" ]; then
  cd "$CONFIG_REPO_PREFIX"
  for repo in "${USER_CONFIG_REPOS[@]}"
  do
    REPO_URL="https://github.com/$STRAP_GITHUB_USER/$repo"
    git clone "$REPO_URL" .
  done
  cd ~
fi

# Install rcm via brew
brew tap thoughtbot/formula
brew install rcm

# Need to get this one file first.
ln -sf "$DOTFILES_REPO_PATH/rcrc" ~/.rcrc

rcup

# Symlink dot/* into home directory as hidden files
# for f in $(ls -d ~/.dotfiles/dot/*); do ln -sfn $f ~/.$(basename $f); done

# Symlink files/* into home directory as regular files
# for f in $(ls -d ~/.dotfiles/files/*); do ln -sfn $f ~/$(basename $f); done

# Set up oh-my-zsh
# mkdir -p ~/src/robbyrussell/oh-my-zsh
