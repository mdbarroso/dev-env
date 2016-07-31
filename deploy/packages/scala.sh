#!/bin/bash

# installs the scala packages 
SCALA_VERSION=2.11.8

if which scala >/dev/null; then
   	echo "Skipping scala-" $SCALA_VERSION " installation" 
else
	echo "Going to install scala-" $SCALA_VERSION 
	cd /tmp
	wget http://www.scala-lang.org/files/archive/scala-${SCALA_VERSION}.deb 
	dpkg -i scala-${SCALA_VERSION}.deb
	cd -
fi

# install scala sbt
SBT_VERSION=0.13.5
if which sbt >/dev/null; then
	echo "Skipping sbt installation"
else
	#has java dependency which will be installable manual with sudo apt-get -f install
	echo "Going to install sbt-" $SBT_VERSION
	cd /tmp
	wget -nv http://dl.bintray.com/sbt/debian/sbt-${SBT_VERSION}.deb
	# install sbt
	apt-get -f install
	dpkg -i sbt*.deb
	# if no jdk is installed than jdk 6 will be installed sbt depends on
	su -l vagrant -c "sbt test"
	cd -
fi

