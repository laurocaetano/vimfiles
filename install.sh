#!/bin/sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

rm ~/.vimrc
ln -s ~/.vim/vimrc ~/.vimrc

vim +PluginInstall +qall
