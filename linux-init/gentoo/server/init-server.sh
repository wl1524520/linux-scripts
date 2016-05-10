#!/bin/bash

emerge --ask --update --deep --newuse @world
emerge --depclean
emerge --ask app-shells/zsh
emerge --ask dev-vcs/git
emerge --ask app-editors/vim
