#!/bin/bash

USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6)
SCRIPT_PATH=$(dirname "$(readlink -f "$0")")

echo $SCRIPT_PATH

# Enable TearFree Option
XORG_CONF_PATH=/etc/X11/xorg.conf.d

ln -sv --backup=numbered $SCRIPT_PATH/xorg/20-intel.conf $XORG_CONF_PATH/20-intel.conf

# Configure sxhkdrc key bindings
SXHKD_CONFIG_PATH=$USER_HOME/.config/sxhkd
sudo -u $SUDO_USER ln -sv --backup=numbered $SCRIPT_PATH/sxhkd/sxhkdrc $SXHKD_CONFIG_PATH/sxhkdrc

# Set LightDM Aether background image
AETHER_WALLPAPERS_PATH=/usr/share/lightdm-webkit/themes/lightdm-webkit-theme-aether/src/img/wallpapers
AETHER_WALLPAPER_URL=https://raw.githubusercontent.com/curieldev/resources/main/img/Blue-PaperMario.jpg

rm -vf $AETHER_WALLPAPERS_PATH/{*.png,*.jpeg,*.jpg}
curl $AETHER_WALLPAPER_URL -o $AETHER_WALLPAPERS_PATH/Blue-PaperMario.jpg

# Set LightDM Aether icon
ACCOUNTS_SVC_PATH=/var/lib/AccountsService
AETHER_ICON_URL=https://raw.githubusercontent.com/curieldev/resources/main/img/curiel.png

sed -i "s/^Icon=.*/Icon=\/var\/lib\/AccountsService\/icons\/$SUDO_USER.png/" $ACCOUNTS_SVC_PATH/users/$SUDO_USER
curl $AETHER_ICON_URL -o $ACCOUNTS_SVC_PATH/icons/$SUDO_USER.png

# Set EndeavourOS wallpaper
ENDEAVOUROS_WALLPAPER_URL=https://raw.githubusercontent.com/curieldev/resources/main/img/endeavouros-wallpaper.png
ENDEAVOUROS_BACKGROUNDS_PATH=/usr/share/endeavouros/backgrounds
curl $ENDEAVOUROS_WALLPAPER_URL -o $ENDEAVOUROS_BACKGROUNDS_PATH/endeavouros-wallpaper.png


# Configure neovim
mkdir -pv $USER_HOME/.config/nvim
sudo -u $SUDO_USER ln -sv --backup=numbered $SCRIPT_PATH/nvim/init.vim $USER_HOME/.config/nvim/init.vim
