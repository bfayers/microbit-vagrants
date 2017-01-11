#!/bin/bash
#
# This script is run by Vagrant when a new machine is provisioned.
#
 
sudo apt-get -y install git

sudo apt-get -y install python-software-properties
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get update
sudo apt-get -y install nodejs
sudo apt-get -y install firefox
sudo apt-get -y install libgl1-mesa-glx

cd ~/pxt && rm -r * && rm -r .* && git clone https://github.com/microsoft/pxt .
git clone https://github.com/microsoft/pxt-microbit
cd ~/pxt

sudo npm install -g jake
sudo npm install -g typings
npm install
typings install
jake
sudo npm install -g pxt

cd pxt-microbit
sudo pxt serve