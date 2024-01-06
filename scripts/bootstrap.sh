#!/bin/sh

INSTALL_LFD_DEPENDENCIES=false

# Expand filesystem to whole partition.
resize2fs /dev/sda1

# Update packagelist and upgrade the system, clean-up including config files.
apt-get update
apt-get dist-upgrade -y

# Please sort packages in alphabetic order $ tr ' ' '\n' < /tmp/to-sort | sort | uniq | tr '\n' ' '

# Common
apt-get install -q -y --no-install-recommends \
  autoconf automake autotools-dev bc binutils-dev clang clang-format clang-tidy cmake cscope exuberant-ctags gdb \
  git htop mold ninja-build screen tmux tree u-boot-tools unp unzip uuid-dev vim vim-runtime zstd

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

if [ ${INSTALL_LFD_DEPENDENCIES} == 'true' ]; then
# LFD courses dependencies
# wget https://training.linuxfoundation.org/cm/prep/ready-for.sh

# LFD420: Linux Kernel Internals and Development
apt-get -q -y --no-install-recommends install \
adwaita-icon-theme aptitude aptitude-common at-spi2-common autoconf automake autotools-dev bc binutils-dev bison bubblewrap crash cscope curl dbus-user-session dconf-gsettings-backend dconf-service dos2unix emacs emacs-bin-common emacs-common emacs-el emacs-gtk emacsen-common etckeeper exuberant-ctags flex fontconfig fonts-freefont-ttf gawk gdb geocode-glib-common gir1.2-atk-1.0 gir1.2-freedesktop gir1.2-gdesktopenums-3.0 gir1.2-gdkpixbuf-2.0 gir1.2-glib-2.0 gir1.2-gnomedesktop-3.0 gir1.2-gtk-2.0 gir1.2-gtk-3.0 gir1.2-handy-1 gir1.2-harfbuzz-0.0 gir1.2-notify-0.7 gir1.2-pango-1.0 git git-man gitk glib-networking glib-networking-common glib-networking-services gnome-desktop3-data gnome-settings-daemon gnome-settings-daemon-common gnome-shell-common gnome-tweaks gnupg2 gparted gparted-common gsettings-desktop-schemas gtk-update-icon-cache hicolor-icon-theme htop icu-devtools indent install-info iotop iso-codes kernelshark keyutils libaio-dev libasound2 libasound2-data libasyncns0 libatk-bridge2.0-0 libatk1.0-0 libatk1.0-dev libatkmm-1.6-1v5 libatspi2.0-0 libaudit-dev libavahi-client3 libavahi-common-data libavahi-common3 libbabeltrace1 libblkid-dev libbluetooth3 libboost-iostreams1.74.0 libboost-regex1.74.0 libbrotli-dev libcairo-gobject2 libcairo-script-interpreter2 libcairo2 libcairo2-dev libcairomm-1.0-1v5 libcanberra-gtk3-0 libcanberra0 libcap-ng-dev libcolord2 libcups2 libcurl3-gnutls libcurl4 libcwidget4 libdatrie-dev libdatrie1 libdconf1 libdebuginfod-common libdebuginfod1 libdeflate-dev libdouble-conversion3 libdrm-amdgpu1 libdrm-common libdrm-intel1 libdrm-nouveau2 libdrm-radeon1 libdrm2 libduktape207 libdw-dev libdw1 libegl-mesa0 libegl1 libelf-dev libepoxy0 libept1.6.0 liberror-perl libevdev2 libevent-core-2.1-7 libexpat1-dev libffi-dev libflac12 libfontconfig-dev libfreeaptx0 libfreetype-dev libfribidi-dev libfribidi0 libfuse-dev libgbm1 libgccjit0 libgck-1-0 libgcr-base-3-1 libgdk-pixbuf-2.0-0 libgdk-pixbuf-2.0-dev libgdk-pixbuf2.0-bin libgdk-pixbuf2.0-common libgeoclue-2-0 libgeocode-glib-2-0 libgif7 libgirepository-1.0-1 libgl1 libgl1-mesa-dri libglade2-0 libglade2-dev libglapi-mesa libgles2 libglib2.0-bin libglib2.0-data libglib2.0-dev libglib2.0-dev-bin libglibmm-2.4-1v5 libglu1-mesa libglut3.12 libglvnd0 libglx-mesa0 libglx0 libgnome-desktop-3-20 libgpm2 libgraphite2-3 libgraphite2-dev libgtk-3-0 libgtk-3-common libgtk2.0-0 libgtk2.0-common libgtk2.0-dev libgtkmm-3.0-1v5 libgudev-1.0-0 libgweather-4-0 libgweather-4-common libhandy-1-0 libharfbuzz-dev libharfbuzz-gobject0 libharfbuzz-icu0 libharfbuzz-subset0 libharfbuzz0b libhugetlbfs-dev libhugetlbfs0 libice-dev libice6 libicu-dev libinput-bin libinput10 libipsec-mb1 libipt2 libjbig-dev libjpeg-dev libjpeg62-turbo-dev libjson-glib-1.0-0 libjson-glib-1.0-common libjudydebian1 libkshark2 liblc3-0 liblcms2-2 libldacbt-abr2 libldacbt-enc2 liblerc-dev liblilv-0-0 libllvm14 libllvm15 libltdl7 liblua5.3-0 liblzma-dev liblzo2-2 liblzo2-dev libm17n-0 libmd4c0 libmm-glib0 libmount-dev libmp3lame0 libmpg123-0 libmspack0 libmtdev1 libncurses-dev libncurses6 libnfsidmap1 libnl-3-200 libnl-genl-3-200 libnm0 libnotify4 libnspr4 libnss3 libnuma-dev libogg0 libopencsd1 libopengl0 libopus0 libotf1 libpango-1.0-0 libpango1.0-dev libpangocairo-1.0-0 libpangoft2-1.0-0 libpangomm-1.4-1v5 libpangoxft-1.0-0 libparted-fs-resize0 libparted2 libpciaccess0 libpcre2-16-0 libpcre2-32-0 libpcre2-dev libpcre2-posix3 libperl-dev libpipewire-0.3-0 libpipewire-0.3-modules libpixman-1-0 libpixman-1-dev libpkgconf3 libpng-dev libpolkit-agent-1-0 libpolkit-gobject-1-0 libproxy1v5 libpthread-stubs0-dev libpulse-mainloop-glib0 libpulse0 libpython3-dev libpython3.11 libpython3.11-dev libqt5core5a libqt5dbus5 libqt5gui5 libqt5network5 libqt5widgets5 librsvg2-2 libsbc1 libsctp1 libselinux1-dev libsensors-config libsensors5 libsepol-dev libserd-0-0 libsigc++-2.0-0v5 libsigsegv2 libslang2-dev libsm-dev libsm6 libsnappy1v5 libsndfile1 libsodium23 libsord-0-0 libsoup-3.0-0 libsoup-3.0-common libsource-highlight-common libsource-highlight4v5 libspa-0.2-bluetooth libspa-0.2-modules libsratom-0-0 libssl-dev libsysfs2 libtcl8.6 libtdb1 libthai-data libthai-dev libthai0 libtiff-dev libtiffxx6 libtk8.6 libtool libtool-bin libtracecmd1 libtraceevent1 libtraceevent1-plugin libtracefs1 libunwind-dev libunwind8 libupower-glib3 libusb-1.0-0 libutempter0 libvorbis0a libvorbisenc2 libvorbisfile3 libvte-2.91-0 libvte-2.91-common libwacom-common libwacom9 libwayland-client0 libwayland-cursor0 libwayland-egl1 libwayland-server0 libwebp-dev libwebpdemux2 libwebpmux3 libwebrtc-audio-processing1 libwireplumber-0.4-0 libx11-dev libx11-xcb1 libxapian30 libxau-dev libxcb-dri2-0 libxcb-dri3-0 libxcb-glx0 libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-present0 libxcb-randr0 libxcb-render-util0 libxcb-render0 libxcb-render0-dev libxcb-shape0 libxcb-shm0 libxcb-shm0-dev libxcb-sync1 libxcb-util1 libxcb-xfixes0 libxcb-xinerama0 libxcb-xinput0 libxcb-xkb1 libxcb1-dev libxcomposite-dev libxcomposite1 libxcursor-dev libxcursor1 libxdamage-dev libxdamage1 libxdmcp-dev libxext-dev libxext6 libxfixes-dev libxfixes3 libxft-dev libxft2 libxi-dev libxi6 libxinerama-dev libxinerama1 libxkbcommon-x11-0 libxkbcommon0 libxkbregistry0 libxml2-dev libxml2-utils libxmlsec1 libxmlsec1-openssl libxrandr-dev libxrandr2 libxrender-dev libxrender1 libxshmfence1 libxslt1.1 libxss1 libxt6 libxxf86vm1 libz3-4 libzstd-dev linux-perf m17n-db m4 mutter-common net-tools nfs-common open-vm-tools pango1.0-tools patchutils pipewire pipewire-alsa pipewire-audio pipewire-bin pipewire-pulse pkexec pkg-config pkgconf pkgconf-bin policykit-1 polkitd psmisc python3-distutils python3-gi python3-lib2to3 rpcbind rsync screen sgml-base shared-mime-info sound-theme-freedesktop sparse strace stress stress-ng swig swig4.0 synaptic sysfsutils tcl tcl8.6 tk tk8.6 tofrodos trace-cmd tree unp unzip uuid-dev vim vim-runtime wireplumber x11-common x11proto-core-dev x11proto-dev xkb-data xml-core xorg-sgml-doctools xtrans-dev zip zlib1g-dev

# LFD435: Embedded Linux Device Drivers
apt-get -q -y --no-install-recommends install \
adwaita-icon-theme at-spi2-common autoconf automake autotools-dev bc binutils-dev binutils-riscv64-linux-gnu bison bmap-tools cpp-12-riscv64-linux-gnu cpp-riscv64-linux-gnu crash cscope curl cutecom dbus-user-session dconf-gsettings-backend dconf-service device-tree-compiler dnsmasq-base dos2unix dosfstools eject emacs-bin-common emacs-common emacs-el emacs-gtk emacsen-common exuberant-ctags flex fontconfig fonts-freefont-ttf gawk gcc-12-cross-base-ports gcc-12-riscv64-linux-gnu gcc-12-riscv64-linux-gnu-base gcc-riscv64-linux-gnu gdb git git-man gitk gnupg2 gperf gtk-update-icon-cache hicolor-icon-theme indent install-info iotop iso-codes kernelshark keyutils libasan8-riscv64-cross libasound2 libasound2-data libatk-bridge2.0-0 libatk1.0-0 libatomic1-riscv64-cross libatspi2.0-0 libaudit-dev libavahi-client3 libavahi-common-data libavahi-common3 libbabeltrace1 libblkid-dev libboost-regex1.74.0 libbrlapi0.8 libc6-dev-riscv64-cross libc6-riscv64-cross libcacard0 libcairo-gobject2 libcairo2 libcap-ng-dev libcapstone4 libcolord2 libcups2 libcurl3-gnutls libcurl4 libdatrie1 libdaxctl1 libdconf1 libdebuginfod-common libdebuginfod1 libdouble-conversion3 libdrm-amdgpu1 libdrm-common libdrm-intel1 libdrm-nouveau2 libdrm-radeon1 libdrm2 libduktape207 libdw-dev libdw1 libegl-mesa0 libegl1 libelf-dev libepoxy0 liberror-perl libevdev2 libevent-core-2.1-7 libexecs0 libexpat1-dev libfdt1 libffi-dev libfribidi0 libfuse-dev libgbm1 libgcc-12-dev-riscv64-cross libgcc-s1-riscv64-cross libgccjit0 libgdk-pixbuf-2.0-0 libgdk-pixbuf2.0-common libgif7 libgl1 libgl1-mesa-dri libglapi-mesa libgles2 libglib2.0-bin libglib2.0-data libglib2.0-dev libglib2.0-dev-bin libglu1-mesa libglut3.12 libglvnd0 libglx-mesa0 libglx0 libgomp1-riscv64-cross libgpm2 libgraphite2-3 libgstreamer-plugins-base1.0-0 libgstreamer1.0-0 libgtk-3-0 libgtk-3-common libgudev-1.0-0 libharfbuzz0b libhugetlbfs-dev libhugetlbfs0 libibverbs1 libice6 libiniparser1 libinput-bin libinput10 libipsec-mb1 libipt2 libjudydebian1 libkshark2 liblcms2-2 libllvm14 libllvm15 liblzma-dev liblzo2-2 liblzo2-dev libm17n-0 libmd4c0 libmount-dev libmtdev1 libncurses-dev libncurses6 libndctl6 libnfsidmap1 libnl-3-200 libnl-route-3-200 libnspr4 libnss3 libopencsd1 libopengl0 libopus0 liborc-0.4-0 libotf1 libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0 libparted2 libpciaccess0 libpcre2-16-0 libpcre2-32-0 libpcre2-dev libpcre2-posix3 libpcsclite1 libpixman-1-0 libpixman-1-dev libpkgconf3 libpmem1 libpng-dev libpolkit-agent-1-0 libpolkit-gobject-1-0 libpython3-dev libpython3.11 libpython3.11-dev libqt5core5a libqt5dbus5 libqt5gui5 libqt5network5 libqt5serialport5 libqt5widgets5 librdmacm1 librsvg2-2 libsctp1 libselinux1-dev libsensors-config libsensors5 libsepol-dev libsigsegv2 libslang2-dev libslirp0 libsm6 libsnappy1v5 libsndio7.0 libsource-highlight-common libsource-highlight4v5 libspice-server1 libssl-dev libsysfs2 libtcl8.6 libthai-data libthai0 libtk8.6 libtool libtool-bin libtracecmd1 libtraceevent1 libtraceevent1-plugin libtracefs1 libunwind-dev libunwind8 libusb-1.0-0 libusbredirparser1 libutempter0 libvdeplug2 libwacom-common libwacom9 libwayland-client0 libwayland-cursor0 libwayland-egl1 libwayland-server0 libx11-xcb1 libxcb-dri2-0 libxcb-dri3-0 libxcb-glx0 libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-present0 libxcb-randr0 libxcb-render-util0 libxcb-render0 libxcb-shape0 libxcb-shm0 libxcb-sync1 libxcb-util1 libxcb-xfixes0 libxcb-xinerama0 libxcb-xinput0 libxcb-xkb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxft2 libxi6 libxinerama1 libxkbcommon-x11-0 libxkbcommon0 libxrandr2 libxrender1 libxshmfence1 libxss1 libxt6 libxxf86vm1 libyaml-0-2 libyaml-dev libz3-4 libzstd-dev linux-libc-dev-riscv64-cross linux-perf lzop m17n-db m4 meson minicom mtd-utils nfs-common nfs-kernel-server ninja-build parted patchutils pkexec pkg-config pkgconf pkgconf-bin polkitd psmisc python3-distutils python3-lib2to3 python3-pip python3-setuptools python3-wheel qemu-system-common qemu-system-data qemu-system-misc rpcbind screen sgml-base shared-mime-info sparse strace stress stress-ng swig swig4.0 sysfsutils tcl tcl8.6 tk tk8.6 tofrodos trace-cmd tree u-boot-tools unzip uuid-dev x11-common xkb-data xml-core zlib1g-dev

# LFD450: Embedded Linux Development
apt-get -q -y --no-install-recommends install \
adwaita-icon-theme aptitude aptitude-common at-spi2-common autoconf automake autotools-dev bc binutils-riscv64-linux-gnu bison bmap-tools bubblewrap ccache cmake cmake-data cpp-12-riscv64-linux-gnu cpp-riscv64-linux-gnu crash cscope curl cutecom dbus-user-session dconf-gsettings-backend dconf-service device-tree-compiler dnsmasq-base dos2unix dosfstools eject emacs emacs-bin-common emacs-common emacs-el emacs-gtk emacsen-common etckeeper exuberant-ctags flex fontconfig fonts-freefont-ttf gawk gcc-12-cross-base-ports gcc-12-riscv64-linux-gnu gcc-12-riscv64-linux-gnu-base gcc-riscv64-linux-gnu gdb geocode-glib-common gir1.2-atk-1.0 gir1.2-freedesktop gir1.2-gdesktopenums-3.0 gir1.2-gdkpixbuf-2.0 gir1.2-glib-2.0 gir1.2-gnomedesktop-3.0 gir1.2-gtk-2.0 gir1.2-gtk-3.0 gir1.2-handy-1 gir1.2-harfbuzz-0.0 gir1.2-notify-0.7 gir1.2-pango-1.0 git git-man gitk glib-networking glib-networking-common glib-networking-services gnome-desktop3-data gnome-settings-daemon gnome-settings-daemon-common gnome-shell-common gnome-tweaks gnupg2 gparted gparted-common gperf gsettings-desktop-schemas gtk-update-icon-cache help2man hicolor-icon-theme htop icu-devtools indent install-info iotop iso-codes kernelshark keyutils libarchive13 libasan8-riscv64-cross libasound2 libasound2-data libasyncns0 libatk-bridge2.0-0 libatk1.0-0 libatk1.0-dev libatkmm-1.6-1v5 libatomic1-riscv64-cross libatspi2.0-0 libavahi-client3 libavahi-common-data libavahi-common3 libbabeltrace1 libblkid-dev libbluetooth3 libboost-iostreams1.74.0 libboost-regex1.74.0 libbrlapi0.8 libbrotli-dev libc6-dev-riscv64-cross libc6-riscv64-cross libcacard0 libcairo-gobject2 libcairo-script-interpreter2 libcairo2 libcairo2-dev libcairomm-1.0-1v5 libcanberra-gtk3-0 libcanberra0 libcapstone4 libcolord2 libcups2 libcurl3-gnutls libcurl4 libcwidget4 libdatrie-dev libdatrie1 libdaxctl1 libdconf1 libdebuginfod-common libdebuginfod1 libdeflate-dev libdouble-conversion3 libdrm-amdgpu1 libdrm-common libdrm-intel1 libdrm-nouveau2 libdrm-radeon1 libdrm2 libduktape207 libdw1 libegl-mesa0 libegl1 libelf-dev libepoxy0 libept1.6.0 liberror-perl libevdev2 libevent-core-2.1-7 libexecs0 libexpat1-dev libfdt1 libffi-dev libflac12 libfontconfig-dev libfreeaptx0 libfreetype-dev libfribidi-dev libfribidi0 libfuse-dev libgbm1 libgcc-12-dev-riscv64-cross libgcc-s1-riscv64-cross libgccjit0 libgck-1-0 libgcr-base-3-1 libgdk-pixbuf-2.0-0 libgdk-pixbuf-2.0-dev libgdk-pixbuf2.0-bin libgdk-pixbuf2.0-common libgeoclue-2-0 libgeocode-glib-2-0 libgif7 libgirepository-1.0-1 libgl1 libgl1-mesa-dri libglade2-0 libglade2-dev libglapi-mesa libglib2.0-bin libglib2.0-data libglib2.0-dev libglib2.0-dev-bin libglibmm-2.4-1v5 libglu1-mesa libglut3.12 libglvnd0 libglx-mesa0 libglx0 libgnome-desktop-3-20 libgomp1-riscv64-cross libgpm2 libgraphite2-3 libgraphite2-dev libgstreamer-plugins-base1.0-0 libgstreamer1.0-0 libgtk-3-0 libgtk-3-common libgtk2.0-0 libgtk2.0-common libgtk2.0-dev libgtkmm-3.0-1v5 libgudev-1.0-0 libgweather-4-0 libgweather-4-common libhandy-1-0 libharfbuzz-dev libharfbuzz-gobject0 libharfbuzz-icu0 libharfbuzz-subset0 libharfbuzz0b libhiredis0.14 libhugetlbfs-dev libhugetlbfs0 libibverbs1 libice-dev libice6 libicu-dev libiniparser1 libinput-bin libinput10 libipt2 libjbig-dev libjpeg-dev libjpeg62-turbo-dev libjson-glib-1.0-0 libjson-glib-1.0-common libjsoncpp25 libkshark2 liblc3-0 liblcms2-2 libldacbt-abr2 libldacbt-enc2 liblerc-dev liblilv-0-0 libllvm14 libllvm15 libltdl7 liblua5.3-0 liblzma-dev liblzo2-2 liblzo2-dev libm17n-0 libmd4c0 libmm-glib0 libmount-dev libmp3lame0 libmpg123-0 libmspack0 libmtdev1 libncurses-dev libncurses6 libndctl6 libnfsidmap1 libnl-3-200 libnl-genl-3-200 libnl-route-3-200 libnm0 libnotify4 libnspr4 libnss3 libogg0 libopencsd1 libopengl0 libopus0 liborc-0.4-0 libotf1 libpango-1.0-0 libpango1.0-dev libpangocairo-1.0-0 libpangoft2-1.0-0 libpangomm-1.4-1v5 libpangoxft-1.0-0 libparted-fs-resize0 libparted2 libpciaccess0 libpcre2-16-0 libpcre2-32-0 libpcre2-dev libpcre2-posix3 libpcsclite1 libpipewire-0.3-0 libpipewire-0.3-modules libpixman-1-0 libpixman-1-dev libpkgconf3 libpmem1 libpng-dev libpolkit-agent-1-0 libpolkit-gobject-1-0 libproxy1v5 libpthread-stubs0-dev libpulse-mainloop-glib0 libpulse0 libpython3-dev libpython3.11 libpython3.11-dev libqt5core5a libqt5dbus5 libqt5gui5 libqt5network5 libqt5serialport5 libqt5widgets5 librdmacm1 librhash0 librsvg2-2 libsbc1 libselinux1-dev libsensors-config libsensors5 libsepol-dev libserd-0-0 libsigc++-2.0-0v5 libsigsegv2 libslang2-dev libslirp0 libsm-dev libsm6 libsnappy1v5 libsndfile1 libsndio7.0 libsodium23 libsord-0-0 libsoup-3.0-0 libsoup-3.0-common libsource-highlight-common libsource-highlight4v5 libspa-0.2-bluetooth libspa-0.2-modules libspice-server1 libsratom-0-0 libssl-dev libsysfs2 libtcl8.6 libtdb1 libtext-unidecode-perl libthai-data libthai-dev libthai0 libtiff-dev libtiffxx6 libtk8.6 libtool libtool-bin libtracecmd1 libtraceevent1 libtraceevent1-plugin libtracefs1 libunwind8 libupower-glib3 libusb-1.0-0 libusbredirparser1 libutempter0 libvdeplug2 libvorbis0a libvorbisenc2 libvorbisfile3 libvte-2.91-0 libvte-2.91-common libwacom-common libwacom9 libwayland-client0 libwayland-cursor0 libwayland-egl1 libwayland-server0 libwebp-dev libwebpdemux2 libwebpmux3 libwebrtc-audio-processing1 libwireplumber-0.4-0 libx11-dev libx11-xcb1 libxapian30 libxau-dev libxcb-dri2-0 libxcb-dri3-0 libxcb-glx0 libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-present0 libxcb-randr0 libxcb-render-util0 libxcb-render0 libxcb-render0-dev libxcb-shape0 libxcb-shm0 libxcb-shm0-dev libxcb-sync1 libxcb-util1 libxcb-xfixes0 libxcb-xinerama0 libxcb-xinput0 libxcb-xkb1 libxcb1-dev libxcomposite-dev libxcomposite1 libxcursor-dev libxcursor1 libxdamage-dev libxdamage1 libxdmcp-dev libxext-dev libxext6 libxfixes-dev libxfixes3 libxft-dev libxft2 libxi-dev libxi6 libxinerama-dev libxinerama1 libxkbcommon-x11-0 libxkbcommon0 libxkbregistry0 libxml-libxml-perl libxml-namespacesupport-perl libxml-sax-base-perl libxml-sax-perl libxml2-dev libxml2-utils libxmlsec1 libxmlsec1-openssl libxrandr-dev libxrandr2 libxrender-dev libxrender1 libxshmfence1 libxslt1.1 libxss1 libxt6 libxxf86vm1 libyaml-0-2 libyaml-dev libz3-4 libzstd-dev linux-libc-dev-riscv64-cross linux-perf lzop m17n-db m4 meson minicom mtd-utils mutter-common net-tools nfs-common nfs-kernel-server ninja-build open-vm-tools pango1.0-tools parted patchutils pipewire pipewire-alsa pipewire-audio pipewire-bin pipewire-pulse pkexec pkg-config pkgconf pkgconf-bin policykit-1 polkitd psmisc python3-distutils python3-gi python3-lib2to3 python3-pip python3-setuptools python3-wheel qemu-system-common qemu-system-data qemu-system-misc rpcbind rsync screen sgml-base shared-mime-info sound-theme-freedesktop sparse squashfs-tools strace swig swig4.0 synaptic sysfsutils tcl tcl8.6 tex-common texinfo tk tk8.6 tofrodos trace-cmd tree u-boot-tools unp unzip uuid-dev vim vim-runtime wireplumber x11-common x11proto-core-dev x11proto-dev xkb-data xml-core xorg-sgml-doctools xtrans-dev zip zlib1g-dev

# LDF460: Embedded Linux Platform Development with the Yocto Project
apt-get -q -y --no-install-recommends install \
adwaita-icon-theme aptitude aptitude-common at-spi2-common autoconf automake autotools-dev bison bubblewrap ccache chrpath curl dbus-user-session dconf-gsettings-backend dconf-service diffstat dos2unix emacs emacs-bin-common emacs-common emacs-el emacs-gtk emacsen-common etckeeper flex fontconfig gawk gdb geocode-glib-common gir1.2-atk-1.0 gir1.2-freedesktop gir1.2-gdesktopenums-3.0 gir1.2-gdkpixbuf-2.0 gir1.2-glib-2.0 gir1.2-gnomedesktop-3.0 gir1.2-gtk-3.0 gir1.2-handy-1 gir1.2-harfbuzz-0.0 gir1.2-ibus-1.0 gir1.2-notify-0.7 gir1.2-pango-1.0 git git-man glib-networking glib-networking-common glib-networking-services gnome-desktop3-data gnome-settings-daemon gnome-settings-daemon-common gnome-shell-common gnome-tweaks gnupg2 gparted gparted-common gsettings-desktop-schemas gtk-update-icon-cache hicolor-icon-theme htop install-info iso-codes libasound2 libasound2-data libasound2-dev libasyncns0 libatk-bridge2.0-0 libatk1.0-0 libatkmm-1.6-1v5 libatspi2.0-0 libavahi-client3 libavahi-common-data libavahi-common3 libbabeltrace1 libblkid-dev libbluetooth3 libboost-iostreams1.74.0 libboost-regex1.74.0 libcairo-gobject2 libcairo2 libcairomm-1.0-1v5 libcanberra-gtk3-0 libcanberra0 libcolord2 libcups2 libcurl3-gnutls libcurl4 libcwidget4 libdatrie1 libdbus-1-dev libdconf1 libdebuginfod-common libdebuginfod1 libdecor-0-0 libdecor-0-dev libdrm-amdgpu1 libdrm-common libdrm-dev libdrm-intel1 libdrm-nouveau2 libdrm-radeon1 libdrm2 libduktape207 libdw1 libegl-dev libegl-mesa0 libegl1 libegl1-mesa libepoxy0 libept1.6.0 liberror-perl libffi-dev libflac12 libfreeaptx0 libfribidi0 libgbm-dev libgbm1 libgccjit0 libgck-1-0 libgcr-base-3-1 libgdk-pixbuf-2.0-0 libgdk-pixbuf2.0-common libgeoclue-2-0 libgeocode-glib-2-0 libgif7 libgirepository-1.0-1 libgl-dev libgl1 libgl1-mesa-dri libglapi-mesa libgles-dev libgles1 libgles2 libglib2.0-bin libglib2.0-data libglib2.0-dev libglib2.0-dev-bin libglibmm-2.4-1v5 libglvnd0 libglx-dev libglx-mesa0 libglx0 libgnome-desktop-3-20 libgpm2 libgraphite2-3 libgtk-3-0 libgtk-3-common libgtkmm-3.0-1v5 libgudev-1.0-0 libgweather-4-0 libgweather-4-common libhandy-1-0 libharfbuzz0b libhiredis0.14 libibus-1.0-5 libibus-1.0-dev libice-dev libice6 libipt2 libjson-glib-1.0-0 libjson-glib-1.0-common liblc3-0 liblcms2-2 libldacbt-abr2 libldacbt-enc2 liblilv-0-0 libllvm15 libltdl7 liblua5.3-0 liblz4-tool libm17n-0 libmm-glib0 libmount-dev libmp3lame0 libmpg123-0 libmspack0 libnl-3-200 libnl-genl-3-200 libnm0 libnotify4 libnspr4 libnss3 libogg0 libopus0 libotf1 libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0 libpangomm-1.4-1v5 libpangoxft-1.0-0 libparted-fs-resize0 libparted2 libpciaccess-dev libpciaccess0 libpcre2-16-0 libpcre2-32-0 libpcre2-dev libpcre2-posix3 libpipewire-0.3-0 libpipewire-0.3-modules libpixman-1-0 libpkgconf3 libpolkit-agent-1-0 libpolkit-gobject-1-0 libproxy1v5 libpthread-stubs0-dev libpulse-dev libpulse-mainloop-glib0 libpulse0 libpython3.11 librsvg2-2 libsamplerate0 libsamplerate0-dev libsbc1 libsdl2-2.0-0 libsdl2-dev libselinux1-dev libsensors-config libsensors5 libsepol-dev libserd-0-0 libsigc++-2.0-0v5 libsigsegv2 libsm-dev libsm6 libsndfile1 libsndio-dev libsndio7.0 libsodium23 libsord-0-0 libsoup-3.0-0 libsoup-3.0-common libsource-highlight-common libsource-highlight4v5 libspa-0.2-bluetooth libspa-0.2-modules libsratom-0-0 libtdb1 libtext-unidecode-perl libthai-data libthai0 libtool libtool-bin libudev-dev libupower-glib3 libusb-1.0-0 libutempter0 libvorbis0a libvorbisenc2 libvorbisfile3 libvte-2.91-0 libvte-2.91-common libwacom-common libwacom9 libwayland-bin libwayland-client0 libwayland-cursor0 libwayland-dev libwayland-egl1 libwayland-server0 libwebrtc-audio-processing1 libwireplumber-0.4-0 libx11-dev libx11-xcb1 libxapian30 libxau-dev libxaw7 libxcb-dri2-0 libxcb-dri3-0 libxcb-glx0 libxcb-present0 libxcb-randr0 libxcb-render0 libxcb-shm0 libxcb-sync1 libxcb-xfixes0 libxcb1-dev libxcomposite1 libxcursor-dev libxcursor1 libxdamage1 libxdmcp-dev libxext-dev libxext6 libxfixes-dev libxfixes3 libxft2 libxi-dev libxi6 libxinerama-dev libxinerama1 libxkbcommon-dev libxkbcommon0 libxkbregistry0 libxml-libxml-perl libxml-namespacesupport-perl libxml-sax-base-perl libxml-sax-perl libxmlsec1 libxmlsec1-openssl libxmu6 libxrandr-dev libxrandr2 libxrender-dev libxrender1 libxshmfence1 libxslt1.1 libxss-dev libxss1 libxt-dev libxt6 libxv-dev libxv1 libxxf86vm-dev libxxf86vm1 libz3-4 lz4 m17n-db m4 mesa-common-dev mutter-common net-tools open-vm-tools patchutils pipewire pipewire-alsa pipewire-audio pipewire-bin pipewire-pulse pkexec pkg-config pkgconf pkgconf-bin policykit-1 polkitd psmisc pylint python3-astroid python3-dill python3-distutils python3-extras python3-fixtures python3-gi python3-git python3-gitdb python3-importlib-metadata python3-isort python3-jinja2 python3-lazy-object-proxy python3-lib2to3 python3-logilab-common python3-markupsafe python3-mccabe python3-more-itertools python3-mypy-extensions python3-pbr python3-pexpect python3-pip python3-platformdirs python3-ply python3-ptyprocess python3-setuptools python3-smmap python3-subunit python3-testtools python3-toml python3-tomlkit python3-typing-extensions python3-wheel python3-wrapt python3-zipp rsync screen sgml-base shared-mime-info socat sound-theme-freedesktop synaptic tex-common texinfo tofrodos tree unp unzip uuid-dev vim vim-runtime wireplumber x11-common x11proto-dev xbitmaps xkb-data xml-core xorg-sgml-doctools xterm xtrans-dev zip zlib1g-dev zstd
fi

sudo apt-get autoremove --purge -y
sudo apt-get clean -y

# Set locales
sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen
sed -i 's/^# *\(en_DK.UTF-8\)/\1/' /etc/locale.gen
locale-gen

