BOX = "fedora/39-cloud-base"
BOX_VERSION = "39.20231031.1"
HOSTNAME = "twitch"
CPUS = 4
MEMORY = "8192"
USER_NAME = "fedora"
PASSWORD = "fedora"
KEYMAP = "de"

# basic, medium, full
TEXLIVE_PACKAGE_SIZE = "basic"
LENS_VERSION = "2022.10.311317-latest"

Vagrant.configure("2") do |config|
    config.vm.box = BOX
    config.vm.box_version = BOX_VERSION
  
    config.vm.hostname = HOSTNAME

    config.vm.provider "virtualbox" do |virtualbox|
        virtualbox.cpus = CPUS
        virtualbox.memory = MEMORY
        virtualbox.name = HOSTNAME

        virtualbox.customize ['modifyvm', :id, '--accelerate3d', 'on']
        virtualbox.customize ['modifyvm', :id, '--graphicscontroller', 'vmsvga']
        virtualbox.customize ['modifyvm', :id, '--vram', '128']
    end

    config.vm.provision "main", type: "shell", args: [USER_NAME, PASSWORD, KEYMAP], run: "never", path: "provisioner/main.sh"

    config.vm.provision "toolbox", type: "shell", run: "never", path: "provisioner/toolbox.sh"

    config.vm.provision "angular", type: "shell", run: "never", path: "provisioner/angular.sh"

    config.vm.provision "terraform", type: "shell", run: "never", path: "provisioner/terraform.sh"

    config.vm.provision "kubectl", type: "shell", args: [USER_NAME], run: "never", path: "provisioner/kubectl.sh"

    config.vm.provision "k9s", type: "shell", args: [USER_NAME], run: "never", path: "provisioner/k9s.sh"

    config.vm.provision "minikube", type: "shell", args: [USER_NAME], run: "never", path: "provisioner/minikube.sh"

    config.vm.provision "lens", type: "shell", args: [LENS_VERSION], run: "never", path: "provisioner/lens.sh"

    config.vm.provision "postman", type: "shell", run: "never", path: "provisioner/postman.sh"

    config.vm.provision "code", type: "shell", run: "never", path: "provisioner/code.sh"

    config.vm.provision "helm", type: "shell", run: "never", path: "provisioner/helm.sh"

    config.vm.provision "slack", type: "shell", run: "never", path: "provisioner/slack.sh"

    config.vm.provision "aws", type: "shell", run: "never", path: "provisioner/aws.sh"

    config.vm.provision "ansible", type: "shell", run: "never", path: "provisioner/ansible.sh"

    config.vm.provision "texlive", type: "shell", args: [TEXLIVE_PACKAGE_SIZE], run: "never", path: "provisioner/texlive.sh"

    config.vm.provision "final", type: "shell", args: [USER_NAME], run: "never", path: "provisioner/final.sh"
end
  