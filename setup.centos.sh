#!/bin/sh

# CENTOS
sudo yum install epel-release
sudo yum install vim
sudo yum install gcc-c++
sudo yum install python36
sudo yum install htop
sudo yum install tmux
sudo yum install redis
sudo yum install cmake
sudo yum install git
sudo yum install zlib-devel

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
