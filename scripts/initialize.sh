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

# Enable Git prompt
echo "" >> $HOME/.bashrc
echo "# https://wiki.archlinux.org/title/Git" >> $HOME/.bashrc
echo "if test -f $HOME/scripts/git-prompt.sh; then" >> $HOME/.bashrc
echo "  source $HOME/scripts/git-prompt.sh 2>&1 /dev/null" >> $HOME/.bashrc
echo "  export GIT_PS1_SHOWSTASHSTATE=true" >> $HOME/.bashrc
echo "  export GIT_PS1_SHOWDIRTYSTATE=true" >> $HOME/.bashrc
echo "  export GIT_PS1_SHOWUNTRACKEDFILES=true" >> $HOME/.bashrc
echo "  export GIT_PS1_SHOWUPSTREAM="auto"" >> $HOME/.bashrc
echo " export GIT_PS1_SHOWCOLORHINTS=true" >> $HOME/.bashrc
echo "  PS1='[\u@\h \W]$(__git_ps1) \$ '" >> $HOME/.bashrc
echo "fi" >> $HOME/.bashrc

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
