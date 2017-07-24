#!/bin/bash

cd ~
export USER=`whoami`

# Installs a whole bunch of useful stuff

sudo apt-get update
sudo apt-get -y dist-upgrade

sudo apt-get install -y build-essential

sudo apt-get install -y vim tmux screen emacs-nox

sudo apt-get install -y incron htop curl unzip cmake pkg-config

sudo apt-get install -y texlive latexmk

sudo apt-get install -y apache2

sudo apt-get install -y libopencv*

sudo apt-get install -y libblas3 libopenblas-dev libopenblas-base libblas-common libblas-dev libblas3

sudo apt-get install -y fftw3

sudo apt-get install -y libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev

sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev

sudo apt-get install -y libxvidcore-dev libx264-dev

sudo apt-get install -y python2.7-dev python3.5-dev

sudo apt-get install -y libav-tools


# Set up environment and config files

git clone https://github.com/fagg/dotfiles.git

# Nuke all the default stuff
rm -f .bash_profile
rm -f .bashrc
rm -rf .vim
rm -rf .emacs.d
rm -f .vimrc
rm -f .emacs
rm -f .tmux.conf
rm -f .screenrc

ln -s dotfiles/.vimrc .vimrc
ln -s dotfiles/.vim .vim

ln -s dotfiles/emacs/.emacs .emacs
ln -s dotfiles/emacs/.emacs.d .emacs.d

ln -s dotfiles/.tmux.conf .tmux.conf

ln -s dotfiles/.screenrc .screenrc

ln -s dotfiles/.bash_profile .bash_profile
ln -s dotfiles/.bashrc .bashrc


# Bring up Apache to my liking
sudo a2enmod userdir
mkdir ~/public_html

# Bring in Torch

git clone https://github.com/torch/distro.git ~/torch --recursive

cd ~/torch
bash install-deps
./install.sh

cd ~

# Make sure current user is in incron.allow
sudo bash -c "echo '$USER' >> /etc/incron.allow"

echo "Configuration done, will now reboot"
sleep 5s

# Reboot just to be sure everything is going to come up correctly
sudo reboot



