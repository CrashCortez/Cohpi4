!#/bin/bash
echo "--------------------------------"
echo "City of Heroes on the Pi4b"
echo "--------------------------------"
wait 5
clear

echo "--------------------------------"
echo "Updates and installing Dependancies"
echo "--------------------------------"
wait 5
sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get install -y perl curl wget
sudo apt-get install -y libdigest-perl-md5-perl libxml-simple-perl libgetopt-long-descriptive-perl

clear
wait 5
echo "--------------------------------"
echo "Checking for/Setting up CoH folder on desktop and downloding penguinrocks"
echo "--------------------------------"

cd
if [ -d "/home/pi/Desktop/coh" ] 
then
    echo "Directory /home/pi/Desktop/coh exists, moving on." 
else
    echo "Error: Directory /path/to/dir does not exists, creating it now."
    sudo mkdir /home/pi/Desktop/coh
fi
sudo chown pi:pi /home/pi/Desktop/coh
cd /home/pi/Desktop/coh
wget https://raw.githubusercontent.com/CrashCortez/penguinrocks/blob/master/penguinrocks.pl
sudo chmod a+x penguinrocks.pl
sudo chown pi:pi penguinrocks.pl

clear
echo "--------------------------------"
echo "Launching penguinrocks"
echo "--------------------------------"
wait 5
cd
cd /home/pi/Desktop/coh
./penguinrocks.pl
