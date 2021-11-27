BOX = "fedora/35-cloud-base"
BOX_VERSION = "35.20211026.0"
HOSTNAME = "fed35"
CPUS = 4
MEMORY = "8192"
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

        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

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

    config.vm.provision "kubectl", type: "shell", args: [USER_NAME], run: "never", inline: <<-SHELL
        readonly USER_NAME=$1
        echo -e "[kubernetes]\nname=Kubernetes\nbaseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg" >> /etc/yum.repos.d/kubernetes.repo
        dnf -y install kubectl
        mkdir /home/$USER_NAME/.kube
    SHELL

    config.vm.provision "postman", type: "shell", run: "never", inline: <<-SHELL
        flatpak install -y flathub com.getpostman.Postman
    SHELL

    config.vm.provision "code", type: "shell", run: "never", inline: <<-SHELL
        rpm --import https://packages.microsoft.com/keys/microsoft.asc
        sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
        dnf install -y code
    SHELL

    config.vm.provision "helm", type: "shell", run: "never", inline: <<-SHELL
        dnf install -y helm
    SHELL

    config.vm.provision "slack", type: "shell", run: "never", inline: <<-SHELL
        flatpak install -y flathub com.slack.Slack
    SHELL

    config.vm.provision "aws", type: "shell", run: "never", inline: <<-SHELL
        readonly AWS_ZIP_FILE=awscliv2.zip
        readonly AWS_DIR=aws-installation
        readonly SAM_ZIP_FILE=sam.zip
        readonly SAM_DIR=sam-installation

        echo -e "installing aws cli..."
        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o $AWS_ZIP_FILE
        unzip $AWS_ZIP_FILE -d $AWS_DIR
        ./$AWS_DIR/aws/install

        echo -e "installing cdk..."
        npm install -g aws-cdk

        echo -e "installing sam cli..."
        curl -L "https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip" -o $SAM_ZIP_FILE
        unzip $SAM_ZIP_FILE -d $SAM_DIR
        ./$SAM_DIR/install

        echo -e "cleanup..."
        rm -r $AWS_DIR
        rm $AWS_ZIP_FILE
        rm -r $SAM_DIR
        rm $SAM_ZIP_FILE
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
  