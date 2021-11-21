# vagrant-fedora-template

This project provides a basic template for vagrant with some provisioners of some tools for development purposes.

# Prerequesites

- Vagrant (can be installed via dnf)
- vagrant-libvirt plugin
- The daemon libvirtd is running

# run

There is the bash script "run.sh" to run vagrant up with predefined provisioners for unix bases operation systems. 

# clean up 

You can destroy the created machine with the the bash script "cleanup.sh".

# Further information

You can find further information about vagrant and libvirt in the vagrant-libvirt repository: https://github.com/vagrant-libvirt/vagrant-libvirt