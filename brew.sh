#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update
brew upgrade
# Install packages

brew install bash-completion2
brew install coreutils
brew install diff-so-fancy
brew install git
brew install git-extras
brew install gnu-sed --with-default-names
brew install grep --with-default-names
brew install fzf
brew install node
brew install python3
brew install python2
brew install ranger
brew install shellcheck
brew install wget

# setup zsh shell
brew install zsh
dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
npm install --global pure-prompt

# setup skhd
brew install koekeishiya/formulae/skhd
brew services start skhd

# setup chunkwm
brew tap crisidev/homebrew-chunkwm
brew install chunkwm
brew services start chunkwm

# setup neovim
brew install neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# install apps
# brew cask install slack
brew cask install telegram-desktop
brew cask install iterm2
# brew cask install google-chrome
brew cask install ubersicht
# brew cask install vlc
