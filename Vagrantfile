# encoding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

current_dir = File.dirname(File.expand_path(__FILE__))
config = YAML.load_file("#{current_dir}/config.yaml")
vagrant_config = config['config']

Vagrant.configure("2") do |config|
  config.vm.box = "debian/bullseye64"

  config.vm.define "buildbox"
  config.vm.hostname = "buildbox"
  #config.disksize.size = "200GB"

  config.vm.provider "virtualbox" do |v|
    v.name = "BuildBox"
    v.cpus = vagrant_config['VM_CORES']
    v.memory = vagrant_config['VM_MEMORY']
    v.gui = true

    #required_plugins = %w( vagrant-vbguest vagrant-disksize )
    required_plugins = %w( vagrant-vbguest )
		required_plugins.each do |plugin|
		  system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
		end
  end

  config.vm.provision "shell", privileged: true, path: "scripts/bootstrap.sh"
  config.vm.provision "file", source: "scripts/initialize.sh", destination: "initialize.sh"
  config.vm.synced_folder vagrant_config['SHARED_FOLDER'], '/home/vagrant/shared'
end

