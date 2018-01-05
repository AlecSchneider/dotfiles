#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update
brew upgrade

# Install packages

packages=(
  bash-completion2
  coreutils
  diff-so-fancy
  git
  git-extras
  gnu-sed --with-default-names
  grep --with-default-names
  fzf
  neovim
  node
  python3
  python2
  shellcheck
  wget
)

brew install "${packages[@]}"

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

# install apps
apps=(
    slack
    telegram-desktop
    iterm2
    google-chrome
    ubersicht
    vlc
)

brew cask install "${apps[@]}"
