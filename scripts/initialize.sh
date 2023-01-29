#!/bin/sh

# Export environment variables
echo "export LC_ALL=en_DK.UTF-8" >> $HOME/.bashrc
echo "export LANG=en_DK.UTF-8" >> $HOME/.bashrc
echo "export LANGUAGE=en_DK.UTF-8" >> $HOME/.bashrc

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

# Download LFC setup script, has all the stuff one needs for development
wget http://bit.ly/LFready -O ready-for.sh
chmod 755 ready-for.sh

