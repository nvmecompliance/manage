#!/bin/bash

sizeGB=$1
sizeB=$(($sizeGB*1024))

Usage() {
echo "usage...."
echo "  $0 <size_GB>"
echo "    <size_GB>  Specify an integral number of GB for disk creation"
echo ""
}

if [ -z $sizeGB ]; then
  Usage
  exit
fi

cd ./vdisk
../../qemu/qemu-img create -f raw ${sizeGB}GB.img ${sizeB}M
