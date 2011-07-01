#!/bin/bash

tagrel=$1
msg=$2

Usage() {
echo "usage...."
echo "  This script places a annotated tag upon all repos under nvme"
echo "  $0 <tag_rev> <msg."
echo "    <tag_rev> Pass the tags revision number; format "x.y.z", concatinated"
echo "              with a larger string of "compliance_rel=x.y.z""
echo "    <msg>     Pass the message to be commited with the tag creation"
echo ""
}

if [ -z "$tagrel" ] || [ -z "$msg" ]; then
	Usage
	exit
fi

tagname=compliance_rel=${tagrel}

cd ../qemu
git tag -a -m "${msg}" ${tagname}
cd ../tnvme
git tag -a -m "${msg}" ${tagname}
cd ../dnvme
git tag -a -m "${msg}" ${tagname}
cd ../manage
git tag -a -m "${msg}" ${tagname}

git tag -l -n1
exit
