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
  sudo apt-get -y install xauth xterm git build-essential  
# sudo apt-get -y dist-upgrade #TODO:Solve grub problem http://askubuntu.com/questions/325872/ubuntu-unattended-apt-get-upgrade-grub-install-dialog
}>/tmp/initial-apt-get-log #2>&1

echo home-local-node-install #https://gist.github.com/isaacs/579814
sudo -u vagrant  echo 'export PATH=$HOME/local/bin:$PATH' >> ~vagrant/.bashrc
sudo -u vagrant  . ~vagrant/.bashrc
sudo -u vagrant  mkdir ~vagrant/local
cd ~vagrant/local
sudo -u vagrant curl https://nodejs.org/download/release/latest-v6.x/node-v6.9.4-linux-x64.tar.gz | tar xz --strip-components=1 
sudo -u vagrant node --version
sudo -u vagrant npm --version

cat <<EOF
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
