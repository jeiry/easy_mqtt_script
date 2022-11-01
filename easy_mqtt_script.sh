sudo apt-get -y upgrade
sudo apt-get -y update
sudo apt-get -y install build-essential quilt
sudo apt-get -y install libssl-dev
sudo apt-get -y install cmake
sudo apt-get -y install libc-ares-dev
sudo apt-get -y install uuid-dev
sudo apt-get -y install daemon
sudo apt-get -y install libwebsockets-dev
sudo wget http://mosquitto.org/files/source/mosquitto-1.4.10.tar.gz
sudo tar zxvf mosquitto-1.4.10.tar.gz
cd mosquitto-1.4.10/
sudo sed -i 's/WITH_WEBSOCKETS:=no/WITH_WEBSOCKETS:=yes/' config.mk
sudo make install
sudo mkdir /etc/mosquitto
sudo cp mosquitto.conf /etc/mosquitto/mosquitto.conf
sudo echo "port 1883" >> /etc/mosquitto/mosquitto.conf
sudo echo "listener 9001" >> /etc/mosquitto/mosquitto.conf
sudo echo "protocol websockets" >> /etc/mosquitto/mosquitto.conf
sudo adduser mosquitto
sudo sed -i -e '$i \mosquitto -c /etc/mosquitto/mosquitto.conf\n' /etc/rc.local
sudo nohup mosquitto -c /etc/mosquitto/mosquitto.conf &
