# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"
  
  config.vm.define "GB_Laravel_5.7" do |t|
  end
  
  config.vm.provider "virtualbox" do |v|
    v.name = "GB_Laravel_5.7"
  end 
  
  config.vm.network "private_network", ip: "33.33.33.10", type: "dhcp", auto_config: false 
  config.vm.network :forwarded_port, guest: 3306, host: 3316
  config.vm.network :forwarded_port, guest: 80, host: 8016 
   
  config.vm.provider "virtualbox" do |vb| 
    vb.memory = "1024"
  end   
  config.vm.provision :shell, :path => "install.sh"  
end
