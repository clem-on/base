#!/bin/bash

EULA=1 MACHINE=$1 DISTRO=$2 source setup-environment build
bitbake $3