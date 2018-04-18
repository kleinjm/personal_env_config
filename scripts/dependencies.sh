#!/bin/bash

# get the os version, either mac or linux. Ie. -o mac
while getopts o: option
do
 case "${option}"
 in
 o) OS=${OPTARG};;
 esac
done

if [ $OS = 'mac' ]; then
  echo 'Installing dependencies for mac...'

  # accept xcode agreement
  sudo xcodebuild -license accept
  xcode-select --install

  brew install macvim --with-override-system-vim
  brew install reattach-to-user-namespace
elif [ $OS = 'linux' ]; then
  echo 'Installing dependencies for linux...'

  # linuxbrew
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
  test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
  test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
  test -r ~/.bash_profile && echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.bash_profile
  echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.profile
else
  echo 'Please enter a valid os name with option -o'
  exit 1
fi

# ohmyzsh plugins
sudo chmod -R 777 $ZSH
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

brew install bash
brew install fzf
brew install gpg                                # for github verified commits
brew install heroku
brew install rbenv
brew install the_silver_searcher
brew install tree # shell `tree` command for directory structure
brew install youtube-dl
brew install zsh-autosuggestions

rbenv ctags # see https://github.com/tpope/rbenv-ctags

brew cask install corelocationcli   # for alfred google maps workflow

# make sure python is installed so we have pip
brew install pyenv
source ~/.zshrc
pyenv install 3.6.4
# Aliased to `speed` in zshrc
pip3 install speedtest-cli

# Needed for nerd fonts and devicons
# https://github.com/ryanoasis/nerd-fonts#option-3-install-script
brew tap caskroom/fonts
brew cask install font-hack-nerd-font
brew cask install font-devicons

# ruby
gem install bundler
bundle

# nvm and npm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
# get the latest version with "node"
nvm install node
npm install -g sass-lint
npm install -g coffeelint
