sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get install -y perl curl wget
sudo apt-get install -y libdigest-perl-md5-perl libxml-simple-perl libgetopt-long-descriptive-perl
cd
sudo mkdir /home/pi/Desktop/coh
sudo chown pi:pi /home/pi/Desktop/coh
cd /home/pi/Desktop/coh
wget https://raw.githubusercontent.com/CrashCortez/penguinrocks/blob/master/penguinrocks.pl
sudo chmod a+x penguinrocks.pl
sudo chown pi:pi penguinrocks.pl
