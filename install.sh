#!/bin/bash
cd
winetricks videomemorysize=2048
winetricks d3dx9 dinput dinput8 dotnet45
sudo apt-get install -y perl curl wget
sudo apt-get install -y libdigest-perl-md5-perl libxml-simple-perl libgetopt-long-descriptive-perl
git clone https://github.com/CrashCortez/penguinrocks
cd penguinrocks
sudo chmod a+x launchcoh.sh
sudo chmod a+x updatecoh.sh
sudo chmod a+x coh.desktop
sudo chmod a+x updatecoh.desktop
cp coh.desktop /home/pi/Desktop
cp updatecoh.desktop /home/pi/Desktop
cd
sudo cp -R /home/pi/penguinrocks /home/pi/Games/coh 
sudo chown pi:pi /home/pi/Games/coh
cd
cd /home/pi/Games/coh
LD_LIBRARY_PATH=/home/pi/mesa/lib/arm-linux-gnueabihf ./penguinrocks.pl --profile 1 --verify --patchonly 
cd hc-bin32
cp cityofheroes.exe /home/pi/Games/coh/hc-bin32cityofheroes.exe
cd /home/pi/Games/coh/hc-bin32
cp cityofheroes.exe hc-bin32cityofheroes.exe
cp hc-bin32cityofheroes.exe /home/pi/Games/coh
cd
cd /home/pi/Games/coh
LD_LIBRARY_PATH=/home/pi/mesa/lib/arm-linux-gnueabihf ./penguinrocks.pl --profile 1 --launchonly --silentlaunch
