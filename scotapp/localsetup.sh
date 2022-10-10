#!/bin/bash

export PATH="`pwd`/local/bin:${PATH}"
export PERL5LIB="`pwd`/scot/lib:`pwd`/local/lib/perl5"
#mkdir logs
#curl -fsSL https://raw.githubusercontent.com/skaji/cpm/main/cpm | sudo perl - install -g --show-build-log-on-failure App::cpm
#sudo cpm install -v -g --show-build-log-on-failure Carton::Snapshot
#tar xvzf File-Magic-0.01.tar.gz --no-same-owner
#cd File-Magic-0.01; perl Makefile.PL; make; make test; sudo make install
#cpm install -v
#echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" >> /etc/apt/sources.list
#echo "deb http://ppa.launchpad.net/maxmind/ppa/ubuntu xenial main" >> /etc/apt/sources.list
#apt update
#apt install libmaxminddb0 libmaxminddb-dev mmdb-bin mongodb-org-shell