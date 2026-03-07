#!/bin/bash

SCRIPT_PATH=$(dirname $0)
FILES=".ackrc .gitconfig .npmrc .vim .vimrc .zshrc .zshrc.miro .gitignore_global"

mkdir -p "$HOME/.vimtmp"

for FILE in $FILES; do
    SYMLINK="$HOME/$FILE"

    if [[ ! -e "$SYMLINK" ]]; then
        DOTFILE=$(greadlink -f "$SCRIPT_PATH/$FILE")
        ln -s "$DOTFILE" "$SYMLINK"
        echo "Linked $FILE"
    else
        echo "Already exists: $FILE"
    fi
done
