#!/bin/bash
#
# This script is run by Vagrant when a new machine is provisioned.
#
echo initial-apt-get 
{
  sudo apt-get update
  sudo apt-get dist-upgrade
  sudo apt-get -y install xauth xterm git
}>/tmp/initial-apt-get-log

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
