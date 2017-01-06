# microbit-vagrants

| Language    | Working?   | Link                                               |
|-------------|------------|----------------------------------------------------|
| MicroPython | Yes        | https://github.com/bbcmicrobit/micropython         |
| Espruino    | Yes        | https://github.com/espruino/Espruino               |
| RIOT        | Yes        | https://github.com/RIOT-OS/RIOT/                   |
| RUST        | WIP        | https://github.com/SimonSapin/rust-on-bbc-microbit |

#What is Vagrant? Why should I use it?
[Vagrant](https://www.vagrantup.com) is a a program which manages [virtual machines](https://en.wikipedia.org/wiki/Virtual_machine) powered by [virtualbox](https://www.virtualbox.org)

Sure, you could download the files for the Operating System and install all the differnt packages yourself, or you could use these handy Vagrantfiles to setup the machines for you in a minimal amount of time.

If you would like to get the latest version of MicroPython, Espruino or RIOT  on your micro:bit follow the guide below

#Windows Guide (WIP) (LESS CONFUSING)
1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. Install [Vagrant](https://www.vagrantup.com/downloads.html)
3. Install [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) (Get the latest installed .msi, currently called "putty-0.67-installer.msi")
4. Install [git](https://git-for-windows.github.io/)
5. Make a folder somewhere on your computer, open the folder.
6. Hold shift and rightclick inside the folder and click "Open command window here"
7. Type in ```vagrant plugin install vagrant-auto_network``` and press enter
8. Now type in ```git clone https://github.com/bfayers/microbit-vagrants .```
9. Now type in ```cd micropython``` for MicroPython,  ```cd Espruino``` for Espruino and ```cd RIOT``` for RIOT then press enter
10. When you are in the folder you want type in this command ```vagrant up``` and press enter
11. Vagrant will now download and install all the packages
12. Wait a while (between 10 and 30 minutes), if your command window is back at a stage where you can type things into it again, it should have a small flashing line
13. Now open PuTTY, in the Host Name box type in ```127.0.0.1``` in the port box type in ```2222``` like [this](http://i.imgur.com/8NrzB4M.png)
14. Now click "Open"
15. It will say ```login as: ``` type in ```vagrant``` and press enter
16. It will says ```vagrant@127.0.0.1's password: ``` type in ```vagrant``` you will not be able to see the password as you type it but it is there. Press enter
17. For MicroPython or Espruino type in ```cd /vagrant && ./compile.sh```
18. Copy the resulting hex file to your micro:bit, you can find this at <placeholder for where hexfile will be>