#!/bin/bash

cd ../qemu

# Note it is targeting a 64b hardware platform
./configure --enable-io-thread --enable-linux-aio --target-list=x86_64-softmmu
make clean
make

