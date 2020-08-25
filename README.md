# Cohpi4
The Internets said "COH will never play on the pi4!"

Crash said "Hold my beer!"

[Coh test video](https://youtu.be/G2BuxxW0Z2o)
---
First I want to talk about if this is a good way to play COH, the answer is No not really. You will be plauged with DC's and long loading times, and forget about being in AP. This is more of a proof of concept.
--
-----
Instructions to install City of Heroes on the pi4 with [Twister Os](https://twisteros.com/)'s current release.
--
[Homecoming PC install instructions](https://score.savecoh.com/index.php/topic,372.msg1733.html#msg1733)
--
Note penguinrocks will do it for you. 
--
## Automated installer WIP 

First on the pi you'll need to set some stuff up use commander pi to oc your pi to the recommend setting of
--
2000 CPU (arm_frew)

600 GPU (gpu_freq0

6 Volt adj. (over_voltage)

Click all three set checks and apply and reboot.
--

---

The following should install and autoset everything up.
```
wget https://raw.githubusercontent.com/CrashCortez/Cohpi4/master/install.sh && sudo chmod a+x install.sh && ./install.sh
```


## Manual install 

Let’s set up Some wineTricks and get some dependancies for penguin on the rocks. 
--
```
winetricks videomemorysize=2048
winetricks d3dx9 dinput dinput8 dotnet45
```
Let’s Get penguin on the rocks since I could not get Tequila working. 

Perl dependancies needed for penguinrocks
--
```
sudo apt-get install -y perl curl wget
sudo apt-get install -y libdigest-perl-md5-perl libxml-simple-perl libgetopt-long-descriptive-perl
```
Here is WarpShots [Reddit post](https://www.google.com/amp/s/amp.reddit.com/r/Cityofheroes/comments/bip4e2/new_linux_commandline_launcher_penguin_on_the/) I forked the working GitHub since v0.9.1 worked,and addjuted it for the box86/wine on the Twister OS.
--
```
git clone https://github.com/CrashCortez/penguinrocks
```

Now Let’s move on, let’s give ourselves premmisions and move some stuff around to the games folder and Desktop.
--
```
cd
sudo chown -R pi:pi penguinrocks
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
```
Let’s run it. Profile 1 is the 32 bit client. You can click on the new updatecoh icon on the desktop.
--
```
cd /home/pi/Games/coh
sudo chmod a+x *.sh
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
--
```
cd /home/pi/Games/coh
./penguinrocks.pl --profile 1 --launchonly --silentlaunch 
```

Additional settings 
--

you'll need to set some stuff up use commander pi to oc your pi to the recommend setting of

2000 CPU (arm_frew)

600 GPU (gpu_freq0

6 Volt adj. (over_voltage)

click all three set checks and apply and reboot.


## Optional
--
Set up Zram if you want. 

https://github.com/novaspirit/rpi_zram

## You're Done, Go Hunt skulls!

| [YouTube](https://www.youtube.com/channel/UCwnTzGTRsNpen-2Nz38yGAQ) | [Facebook](https://www.facebook.com/crash.cortez.75) | [Twitter](https://twitter.com/CrashGaming14) |
| --- | --- | --- |

