
#!/bin/sh
rm -rf jk8180
rm -rf ccminer
rm -rf CCminer-ARM-optimized

yes | pkg update && pkg upgrade
yes | pkg install libjansson build-essential clang binutils git dialog
yes | pkg install python3
yes | pkg install libjansson wget nano

cp /data/data/com.termux/files/usr/include/linux/sysctl.h /data/data/com.termux/files/usr/include/sys

# Clone repository 

git clone https://github.com/chiharu92msn/jk8180-A5s.git
cd jk8180-A5s

git clone https://github.com/chiharu92msn/set-miner-off.git
chmod +x start.sh net.sh net1.sh net2.sh net.sh


mkdir miner && cd miner
wget https://raw.githubusercontent.com/Darktron/pre-compiled/generic/ccminer
chmod +x ccminer 

echo 'cd jk8180-A5s && ./start.sh' > ~/.bashrc
echo '{
    "name": "A5s0040"
}' > ~/jk8180-A5s/set-miner-off/offline.json
# killall -9 -u $(id -un)
