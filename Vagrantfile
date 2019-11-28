# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vagrant.plugins = "vagrant-cloudinit"

  config.vm.box = "err0r500/bionic64-consul-nomad-tf"
  config.vm.box_version = "0.1"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.customize ["modifyvm", :id, "--audio", "none"]
  end

  ### MONITORING DATACENTER ###
  config.vm.define "monitoring-ctrlplane" do |c|
    c.vm.hostname = "monitoring-ctrlplane"
    c.vm.network "private_network", ip: "172.16.1.10"
    c.vm.network "private_network", ip: "172.18.1.10"
    c.vm.synced_folder ".", "/vagrant", disabled: true
    c.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "256"]
    end
    c.vm.provision :cloud_init, user_data: "./cloud-init/monitoring-ctrl.yml"
  end

  config.vm.define "monitoring-dataplane" do |c|
    c.vm.hostname = "monitoring-dataplane"
    c.vm.network "private_network", ip: "172.16.1.11"
    c.vm.network "private_network", ip: "172.18.1.11"
    c.vm.synced_folder ".", "/vagrant", disabled: true
    c.vm.synced_folder "./nomad/", "/home/vagrant/nomad"
    c.vm.synced_folder "./consul/", "/home/vagrant/consul"
    c.vm.provision :cloud_init, user_data: "./cloud-init/monitoring-data.yml"
  end

  ### SHARED DATACENTER ###
  config.vm.define "shared-ctrlplane" do |c|
    c.vm.hostname = "shared-ctrlplane"
    c.vm.network "private_network", ip: "172.16.2.10"
    c.vm.network "private_network", ip: "172.18.2.10"
    c.vm.synced_folder ".", "/vagrant", disabled: true
    c.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "256"]
    end
    c.vm.provision :cloud_init, user_data: "./cloud-init/shared-ctrl.yml"
  end

  config.vm.define "shared-dataplane" do |c|
    c.vm.hostname = "shared-dataplane"
    c.vm.network "private_network", ip: "172.16.2.11"
    c.vm.network "private_network", ip: "172.18.2.11"
    c.vm.synced_folder ".", "/vagrant", disabled: true
    c.vm.synced_folder "./nomad/", "/home/vagrant/nomad"
    c.vm.synced_folder "./consul/", "/home/vagrant/consul"
    c.vm.provision :cloud_init, user_data: "./cloud-init/shared-data.yml"
  end


  ### CLIENT1 DATACENTER ###
  config.vm.define "client1-ctrlplane" do |c|
    c.vm.hostname = "client1-ctrlplane"
    c.vm.network "private_network", ip: "172.16.3.10"
    c.vm.network "private_network", ip: "172.18.3.10"
    c.vm.synced_folder ".", "/vagrant", disabled: true
    c.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "256"]
    end
    c.vm.provision :cloud_init, user_data: "./cloud-init/client1-ctrl.yml"
  end

  config.vm.define "client1-dataplane" do |c|
    c.vm.hostname = "client1-dataplane"
    c.vm.network "private_network", ip: "172.16.3.11"
    c.vm.network "private_network", ip: "172.18.3.11"
    c.vm.synced_folder ".", "/vagrant", disabled: true
    c.vm.synced_folder "./nomad/", "/home/vagrant/nomad"
    c.vm.synced_folder "./consul/", "/home/vagrant/consul"
    c.vm.provision :cloud_init, user_data: "./cloud-init/client1-data.yml"
  end

  ### CLIENT2 DATACENTER ###
  config.vm.define "client2-ctrlplane" do |c|
    c.vm.hostname = "client2-ctrlplane"
    c.vm.network "private_network", ip: "172.16.4.10"
    c.vm.network "private_network", ip: "172.18.4.10"
    c.vm.synced_folder ".", "/vagrant", disabled: true
    c.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "256"]
    end
    c.vm.provision :cloud_init, user_data: "./cloud-init/client2-ctrl.yml"
  end

  config.vm.define "client2-dataplane" do |c|
    c.vm.hostname = "client2-dataplane"
    c.vm.network "private_network", ip: "172.16.4.11"
    c.vm.network "private_network", ip: "172.18.4.11"
    c.vm.synced_folder ".", "/vagrant", disabled: true
    c.vm.synced_folder "./nomad/", "/home/vagrant/nomad"
    c.vm.synced_folder "./consul/", "/home/vagrant/consul"
    c.vm.provision :cloud_init, user_data: "./cloud-init/client2-data.yml"
  end

end
