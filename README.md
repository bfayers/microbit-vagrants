# microbit-vagrants
IF WIP OR NO IS LISTED BELOW BUT THERE IS A VAGRANT FILE AVALIALBE DO NOT USE IT, UNLESS YOU ARE WILLING TO DEAL WITH IT NOT WORKING.
YOU HAVE BEEN WARNED

| Language    | Supported? | Link                                               |
|-------------|------------|----------------------------------------------------|
| MicroPython | WIP        | https://github.com/bbcmicrobit/micropython         |
| Espruino    | Yes        | https://github.com/espruino/Espruino               |
| RIOT        | WIP        | https://github.com/RIOT-OS/RIOT/                   |
| RUST        | WIP        | https://github.com/SimonSapin/rust-on-bbc-microbit |

#Guide (WIP)
1. Install [virtualbox](https://www.virtualbox.org/wiki/Downloads)
2. Install [Vagrant](https://www.vagrantup.com/downloads.html)
3. Clone this repo ```git clone https://github.com/bfayers/microbit-vagrants```
4. Run ```vagrant plugin install vagrant-auto_network```
5. Now ```cd``` into whichever one you want to use
6. now run ```vagrant up``` (the espruino one MIGHT be flakey and the vagrant up command may say something about failure, if so run vagrant halt && vagrant up)
7. SSH in (you may have to use the key in ```microbit-vagrants/<yourchoice>/.vagrant/machines/microbit-vagrants-<yourchoice>/virtualbox/private_key```) 127.0.0.1:2222 or possibly something else, run vagrant ssh and it will tell you the details, and if you have an SSH client (in windows case in your PATH) will start an SSH session.
8. Once in the virtual machine run ```cd /vagrant && ./compile.sh``` 
9. Check your Espruino or micropython folder and their appropriate build directories for the hex files (Espruino builds to its root directory of its code (```/espruino```) and micropython builds to ```micropython\build\bbc-microbit-classic-gcc-nosd\source```
