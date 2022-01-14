Vagrant.configure("2") do |config|
  config.vm.box = "debian/bullseye64"
  config.vm.define "buildbox"
  config.vm.hostname = "buildbox"
  config.disksize.size = "200GB"
  config.vm.provider "virtualbox" do |v|
    v.name = "BuildBox"
    v.cpus = 4
    v.memory = 8192
  end
  config.vm.provision "shell", path: "vagrant/bootstrap.sh"
  config.vm.synced_folder '.', '/home/vagrant/'
end

