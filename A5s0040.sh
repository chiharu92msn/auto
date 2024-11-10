yes | sudo apt update && pkg upgrade
yes | sudo apt install libjansson build-essential clang binutils git dialog
yes | sudo apt install python3
yes | sudo apt install libjansson wget nano
# xmrigcc
yes | sudo apt update 
yes | sudo apt upgrade 
yes | sudo apt install git 
yes | sudo apt install wget 
yes | sudo apt install proot 
yes | sudo apt install cmake 
yes | sudo apt install unzip 

cp /data/data/com.termux/files/usr/include/linux/sysctl.h /data/data/com.termux/files/usr/include/sys

# Clone repository 

git clone https://github.com/chiharu92msn/jk8180-A5s.git
cd jk8180-A5s

git clone https://github.com/chiharu92msn/set-miner-off.git
chmod +x start.sh net.sh net1.sh net2.sh net3.sh autoboot.sh
mv ./net.sh ./net1.sh ./net2.sh ./net3.sh ./autoboot.sh ~/


mkdir miner && cd miner
wget https://raw.githubusercontent.com/Darktron/pre-compiled/generic/ccminer
chmod +x ccminer 

~ cd
cd jk8180-A5s && cd miner 
git clone https://github.com/xmrig/xmrig
mkdir xmrig/build
cd xmrig/build
figlet -f small Compiling xmrig
cmake -DWITH_HWLOC=OFF ..
make -j$(nproc)
figlet -f small Done compiling
apt remove figlet -y
echo Removed extra packages


echo './net.sh' > ~/.bashrc
echo '{
    "name": "A5s0040"
}' > ~/jk8180-A5s/set-miner-off/offline.json
# killall -9 -u $(id -un)
