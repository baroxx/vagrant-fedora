# vagrant-fedora-template

This project provides a basic template for vagrant with some provisioners of some tools for development purposes.

# Prerequesites

- Vagrant (via dnf or from [vagrantup.com/downloads](https://www.vagrantup.com/downloads))
- Plugins
  - vagrant-libvirt
- libvirt/qemu (via dnf)
- Daemons libvirtd and virtnetworkd enabled

# run

The bash script [run.sh](run.sh) runs "vagrant up" with predefined provisioners.

# clean up 

You can destroy the created machine with the sript [cleanup.sh](cleanup.sh).

# Available provisioners

You can set the provisioners in the run script. The provisioners are comma separated.

- toolbox (Jetbrains Toolbox)
- angular (npm via dnf)
- terraform (via dnf)
- kubectl (via dnf)
- minikube (via dnf - new RPM)
- postman (via flatpak)
- code (Visual Studio Code)
- helm (via dnf)
- slack (via flatpak)
- aws
  - aws cli v2
  - cdk
  - sam cli
- ansible
- texlive

**The main provisioner should always be set, as it installs the graphical components (gnome). The final provisioner installs the lates updates and reboots the system.**

# Additional information

You can find further information about vagrant and libvirt in the [vagrant-libvirt repository](https://github.com/vagrant-libvirt/vagrant-libvirt)

[Here](https://libvirt.org/formatdomain.html#elementsVideo) are more details about the video settings available.