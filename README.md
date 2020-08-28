# Cohpi4
No one said "COH will never play on the pi4!"

Crash said "Hold my beer!"

___

[Coh install video](https://youtu.be/b_25KE0Ov-4)
---
First I want to talk about if this is a good way to play COH, the answer is No not really. You will be plagued with DC's and long loading times, and forget about being in AP. This is more of a proof of concept. Suggested settings: Minimal with particle count very low, to load in and then adjust settings. windowed at 720p works well with the performance setting and quality crashes and has graphics errors. This project might work great with a home server, I think I know what I'm trying next.



Instructions to install City of Heroes on the pi4 with [Twister Os](https://twisteros.com/)'s current release.

[Homecoming PC install instructions](https://score.savecoh.com/index.php/topic,372.msg1733.html#msg1733)

Note: Penguinrocks will do it for you. 

## Image and settings

Download [Twister Os](https://twisteros.com/)'s current release, and set up your sd card.

First on the pi you'll need to set some stuff up use commander pi to oc your pi to the recommend setting of

2000 CPU (arm_frew)

600 GPU (gpu_freq0

6 Volt adj. (over_voltage)

Click all three set checks and apply and reboot. 

After the reboot open up wine configuration and let it download the needed files, mono and gecko I believe, just install everything it asks. 

You can also twist the theme on this image I like the XP one for nostalgia.
## Automated installer 

Copy and paste the following into your terminal and it will autoset everything up for you should take 25-35 minutes depending on your internet speeds.
```
wget https://raw.githubusercontent.com/CrashCortez/Cohpi4/master/install.sh && sudo chmod a+x install.sh && ./install.sh
```
After it is done downloading and setting it up you will can now log in. 
## You're Done, Go Hunt skulls!


---

## Manual install 

Let’s set up Some wineTricks and get some dependancies for penguin on the rocks. 
--
```
winetricks videomemorysize=2048
winetricks d3dx9 dinput dinput8 dotnet45
```
Let’s Get penguin on the rocks since I could not get Tequila working. 
--

Perl dependancies needed for penguinrocks

```
sudo apt-get install -y perl curl wget
sudo apt-get install -y libdigest-perl-md5-perl libxml-simple-perl libgetopt-long-descriptive-perl
```
Here is WarpShots [Reddit post](https://www.google.com/amp/s/amp.reddit.com/r/Cityofheroes/comments/bip4e2/new_linux_commandline_launcher_penguin_on_the/) I forked the working GitHub since v0.9.1 worked, and adjusted it for the box86/wine on the Twister OS.
--
We will use my fork since it has been adjusted for Twister OS.
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

Lets remove the files and folders no longer needed.
--
```
cd
sudo rm -R /home/pi/penguinrocks
sudo rm /home/pi/install.sh
```

Now run In terminal the following or click the City of Heros icon on the desktop
--
```
cd /home/pi/Games/coh
./penguinrocks.pl --profile 1 --launchonly --silentlaunch 
```
To update
```
cd /home/pi/Games/coh
./penguinrocks.pl --profile 1 --verify --patchonly
```
Penguinrocks usage a arguments
```
Usage: penguinrocks.pl [--patchonly|--launchonly] [--verify] [--silentlaunch] [--silent] [--manifest=<URL of update manifest>] [City of Heroes options].

--silentlaunch: Suppress all console output from City of Heroes.
        This may improve stability or give a slight increase in framerate.
        For most people, I expect it will do nothing.
--silent: Suppress all output except error messages.
--patchonly: Only patch the City of Heroes client, do not launch it.
--launchonly: Only launch the City of Heroes client, do not patch it.
--verify: Verify the checksums of the client files.
--manifest: Specify an alternate manifest location.
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

