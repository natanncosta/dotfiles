#!/bin/bash

echo "$(cat ~/dotfiles/.zsh_aliases)" > ~/.zsh_aliases

echo "$(cat ~/dotfiles/config.lua)" > ~/.config/lvim/config.lua

if ! grep -q "source ~/.zsh_aliases" ~/.zshrc ; then
    echo "" >> ~/.zshrc
    echo "source ~/.zsh_aliases" >> ~/.zshrc
fi
