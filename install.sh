#!/bin/sh
git submodule init
git submodule update

rm ~/.vimrc
ln -s ~/.vim/vimrc ~/.vimrc
