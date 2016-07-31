#!/bin/bash

THE_ZONE=/vagrant

apt-get update
apt-get install -y python-pip git tmux

# call the install scripts 
for package in $THE_ZONE/deploy/packages/*; do
	echo "Installing $package ..."
	bash $package
done

apt-get install htop wireshark

# TODO: set git configuration
