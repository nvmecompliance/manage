#!/bin/bash

cd ../qemu

# Note it is targeting a 64b hardware platform
./configure --enable-io-thread --target-list=x86_64-softmmu --enable-sdl
make clean
make

