#!/bin/bash

# -------------------------------------------------------------------
# Homebrew
# -------------------------------------------------------------------
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# -------------------------------------------------------------------
# git, wget, zsh...
# -------------------------------------------------------------------
brew install git wget zsh zsh-completions

# -------------------------------------------------------------------
# Oh My Zsh
# -------------------------------------------------------------------
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# -------------------------------------------------------------------
# Homebrew Cask
# -------------------------------------------------------------------
brew tap caskroom/cask

# -------------------------------------------------------------------
# Install softwares via Homebrew Cask
# -------------------------------------------------------------------
brew cask install docker
brew cask install firefox
brew cask install franz
brew cask install google-backup-and-sync
brew cask install google-chrome
brew cask install google-web-designer
brew cask install imageoptim
brew cask install iterm2
brew cask install kdiff3
brew cask install keepingyouawake
brew cask install kitematic
brew cask install phpstorm
brew cask install postman
brew cask install pritunl
brew cask install robo-3t
brew cask install sequel-pro
brew cask install sip
brew cask install skype
brew cask install slack
brew cask install smartgit
brew cask install sourcetree
brew cask install spotify
brew cask install virtualbox
brew cask install visual-studio-code
brew cask install vlc
