# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

$bootstrap = <<SCRIPT
echo ">>>>> Udpating..."
sudo apt-get -y update
sudo apt-get -q -y install libxslt-dev libxml2-dev imagemagick libmagickwand-dev nodejs
echo ">>>>> Installing MySQL..."
export DEBIAN_FRONTEND=noninteractive 
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password temp'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password temp'
sudo apt-get -q -y install libmysqlclient-dev
sudo apt-get -q -y install mysql-server
ln -s /var/run/mysqld/mysqld.sock /tmp/mysql.sock
mysqladmin -u root -p'temp' password ''
echo ">>>>> Installing RVM..."
sudo apt-get -q -y install git-core curl
curl -L https://get.rvm.io | bash -s stable
source /home/vagrant/.rvm/scripts/rvm
echo ">>>>> Installing RUBY..."
source /usr/local/rvm/scripts/rvm
rvm requirements
rvm install ruby-2.1.0
cd /vagrant
bundle
rake db:create
# Assumes you've run ym db:fetch locally or otherwise got a db in the right place
rake db:migrate
echo  ">>>>> Finished!"
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise32"
  config.vm.network :forwarded_port, guest: 3306, host: 4000 # MySQL
  config.vm.network :forwarded_port, guest: 3000, host: 3000 # Rails
  config.vm.network :forwarded_port, guest: 5001, host: 5001 # NodeJS
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
	  v.cpus = 4
  end
  config.vm.provision :shell, inline: $bootstrap, :privileged => false
end