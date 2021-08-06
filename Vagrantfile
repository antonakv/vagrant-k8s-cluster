
Vagrant.configure("2") do |config|  
  (1..2).each do |i|
    config.vm.define "k8s-worker-0#{i}" do |web|
      web.vm.box = "aakulov/bionic64"
      web.vm.hostname = "k8s-worker-0#{i}"
      web.vm.network "private_network", ip: "192.168.111.#{100+i}"
      web.vm.provider "virtualbox" do |v|
        v.memory = 1024 * 2
        v.cpus = 2
      end
    end
  end
  
  config.vm.define vm_name="k8s-master" do |master|
    master.vm.box = "aakulov/bionic64"
    master.vm.hostname = vm_name
    master.vm.network "private_network", ip: "192.168.111.10"
    master.vm.provider "virtualbox" do |v|
      v.memory = 1024 * 2
      v.cpus = 2
    end
  end
end
