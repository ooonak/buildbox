#!/bin/sh

# Expand filesystem to whole partition.
resize2fs /dev/sda1

# Update packagelist and upgrade the system, clean-up including config files.
apt-get update
apt-get dist-upgrade -y

# Please sort packages in alphabetic order $ tr ' ' '\n' < /tmp/to-sort | sort | uniq | tr '\n' ' '

# Common
apt-get install -q -y --no-install-recommends \
  clang clang-format clang-tidy cmake git mold ninja-build tmux vim zstd

# Buildroot dependencies
# https://buildroot.org/downloads/manual/manual.html#requirement-mandatory
apt-get install -q -y --no-install-recommends \
  bash bc binutils build-essential bzip2 cpio diffutils file findutils g++ gcc gzip make patch perl rsync sed tar \
  unzip wget which

# Yocto dependencies
# https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#build-host-packages
apt-get install -q -y --no-install-recommends \
  build-essential chrpath cpio debianutils diffstat file gawk gcc git iputils-ping libacl1 libegl1-mesa liblz4-tool \
  libsdl1.2-dev locales mesa-common-dev python3 python3-git python3-jinja2 python3-pexpect python3-pip \
  python3-subunit socat texinfo unzip wget xz-utils zstd

# LFD courses dependencies, thank you for
# wget https://training.linuxfoundation.org/cm/prep/ready-for.sh


sudo apt-get autoremove --purge -y
sudo apt-get clean -y

# Set locales
sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen
sed -i 's/^# *\(en_DK.UTF-8\)/\1/' /etc/locale.gen
locale-gen

