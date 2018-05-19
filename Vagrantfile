# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :hostonly, "192.168.19.69"
  config.vm.forward_port 69, 1969
  config.vm.share_folder "www", "/var/www", ".", :owner => "www-data", :group => "www-data"

  config.vm.provision :shell, :path => "vagrant/scripts/provision.sh"
  config.vm.provision :shell, :path => "vagrant/scripts/install-wordpress.sh"

end
