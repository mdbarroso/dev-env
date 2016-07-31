#!/bin/bash


# installs the mvn package
MAVEN_VERSION=3.3.9
FILE_NAME=apache-maven-${MAVEN_VERSION}-bin.tar.gz

if which mvn > /dev/null; then
   	echo "Skipping maven-" $MAVEN_VERSION " installation" 
	return 0
else
	echo "Going to install maven-"$MAVEN_VERSION 
fi


mkdir -p /usr/lib/mvn
cd /usr/lib/mvn

if [ ! -f $FILE_NAME ]; then
	wget -q http://ftp.cixug.es/apache/maven/maven-3/3.3.9/binaries/$FILE_NAME -O $FILE_NAME
	tar -zxvf $FILE_NAME
fi

cat >> ~/.bashrc << EOL
export PATH=$PATH:`pwd`/apache-maven-3.3.9/bin 
export JAVA_HOME=/usr/lib/jvm/java-8-oracle/
EOL

