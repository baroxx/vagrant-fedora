# vagrant-fedora-template

This project provides a basic template for vagrant with some provisioners of some tools for development purposes. This project mainly supports libvirt as hypervisor.


# Prerequesites

- Vagrant (via dnf or from [vagrantup.com/downloads](https://www.vagrantup.com/downloads))
- hypbervisor (depending on the targeted virtualization)

## Libvirt

- libvirt and libvirt-devel (via dnf)
- Daemons libvirtd and virtnetworkd enabled
- Plugins
  - vagrant-libvirt `vagrant plugin install vagrant-libvirt`

## VirtualBox

- VirtualBox (via dnf)

# run

The bash script [run.sh](run.sh) runs "vagrant up" with predefined provisioners. Choose a provider (by default libvirt is set) and change the tools you want to install.

# Available provisioners

You can set the provisioners in the run script. The provisioners are comma separated.

- toolbox (Jetbrains Toolbox)
- angular (npm via dnf)
- terraform (via dnf)
- kubectl (via dnf)
- k9s (via webi)
- minikube (via dnf - new RPM)
- lens (via dnf - new RPM)
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

# clean up

You can destroy the created machine with the sript [cleanup.sh](cleanup.sh).

# Additional information

You can find further information about vagrant and libvirt in the [vagrant-libvirt repository](https://github.com/vagrant-libvirt/vagrant-libvirt)

[Here](https://libvirt.org/formatdomain.html#elementsVideo) are more details about the video settings available.