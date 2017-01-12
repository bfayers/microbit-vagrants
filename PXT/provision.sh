#!/bin/bash
#
# This script is run by Vagrant when a new machine is provisioned.
# -rwxrwxr-x 1 vagrant vagrant 1811 Jan 12 18:23 /tmp/vagrant-shell
# can be checked as vagrant user with sudo su - provison.sh

LOG=/tmp/vagrant.log

function get-info(){
  whoami
  set
}

function add-local(){
  mkdir -p ~vagrant/local
  echo 'export PATH=~vagrant/local/bin:$PATH' >>~vagrant/.bashrc
}

function basic-apt-get(){
  echo "basic-apt-get stop $(date)"
  apt-get update
# apt-get -y dist-upgrade #TODO:Solve grub problem http://askubuntu.com/questions/325872/ubuntu-unattended-apt-get-upgrade-grub-install-dialog
  apt-get -y install git build-essential
  echo "basic-apt-get stop $(date)"
}

function local-node-install(){
    mkdir ~vagrant/local
    chown vagrant ~vagrant/local
    cd ~vagrant/local 
    runuser - vagrant -c '
      cd ~vagrant/local;
      curl https://nodejs.org/download/release/latest-v6.x/node-v6.9.4-linux-x64.tar.gz | tar xz --strip-components=1;
    '
}

function install-pxt(){
  echo "install-pxt start $(date)"
  runuser - vagrant -c '
    . ~vagrant/.bashrc;
    npm install -g jake typings;
    npm install -g typings;
    mkdir -p ~vagrant/pxt/pxt; 
    ~vagrant/pxt/pxt-microbit;
    git clone https://github.com/microsoft/pxt ~vagrant/pxt/pxt
    git clone https://github.com/microsoft/pxt-microbit ~vagrant/pxt/pxt-microbit
    cd ~vagrant/pxt/pxt;
    npm install; 
    typings install; 
    jake; 
    npm install -g pxt;
    cd ~vagrant/pxt/pxt-microbit;
    npm install ../pxt; 
    npm install;
    pxt serve;
  '
  echo "install-pxt stop $(date)"
}

#echo "provison start $(date)"
#get-info 
#add-local
#basic-apt-get& # let this run in background so finished quicker (hopefully) maybe record pid
#local-node-install& # let this run in background: check status when logged in maybe record pid
#echo "provison stop $(date)"
