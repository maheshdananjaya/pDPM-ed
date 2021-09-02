#!/bin/bash
KERNEL_VER=$(uname -a)
echo $KERNEL_VER
OS_VER="ubuntu`lsb_release -r | cut -d":" -f2 | xargs`"
#MLNX_OFED_VER=4.6-1.0.1.1
MLNX_OFED_VER=4.9-3.1.5.0

MLNX_OFED=MLNX_OFED_LINUX-$MLNX_OFED_VER-$OS_VER-x86_64
axel -n 8 -q http://www.mellanox.com/downloads/ofed/MLNX_OFED-$MLNX_OFED_VER/$MLNX_OFED.tgz
tar xzf $MLNX_OFED.tgz
sudo $MLNX_OFED/mlnxofedinstall --force --without-dkms --add-kernel-support --kernel 4.15.0-147-generic --without-fw-update
ibv_devinfo
/etc/init.d/openibd start
