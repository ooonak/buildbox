# BuildBox

## VirtualBox by Vagrant
Creates a VirtualBox machine with Debian 11 - Bullseye 64-bit, provisioned
for kernel development, Yocto, Buildroot and stuff like that :-)

Assuming you have vagrant installed.

First edit config.yaml to set resources and shared folder.

```bash
$ vagrant up
$ vagrant ssh
```

You should change the password for the vagrant user.

```bash
$ sudo passwd vagrant
```

And then just log in from VirtualBox and start the init script.

```bash
$ sh ./initialize.sh
```
