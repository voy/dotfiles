#!/bin/bash

SCRIPT_PATH=$(dirname $0)
FILES=".atom .ackrc .bookmarks .gitconfig .npmrc .vim .vimrc .zshrc .zshrc.gdc .editorconfig"

for FILE in $FILES; do
    if [[ ! -e "$HOME/$FILE" ]]; then
        ln -s "$HOME/$SCRIPT_PATH/$FILE" "$HOME/$FILE"
        echo "Linked $FILE"
    else
        echo "Already exists: $FILE"
    fi
done
