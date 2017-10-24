#!/bin/bash

declare -a BIN_FILES=(
    'bin/bd'
    'bin/mpager'
    'bin/plompt'
    'bin/renamer'
    'bin/repo-each'
)

declare -A HOME_FILES=(
    ['.bashrc']='home/bashrc'
    ['.gdbinit']='home/gdbinit'
    ['.gitconfig']='home/gitconfig'
    ['.tmux.conf']='home/tmux.conf'
    ['.vimrc']='home/vimrc'
    ['.xinitrc']='home/xinitrc'
    ['.Xresources']='home/Xresources'
)

for f in ${BIN_FILES[@]}; do
    ln -s "$(realpath $f)" "$HOME/bin/$(basename $f)"
done

for f in ${!HOME_FILES[@]}; do
    ln -s "$(realpath ${HOME_FILES[$f]})" "$HOME/$(basename $f)"
done
