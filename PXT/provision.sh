#!/bin/bash
#
# This script is run by Vagrant when a new machine is provisioned.
#

echo debug-info-log
{
  whoami
  who am i
  set
} >>/tmp/vagrant-debug-info-log 2>>&1

echo initial-apt-get 
{
  sudo apt-get update
  apt-get -y install git build-essential  
# sudo apt-get -y dist-upgrade #TODO:Solve grub problem http://askubuntu.com/questions/325872/ubuntu-unattended-apt-get-upgrade-grub-install-dialog
} >>/tmp/vagrant-debug-info-log 2>>&1

echo home-local-node-install #https://gist.github.com/isaacs/579814
{
  runuser - vagrant -c '
    echo export PATH=~vagrant/local/bin:$PATH >>~vagrant/.bashrc;
    mkdir ~vagrant/local; 
    cd ~vagrant/local; 
    curl https://nodejs.org/download/release/latest-v6.x/node-v6.9.4-linux-x64.tar.gz | tar xz --strip-components=1;
    '
} >>/tmp/vagrant-debug-info-log 2>>&1

echo pxt
{
  runuser - vagrant -c '
    . ~vagrant/.bashrc;
    npm install -g jake typings;
    mkdir -p ~vagrant/pxt ~vagrant/pxt/pxt-microbit
    git clone https://github.com/microsoft/pxt ~vagrant/pxt
    git clone https://github.com/microsoft/pxt-microbit ~vagrant/pxt/pxt-microbit
    cd ~vagrant/pxt/pxt;
    npm install; 
    typings install; 
    jake; 
    npm install -g pxt;
    cd ~vagrant/pxt/pxt-microbit; 
    npm install ../pxt; 
    npm install; 
    nohup pxt serve&;
    '
} >>/tmp/vagrant-debug-info-log 2>>&1

echo 'ssh vagrant@127.0.0.1:2222'

cat <<EOF

echo x-apt-get
{
  apt-get -y install xauth xterm firefox
}>/tmp/x-apt-get-log

# What is this for ...
sudo apt-get --qq -y install python-software-properties
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
EOF
