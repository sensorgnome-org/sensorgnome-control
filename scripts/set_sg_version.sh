#!/bin/bash

if [[ -z "$1" ]]; then cat <<EOF
Usage:  set_sg_version.sh VERSION_NAME

Sets the name of the version of software being run by this
sensorgnome.  This name is added to a timestamp generated by date
'+%s,%Y-%m-%d %H:%M:%S' so that the final version string looks like
this:

   1493490775,2017-04-29 18:32:55,VERSION_NAME

where VERSION_NAME is the set of arguments passed to this script.

This version string is printed, and written to the file

   /boot/uboot/SENSORGNOME_VERSION.TXT

This script is intended for sensorgnome developers when they are about to
create a new release using liwixi (see https://github.com/jbrzusto/liwixi)

EOF

    exit 1;
fi

VERSION="`date +'%s,%Y-%m-%d %H:%M:%S'`,$*"
echo $VERSION | tee /boot/uboot/SENSORGNOME_VERSION.TXT
