#!/bin/bash

# Show all hidden files by default
defaults write com.apple.finder AppleShowAllFiles YES

# Create .bash_profile
touch ~/.bash_profile

# Upgrade build-in PHP to 7.2 version
# Password is required for this installation
curl -s https://php-osx.liip.ch/install.sh | bash -s 7.2

# Remove override php.ini values set by Liip.ch
# Password is required for this action
sudo rm /usr/local/php5/php.d/99-liip-developer.ini

# Adjust PATH to include PHP 7.2
echo "export PATH=/usr/local/php5/bin:$PATH" >> ~/.bash_profile

# Install PHP Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

# Move PHP Composer to PATH
mv composer.phar /usr/local/bin/composer

# Install nvm
# https://github.com/creationix/nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo "source ~/.nvm/nvm.sh" >> ~/.bash_profile

# Install Node.js 8.9.4
nvm install 8.9.4

# Set Node.js 8.9.4 as default version using
nvm use 8.9.4
nvm alias default 8.9.4

# Update npm
npm install -g npm

# Install Homebrew
# Password is required for this installation
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Opting out Homebrew analytics
brew analytics off

# Keep Homebrew packages up-to-date
brew update && brew upgrade

# Install Homebrew packages
brew install git
brew install git-lfs
brew install git-standup
brew install mas
brew install wget
brew install zsh zsh-completions

# Link git to version installed by Homebrew (Should already linked)
brew link git

# Set git username and email
git config --global user.name "Andrew Mok"
git config --global user.email "andrewmmc@users.noreply.github.com"

# Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Clone Auto Suggestions for Oh My ZSH
# Will be installed by syncing settings below
git clone git://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Sync .zshrc settings first
rm -f "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/zsh/.zshrc" "$HOME/.zshrc"
# echo "source ~/.bash_profile" >> $HOME/dotfiles/zsh/.zshrc

# Install Powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# Homebrew Cask
brew tap caskroom/cask

# Install software via brew cask
# Password is required for first time installation
brew cask install 1password
brew cask install alfred
brew cask install docker
brew cask install evernote
brew cask install filezilla
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
brew cask install microsoft-office
brew cask install phpstorm
brew cask install postman
brew cask install pritunl
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

brew cleanup
brew cask cleanup

# Install software via mas
# Apple ID is required to login for this action
# Uncomment the following command for auto sign in
# mas signin email@email.com

mas install 540348655 # Monosnap (3.4.9)
mas install 904280696 # Things3 (3.3)
mas install 568494494 # Pocket (1.6.6)
mas install 1102004240 # iHosts (1.3.0)

# Install npm global packages
npm install -g @angular/cli
npm install -g @pingy/cli
npm install -g create-react-app
npm install -g eslint
eslint --init
## TODO: Sync .eslintrc files
npm install -g express-generator
npm install -g firebase-tools
npm install -g gulp-cli
npm install -g react-native-cli
npm install -g standard # Javascript Standard Style
# npm install -g typescript
# npm install -g tslint # need install typescript first
npm install -g vue-cli

# Sync settings in this repo
# Alfred settings
rm -rf "$HOME/Library/Application Support/Alfred 3/Alfred.alfredpreferences"
ln -sf "$HOME/dotfiles/alfred/Alfred.alfredpreferences" "$HOME/Library/Application Support/Alfred 3/Alfred.alfredpreferences"

cd ./alfred/workflow
# Workflow: AlfredSwitchWindows
# https://github.com/mandrigin/AlfredSwitchWindows/releases
curl -O "https://github.com/mandrigin/AlfredSwitchWindows/releases/download/v0.2.8/Swift.Window.Switcher.v0.2.8.alfredworkflow"
# Workflow: JetBrains: Open project
# https://github.com/bchatard/jetbrains-alfred-workflow
curl -O "https://github.com/bchatard/jetbrains-alfred-workflow/blob/master/package/JetBrains%20-%20Open%20project.alfredworkflow?raw=true"
cd ../../

# iTerm2 settings
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# VS Code settings
rm -f "$HOME/Library/Application Support/Code/User/keybindings.json"
rm -f "$HOME/Library/Application Support/Code/User/settings.json"
rm -f "$HOME/Library/Application Support/Code/User/vsicons.settings.json"
ln -sf "$HOME/dotfiles/vs-code/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"
ln -sf "$HOME/dotfiles/vs-code/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
ln -sf "$HOME/dotfiles/vs-code/vsicons.settings.json" "$HOME/Library/Application Support/Code/User/vsicons.settings.json"

# Install VS Code Extension
code --install-extension bradgashler.htmltagwrap
code --install-extension christian-kohler.path-intellisense
code --install-extension dbaeumer.vscode-eslint
code --install-extension dbankier.vscode-quick-select
code --install-extension donjayamanne.githistory
code --install-extension donjayamanne.jquerysnippets
code --install-extension eamodio.gitlens
code --install-extension EditorConfig.EditorConfig
code --install-extension eg2.tslint
code --install-extension esbenp.prettier-vscode
code --install-extension felixfbecker.php-debug
code --install-extension felixfbecker.php-intellisense
code --install-extension felixfbecker.php-pack
code --install-extension hollowtree.vue-snippets
code --install-extension HookyQR.beautify
code --install-extension jeremyrajan.vscode-lebab
code --install-extension johnpapa.Angular2
code --install-extension k--kato.intellij-idea-keybindings
code --install-extension leizongmin.node-module-intellisense
code --install-extension lonefy.vscode-JS-CSS-HTML-formatter
code --install-extension mkaufman.HTMLHint
code --install-extension ms-vscode.azure-account
code --install-extension ms-vscode.node-debug2
code --install-extension nwallace.language-vscode-javascript-angular2
code --install-extension onecentlin.laravel-blade
code --install-extension PeterJausovec.vscode-docker
code --install-extension robertohuertasm.vscode-icons
# code --install-extension small.php-ci
code --install-extension steoates.autoimport
code --install-extension traBpUkciP.vscode-npm-scripts
code --install-extension TwentyChung.jsx
code --install-extension vsmobile.vscode-react-native
code --install-extension Zignd.html-css-class-completion

# Change deafult shell to zsh
# Password is required for this action
sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)

exec $SHELL --login