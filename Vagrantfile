box      = 'debian-jessie-8.1-puppet'
url      = 'https://dl.dropboxusercontent.com/u/3523744/boxes/debian-8.1-amd64-lxc-puppet/debian-8.1-lxc-puppet.box'
hostname = 'symfony2-playground'
domain   = 'dev'
ip       = '192.168.56.101'
ram      = '1024'

Vagrant.configure("2") do |config|
  config.vm.box = box
  config.vm.box_url = url
  config.vm.hostname = domain
  config.vm.network "private_network", ip: "#{ip}"
  config.vm.synced_folder "./", "/var/www", id: "webproject"
  config.vm.provision :shell, :inline => "echo \"Europe/Warsaw\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"
  

  config.vm.provider "virtualbox" do |vb|
	vb.customize ["modifyvm", :id,
		'--name', hostname,
		'--memory', ram,
		"--audio", "none",
		"--usb", "on",
		"--usbehci", "off"]
  end  

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.manifest_file = 'site.pp'
    puppet.module_path = 'puppet/modules'
  end
end
