#!/bin/sh

# Expand filesystem to whole partition.
resize2fs /dev/sda1

# Update packagelist and upgrade the system, clean-up including config files.
apt-get update
apt-get dist-upgrade -y
apt-get autoremove --purge -y

# Install packages.
sudo apt-get --no-install-recommends --no-install-suggests install -y aptitude aptitude-common autoconf automake autotools-dev bc binutils-dev bison bmap-tools bubblewrap build-essential ccache chrpath clang clang-format clang-tidy clang-tools cmake cpio cpp cppcheck crash cscope curl debianutils device-tree-compiler diffstat dirmngr dnsmasq-base dos2unix dosfstools doxygen dpkg-dev exuberant-ctags flex g++ gawk gcc gcc-multilib gdb git git-man gnupg gnupg-utils gnupg2 gperf help2man htop indent install-info iotop iputils-ping iso-codes keyutils liblz4-tool liblzma-dev liblzo2-2 liblzo2-dev linux-perf linux-perf-5.10 ltrace lzop m17n-db m4 make manpages-dev mesa-common-dev minicom mtd-utils net-tools nfs-common nfs-kernel-server ninja-build p11-kit p11-kit-modules patch patchutils pkg-config psmisc pylint3 python-pip-whl python3 python3-distutils python3-gi python3-git python3-jinja2 python3-lib2to3 python3-pexpect python3-pip python3-setuptools python3-subunit python3-wheel qemu-system-common qemu-system-data qemu-system-misc rpcbind rsync screen socat squashfs-tools strace stress stress-ng swig swig4.0 sysfsutils tcl tcl8.6 tex-common texinfo tmux tofrodos trace-cmd tree u-boot-tools unp unzip uuid-dev vim vim-runtime wget xterm xz-utils zip zlib1g-dev zstd

# Run initialization/configuration script as user inside virtual machine.
su -c "source /home/vagrant/vagrant/init.sh" vagrant

