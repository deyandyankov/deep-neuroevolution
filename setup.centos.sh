#!/bin/sh

# CENTOS
sudo yum install -y epel-release
sudo yum install -y vim
sudo yum install -y gcc-c++
sudo yum install -y python36
sudo yum install -y htop
sudo yum install -y tmux
sudo yum install -y redis
sudo yum install -y cmake
sudo yum install -y git
sudo yum install -y zlib-devel

git clone https://github.com/deyandyankov/deep-neuroevolution
cd deep-neuroevolution
python3.6 -m venv env
. env/bin/activate
curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
python get-pip.py
pip install --upgrade pip
pip install wheel
pip install Pillow
pip install gym[atari]
pip install -r requirements.txt
