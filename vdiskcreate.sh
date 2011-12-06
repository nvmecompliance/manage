#!/bin/bash

# Copyright (c) 2011, Intel Corporation.
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#

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
