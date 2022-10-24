BOX = "fedora/36-cloud-base"
BOX_VERSION = "36-20220504.1"
HOSTNAME = "fed36"
CPUS = 4
MEMORY = "8192"
USER_NAME = "fedora"
PASSWORD = "fedora"
KEYMAP = "de"

# basic, medium, full
TEXLIVE_PACKAGE_SIZE = "basic"

Vagrant.configure("2") do |config|
    config.vm.box = BOX
    config.vm.box_version = BOX_VERSION
  
    config.vm.hostname = HOSTNAME
  
    config.vm.provider "libvirt" do |libvirt|
        libvirt.cpus = CPUS
        libvirt.memory = MEMORY
        libvirt.keymap = KEYMAP
        libvirt.graphics_type = "spice"
        libvirt.video_type = "virtio"
        libvirt.cpu_mode = "host-passthrough"
        libvirt.channel :type => 'spicevmc', :target_name => 'com.redhat.spice.0', :target_type => 'virtio'
    end

    config.vm.provision "main", type: "shell", args: [USER_NAME, PASSWORD, KEYMAP], run: "never", path: "provisioner/main.sh"

    config.vm.provision "toolbox", type: "shell", run: "never", path: "provisioner/toolbox.sh"

    config.vm.provision "angular", type: "shell", run: "never", path: "provisioner/angular.sh"

    config.vm.provision "terraform", type: "shell", run: "never", path: "provisioner/terraform.sh"

    config.vm.provision "kubectl", type: "shell", args: [USER_NAME], run: "never", path: "provisioner/kubectl.sh"

    config.vm.provision "minikube", type: "shell", args: [USER_NAME], run: "never", path: "provisioner/minikube.sh"

    config.vm.provision "postman", type: "shell", run: "never", path: "provisioner/postman.sh"

    config.vm.provision "code", type: "shell", run: "never", path: "provisioner/code.sh"

    config.vm.provision "helm", type: "shell", run: "never", path: "provisioner/helm.sh"

    config.vm.provision "slack", type: "shell", run: "never", path: "provisioner/slack.sh"

    config.vm.provision "aws", type: "shell", run: "never", path: "provisioner/aws.sh"

    config.vm.provision "ansible", type: "shell", run: "never", path: "provisioner/ansible.sh"

    config.vm.provision "texlive", type: "shell", args: [TEXLIVE_PACKAGE_SIZE], run: "never", path: "provisioner/texlive.sh"

    config.vm.provision "final", type: "shell", args: [USER_NAME], run: "never", path: "provisioner/final.sh"
end
  