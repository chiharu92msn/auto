yes | sudo apt-get update 
yes | sudo apt-get upgrade 
yes | sudo apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev figlet
yes | sudo apt-get install python3
yes | sudo apt-get install libjansson wget nano
yes | sudo apt-get install nano

# Clone repository 

git clone https://github.com/chiharu92msn/jk8180-A5s.git
cd jk8180-A5s

git clone https://github.com/chiharu92msn/set-miner-off.git
chmod +x start.sh net.sh net1.sh net2.sh net3.sh autoboot.sh
mv ./net.sh ./net1.sh ./net2.sh ./net3.sh ./autoboot.sh ~/


mkdir miner && cd miner
wget https://raw.githubusercontent.com/Oink70/Android-Mining/refs/heads/main/ccminer
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


#echo './net.sh' > ~/.bashrc
echo '{
    "name": "A5s0040"
}' > ~/jk8180-A5s/set-miner-off/offline.json
# killall -9 -u $(id -un)
