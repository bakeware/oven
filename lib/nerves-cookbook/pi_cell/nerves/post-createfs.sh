#!/bin/sh

TARGETDIR=$1

NERVES_ROOT=$TARGETDIR/../../..
IMAGESDIR=$TARGETDIR/../images
FWUP_CONFIG=$NERVES_ROOT/config/fwup.conf
BASE_FW_NAME=nerves-rpi-base

# Process the kernel if using device tree
if [ -e $NERVES_ROOT/buildroot/output/host/usr/bin/mkknlimg ]; then
    $NERVES_ROOT/buildroot/output/host/usr/bin/mkknlimg \
        $IMAGESDIR/zImage $IMAGESDIR/zImage.mkknlimg
fi

# Run the common post-image processing for nerves
$NERVES_ROOT/board/nerves-common/post-createfs.sh $TARGETDIR $FWUP_CONFIG $BASE_FW_NAME
