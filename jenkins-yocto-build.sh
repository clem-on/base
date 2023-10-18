#!/bin/bash

EULA=1 MACHINE=$1 DISTRO=$2 source setup-environment build
echo "INHERIT += \"own-mirrors\"" >> conf/local.conf
echo "SOURCE_MIRROR_URL = \"http://tremosiris.trem.bod:8081/repository/Scorepad/yocto-haumea/"" >> conf/local.conf
echo "DL_DIR = \"/opt/yocto-downloads/\"" >> conf/local.conf
echo "BB_NO_NETWORK = \"1\"" >> conf/local.conf
echo "SSTATE_DIR = \"/opt/yocto-$1-$2-$3-sstate/\"" >> conf/local.conf
echo "BB_GENERATE_MIRROR_TARBALLS = \"1\"" >> conf/local.conf
bitbake $3