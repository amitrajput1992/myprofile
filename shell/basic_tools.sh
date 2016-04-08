#!/bin/bash
sudo apt-get install -y byobu emacs24-nox emacs zsh zsh-doc
sudo apt-get install -y curl wget nmap whois
udo apt-get install -y git gitk
sudo apt-get install -y encfs
#Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/sahil87/oh-my-zsh/master/tools/install.sh)"
#Install magit (git for emacs)
mkdir -p ~/.emacs.d/site-lisp
git clone https://github.com/magit/magit.git ~/.emacs.d/site-lisp/magit
CURRENTDIR=`pwd`
cd ~/.emacs.d/site-lisp/magit
make
cd $CURRENTDIR
