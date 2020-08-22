# Cohpi4
Instructions to install City of Heroes on pi4 Twister Os
https://score.savecoh.com/index.php/topic,372.msg1733.html#msg1733 (I downloaded the torrent first, saves having to download later)

So far, I've been able to run Tequila.exe on a clean win32 Wine bottle with dotnet35 installed. The game patches and launches fine, but I couldn't test gameplay as the auth server is currently down. I can say, CoH in its final days played pretty well, so there's hope.

To get such a setup, run the following command:

WINEPREFIX="${HOME}/CoH" WINEARCH=win32 winetricks dotnet35 dinput8

WINEPREFIX="${HOME}/CoH" WINEARCH=win32 winetricks dotnet40 dinput8 dinput


This will open up a dialogue window, so just follow up with the installation. Once that has been completed, copy the launcher you have downloaded (the whole "coh" folder) in: "${HOME}/CoH/drive_c/Program Files/" (note: for non shell users, ${HOME} is your home folder, as in /home/yourusername). To launch the game, run: Quote

WINEPREFIX="${HOME}/CoH" wine "${HOME}/CoH/drive_c/Program Files/coh/Tequila.exe"


The first time you run it, it will ask you to choose a folder... Simply press ok without changing it. It will then start downloading the files as normal.


## OR 
___



https://github.com/CrashCortez/penguinrocks

 - Perl 5 *(I have no clue if it'll run with Perl 6 or not)*
 - Perl modules:
   - Digest::MD5
   - File::Copy and File::Path
   - Getopt::Long
   - XML::Simple
 - wget or curl

```
sudo apt-get update && sudo apt-get -y upgrade
```
```
sudo apt-get install perl curl wget
sudo curl -L http://cpanmin.us | perl - --sudo App::cpanminus
sudo cpanm Digest::MD5
sudo cpanm File::Copy
sudo cpanm File::Path
sudo cpanm Getopt::Long
sudo cpanm XML::Simple
```
or
--

```
sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get install -y perl curl wget
sudo apt-get install -y libdigest-perl-md5-perl libxml-simple-perl libgetopt-long-descriptive-perl
```
```
cd
cd /home/pi/Desktop/coh
wget https://github.com/CrashCortez/penguinrocks/blob/master/penguinrocks.pl
wget https://github.com/CrashCortez/penguinrocks/archive/v0.9.1.zip
sudo chmod a+x penguinrocks
```

then run with 
----
```
cd /home/pi/Desktop/coh
./penguinrocks.pl
```
