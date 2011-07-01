#!/bin/bash

tagname=$1
msg=$2

Usage() {
echo "usage...."
echo "  This script places a annotated tag upon all repos under nvme"
echo "  $0 <tagname> <msg."
echo "    <tagname> Pass the name of a git annotated tag object for all repos"
echo "              Recommended format of tagname="NVME compliance, rel=x.y.z""
echo "    <msg>     Pass the message to be commited with the tag creation"
echo ""
}

if [ -z $tagname ] || [ -z $msg ]; then
	Usage
	exit
fi

cd ..\qemu
git tag -a ${tagname} -m ${msg}
cd ..\tnvme
git tag -a ${tagname} -m ${msg}
cd ..\dnvme
git tag -a ${tagname} -m ${msg}
cd ..\manage
git tag -a ${tagname} -m ${msg}

exit
