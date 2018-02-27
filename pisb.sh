#!bin/bash
cd /home/pi ;
echo "    #Attemping APT Update";
echo " ";
echo " ";
sudo apt-get update ;
echo " ";
echo " ";
echo "    #Attemping APT Upgrade";
echo " ";
echo " ";
sudo apt-get upgrade;
echo " ";
echo " ";
echo "    #Adding Node to RPi Repository";
echo " ";
echo " ";
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -;
echo " ";
echo " ";
echo "    #Installing Raspotify";
echo " ";
echo " ";
curl -sL https://dtcooper.github.io/raspotify/install.sh | sh;
echo " ";
echo " ";
echo "    #Installing Shairport-sync, Node, Mosquitto and LibAvahi";
echo " ";
echo " ";
sudo apt-get install shairport-sync nodejs libavahi-compat-libdnssd-dev mosquitto;
echo "    #Installing HomeBridge, HomeBridge's PlugIns, Node-Red and Node-Red-Serial";
echo " ";
echo " ";
sudo npm install -g --unsafe-perm homebridge homebridge-pc-volume homebridge-mqtt node-red node-red-node-serialport ;
echo " ";
echo " ";
echo "    #Making HomeBridge and Node-Red booteable";
echo " ";
echo " ";
sudo cp /home/pi/PiSmartBox/Boots/* /etc/init.d ;
sudo chmod +x /etc/init.d/homebridge /etc/init.d/node-red ;
sudo update-rc.d homebridge defaults ;
sudo update-rc.d node-red defaults ;
echo " ";
echo " ";
echo "    #Configuring HomeBridge";
echo " ";
echo " ";
sudo mkdir /home/pi/.homebridge ;
sudo chmod 777 /home/pi/.homebridge ;
echo " ";
sudo cp /home/pi/PiSmartBox/config.json /home/pi/.homebridge ;
echo " ";
echo " ";
echo "    #Configuring Raspotify's and Shairport-Sync's outputs";
echo " ";
echo " ";
sudo cp /home/pi/PiSmartBox/raspotify /etc/default ;
sudo cp /home/pi/PiSmartBox/shairport-sync.conf /etc ;
echo " ";
echo " ";
echo "    #Configurating ALSA for multiple audio routing";
sudo cp /home/pi/PiSmartBox/asound.conf /etc ;
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo "----------------------------------ALL  DONE------------------------------------";
read -p "---------------------------PRESS ANY KEY TO FINISH-----------------------------";
sudo reboot;
