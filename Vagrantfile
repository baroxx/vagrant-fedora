BOX = "fedora/35-cloud-base"
BOX_VERSION = "35.20211026.0"
HOSTNAME = "fed35"
CPUS = 4
MEMORY = "8192"
DISKSIZE = "40GB"
USER_NAME = "fedora"
PASSWORD = "fedora"
KEYMAP = "de"

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

    config.vm.provision "main", type: "shell", args: [USER_NAME, PASSWORD, KEYMAP], run: "never", inline: <<-SHELL 
        echo -e "main provisioner is running..."
        readonly USER_NAME=$1
        readonly PASSWORD=$2
        readonly KEYMAP=$3    
    
        useradd $USER_NAME
        echo $USER_NAME:$PASSWORD | sudo chpasswd
        usermod -aG wheel $USER_NAME

        dnf -y group install workstation-product-environment
        systemctl set-default graphical.target
        
        timedatectl set-timezone Europe/Berlin
        localectl set-x11-keymap $KEYMAP

        dnf -y install maven
        echo -e "main provisioner finished..."
    SHELL

    config.vm.provision "toolbox", type: "shell", run: "never", inline: <<-SHELL
        curl -fsSL https://raw.githubusercontent.com/nagygergo/jetbrains-toolbox-install/master/jetbrains-toolbox.sh | bash
    SHELL

    config.vm.provision "angular", type: "shell", run: "never", inline: <<-SHELL
        dnf install -y nodejs
        npm install -g @angular/cli
        echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
    SHELL

    config.vm.provision "terraform", type: "shell", run: "never", inline: <<-SHELL
        dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
        dnf install -y terraform
    SHELL

    config.vm.provision "final", type: "shell", args: [USER_NAME], run: "never", inline: <<-SHELL
        echo -e "finalising..."
        readonly USER_NAME=$1
        dnf -y update
        chown -R $USER_NAME:$USER_NAME /home/$USER_NAME
        reboot
        echo -e "provisioning finished..."
    SHELL
end
  