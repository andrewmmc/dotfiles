#!/bin/bash

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install packages
brew update
brew upgrade

brew install git
brew install git-standup
brew install node
brew install wget
brew install zsh
brew install zsh-completions

brew link git

brew unlink php56
brew install php71-xdebug

# Install MySQL on Sierra using Homebrew
# https://gist.github.com/andrewmmc/dec30aab2d0797955e6bf3991d14bec3

brew install mysql

brew tap homebrew/services

# Oh My Zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Homebrew Cask
brew tap caskroom/cask

# Install softwares via brew cask
brew cask install 1password
brew cask install alfred
brew cask install docker
brew cask install evernote
brew cask install firefox
brew cask install franz
brew cask install filezilla
brew cask install google-backup-and-sync
brew cask install google-chrome
brew cask install google-web-designer
brew cask install imageoptim
brew cask install iterm2
brew cask install kdiff3
brew cask install keepingyouawake
brew cask install kitematic
brew cask install microsoft-office
brew cask install pritunl
brew cask install postman
brew cask install pritunl
brew cask install robo-3t
brew cask install sequel-pro
brew cask install sip
brew cask install skype
brew cask install slack
brew cask install sourcetree
brew cask install spotify
brew cask install virtualbox
brew cask install visual-studio-code
brew cask install vlc
brew cask install jetbrains-toolbox
