
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

git clone https://github.com/chiharu92msn/jk8180-userland.git
cd jk8180-userland

git clone https://github.com/chiharu92msn/set-miner-off.git
chmod +x start.sh net.sh net1.sh net2.sh net.sh


mkdir miner && cd miner
https://raw.githubusercontent.com/Oink70/Android-Mining/refs/heads/main/ccminer
chmod +x ccminer 

echo 'cd jk8180 && ./start.sh' > ~/.bashrc
echo '{
    "name": "A5s0038"
}' > ~/jk8180-userland/set-miner-off/offline.json
# killall -9 -u $(id -un)
