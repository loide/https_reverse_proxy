Vagrant.configure(2) do |config|
  config.vm.define "jenkins" do |jenkins|
	jenkins.vm.box = "ubuntu/trusty64"
	jenkins.vm.hostname = "jenkins.localdomain"
	
	jenkins.vm.network :forwarded_port, guest: 8080, host: 8080
	jenkins.vm.network :forwarded_port, guest: 443, host:8081
	jenkins.vm.provider :virtualbox do |v|
		v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
		v.customize ["modifyvm", :id, "--name", "jenkins"]
    	end

	jenkins.vm.provision "file", source: "default", destination: "default"
	jenkins.vm.provision "file", source: "gen_ce.sh", destination: "gen_ce.sh"
	jenkins.vm.provision "shell", path: "setup.sh"
   end
end
