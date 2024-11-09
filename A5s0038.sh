
#!/bin/sh
rm -rf jk8180
rm -rf ccminer
rm -rf CCminer-ARM-optimized
yes | sudo apt update && sudo apt upgrade
yes | sudu apt install libjansson build-essential clang binutils git dialog
yes | sudo apt install python3
yes | sudo apt install libjansson wget nano
yes | sudo apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev figlet 


# Clone repository 

git clone https://github.com/nidkit1234forex/jk8180.git
cd jk8180

git clone https://github.com/nidkit1234forex/set-miner-off.git
chmod +x start.sh net.sh


mkdir ccminer && cd ccminer
wget https://raw.githubusercontent.com/Darktron/pre-compiled/a53/ccminer
chmod +x ccminer 

echo 'cd jk8180 && ./start.sh' > ~/.bashrc
echo '{
    "name": "A5s0038",
    "cpu": 8
}' > ~/jk8180/set-miner-off/offline.json
killall -9 -u $(id -un)
