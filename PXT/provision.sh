#!/bin/bash
#
# This script is run by Vagrant when a new machine is provisioned.
#
echo debug-info-log
{
  whoami
  who am i
  set
} >/tmp/debug-info-log

echo initial-apt-get 
{
  sudo apt-get update
  apt-get -y install git build-essential  
# sudo apt-get -y dist-upgrade #TODO:Solve grub problem http://askubuntu.com/questions/325872/ubuntu-unattended-apt-get-upgrade-grub-install-dialog
}>/tmp/initial-apt-get-log #2>&1

echo home-local-node-install #https://gist.github.com/isaacs/579814
{
  runuser - vagrant -c 'echo export PATH=$HOME/local/bin:$PATH' >> ~vagrant/.bashrc
  runuser - vagrant -c 'mkdir ~vagrant/local'
  cd ~vagrant/local
  runuser - vagrant -c 'curl https://nodejs.org/download/release/latest-v6.x/node-v6.9.4-linux-x64.tar.gz | tar xz --strip-components=1'
}

echo pxt
{
  runuser - vagrant -c 'mkdir -p ~vagrant/pxt/pxt'
  runuser - vagrant -c 'mkdir -p ~vagrant/pxt/pxt-microbit'  
  runuser - vagrant -c 'git clone https://github.com/microsoft/pxt ~vagrant/pxt/pxt'
  runuser - vagrant -c 'git clone https://github.com/microsoft/pxt-microbit ~vagrant/pxt/pxt-microbit'
}

cat <<EOF

sudo npm install -g jake
sudo npm install -g typings
sudo npm install
sudo typings install
sudo jake
sudo npm install -g pxt
sudo pxt target microbit

cd pxt-microbit
sudo npm install -g pxt
sudo npm install
pxt serve
  
}



echo x-apt-get
{
  apt-get -y install xauth xterm firefox
}>/tmp/x-apt-get-log

# The following is under investigation
sudo apt-get --qq -y install python-software-properties
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get -y install nodejs
sudo apt-get -y install firefox
sudo apt-get -y install libgl1-mesa-glx

cd /home/vagrant/pxt && rm -r * && rm -r .* 
cd /home/vagrant/pxt && git clone https://github.com/microsoft/pxt .
git clone https://github.com/microsoft/pxt-microbit
cd /home/vagrant/pxt

sudo npm install -g jake
sudo npm install -g typings
sudo npm install
sudo typings install
sudo jake
sudo npm install -g pxt
sudo pxt target microbit

cd pxt-microbit
sudo npm install -g pxt
sudo npm install
pxt serve
EOF
