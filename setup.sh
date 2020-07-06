#!/bin/bash

/bin/bash -c "defaults write NSGlobalDomain KeyRepeat -int 0"

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"


# --------------------------
# INSTALL NECESSARY SOFTWARE
# --------------------------

# install nushell
brew install nushell

# install postgres
brew install postgresql
brew services start postgresql

# install git
brew install git

# clone dotfiles
git clone https://github.com/afogel/dotfiles.git
# copy git aliases
cp ./dotfiles/.gitconfig ~/.gitconfig

brew install bash-completion

# install starship prompt
brew install starship
echo "eval "$(starship init bash)"" >> ~/.bashrc

# install starship prompt
brew install icdiff

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

# install rstudio
brew cask install r
brew cask install rstudio

# install dashlane
brew cask install dashlane

# Generate ssh keys
ssh-keygen -t rsa -b 4096 -C "fogeltine@gmail.com"
