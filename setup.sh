#! /usr/bin/env bash

echo Installing...
MAIN_PATH=$(pwd $(dirname $0))
echo "MAIN_PATH = $MAIN_PATH"

if [ ! -d $MAIN_PATH ]; then
    git clone git@github.com:sabonis/dotfiles.git $MAIN_PATH
fi

mkdir -p ~/.vim/undodir
ln -sf $MAIN_PATH/.vimrc ~/.vimrc

# Link tmux
ln -sf "$MAIN_PATH/.tmux.conf.local" ~/.tmux.conf.local

# Install minpac
# see https://github.com/k-takata/minpac
# git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
# see https://superuser.com/questions/451863/how-to-run-vim-command-from-the-shell
# vim +"call minpac#update('', {'do': 'q'})"

echo Installed 🍺

