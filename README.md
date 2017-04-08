# Reinstallation of a computer

Reformatting of a new computer

Go to App Store, download Xcode; Install Dev Tools

## Install Spectacles
https://www.spectacleapp.com/

## Install ITerm2
https://www.iterm2.com/

## Homebrew Installation
Navigate to https://brew.sh/ 
Run `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)”` to install homebrew (double check since installation instructions may have changed)

## RVM Installation
Navigate to https://rvm.io/
Run `\curl -sSL https://get.rvm.io | bash -s stable` to install rvm

## Set up SSH and git
Run `brew install git`
Navigate to https://help.github.com/articles/connecting-to-github-with-ssh/, then follow instructions.

### Install Ruby
Navigate to `https://www.ruby-lang.org`
Check which are the latest two stable rubies
Run `rvm install 2.3.4` 
Run `rvm use 2.3.4 --default`

### Install Postgres
Run `brew install postgres`
Follow the post-installation instructions, initdb and launchctl, and start the PostgreSQL server as a daemon. If you are updating postgres, you can also access instructions via `brew info postgresql`.
Note: you may need to alter the path to the psql binary to use the Cellar version instead of the native one. For example, add this to the end of your .bash_profile or .zshrc:
```
# pwd #=> anywhere
$ echo "$PATH=/usr/local/Cellar/postgresql/9.X.X/bin:$PATH" >> ~/.bash_profile
```
