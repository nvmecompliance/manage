#!/bin/bash

Usage() {
echo "usage...."
echo "  $0 <size_GB>"
echo "    <size_GB>  Specify an integral number of GB for disk creation"
echo ""
}

sizeGB=$1

if [ -z $sizeGB ]; then
  Usage
  exit
fi

sizeB=$(($sizeGB*1024))

mkdir ./vdisk
cd ./vdisk
../../qemu/qemu-img create -f raw ${sizeGB}GB.img ${sizeB}M
