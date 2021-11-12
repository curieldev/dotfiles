#!/bin/bash

USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6)

# Enable TearFree Option
ln -sv --backup=numbered $USER_HOME/git/dotfiles/xorg/20-intel.conf /etc/X11/xorg.conf.d/20-intel.conf

# Configure sxhkdrc key bindkings
sudo -u $SUDO_USER ln -sv --backup=numbered $USER_HOME/git/dotfiles/sxhkd/sxhkdrc $USER_HOME/.config/sxhkd/sxhkdrc

# Set LightDM Aether background image
rm -f /usr/share/lightdm-webkit/themes/lightdm-webkit-theme-aether/src/img/wallpapers/{*.png,*.jpeg,*.jpg}
curl https://raw.githubusercontent.com/curieldev/resources/main/img/Blue-PaperMario.jpg -o /usr/share/lightdm-webkit/themes/lightdm-webkit-theme-aether/src/img/wallpapers/Blue-PaperMario.jpg

# Set LightDM Aether icon
sed -i "s/^Icon=.*/Icon=\/var\/lib\/AccountsService\/icons\/$SUDO_USER.png/" /var/lib/AccountsService/users/$SUDO_USER
curl https://raw.githubusercontent.com/curieldev/resources/main/img/curiel.png -o /var/lib/AccountsService/icons/$SUDO_USER.png

# Set EndeavourOS wallpaper
curl https://raw.githubusercontent.com/curieldev/resources/main/img/endeavouros-wallpaper.png -o /usr/share/endeavouros/backgrounds/endeavouros-wallpaper.png
