# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "box-cutter/ubuntu1404-docker"

  config.vm.provider :virtualbox do |virtualbox|
    virtualbox.memory = 2048
    virtualbox.cpus = 2
  end

  # NFS is fragile, disable it and use rsync
  config.nfs.functional = false

  config.vm.provision "shell", :path => "deploy/provision.sh"

  config.vm.synced_folder "data", "/vagrant_data"
end

