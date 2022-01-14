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

# Set File System Automount
grep -q "ef0923e2-f348-460c-83c7-dc8339f58287" /etc/fstab && echo "File System with UUID ef0923e2-f348-460c-83c7-dc8339f58287 already in fstab" || echo "UUID=ef0923e2-f348-460c-83c7-dc8339f58287    /mnt/500    ext4    defaults    0    2" >> /etc/fstab

# Set LightDM Aether icon
ACCOUNTS_SVC_PATH=/var/lib/AccountsService
AETHER_ICON_URL=https://raw.githubusercontent.com/curieldev/resources/main/img/curiel.png

sed -i "s/^Icon=.*/Icon=\/var\/lib\/AccountsService\/icons\/$SUDO_USER.png/" $ACCOUNTS_SVC_PATH/users/$SUDO_USER
curl $AETHER_ICON_URL -o $ACCOUNTS_SVC_PATH/icons/$SUDO_USER.png

# Set EndeavourOS wallpaper
ENDEAVOUROS_WALLPAPER_URL=https://raw.githubusercontent.com/curieldev/resources/main/img/endeavouros-wallpaper.png
ENDEAVOUROS_BACKGROUNDS_PATH=/usr/share/endeavouros/backgrounds
curl $ENDEAVOUROS_WALLPAPER_URL -o $ENDEAVOUROS_BACKGROUNDS_PATH/endeavouros-wallpaper.png


# Configure vim
sudo -u $SUDO_USER ln -sv --backup=numbered $SCRIPT_PATH/vim/vimrc $USER_HOME/.vim/vimrc

# Configure xfce4-terminal
sudo -u $SUDO_USER ln -sv --backup=numbered $SCRIPT_PATH/xfce-term/terminalrc $USER_HOME/.config/xfce4/terminal/terminalrc

# Configure bashrc
sudo -u $SUDO_USER ln -sv --backup=numbered $SCRIPT_PATH/bash/.bashrc $USER_HOME/.bashrc
