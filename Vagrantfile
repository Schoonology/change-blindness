# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Our base box: 64-bit Ubuntu
  config.vm.box = "ubuntu/trusty64"
  config.vm.define :change_blindness do |t|
  end

  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provision "puppet" do |puppet|
    puppet.module_path = ["modules", "~/.puppet/modules"]
  end
end
