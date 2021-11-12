#!/bin/bash

USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6)

ln -sv --backup=numbered $USER_HOME/git/dotfiles/xorg/20-intel.conf /etc/X11/xorg.conf.d/20-intel.conf
