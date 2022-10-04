#!/bin/bash

export PATH="`pwd`/local/bin:${PATH}"
export PERL5LIB="`pwd`/scot/lib:`pwd`/local/lib/perl5"
mkdir logs
curl -fsSL https://raw.githubusercontent.com/skaji/cpm/main/cpm | sudo perl - install -g --show-build-log-on-failure App::cpm
sudo cpm install -v -g --show-build-log-on-failure Carton::Snapshot
