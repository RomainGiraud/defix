#!/bin/bash

declare -a BIN_FILES=(
    '24-bit-color'
    'bd'
    'clean-path'
    'color-simpler'
    'colortest'
    'git-author-email-rewrite'
    'git-quick-stats'
    'monitors'
    'monitors-refresh'
    'mpager'
    'nyan'
    'pipes'
    'renamer'
    'repo-each'
    'screenlock'
    'tabs2spaces'
)

declare -A HOME_FILES=(
    ['.bashrc']='bashrc'
    ['.bash_profile']='bash_profile'
    ['.gdbinit']='gdbinit'
    ['.gitconfig']='gitconfig'
    ['.gitignore']='gitignore'
    ['.inputrc']='inputrc'
    ['.tmux.conf']='tmux.conf'
    ['.vimrc']='vimrc'
    ['.xinitrc']='xinitrc'
    ['.Xresources']='Xresources'
)

declare -a CONFIG_FILES=(
    'pcmanfm/default/pcmanfm.conf'
    'bspwm/bspwmrc'
    'polybar/config'
    'polybar/launch.sh'
    'sxhkd/sxhkdrc'
    'mimeapps.list'
    'user-dirs.dirs'
)

function error {
    echo $* 1>&2
}

function make_link {
    target=$(realpath $1 2> /dev/null)
    link_name=$(realpath $2 2> /dev/null)
    if [[ -f "$2" ]]; then
        if [[ "$target" == "$link_name" ]]; then
            return
        fi

        if [[ -n $link_name ]]; then
            error "link to $1 already exists and point to $link_name"
        fi
    fi
    echo "target: $1 - $target"
    echo "link_name: $2 - $link_name"
    echo ln -sf 1"$target" 2"$2"
    ln -sf "$target" "$2" || true
}

for f in ${BIN_FILES[@]}; do
    make_link "bin/$f" "$HOME/bin/$(basename $f)"
done

echo "== HOME"
for f in ${!HOME_FILES[@]}; do
    make_link "home/${HOME_FILES[$f]}" "$HOME/$(basename $f)"
done

echo "== CONFIG"
for f in ${CONFIG_FILES[@]}; do
    dir=$(dirname $f)
    if [[ "$dir" == "." ]]; then
        dir=""
    fi
    mkdir -p ".config/$dir"
    make_link "config/$f" "$HOME/.config/$dir/$(basename $f)"
done

echo "== Install following tools ==
  - base16-shell: default ANSI colors
  - bd: move to a parent directory
  - direnv: env per directory
  - gompt: enhanced prompt
  - vimpager/vimcat: use vim instead of less/cat"
