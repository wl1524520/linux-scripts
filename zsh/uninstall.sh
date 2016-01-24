#!/bin/bash

rm -rf ~/.oh-my-zsh
rm -f ~/.zshrc

sudo chsh -s /bin/bash `whoami`
