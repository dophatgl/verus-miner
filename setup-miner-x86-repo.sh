#!/usr/bin/bash
echo "setup ccminer program!"
apt-get update -y
apt-get upgrade -y
apt-get install libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential git nano  cmake -y
git clone https://github.com/monkins1010/ccminer
cd ccminer
chmod +x build.sh && chmod +x configure.sh && chmod +x autogen.sh
./build.sh
cd ..
