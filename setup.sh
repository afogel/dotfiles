#!/bin/bash

# install homebrew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh

# install rvm
curl -sSL https://get.rvm.io | bash -s stable

# --------------------------
# INSTALL NECESSARY APPS
# --------------------------
# install iterm2
brew cask install iterm2

# install Rectangle
brew cask install rectangle

# install VLC
brew cask install vlc

# install Anki
brew cask install anki

# install Authy
brew cask install authy

# install slack
brew cask install slack
# spaces to enter:
# edurrhaphy.slack.com,
# uw-learningsciences.slack.com,
# reply-all.slack.com,
# gorails.slack.com,
# driftingruby.slack.com,
# tebs-lab.slack.com

# install vscode
brew cask install visual-studio-code

# install tor
brew cask install tor-browser

# install qbittorrent
brew cask install qbittorrent

# --------------------------
# INSTALL NECESSARY SOFTWARE
# --------------------------

# copy git aliases
cp .gitconfig ~/.gitconfig
cp .bash_profile ~/.bash_profile

# install git
brew install git

# install starship prompt
brew install starship
echo "eval "$(starship init bash)"" >> ~/.bashrc

# install nushell
brew install nushell

# install postgres
brew install postgresql
brew services start postgresql
