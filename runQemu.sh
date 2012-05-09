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

vdisk=$1
isofile=$2

Usage() {
echo "usage...."
echo "  $0 <HD_img> [OS_ISO]"
echo "    <HD_img>  Pass the name of your virtual HD within the ./vdisk dir"
echo "    [OS_ISO]  Optional param, use only when attempting to install a"
echo "              virtual OS onto a new ./vdisk image. Pass ISO filename."
echo ""
}

if [ -z $vdisk ]; then
	Usage
	exit
fi

if [ -z $isofile ]; then
	# sudo needed because kvm module requires higher priveledged user; default
    # 4 namespaces each of size 512MB.
	sudo ../qemu/x86_64-softmmu/qemu-system-x86_64 -m 4096 -hda ./vdisk/${vdisk} -device nvme,namespaces=2,size=512 --enable-kvm -smp 2
else
	../qemu/x86_64-softmmu/qemu-system-x86_64 -m 4096 -cdrom ./vkernel/${isofile} -hda ./vdisk/${vdisk} -device nvme
fi

exit
