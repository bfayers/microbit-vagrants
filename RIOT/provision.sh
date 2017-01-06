#!/bin/bash
#
# This script is run by Vagrant when a new machine is provisioned.
#
 
sudo apt-get -y install git
sudo apt-get -y install pcregrep libpcre3 python3 git gcc-arm-none-eabi gcc-msp430 unzip vim qemu-system-x86 g++-multilib gcc-multilib build-essential gcc-avr binutils-avr avr-libc avrdude doxygen cppcheck python-setuptools libusb-1.0-0 libusb-1.0-0-dev libftdi1 libftdi-dev libftdipp1-dev libftdipp1-2v5 libhidapi-dev libhidapi-hidraw0 libhidapi-libusb0 make cmake autotools-dev autoconf pkg-config jimsh libtool valgrind openocd python-serial python3-serial
 
# apply setup config to add compiler to PATH
# from stackoverflow i.e http://stackoverflow.com/a/28279205
echo "export PATH="$PATH:/usr/local/gcc-arm-embedded/bin/"" >> /home/vagrant/.bashrc

cd /riot && git clone https://github.com/RIOT-OS/RIOT .