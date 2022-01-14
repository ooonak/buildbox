Let's create a VirtualBox machine with Debian 11 - Bullseye 64-bit to run Yocto inside.

Assuming you have vagrant installed, also make sure you have the disksize plugin installed.

$ vagrant plugin install vagrant-disksize vagrant-scp

$ vagrant up

$ vagrant ssh

We can copy to and from the machine like this.
$ vagrant scp <file> 99101f6:
