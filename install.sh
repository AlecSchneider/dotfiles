export DOTFILES_DIR DOTFILES_CACHE DOTFILES_EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#Bunch of symlinks

ln -sfv "$DOTFILES_DIR/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/.zshrc" ~
ln -sfv "$DOTFILES_DIR/.chunkwmrc" ~
ln -sfv "$DOTFILES_DIR/.skhdrc" ~
ln -sfv "$DOTFILES_DIR/nvim" ~/.config
