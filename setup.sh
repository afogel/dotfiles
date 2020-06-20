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

# install rectangle
brew cask install rectangle

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

