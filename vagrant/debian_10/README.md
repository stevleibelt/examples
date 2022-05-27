# Debian 10 bazzline base box

This setup is tested from a Windows 10 host.

# Steps to setup

## Windows 10

* download and install (use choco if possible)
    * virtual box
    * vagrant
* initialize the box (create file "Vagrant" in current working directory)
```
vagrant init
```
* open virtualbox and add "VBoxGuestAdditions.iso" as disk to the "mass storage" section
* install vagrant plugins
```
vagrant plugin install vagrant-guest_ansible
vagrant plugin install vagrant-vbguest
```
* setup box
```
vagrant up
vagrant provision
```
