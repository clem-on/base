#!/bin/bash

EULA=1 MACHINE=$1 DISTRO=$2 source setup-environment build
echo "DL_DIR = \"/opt/yocto-downloads/\"" >> conf/local.conf
echo "SSTATE_DIR = \"/opt/$1-$2-$3-sstate/\"" >> conf/local.conf
echo "BB_NO_NETWORK = \"1\"" >> conf/local.conf
bitbake $3