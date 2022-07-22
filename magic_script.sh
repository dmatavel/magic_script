#!/bin/sh

SU=sudo
SAPT="sudo apt"
INST=install
RM=remove

echo Updating system ...
    $SAPT update && $SAPT upgrade

echo Installing general tools ...
echo Version control system ...
    $SAPT $INST git
	$SAPT $INST temux

echo Text editors ...
    $SAPT $INST vim
    $SAPT $INST neovim

echo Codecs and fonts
    $SAPT $INST ubuntu-restricted-extras -y
    $SAPT $INST ffmpeg

echo Installing C compiler and other C tools ...
    $SAPT $INST build-essential
    $SAPT $INST libbsd-dev
    $SAPT $INST ccache
    $SAPT $INST clang
    $SAPT $INST valgrind

echo Installing Python3 and pip modules ...
    $SAPT $INST python3
    $SAPT $INST python3-pip

echo Installing 42 norminette ...
    $SU python3 -m pip install --upgrade pip setuptools
    $SU python3 -m pip install norminette

echo Setting a SSH key ...
    ssh-keygen

echo Remove unnacessary files and packages ...
    $SAPT clean
    $SAPT auto-clean
    $SAPT autoremove
