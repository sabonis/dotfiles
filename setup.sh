#! /usr/bin/env bash

mkdir -p ~/.vim/undodir
ln -s $(pwd)/.vimrc ~/.vimrc

# Install minpac
# see https://github.com/k-takata/minpac
git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
# see https://superuser.com/questions/451863/how-to-run-vim-command-from-the-shell
vim +'call minpac#update()'

