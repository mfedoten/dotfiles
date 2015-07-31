#!/usr/bin/env bash

# Install MacPorts
# from https://guide.macports.org/#installing.shell
curl -O https://distfiles.macports.org/MacPorts/MacPorts-2.3.3.tar.bz2
tar xf MacPorts-2.3.3.tar.bz2
cd MacPorts-2.3.3/
./configure
make
sudo make install
cd ..
sudo rm -r MacPorts-2.3.3
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

