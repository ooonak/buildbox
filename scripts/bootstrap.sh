#!/bin/sh

# Expand filesystem to whole partition.
resize2fs /dev/sda1

# Update packagelist and upgrade the system, clean-up including config files.
apt-get update
apt-get dist-upgrade -y

# Install packages.
sudo apt-get install -y xfce4 xfce4-goodies
sudo apt-get install -y vim tmux tree curl wget doxygen htop locales rsync \
  gzip bzip2 cpio unzip file bc

# Dev tools
sudo apt-get install -y binutils build-essential clang clang-format \
  clang-tidy clang-tools cmake cppcheck dpkg-dev debianutils cscope \
  exuberant-ctags pkg-config automake ninja-build gdb valgrind \
  diffutils

# QEMU
sudo apt install qemu qemu-utils qemu-system-x86 qemu-system-gui

# Buildroot dependencies
sudo apt-get install -y asciidoc graphviz perl libncurses5-dev \
  python3-matplotlib

# Yocto dependencies
sudo apt-get install -y gawk wget git diffstat unzip texinfo gcc \
  build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
  xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa \
  libsdl1.2-dev pylint3 xterm python3-subunit mesa-common-dev zstd liblz4-tool

sudo apt-get autoremove --purge -y
sudo apt-get clean -y

# Set locales
sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen
sed -i 's/^# *\(en_DK.UTF-8\)/\1/' /etc/locale.gen
locale-gen

