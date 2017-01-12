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
  runuser - vagrant -c 'echo export PATH=~vagrant/local/bin:$PATH >>~vagrant/.bashrc' 
  runuser - vagrant -c 'mkdir ~vagrant/local; cd ~vagrant/local; curl https://nodejs.org/download/release/latest-v6.x/node-v6.9.4-linux-x64.tar.gz | tar xz --strip-components=1'
}

echo pxt
{
  runuser - vagrant -c 'npm install -g jake typings'
  runuser - vagrant -c 'mkdir -p ~vagrant/pxt ~vagrant/pxt/pxt-microbit'
  # Note: there was rm's cause git will not clone into a non empty directory so we need a ~vagrant/pxt/pxt structure as ~vagrant/pxt is used So I # it as "not needed"
  runuser - vagrant -c 'git clone https://github.com/microsoft/pxt ~vagrant/pxt; git clone https://github.com/microsoft/pxt-microbit ~vagrant/pxt/pxt-microbit' # Note: Peli needs to say ok
  runuser - vagrant -c 'cd ~vagrant/pxt/pxt;npm install; typings install; jake; npm install -g pxt'
  runuser - vagrant -c 'cd ~vagrant/pxt/pxt-microbit; npm install ../pxt; npm install; pxt serve' # Note: Peli needs to say ok
}

cat <<EOF

echo x-apt-get
{
  apt-get -y install xauth xterm firefox
}>/tmp/x-apt-get-log

# What is this for ...
sudo apt-get --qq -y install python-software-properties
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
EOF
