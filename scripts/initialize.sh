#!/bin/sh

# Configure locale time and keyboard layout
sudo timedatectl set-timezone Europe/Copenhagen
sudo dpkg-reconfigure keyboard-configuration

# Export environment variables
echo "" >> $HOME/.bashrc
echo "export LC_ALL=en_DK.UTF-8" >> $HOME/.bashrc
echo "export LANG=en_DK.UTF-8" >> $HOME/.bashrc
echo "export LANGUAGE=en_DK.UTF-8" >> $HOME/.bashrc
echo "" >> $HOME/.bashrc
echo "export EDITOR=vim" >> $HOME/.bashrc

# Get vimrc
mkdir git
cd git
git clone https://github.com/ooonak/dotfiles.git
cd dotfiles
bash ./init.sh
cd

echo ""
echo "Remember to open vim and execute :PluginInstall"
echo ""
