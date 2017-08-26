#!/bin/bash
sudo apt install -y byobu emacs zsh zsh-doc #emacs24-nox
sudo apt install -y curl wget nmap whois
sudo apt install -y git gitk
sudo apt install -y encfs openssh-server luckybackup gparted
sudo apt install -y android-tools-adb android-tools-fastboot
sudo apt install -y rygel rygel-preferences
#sudo apt install -y ubuntu-restricted-extras libavcodec-extra libdvd-pkg
#For UI:
sudo apt install -y yakuake xcalib

#Java
sudo echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt install -y oracle-java8-installer oracle-java8-set-default

#Atom
sudo add-apt-repository -y ppa:webupd8team/atom
sudo apt-get update; sudo apt-get install atom

#Digikam
sudo apt install kipi-plugins5 plasma-theme-oxygen
sudo add-apt-repository -y ppa:philip5/extra
sudo apt update; sudo apt install -y digikam5

#Link custom apps menu
git clone git@github.com:sahil87/custom-apps-menu.git ~/code/sahil87/custom-apps-menu
ln -s ~/code/sahil87/custom-apps-menu ~/.local/share/cinnamon/applets/custom-apps-menu@sahil87

#Download groovy sdk from http://groovy-lang.org/download.html
#Unzip it in /mnt/files/storage/groovy-2.4.8
cd /mnt/files/storage
ln -s groovy-2.4.8 groovy

#Install go from https://golang.org/doc/install
wget https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.9.linux-amd64.tar.gz
mkdir ~/code/go

#Install google drive for linux
go get -u github.com/odeke-em/drive/cmd/drive

#Install Hugo
go get github.com/kardianos/govendor
govendor get github.com/gohugoio/hugo
go install github.com/gohugoio/hugo

#Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/sahil87/oh-my-zsh/master/tools/install.sh)"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/add_to_zshrc.sh
chsh -s /bin/zsh

git clone git@github.com:sahil87/z.git ~/.zclone

#Install Ruby (rvm)
command curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
\curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles stable

#Make ruby 2.3 default
#rvm list known
#rvm install 2.3
rvm install 2.3-dev
rvm --default use 2.3-dev
gem install bundler

#Install Nodejs
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt install -y nodejs build-essential

#Install docker
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(grep UBUNTU_CODENAME /etc/os-release | awk -F '=' '{ print $2 }') stable edge"
sudo apt-get update
sudo apt-get -y install docker-ce
sudo service docker stop
sudo rm -rf /var/lib/docker; sudo umount /var/lib/docker/aufs
sudo ln -s /mnt/files/storage/docker /var/lib/docker
sudo service docker start
#Add yourself to docker group
sudo groupadd docker
sudo usermod -aG docker sahil
#Docker Compose, find latest version from https://github.com/docker/compose/releases
su -c 'curl -L https://github.com/docker/compose/releases/download/1.15.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose'
sudo chmod +x /usr/local/bin/docker-compose

#Python
sudo apt install -y python3 python3-pip python3-setuptools
pip3 install virtualenv
pip3 install virtualenvwrapper

#Install ansible
sudo apt install -y software-properties-common python-jmespath
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt update
sudo apt install -y ansible

#For AWS ec2.py script to work
sudo apt-get install -y python python-dev python-pip
sudo pip install boto
sudo pip install --upgrade --user boto

#For virtualbox
sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian xenial contrib"
#su -c 'echo "deb http://download.virtualbox.org/virtualbox/debian xenial contrib"  > /etc/apt/sources.list.d/virtualbox.list'
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo apt update
sudo apt install virtualbox-5.1
sudo usermod -a -G vboxusers sahil

#Important symbolic links:
ln -s /mnt ~/
ln -s /mnt/files/code ~/
ln -s /mnt/hd2008/VirtualBox\ VMs ~/
ln -s ~/Dropbox/code-sync ~/code/code-sync
ln -s ~/Dropbox/books/Music/MuseScore2 ~/Documents/MuseScore2

STORAGE=/mnt/files/storage
ln -s $STORAGE/Android ~/
ln -s $STORAGE/Genymobile_hidden ~/.Genymobile
ln -s $STORAGE/docker /var/lib/docker
ln -s $STORAGE/Unity /opt/Unity

#Unity
#After installing Unity from deb by
#"dpkg -i Unity----.deb" run
#"sudo apt-get -f install" to get all dependencies
