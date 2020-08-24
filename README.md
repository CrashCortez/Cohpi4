# Cohpi4
Instructions to install City of Heroes on pi4 Twister Os

[Homecoming install instructions](https://score.savecoh.com/index.php/topic,372.msg1733.html#msg1733)

You can download the torrent first, saves having to download later. Or penguinrocks will do it for you. 

## Automated installer WIP 

First on the pi youll need to set some stuff up 

Use commander pi to oc your pi to the recommend setting of

2000
600
6

Set wine to run as win10 in wine config

The following should install and autoset everything up.
```
wget https://raw.githubusercontent.com/CrashCortez/Cohpi4/master/install.sh && sudo chmod a+x install.sh && ./install.sh
```


## Manual install 

Let’s set up Some wineTricks and get some dependancies for penguin on the rocks. 
```
winetricks videomemorysize=2048
winetricks d3dx9 dinput dinput8 dotnet45
```
Let’s Get penguin on the rocks since I could not get Tequila working. 
Perl dependancies needed for penguinrocks
```
sudo apt-get install -y perl curl wget
sudo apt-get install -y libdigest-perl-md5-perl libxml-simple-perl libgetopt-long-descriptive-perl
```
Here is WarpShots [Reddit post](https://www.google.com/amp/s/amp.reddit.com/r/Cityofheroes/comments/bip4e2/new_linux_commandline_launcher_penguin_on_the/)
```
git clone https://github.com/WarpshotCoH/penguinrocks
```
I forked the working GitHub since v0.9.1 worked. If warpshots doesn’t work use this.
```
git clone https://github.com/CrashCortez/penguinrocks
```
*If you use my git clone you get some extras just for this.

Now Let’s move on, let’s move some stuff around to the games folder and Desktop.
```
cd
cd penguinrocks
cp coh.desktop /home/pi/Desktop
cp updatecoh.desktop /home/pi/Desktop
cd
cp -R penguinrocks /home/pi/Games/coh 
sudo chown pi:pi /home/pi/Games/coh
```
Let’s run it. Profile 1 is the 32 bit client. You can click on the new updatecoh icon on the desktop.
```
cd /home/pi/Games/coh
./penguinrocks.pl --profile 1
```
Let it error. The error is that it can’t find hc-bin32cityofheroes.exe in the program files. But it did install/update all the files from the homecoming servers. So we need to move the 32 bit cityofheroes.exe so penguinrocks will launch it. What I did was go to /home/pi/Games/coh/hc-bin32/ and made a copy of the cityofheroes.exe. Pasted it there and renamed it to hc-bin32cityofheroes.exe. Then I made a copy of that and pasted it in the main coh too just in case. Go to /home/pi/Games/coh and paste your copy. For updates I made a script to handle this in the future. With a desktop icon as well. 
```
cd /home/pi/Games/coh/hc-bin32
cp cityofheroes.exe hc-bin32cityofheroes.exe
cp hc-bin32cityofheroes.exe /home/pi/Games/coh
cd
```

Now run In terminal the following or click the City of Heros icon on the desktop
```
cd /home/pi/Games/coh
LD_LIBRARY_PATH=/home/pi/mesa/lib/arm-linux-gnueabihf ./penguinrocks.pl --profile 1 --launchonly --silentlaunch 
```

Additional settings 

Use commander pi to oc your pi to the recommend setting of

2000
600
6

Set wine to run as win10 in wine config

## Optional
--
Set up Zram if you want. 
https://github.com/novaspirit/rpi_zram
```

| [YouTube](https://www.youtube.com/channel/UCwnTzGTRsNpen-2Nz38yGAQ) | [Facebook](https://www.facebook.com/crash.cortez.75) | [Twitter](https://twitter.com/CrashGaming14) |
| --- | --- | --- |

