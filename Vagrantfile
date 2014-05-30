# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "wordgamesprod"

  #config.vm.box = "precise64"
  config.vm.box = "digital_ocean"
  
  #config.vm.network :private_network, ip: "33.33.33.100"
  config.vm.boot_timeout = 120
  config.berkshelf.enabled = true
  config.vm.network :forwarded_port, guest: 80, host: 80

  config.omnibus.chef_version = "10.14.2"

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '~/.ssh/id_rsa'
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"

    provider.client_id = "x"
    provider.api_key = "x"
    provider.image = "Ubuntu 12.04.4 x64"

    provider.ssh_key_name = "MAC JP"
    provider.ca_path = "/etc/ssl/certs/ca-certificates.crt"
  end

  config.vm.provision "shell", inline: "sudo apt-get install make"

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :mysql => {
        :server_root_password => 'rootpass',
        :server_debian_password => 'debpass',
        :server_repl_password => 'replpass'
      }
    }

    chef.run_list = [
        "recipe[word_games_chef::default]"
    ]
  end

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", "1024"]
    v.customize ["modifyvm", :id, "--cpus", "4"]
  end
end
