#!/bin/sh

# Expand filesystem to whole partition.
resize2fs /dev/sda1

# Update packagelist and upgrade the system, clean-up including config files.
apt-get update
apt-get dist-upgrade -y

# Install packages.
# Formated with cat pkg.txt | tr " " "\n" | sort | uniq | tr "\n" " " | fmt | sed 's/$/ \\/' | sed 's/^/  /'
sudo apt-get install -y --no-install-recommends \
  aptitude aptitude-common asciidoc automake binutils binutils-dev \
  binutils-riscv64-linux-gnu bison bmap-tools bpfcc-tools bubblewrap \
  build-essential busybox ccache chrpath clang clang-format \
  clang-tidy clang-tools cmake cpio cpp-10-riscv64-linux-gnu \
  cppcheck cpp-riscv64-linux-gnu crash cscope curl cutecom debianutils \
  device-tree-compiler diffstat diffutils dnsmasq-base dos2unix doxygen \
  dpkg-dev emacs emacs-bin-common emacs-common emacs-gtk etckeeper \
  evolution-data-server evolution-data-server-common exuberant-ctags flex \
  freeglut3 gawk gcc gcc-10-cross-base-ports gcc-10-riscv64-linux-gnu \
  gcc-10-riscv64-linux-gnu-base gcc-riscv64-linux-gnu gconf2-common \
  gcr gdb gir1.2-accountsservice-1.0 gir1.2-atk-1.0 gir1.2-atspi-2.0 \
  gir1.2-freedesktop gir1.2-gck-1 gir1.2-gcr-3 gir1.2-gdesktopenums-3.0 \
  gir1.2-gdkpixbuf-2.0 gir1.2-gdm-1.0 gir1.2-geoclue-2.0 gir1.2-glib-2.0 \
  gir1.2-gnomebluetooth-1.0 gir1.2-gnomedesktop-3.0 gir1.2-graphene-1.0 \
  gir1.2-gstreamer-1.0 gir1.2-gtk-2.0 gir1.2-gtk-3.0 gir1.2-gweather-3.0 \
  gir1.2-handy-0.0 gir1.2-harfbuzz-0.0 gir1.2-ibus-1.0 gir1.2-json-1.0 \
  gir1.2-mutter-7 gir1.2-nm-1.0 gir1.2-nma-1.0 gir1.2-notify-0.7 \
  gir1.2-pango-1.0 gir1.2-polkit-1.0 gir1.2-rsvg-2.0 gir1.2-soup-2.4 \
  gir1.2-upowerglib-1.0 git gitk gjs gnome-backgrounds gnome-desktop3-data \
  gnome-keyring gnome-settings-daemon gnome-settings-daemon-common \
  gnome-shell gnome-shell-common gnome-shell-extension-prefs \
  gnome-tweaks gnupg2 gparted gparted-common gperf graphviz \
  gstreamer1.0-pipewire gstreamer1.0-plugins-good help2man htop \
  icu-devtools ieee-data indent install-info iotop iputils-ping \
  kdump-tools kernelshark kexec-tools keyutils libaccountsservice0 \
  libaio-dev libatk1.0-dev libatomic1-riscv64-cross libaudit-dev \
  libavc1394-0 libboost-iostreams1.74.0 libbpfcc libbrlapi0.8 \
  libbrotli-dev libc6-dev-riscv64-cross libc6-riscv64-cross libcacard0 \
  libcairo2-dev libcairo-script-interpreter2 libcamel-1.2-62 libcap-ng-dev \
  libcapstone4 libcwidget4 libdatrie-dev libdaxctl1 libdbus-1-dev \
  libdouble-conversion3 libdv4 libdw-dev libebackend-1.2-10 \
  libebook-1.2-20 libebook-contacts-1.2-3 libecal-2.0-1 \
  libedata-book-1.2-26 libedata-cal-2.0-1 libedataserver-1.2-25 \
  libedataserverui-1.2-2 libegl1-mesa libegl1-mesa-dev libelf-dev \
  libenchant-2-2 libept1.6.0 libexecs0 libfdt1 libfontconfig1-dev \
  libfontconfig-dev libfreetype6-dev libfreetype-dev libfribidi-dev \
  libfuse-dev libgcc-10-dev-riscv64-cross libgcc-s1-riscv64-cross \
  libgconf-2-4 libgcr-ui-3-1 libgdata22 libgdata-common \
  libgdk-pixbuf-2.0-dev libgdm1 libgeoclue-2-0 libgeocode-glib0 \
  libgif7 libgirepository-1.0-1 libgjs0g libglade2-0 libglade2-dev \
  libgnome-autoar-0-0 libgnome-bluetooth13 libgnome-desktop-3-19 \
  libgoa-1.0-0b libgoa-1.0-common libgomp1-riscv64-cross libgraphene-1.0-0 \
  libgraphite2-dev libgstreamer-gl1.0-0 libgtk2.0-0 libgtk2.0-common \
  libgtk2.0-dev libgweather-3-16 libgweather-common libhandy-0.0-0 \
  libharfbuzz-dev libharfbuzz-gobject0 libharfbuzz-icu0 libhugetlbfs0 \
  libhugetlbfs-dev libhunspell-1.7-0 libhyphen0 libibus-1.0-5 \
  libibus-1.0-dev libibverbs1 libical3 libice-dev libicu-dev libiec61883-0 \
  libiniparser1 libipsec-mb0 libjavascriptcoregtk-4.0-18 libjudydebian1 \
  liblz4-tool liblzma-dev liblzo2-2 liblzo2-dev libm17n-0 libmanette-0.2-0 \
  libmd4c0 libmm-glib0 libmozjs-78-0 libmpg123-0 libmspack0 libmutter-7-0 \
  libncurses5-dev libndctl6 libnfsidmap2 libnl-route-3-200 libnm0 \
  libnma0 libnma-common libnuma-dev libopencsd0 libotf0 libpango1.0-dev \
  libpangoxft-1.0-0 libpcsclite1 libperl-dev libphonenumber8 \
  libpipewire-0.3-0 libpipewire-0.3-modules libpixman-1-dev libpmem1 \
  libprotobuf23 libqt5core5a libqt5dbus5 libqt5gui5 libqt5network5 \
  libqt5serialport5 libqt5widgets5 libraw1394-11 librdmacm1 libsctp1 \
  libsdl1.2-dev libsdl2-2.0-0 libsdl2-dev libshout3 libslirp0 libsm-dev \
  libsndio7.0 libsndio-dev libspa-0.2-modules libspice-server1 libssl-dev \
  libsysfs2 libthai-dev libtool libtool-bin libudev-dev libunwind-dev \
  libusbredirparser1 libv4l-0 libv4lconvert0 libvdeplug2 libvirglrenderer1 \
  libwayland-bin libwayland-dev libwebkit2gtk-4.0-37 libwpe-1.0-1 \
  libwpebackend-fdo-1.0-1 libxcb-icccm4 libxcb-image0 libxcb-keysyms1 \
  libxcb-render0-dev libxcb-render-util0 libxcb-res0 libxcb-shm0-dev \
  libxcb-xinerama0 libxcb-xinput0 libxcb-xkb1 libxcomposite-dev \
  libxcursor-dev libxdamage-dev libxfixes-dev libxft-dev libxi-dev \
  libxinerama-dev libxkbcommon-dev libxkbcommon-x11-0 libxkbregistry0 \
  libxml2-dev libxmlsec1 libxmlsec1-openssl libxrandr-dev libxrender-dev \
  libxss-dev libxt-dev libxv-dev libxxf86vm-dev libyaml-dev libzstd-dev \
  libaa1 linux-libc-dev-riscv64-cross linux-perf linux-perf-5.10 locales \
  lzop m17n-db makedumpfile mesa-common-dev meson minicom mtd-utils \
  mutter-common net-tools nfs-common nfs-kernel-server ninja-build \
  open-vm-tools p11-kit p11-kit-modules pango1.0-tools patchutils perl \
  pinentry-gnome3 pipewire pipewire-bin pkg-config policycoreutils psmisc \
  pylint3 python3 python3-bpfcc python3-gi python3-git python3-jinja2 \
  python3-matplotlib python3-netaddr python3-pexpect python3-pip \
  python3-ply python3-subunit qemu qemu-efi-aarch64 qemu-system-arm \
  qemu-system-common qemu-system-data qemu-system-gui qemu-system-misc \
  qemu-system-x86 qemu-utils rpcbind rsync screen selinux-utils socat sparse \
  squashfs-tools strace stress stress-ng swig swig4.0 synaptic sysfsutils \
  texinfo tmux tofrodos trace-cmd tree u-boot-tools unp unzip valgrind \
  vim wget x11proto-input-dev x11proto-randr-dev x11proto-scrnsaver-dev \
  x11proto-xf86vidmode-dev x11proto-xinerama-dev xdg-dbus-proxy xfce4 \
  xfce4-goodies xterm xz-utils zstd

sudo apt-get autoremove --purge -y
sudo apt-get clean -y

# Set locales
sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen
sed -i 's/^# *\(en_DK.UTF-8\)/\1/' /etc/locale.gen
locale-gen

