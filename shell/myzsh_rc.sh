#!/bin/zsh
#http://zsh.sourceforge.net/Guide/zshguide02.html#l7
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#ADD PERSONAL BIN AND CURRENT FOLDER TO PATH
CURRENTDIR=${0:a:h}
export MYPROFILEDIR=`realpath $CURRENTDIR/..`
export DIR87=`realpath $MYPROFILEDIR/..`
export LIFETRACKERDIR=`realpath $DIR87/lifetracker`
export BLOGDIR=`realpath $DIR87/bloghugo`

source $LIFETRACKERDIR/shell/envvars.sh

#LOAD RVM
GRADLE_VERSION=`ls ~/software/android-studio/gradle/ | grep gradle | sort -r | head -n 1`
GRADLE_PATH=~/software/android-studio/gradle/$GRADLE_VERSION/bin
#RVM SETTINGS
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
#GO Settings
export GOPATH=~/code/go
#Python Settings: Use workon to list/go into a virutal env, deactivate to exit, mkvirtualenv temp to create virtual env
#export WORKON_HOME=~/code/python/.virtualenvs
#export PROJECT_HOME=~/code/python
#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
#source ~/.local/bin/virtualenvwrapper.sh

#The incantation `typeset -U path', where the -U stands for unique, tells the shell that it should not add anything to $path if it's there already.
typeset -U path
#~/.local/bin is for pythong pip installs done by user without setting virtualenv
path=($path ~/.rvm/bin . ~/.local/bin $MYPROFILEDIR/bin ~/.yarn/bin /usr/local/go/bin ~/code/bin $GOPATH/bin ~/Android/Sdk/platform-tools ~/Android/Sdk/tools /mnt/files/storage/groovy/bin $GRADLE_PATH)

#oh-my-zsh SETTINGS:
plugins=(myfunctions git docker kubectl themes ssh-agent man history-substring-search myaliases kubectl helm)
ZSH_THEME="sahil2"
export ZSH=~/.oh-my-zsh
export ZSH_CUSTOM=$CURRENTDIR/zsh-custom
export COMPLETION_WAITING_DOTS="true"
source $ZSH/oh-my-zsh.sh

#OVERRIDE WITH OWN SETTINGS:
#remove up and down arrow bindings for history-substring-search as we want it show normal history
#bindkey -r '^[[A'
#bindkey -r '^[[B'
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

#HISTORY SETTINGS
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=100000
setopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
#Deliberately don't record commands with atleast one space preceeding them
setopt HIST_IGNORE_SPACE

#EMACS KEYBINDING
bindkey -e

#AUTOCD
setopt autocd

#AUTO COMPLETION
autoload -U compinit
compinit

#AUTOCORRECT
#setopt correctall

#ADVANCED PROMPT
autoload -U promptinit
promptinit

#CHANGE GIT EDITOR
export EDITOR="emacs -nw"
export GIT_EDITOR=$EDITOR

#. ~/.zclone/z.sh
