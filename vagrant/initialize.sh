#!/bin/sh

echo "export EDITOR=vim" >> $HOME/.bashrc

# Get vimrc
git clone https://github.com/ooonak/dotfiles.git
cd dotfiles
bash ./init.sh
cd

# Get Yocto
git clone git://git.yoctoproject.org/poky
cd poky
git checkout -t origin/honister -b my-honister
cd

echo ""
echo "Remember to open vim and execute :PluginInstall"
echo ""

