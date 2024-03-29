#!/bin/bash

SCRIPT_PATH=$(dirname $0)
FILES=".ackrc .gitconfig .npmrc .vim .vimrc .zshrc .editorconfig .ideavimrc .gitignore_global .tmux.conf .p10k.zsh"

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
