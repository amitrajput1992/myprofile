#!/bin/bash
sudo apt install -y byobu emacs zsh zsh-doc #emacs24-nox
sudo apt install -y curl wget nmap whois
sudo apt install -y git gitk
sudo apt install -y encfs
sudo apt install -y android-tools-adb android-tools-fastboot
#sudo apt install -y ubuntu-restricted-extras libavcodec-extra libdvd-pkg
#For UI:
sudo apt install -y yakuake

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer

sudo add-apt-repository ppa:webupd8team/atom
sudo apt-get update
sudo apt-get install atom

#Link custom apps menu
git clone git@github.com:sahil87/custom-apps-menu.git ~/code/sahil87/custom-apps-menu
ln -s ~/code/sahil87/custom-apps-menu ~/.local/share/cinnamon/applets/custom-apps-menu@sahil87

#Install go from https://golang.org/doc/install
wget https://storage.googleapis.com/golang/go1.6.3.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.6.3.linux-amd64.tar.gz
mkdir ~/code/go

#Install google drive for linux
go get -u github.com/odeke-em/drive/cmd/drive

#Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/sahil87/oh-my-zsh/master/tools/install.sh)"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/add_to_zshrc.sh
chsh -s /bin/zsh

#Install Ruby (rvm)
command curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
\curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles stable

#Make ruby 2.3 default
rvm list known
rvm install 2.3
rvm --default use 2.3

#Install Nodejs
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt install -y nodejs build-essential

#Install docker
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
su -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" > /etc/apt/sources.list.d/docker.list'
sudo apt-get update
sudo apt-get install linux-image-extra-$(uname -r) docker-engine
sudo rm -rf /var/lib/docker
ln -s /mnt/files/storage/docker /var/lib/docker
sudo service docker start
#Add yourself to docker group
sudo groupadd docker
sudo usermod -aG docker sahil
#Docker Compose, find latest version from https://github.com/docker/compose/releases
su -c 'curl -L https://github.com/docker/compose/releases/download/1.8.0-rc2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose'
sudo chmod +x /usr/local/bin/docker-compose
