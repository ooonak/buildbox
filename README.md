# BuildBox

## Create VirtualBox VM with Vagrant

### Provision

Creates a VirtualBox machine with Debian 12 Bookworm 64-bit, provisioned
for Yocto, Buildroot, kernel development.

Assuming you have vagrant installed. Maybe you need to update your plugins.

```bash
$ vagrant plugin update
$ vagrant plugin install vagrant-vbguest
```

First edit config.yaml to set resources and shared folder. Then provision machine.

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

### Usage

Start the container and
```bash
$ vagrant up
$ vagrant ssh
```
