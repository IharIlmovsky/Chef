# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |cfg|
  cfg.vm.box = "centos6.7"
  cfg.vm.network "private_network", ip: "192.168.33.11" 
#  cfg.vm.network "forwarded_port", guest: 8080, host: 8080
  cfg.vm.network "forwarded_port", guest: 80, host: 8082
  cfg.vm.hostname = "Chef2"

  cfg.vm.provider "virtualbox" do |vb2|
    vb2.customize ["modifyvm", :id, "--memory", 2048]
    vb2.name = "Chef2"
  end
end
