# http://bc-2.jp/sde.html

sudo apt-get install -y git
sudo apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils
sudo apt-get install -y libboost-all-dev

sudo add-apt-repository ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install -y libdb4.8-dev libdb4.8++-dev

cd /bc2
git init
git remote add origin https://github.com/dgarage/bc2.git
git pull origin bc2
git checkout bc2
./autogen.sh
./configure
make

# .NET
cd /tmp
sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
sudo apt-get update
sudo apt-get install -y dotnet-dev-1.0.0-preview2.1-003177

# node.js & mongoDB
sudo apt-get install -y curl
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get install -y nodejs mongodb
sudo systemctl start mongodb
sudo systemctl enable mongodb
sudo ln -s /usr/bin/nodejs /usr/local/bin/node # nodeがないとバグったりする
sudo npm install -g mocha
