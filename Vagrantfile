# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "debian/contrib-stretch64"

  # Provisioning script
  
  config.vm.provision :shell, path: "files/scripts/provision.sh"

  # Hostname
  config.vm.network :private_network, :ip => "192.168.19.69"

  # Puppet LAMP setup
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.manifest_file  = "init.pp"
    puppet.options="--verbose --debug"
    puppet.synced_folder_args
  end
  
  # Performance improvements
  #  1. Assign a quarter of host memory and all available CPU's to VM
  #     Depending on host OS this has to be done differently.
  #  2. set --natdnshostresolver1 & --natdnsproxy1 to speed up external connections
  config.vm.provider :virtualbox do |vb|
    host = RbConfig::CONFIG['host_os']

    if host =~ /darwin/
        cpus = `sysctl -n hw.ncpu`.to_i
        mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 4

    elsif host =~ /linux/
        cpus = `nproc`.to_i
        mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 4

    # Windows...
    else
        cpus = 4
        mem = 2048
    end

    vb.customize ["modifyvm", :id, "--memory", mem]
    vb.customize ["modifyvm", :id, "--cpus", cpus]
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
  end

  # Additional setup
  config.vm.provision :shell, path: "files/scripts/setup.sh"

end
