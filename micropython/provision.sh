#!/bin/bash
#
# This script is run by Vagrant when a new machine is provisioned.
#
 
sudo apt-get -y install git

sudo add-apt-repository ppa:team-gcc-arm-embedded/ppa
sudo add-apt-repository -y ppa:pmiller-opensource/ppa
sudo apt-get update
sudo apt-get -y install cmake ninja-build gcc-arm-none-eabi srecord libssl-dev python3-pip libffi-dev libssl-dev python-dev 
sudo pip3 install markupsafe
sudo pip3 install yotta


cd /micropython && git clone https://github.com/bbcmicrobit/micropython .