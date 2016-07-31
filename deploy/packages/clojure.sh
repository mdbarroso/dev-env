#!/bin/bash

# installs the clojure package
CLOJURE_VERSION=1.8.0

if [ -f /usr/local/bin/lein ]; then
	echo "Skipping clojure-" $CLOJURE_VERSION " installation"
else
	wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
	mv lein /usr/local/bin/
	chmod a+x /usr/local/bin/lein
fi

