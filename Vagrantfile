Vagrant.configure("2") do |config|
    config.vm.box = "fedora/35-cloud-base"
    config.vm.box_version = "35.20211026.0"
  
    config.vm.hostname = "fed35"
  
    config.vm.provider "libvirt" do |libvirt|
        libvirt.cpus = 4
        libvirt.memory = "8192"
    end
end
  