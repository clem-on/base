#!/bin/bash

find_and_replace_or_create () {
    correct_string=$(echo ${2} | sed 's/\//\\\//g')
    case `grep '^'${1}'' conf/local.conf >/dev/null; echo $?` in
    0)
        # code if found : replace in file
        sed -i -e 's/^'${1}'.*/'${1}' = \"'${correct_string}'\"/' conf/local.conf
        ;;
    1)
        # code if not found : append to end of file
        echo "${1} = \"${2}\"" >> conf/local.conf
        ;;
    *)
        # code if an error occurred
        echo "ERROR: grep"
        exit 1
        ;;
    esac   
}

EULA=1 MACHINE=$1 DISTRO=$2 source setup-environment build
find_and_replace_or_create DL_DIR "/opt/yocto-downloads"
find_and_replace_or_create SSTATE_DIR "/opt/yocto-downloads"
find_and_replace_or_create UNINATIVE_URL "http://tremosiris.trem.bod:8081/repository/Scorepad/yocto-haumea/"
find_and_replace_or_create SOURCE_MIRROR_URL "http://tremosiris.trem.bod:8081/repository/Scorepad/yocto-haumea/"
find_and_replace_or_create BB_FETCH_PREMIRRORONLY "1"
find_and_replace_or_create BB_NO_NETWORK "1"
echo "INHERIT += \"own-mirrors\"" >> conf/local.conf
bitbake $3