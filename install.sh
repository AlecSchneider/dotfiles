export DOTFILES_DIR DOTFILES_CACHE DOTFILES_EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#Bunch of symlinks

ln -sfv "$DOTFILES_DIR/.zshrc" ~
ln -sfv "$DOTFILES_DIR/.yabairc" ~
ln -sfv "$DOTFILES_DIR/.skhdrc" ~
ln -sfv "$DOTFILES_DIR/nvim" ~/.config
ln -sfv "$DOTFILES_DIR/.tmux.conf" ~

#. "$DOTFILES_DIR/brew.sh"
#. "$DOTFILES_DIR/.macos"
