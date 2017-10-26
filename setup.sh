#!/bin/bash

declare -a BIN_FILES=(
    'bd'
    'mpager'
    'plompt'
    'renamer'
    'repo-each'
)

declare -A HOME_FILES=(
    ['.bashrc']='bashrc'
    ['.gdbinit']='gdbinit'
    ['.gitconfig']='gitconfig'
    ['.tmux.conf']='tmux.conf'
    ['.vimrc']='vimrc'
    ['.xinitrc']='xinitrc'
    ['.Xresources']='Xresources'
)

declare -a CONFIG_FILES=(
    'bspwm/bspwmrc'
    'sxhkd/sxhkdrc'
    'polybar/config'
    'polybar/launch.sh'
)

function error {
    echo $* 1>&2
    exit 1
}

function make_link {
    target=$(realpath $1 2> /dev/null)
    link_name=$(realpath $2 2> /dev/null)
    if [[ -f "$1" ]]; then
        if [[ "$target" == "$link_name" ]]; then
            return
        fi

        if [[ -n $link_name ]]; then
            error "link to $1 already exists and point to $link_name"
        fi
    fi
    ln -sf "$target" "$2"
}

for f in ${BIN_FILES[@]}; do
    make_link "bin/$f" "$HOME/bin/$(basename $f)"
done

for f in ${!HOME_FILES[@]}; do
    make_link "home/${HOME_FILES[$f]}" "$HOME/$(basename $f)"
done

for f in ${CONFIG_FILES[@]}; do
    dir=$(dirname $f)
    mkdir -p ".config/$dir"
    make_link "config/$f" "$HOME/.config/$dir/$(basename $f)"
done
