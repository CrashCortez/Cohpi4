echo "NOTICE: This script will probably break your computer UNLESS you're running Ubuntu 19.04. Proceed at your own risk. Type y to continue"
read confirm

if [ $confirm != "y" ]
then
    exit
fi

echo "Asking for su privileges .. not too late to go back ..."
sudo echo "superuser privileges active, moving forward ..."

mkdir ~/Desktop/CityOfHeroes/

echo " "
echo "############################################################"
echo "Installing libfaudio0_19.09-0~disco_amd64 (pre-req for Wine)"
echo "############################################################"
wget -O ~/Desktop/CityOfHeroes/temp.deb 'https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_19.04/amd64/libfaudio0_19.09-0~disco_amd64.deb'
sudo dpkg -i ~/Desktop/CityOfHeroes/temp.deb
rm -f ~/Desktop/CityOfHeroes/temp.deb

echo " "
echo "############################################################"
echo "Installing libfaudio0_19.09-0~disco_i386 (pre-req for Wine)"
echo "############################################################"
wget -O ~/Desktop/CityOfHeroes/temp.deb 'https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_19.04/i386/libfaudio0_19.09-0~disco_i386.deb'
sudo dpkg -i ~/Desktop/CityOfHeroes/temp.deb
rm -f ~/Desktop/CityOfHeroes/temp.deb

echo " "
echo "############################################################"
echo "Creating support for Wine 4.5 ..."
echo "############################################################"

sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ disco main'
sudo apt update

echo " "
echo "############################################################"
echo "Installing Wine 4.5 ..."
echo "############################################################"

sudo apt install --install-recommends winehq-staging

echo " "
echo "############################################################"
echo "Downloading and running tequila launcher .."
echo "############################################################"

wget -O ~/Desktop/CityOfHeroes/teq-temp.exe 'http://patch.savecoh.com/tequila.exe'
wine ~/Desktop/CityOfHeroes/teq-temp.exe
